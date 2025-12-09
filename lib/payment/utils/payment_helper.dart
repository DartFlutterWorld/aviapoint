import 'dart:async';

import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/injection_container.dart';
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
  /// Создает платеж и сразу открывает WebView (мобильные) или редиректит (веб)
  ///
  /// [context] - контекст для доступа к BlocProvider
  /// [amount] - сумма платежа
  /// [currency] - валюта (по умолчанию 'RUB')
  /// [description] - описание платежа
  /// [subscriptionTypeId] - ID типа подписки
  /// [returnRouteSource] - источник, откуда пришел пользователь ('profile' или 'testing_mode')
  ///
  /// Возвращает true, если платеж успешно создан и редирект/WebView открыт
  static Future<bool> createPaymentAndRedirect({
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка: не удалось получить данные пользователя'), backgroundColor: Colors.red));
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
        CreatePaymentEvent(amount: amount, currency: currency, description: description, userId: userId!, subscriptionTypeId: subscriptionTypeId, customerPhone: customerPhone, returnUrl: returnUrl),
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Превышено время ожидания. Попробуйте еще раз.'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
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
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка при создании платежа: ${e.toString()}'), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
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
          if (context.mounted) {
            print('🔵 Открываем WebView на мобильном устройстве');
            // Сохраняем paymentId для проверки статуса после возврата
            await PaymentStorageHelper.savePaymentId(paymentId);

            // Используем rootNavigator, чтобы открыть поверх диалога
            final result = await Navigator.of(context, rootNavigator: true).push<bool>(
              MaterialPageRoute<bool>(
                builder: (context) {
                  print('🔵 PaymentWebViewScreen создан с URL: $paymentUrl');
                  return PaymentWebViewScreen(paymentUrl: paymentUrl, returnRouteSource: returnRouteSource, paymentId: paymentId);
                },
              ),
            );

            // После возврата из WebView проверяем статус через API
            // Используем глобальный контекст, так как локальный может стать невалидным
            final rootContext = navigatorKey.currentContext;

            if (result == true && paymentId.isNotEmpty) {
              print('🔵 WebView вернул true, проверяем статус через API');
              if (rootContext != null && rootContext.mounted) {
                await _handlePaymentReturn(rootContext, paymentId, returnRouteSource);
              } else {
                print('❌ rootContext не доступен для проверки статуса');
              }
            } else if (result == false) {
              // Пользователь отменил оплату через кнопку закрытия - навигируем обратно
              print('⚠️ WebView вернул false (отмена), навигируем на исходный экран: $returnRouteSource');
              if (rootContext != null && rootContext.mounted) {
                navigateToSource(rootContext, returnRouteSource);
              } else {
                print('❌ rootContext не доступен для навигации при отмене');
              }
            } else {
              print('⚠️ WebView закрыт, но result=$result, context.mounted=${context.mounted}, paymentId.isNotEmpty=${paymentId.isNotEmpty}');
              // Даже если result null или неопределен, пытаемся навигировать обратно
              if (rootContext != null && rootContext.mounted) {
                navigateToSource(rootContext, returnRouteSource);
              }
            }

            print('✅ WebView закрыт, result: $result');
            return true;
          } else {
            print('❌ Контекст не mounted, не можем открыть WebView');
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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка: $message'), backgroundColor: Colors.red));
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка при создании платежа: $e'), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
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

      // Очищаем paymentId
      await PaymentStorageHelper.clearPaymentId();

      // Логируем статус платежа (уведомления убраны, чтобы не вводить пользователя в заблуждение)
      if (payment.status == 'succeeded') {
        print('✅ Платеж успешно выполнен');
      } else if (payment.status == 'canceled') {
        print('⚠️ Платеж отменен');
      } else if (payment.status == 'pending' || payment.status == 'waiting_for_capture') {
        print('⏳ Платеж имеет статус ${payment.status}');
      } else {
        print('⚠️ Неизвестный статус платежа: ${payment.status}');
      }

      // Навигируем на исходный экран
      navigateToSource(context, returnRouteSource);
    } catch (e, stackTrace) {
      print('❌ Ошибка при проверке статуса платежа: $e');
      print('StackTrace: $stackTrace');
      // Очищаем paymentId даже при ошибке
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
        // Сначала очищаем стек до BaseRoute
        print('🔵 Очищаем стек навигации до BaseRoute');
        currentContext.router.popUntil((route) => route.settings.name == BaseRoute.name || route.isFirst);

        // Небольшая задержка для завершения очистки стека
        await Future<void>.delayed(const Duration(milliseconds: 100));

        if (returnRouteSource == 'profile') {
          print('🔵 Переход на ProfileNavigationRoute (push)');
          currentContext.router.push(const ProfileNavigationRoute());
        } else if (returnRouteSource == 'testing_mode') {
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
          } else if (returnRouteSource == 'testing_mode') {
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
