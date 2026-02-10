import 'dart:async';
import 'dart:io';

import 'package:aviapoint/core/routes/app_router.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/payment/data/datasources/iap_service.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_event.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/payment/presentation/pages/payment_webview_screen.dart';
import 'package:aviapoint/payment/utils/payment_storage_helper.dart';
import 'package:aviapoint/payment/utils/payment_url_helper.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_screen_stub.dart' if (dart.library.html) 'payment_screen_web.dart' as html;

/// Утилита для создания платежа и обработки редиректа/WebView
class PaymentHelper {
  /// Создает платеж через Apple IAP (только для iOS)
  /// На других платформах использует YooKassa
  static Future<bool> createPaymentAndRedirect({
    required BuildContext context,
    required double amount,
    String currency = 'RUB',
    required String description,
    required int subscriptionTypeId,
    String? returnRouteSource,
  }) async {
    // На iOS используем Apple IAP, на остальных платформах - YooKassa
    // Важно: IAP работает только на реальных устройствах, не на симуляторе
    if (!kIsWeb && Platform.isIOS) {
      try {
        return await _createIAPPayment(
          context: context,
          subscriptionTypeId: subscriptionTypeId,
          returnRouteSource: returnRouteSource,
        );
      } catch (e) {
        print('Error with IAP, falling back to YooKassa: $e');
        // Если IAP не работает (например, на симуляторе), используем YooKassa
        return await _createYooKassaPayment(
          context: context,
          amount: amount,
          currency: currency,
          description: description,
          subscriptionTypeId: subscriptionTypeId,
          returnRouteSource: returnRouteSource,
        );
      }
    } else {
      return await _createYooKassaPayment(
        context: context,
        amount: amount,
        currency: currency,
        description: description,
        subscriptionTypeId: subscriptionTypeId,
        returnRouteSource: returnRouteSource,
      );
    }
  }

  /// Создает платеж через Apple IAP
  static Future<bool> _createIAPPayment({
    required BuildContext context,
    required int subscriptionTypeId,
    String? returnRouteSource,
  }) async {
    bool loadingDialogWasShown = false;
    try {
      final iapService = IAPService();

      try {
        final initialized = await iapService.initialize();

        if (!initialized) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('In-App Purchases недоступны. Используйте реальное устройство для тестирования IAP.'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 3),
              ),
            );
          }
          // Возвращаем false, чтобы вызвать fallback на YooKassa
          throw Exception('IAP not available');
        }
      } catch (e) {
        print('Error initializing IAP: $e');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('In-App Purchases недоступны: ${e.toString()}. Используйте реальное устройство.'),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 3),
            ),
          );
        }
        // Пробрасываем ошибку, чтобы вызвать fallback на YooKassa
        rethrow;
      }

      // Показываем индикатор загрузки (всегда закрываем в finally при ошибке)
      bool loadingDialogOpen = false;
      void closeLoadingDialog() {
        if (loadingDialogOpen && context.mounted) {
          Navigator.of(context).pop();
          loadingDialogOpen = false;
        }
      }

      if (context.mounted) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()),
        );
        loadingDialogOpen = true;
        loadingDialogWasShown = true;
      }

      try {
        // Загружаем продукты
        print('🔵 Начинаем загрузку продуктов из App Store...');
        final products = await iapService.loadProducts();

        if (products.isEmpty) {
          closeLoadingDialog();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Подписка временно недоступна. Убедитесь, что в настройках устройства включены покупки в приложениях и есть подключение к интернету.',
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 5),
              ),
            );
          }
          print('❌ Продукты не загружены. Проверьте логи выше для деталей.');
          return false;
        }

        print('✅ Продукты загружены успешно: ${products.length}');

        // Находим годовую подписку
        ProductDetails yearlyProduct;
        try {
          yearlyProduct = products.firstWhere(
            (p) => p.id == IAPProducts.yearlySubscription,
            orElse: () => throw Exception('Годовая подписка не найдена'),
          );
        } catch (_) {
          closeLoadingDialog();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Подписка не найдена. Попробуйте позже или оформите подписку на сайте.'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 4),
              ),
            );
          }
          return false;
        }

        closeLoadingDialog();

        // Слушаем результат покупки
        StreamSubscription<bool>? purchaseSubscription;
        bool purchaseCompleted = false;

        purchaseSubscription = iapService.purchaseStream.listen((success) {
          purchaseCompleted = true;
          purchaseSubscription?.cancel();

          if (context.mounted) {
            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Подписка успешно активирована'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
              // Обновляем информацию о подписке
              final paymentRepository = getIt<PaymentRepository>();
              paymentRepository.getSubscriptionStatus().then((_) {
                // Навигируем обратно
                navigateToSource(context, returnRouteSource);
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Ошибка при покупке подписки. Подписка не была активирована. Попробуйте восстановить покупки или обратитесь в поддержку.',
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 5),
                ),
              );
            }
          }
        });

        // Запускаем покупку
        final purchaseStarted = await iapService.buySubscription(yearlyProduct.id);

        if (!purchaseStarted) {
          purchaseSubscription.cancel();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Не удалось начать покупку. Попробуйте ещё раз или оформите подписку на сайте.'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 4),
              ),
            );
          }
          return false;
        }

        // Ждем завершения покупки (таймаут 5 минут)
        await Future<void>.delayed(const Duration(seconds: 1));
        int attempts = 0;
        while (!purchaseCompleted && attempts < 300) {
          await Future<void>.delayed(const Duration(seconds: 1));
          attempts++;
        }

        if (!purchaseCompleted) {
          purchaseSubscription.cancel();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Превышено время ожидания покупки'), backgroundColor: Colors.orange),
            );
          }
        }

        iapService.dispose();
        return purchaseCompleted;
      } catch (e, stackTrace) {
        closeLoadingDialog();
        print('❌ Ошибка при покупке через IAP: $e');
        print('StackTrace: $stackTrace');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Не удалось загрузить подписку. Проверьте интернет и настройки покупок в приложениях или оформите подписку на сайте.',
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
            ),
          );
        }
        return false;
      }
    } catch (e, stackTrace) {
      print('❌ Ошибка при покупке через IAP: $e');
      print('StackTrace: $stackTrace');
      if (context.mounted) {
        if (loadingDialogWasShown) Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Ошибка при оформлении подписки. Проверьте подключение к интернету и настройки покупок в приложениях.',
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          ),
        );
      }
      return false;
    }
  }

  /// Запуск IAP без UI (для использования из Cubit). Возвращает успех и текст ошибки для пользователя.
  static Future<({bool success, String? errorForUser})> runIAPPurchaseWithoutUI({
    required BuildContext context,
    required int subscriptionTypeId,
    String? returnRouteSource,
  }) async {
    const errorDefault = 'Не удалось загрузить подписку. Проверьте интернет и настройки покупок в приложениях или оформите подписку на сайте.';
    final iapService = IAPService();
    try {
      final initialized = await iapService.initialize();
      if (!initialized) {
        return (success: false, errorForUser: 'In-App Purchases недоступны. Используйте реальное устройство для тестирования IAP.');
      }
    } catch (e) {
      return (success: false, errorForUser: 'In-App Purchases недоступны. Используйте реальное устройство.');
    }

    try {
      final products = await iapService.loadProducts();
      if (products.isEmpty) {
        return (success: false, errorForUser: 'Подписка временно недоступна. Убедитесь, что в настройках устройства включены покупки в приложениях и есть подключение к интернету.');
      }
      ProductDetails yearlyProduct;
      try {
        yearlyProduct = products.firstWhere(
          (p) => p.id == IAPProducts.yearlySubscription,
          orElse: () => throw Exception('Годовая подписка не найдена'),
        );
      } catch (_) {
        return (success: false, errorForUser: 'Подписка не найдена. Попробуйте позже или оформите подписку на сайте.');
      }

      bool purchaseCompleted = false;
      bool purchaseSuccess = false;
      StreamSubscription<bool>? purchaseSubscription;

      purchaseSubscription = iapService.purchaseStream.listen((success) {
        purchaseCompleted = true;
        purchaseSuccess = success;
        purchaseSubscription?.cancel();
        if (success && context.mounted) {
          getIt<PaymentRepository>().getSubscriptionStatus().then((_) {
            if (context.mounted) PaymentHelper.navigateToSource(context, returnRouteSource);
          });
        }
      });

      final purchaseStarted = await iapService.buySubscription(yearlyProduct.id);
      if (!purchaseStarted) {
        purchaseSubscription.cancel();
        return (success: false, errorForUser: 'Не удалось начать покупку. Попробуйте ещё раз или оформите подписку на сайте.');
      }

      int attempts = 0;
      while (!purchaseCompleted && attempts < 300) {
        await Future<void>.delayed(const Duration(seconds: 1));
        attempts++;
      }
      iapService.dispose();

      if (!purchaseCompleted) {
        return (success: false, errorForUser: 'Превышено время ожидания покупки.');
      }
      return (success: purchaseSuccess, errorForUser: null);
    } catch (e, stackTrace) {
      print('❌ Ошибка при покупке через IAP: $e');
      print('StackTrace: $stackTrace');
      return (success: false, errorForUser: errorDefault);
    }
  }

  /// Создает платеж через YooKassa (веб и Android)
  static Future<bool> _createYooKassaPayment({
    required BuildContext context,
    required double amount,
    String currency = 'RUB',
    required String description,
    required int subscriptionTypeId,
    String? returnRouteSource,
  }) async {
    try {
      // Получаем PaymentBloc и ProfileBloc
      final paymentBloc = context.read<PaymentBloc>();
      final profileBloc = context.read<ProfileBloc>();

      // Получаем userId и phone из ProfileBloc
      final profileState = profileBloc.state;
      int? userId;
      String? customerPhone;

      profileState.maybeWhen(
        success: (profile) {
          userId = profile.id;
          customerPhone = profile.phone;
        },
        orElse: () {
          userId = null;
          customerPhone = null;
        },
      );

      if (userId == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ошибка: не удалось получить данные пользователя'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return false;
      }

      // Показываем индикатор загрузки
      if (context.mounted) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()),
        );
      }

      // Создаем платеж
      final returnUrl = PaymentUrlHelper.buildReturnUrl(source: returnRouteSource);
      print('🔵 Создаем платеж: amount=$amount, subscriptionTypeId=$subscriptionTypeId');

      // Сохраняем текущее состояние, чтобы пропустить его
      final currentState = paymentBloc.state;
      print('🔵 Текущее состояние PaymentBloc: ${currentState.toString()}');

      paymentBloc.add(
        CreatePaymentEvent(
          amount: amount,
          currency: currency,
          description: description,
          userId: userId!,
          subscriptionTypeId: subscriptionTypeId,
          customerPhone: customerPhone,
          returnUrl: returnUrl,
        ),
      );

      // Ждем результат создания платежа
      // Пропускаем состояния до тех пор, пока не получим новое (отличное от текущего)
      PaymentState finalState;
      try {
        print('🔵 Ожидаем результат создания платежа...');
        finalState = await paymentBloc.stream
            .where((state) => state != currentState) // Пропускаем текущее состояние
            .timeout(const Duration(seconds: 30))
            .firstWhere((state) {
              print('🔵 PaymentBloc state: ${state.toString()}');
              return state.maybeWhen(
                success: (payment) {
                  print('🔵 Payment success: id=${payment.id}, paymentUrl=${payment.paymentUrl}');
                  return payment.paymentUrl != null;
                },
                failure: (message) {
                  print('❌ Payment failure: $message');
                  return true;
                },
                orElse: () {
                  print('⏳ Payment state: loading or initial');
                  return false;
                },
              );
            });
        print('✅ Получен финальный state: ${finalState.toString()}');
      } on TimeoutException catch (e) {
        print('❌ Timeout при ожидании состояния платежа: $e');
        // Закрываем индикатор загрузки при таймауте
        if (context.mounted) {
          Navigator.of(context).pop();
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Превышено время ожидания. Попробуйте еще раз.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
        return false;
      } catch (e, stackTrace) {
        print('❌ Ошибка при ожидании состояния платежа: $e');
        print('StackTrace: $stackTrace');
        // Закрываем индикатор загрузки при ошибке
        if (context.mounted) {
          Navigator.of(context).pop();
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка при создании платежа: ${e.toString()}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
        return false;
      }

      // Закрываем индикатор загрузки перед редиректом/открытием WebView
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Небольшая задержка для закрытия диалога перед открытием WebView
      await Future<void>.delayed(const Duration(milliseconds: 100));

      // Обрабатываем результат
      if (finalState.maybeWhen(success: (payment) => payment.paymentUrl != null, orElse: () => false)) {
        final payment = finalState.maybeWhen(success: (p) => p, orElse: () => throw Exception('Payment not found'));

        final paymentId = payment.id;
        final paymentUrl = payment.paymentUrl!; // Уже проверили выше, что не null
        print('🔵 Открываем форму оплаты: paymentUrl=$paymentUrl');

        // На веб: сохраняем paymentId и редиректим
        if (kIsWeb) {
          PaymentStorageHelper.savePaymentId(paymentId);
          html.setWindowLocationHref(paymentUrl);
          return true;
        } else {
          // На мобильных: сохраняем paymentId и открываем WebView
          // Используем глобальный контекст, так как локальный может стать невалидным после закрытия диалога
          final rootContext = navigatorKey.currentContext;
          if (rootContext != null && rootContext.mounted) {
            print('🔵 Открываем WebView на мобильном устройстве');
            // Сохраняем paymentId для проверки статуса после возврата
            await PaymentStorageHelper.savePaymentId(paymentId);

            // Используем rootNavigator, чтобы открыть поверх диалога
            final result = await Navigator.of(rootContext, rootNavigator: true).push<bool>(
              MaterialPageRoute<bool>(
                builder: (context) {
                  print('🔵 PaymentWebViewScreen создан с URL: $paymentUrl');
                  return PaymentWebViewScreen(
                    paymentUrl: paymentUrl,
                    returnRouteSource: returnRouteSource,
                    paymentId: paymentId,
                  );
                },
              ),
            );

            // После возврата из WebView проверяем статус через API
            // Используем глобальный контекст, так как локальный может стать невалидным
            final rootContextAfterReturn = navigatorKey.currentContext;

            if (result == true && paymentId.isNotEmpty) {
              print('🔵 WebView вернул true, проверяем статус через API');
              if (rootContextAfterReturn != null && rootContextAfterReturn.mounted) {
                await _handlePaymentReturn(rootContextAfterReturn, paymentId, returnRouteSource);
              } else {
                print('❌ rootContext не доступен для проверки статуса');
              }
            } else if (result == false) {
              // Пользователь отменил оплату через кнопку закрытия - навигируем обратно
              print('⚠️ WebView вернул false (отмена), навигируем на исходный экран: $returnRouteSource');
              if (rootContextAfterReturn != null && rootContextAfterReturn.mounted) {
                navigateToSource(rootContextAfterReturn, returnRouteSource);
              } else {
                print('❌ rootContext не доступен для навигации при отмене');
              }
            } else {
              print(
                '⚠️ WebView закрыт, но result=$result, rootContext.mounted=${rootContextAfterReturn?.mounted}, paymentId.isNotEmpty=${paymentId.isNotEmpty}',
              );
              // Даже если result null или неопределен, пытаемся навигировать обратно
              if (rootContextAfterReturn != null && rootContextAfterReturn.mounted) {
                navigateToSource(rootContextAfterReturn, returnRouteSource);
              }
            }

            print('✅ WebView закрыт, result: $result');
            return true;
          } else {
            print('❌ rootContext не доступен, не можем открыть WebView');
            // Пытаемся использовать локальный контекст как fallback
            if (context.mounted) {
              print('🔵 Используем локальный контекст как fallback');
              await PaymentStorageHelper.savePaymentId(paymentId);
              final result = await Navigator.of(context, rootNavigator: true).push<bool>(
                MaterialPageRoute<bool>(
                  builder: (context) {
                    print('🔵 PaymentWebViewScreen создан с URL: $paymentUrl');
                    return PaymentWebViewScreen(
                      paymentUrl: paymentUrl,
                      returnRouteSource: returnRouteSource,
                      paymentId: paymentId,
                    );
                  },
                ),
              );
              // Обрабатываем результат аналогично
              final rootContextAfterReturn = navigatorKey.currentContext;
              if (result == true &&
                  paymentId.isNotEmpty &&
                  rootContextAfterReturn != null &&
                  rootContextAfterReturn.mounted) {
                await _handlePaymentReturn(rootContextAfterReturn, paymentId, returnRouteSource);
              } else if (rootContextAfterReturn != null && rootContextAfterReturn.mounted) {
                navigateToSource(rootContextAfterReturn, returnRouteSource);
              }
              return true;
            }
            return false;
          }
        }
      }

      return finalState.maybeWhen(
        success: (payment) {
          print('⚠️ paymentUrl is null');
          return false;
        },
        failure: (message) {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Ошибка: $message'), backgroundColor: Colors.red));
          }
          return false;
        },
        orElse: () => false,
      );
    } catch (e, stackTrace) {
      print('❌ Ошибка при создании платежа: $e');
      print('StackTrace: $stackTrace');
      if (context.mounted) {
        // Закрываем индикатор загрузки, если он открыт
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при создании платежа: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
      return false;
    }
  }

  /// Обрабатывает возврат из платежа: проверяет статус через API и навигирует на исходный экран
  static Future<void> _handlePaymentReturn(BuildContext context, String paymentId, String? returnRouteSource) async {
    try {
      print('🔵 Проверяем статус платежа через API: paymentId=$paymentId');
      final paymentRepository = getIt<PaymentRepository>();
      final payment = await paymentRepository.getPaymentStatus(paymentId);

      print('🔵 Статус платежа от API: ${payment.status}, paid: ${payment.paid}');

      // Логируем статус платежа
      if (payment.status == 'succeeded') {
        print('✅ Платеж успешно выполнен');
        // Для успешных платежей НЕ очищаем paymentId - он будет очищен на экране после проверки подписки
        // Это позволяет экрану проверить статус и обновить подписку
      } else if (payment.status == 'canceled') {
        print('⚠️ Платеж отменен');
        // Для отмененных платежей очищаем paymentId сразу
        await PaymentStorageHelper.clearPaymentId();
      } else if (payment.status == 'pending' || payment.status == 'waiting_for_capture') {
        print('⏳ Платеж имеет статус ${payment.status}');
        // Для pending платежей НЕ очищаем paymentId - экран проверит статус и обновит подписку
      } else {
        print('⚠️ Неизвестный статус платежа: ${payment.status}');
        // Для неизвестных статусов очищаем paymentId
        await PaymentStorageHelper.clearPaymentId();
      }

      // Навигируем на исходный экран
      // paymentId останется в хранилище для проверки на экране (если платеж успешен или pending)
      navigateToSource(context, returnRouteSource);
    } catch (e, stackTrace) {
      print('❌ Ошибка при проверке статуса платежа: $e');
      print('StackTrace: $stackTrace');
      // Очищаем paymentId при ошибке
      await PaymentStorageHelper.clearPaymentId();
      // Навигируем на исходный экран даже при ошибке
      navigateToSource(context, returnRouteSource);
    }
  }

  /// Навигирует на исходный экран в зависимости от returnRouteSource
  /// Публичный метод для использования на вебе и мобильных
  static void navigateToSource(BuildContext context, String? returnRouteSource) {
    print('🔵 _navigateToSource вызван: returnRouteSource=$returnRouteSource, context.mounted=${context.mounted}');

    if (!context.mounted) {
      print('❌ Контекст не mounted, пытаемся использовать глобальный контекст');
      final rootContext = navigatorKey.currentContext;
      if (rootContext == null || !rootContext.mounted) {
        print('❌ Глобальный контекст тоже не доступен');
        return;
      }
      // Используем глобальный контекст
      print('✅ Используем глобальный контекст для навигации');
      navigateToSource(rootContext, returnRouteSource);
      return;
    }

    print('🔵 Навигируем на исходный экран: returnRouteSource=$returnRouteSource');

    // Используем Future.microtask для навигации после закрытия WebView
    Future.microtask(() async {
      // Проверяем контекст еще раз
      final currentContext = context.mounted ? context : navigatorKey.currentContext;
      if (currentContext == null || !currentContext.mounted) {
        print('❌ Контекст не mounted после microtask');
        return;
      }

      try {
        // Очищаем стек до BaseRoute
        print('🔵 Очищаем стек навигации до BaseRoute');
        currentContext.router.popUntil((route) => route.settings.name == BaseRoute.name || route.isFirst);

        // Небольшая задержка для завершения очистки стека
        await Future<void>.delayed(const Duration(milliseconds: 100));

        if (returnRouteSource == 'profile') {
          print('🔵 Переход на ProfileNavigationRoute (push)');
          currentContext.router.push(const ProfileNavigationRoute());
        } else if (returnRouteSource == 'testing_mode' || returnRouteSource == 'select_topics') {
          // Для select_topics и testing_mode навигируем на экран режима тестирования
          // Там будет проверен статус платежа и разблокирован тренировочный режим
          print('🔵 Переход на TestingModeRoute (push)');
          // TestingModeRoute находится внутри LearningNavigationRoute (path: 'learning')
          currentContext.router.push(
            BaseRoute(
              children: [
                LearningNavigationRoute(children: [const TestingModeRoute()]),
              ],
            ),
          );
        } else {
          print('⚠️ returnRouteSource не указан или неизвестен: $returnRouteSource');
        }
      } catch (e, stackTrace) {
        print('❌ Ошибка при навигации: $e');
        print('StackTrace: $stackTrace');
        // В случае ошибки пробуем просто push без очистки стека
        try {
          if (returnRouteSource == 'profile') {
            currentContext.router.push(const ProfileNavigationRoute());
          } else if (returnRouteSource == 'testing_mode' || returnRouteSource == 'select_topics') {
            currentContext.router.push(
              BaseRoute(
                children: [
                  LearningNavigationRoute(children: [const TestingModeRoute()]),
                ],
              ),
            );
          }
        } catch (e2) {
          print('❌ Ошибка при fallback навигации: $e2');
        }
      }
    });
  }
}
