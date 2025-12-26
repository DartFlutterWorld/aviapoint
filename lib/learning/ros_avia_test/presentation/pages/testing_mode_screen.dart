import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/testing_mode_element.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/utils/payment_storage_helper.dart';
import 'package:aviapoint/payment/utils/payment_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TestingModeScreen extends StatefulWidget {
  const TestingModeScreen({super.key});

  @override
  State<TestingModeScreen> createState() => _TestingModeScreenState();
}

class _TestingModeScreenState extends State<TestingModeScreen> {
  bool _hasActiveSubscription = false;
  bool? _previousAuthStatus;

  @override
  void initState() {
    super.initState();
    // Инициализируем предыдущий статус авторизации
    final appState = Provider.of<AppState>(context, listen: false);
    _previousAuthStatus = appState.isAuthenticated;
    _checkSubscription();

    // Обрабатываем параметры из URL (для редиректа после оплаты)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handlePaymentRedirect();
    });
  }

  Future<void> _handlePaymentRedirect() async {
    if (!kIsWeb) {
      // На мобильных WebView сам обработает через _handleUrl в PaymentWebViewScreen
      return;
    }

    try {
      // ЮKassa всегда возвращает на return_url, независимо от результата
      // Проверяем наличие payment_id в localStorage и проверяем статус через API
      final paymentId = await PaymentStorageHelper.getPaymentId();

      if (paymentId != null && paymentId.isNotEmpty) {
        try {
          // Проверяем статус платежа через API
          final paymentRepository = getIt<PaymentRepository>();
          final payment = await paymentRepository.getPaymentStatus(paymentId);

          print('🔵 Статус платежа от API (веб): ${payment.status}, paid: ${payment.paid}');

          // Очищаем payment_id из localStorage
          await PaymentStorageHelper.clearPaymentId();

          // Логируем статус платежа (уведомления убраны, чтобы не вводить пользователя в заблуждение)
          if (payment.status == 'succeeded') {
            print('✅ Платеж успешно выполнен (веб)');
            // Обновляем информацию о подписке
            _checkSubscription();
            // Навигируем на исходный экран используя ту же логику, что и при отмене
            PaymentHelper.navigateToSource(context, 'testing_mode');
          } else if (payment.status == 'canceled') {
            print('⚠️ Платеж отменен (веб)');
          } else if (payment.status == 'pending' || payment.status == 'waiting_for_capture') {
            print('⏳ Платеж имеет статус ${payment.status} (веб)');
          } else {
            print('⚠️ Неизвестный статус платежа: ${payment.status} (веб)');
          }
        } catch (e) {
          print('Ошибка при проверке статуса платежа: $e');
          // Очищаем payment_id даже при ошибке
          await PaymentStorageHelper.clearPaymentId();
        }
      }
    } catch (e) {
      // Игнорируем ошибки
      print('Ошибка при обработке редиректа: $e');
    }
  }

  Future<void> _checkSubscription() async {
    try {
      final appState = Provider.of<AppState>(context, listen: false);
      if (!appState.isAuthenticated) {
        if (mounted) {
          setState(() {
            _hasActiveSubscription = false;
          });
        }
        return;
      }

      final paymentRepository = getIt<PaymentRepository>();
      final subscriptions = await paymentRepository.getSubscriptionStatus();

      final hasActive = subscriptions.any(
        (subscription) => subscription.isActive && subscription.endDate.isAfter(DateTime.now()),
      );

      if (mounted) {
        setState(() {
          _hasActiveSubscription = hasActive;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasActiveSubscription = false;
        });
      }
    }
  }

  Future<void> _handleTrainingModePayment(BuildContext context) async {
    // Проверяем статус авторизации
    final appState = Provider.of<AppState>(context, listen: false);
    final isAuthenticated = appState.isAuthenticated;

    if (!isAuthenticated) {
      // Если не авторизован - показываем боттом шит с регистрацией
      await showLogin(
        context,
        callback: () async {
          // После успешной авторизации проверяем подписку
          await _checkSubscriptionAndNavigate(context);
        },
      );
      return;
    }

    // Если авторизован - проверяем статус подписки
    await _checkSubscriptionAndNavigate(context);
  }

  Future<void> _checkSubscriptionAndNavigate(BuildContext context) async {
    try {
      // Проверяем статус подписки на сервере
      final paymentRepository = getIt<PaymentRepository>();
      final subscriptions = await paymentRepository.getSubscriptionStatus();

      // Проверяем, есть ли хотя бы одна активная подписка
      final hasActiveSubscription = subscriptions.any(
        (subscription) => subscription.isActive && subscription.endDate.isAfter(DateTime.now()),
      );

      if (hasActiveSubscription) {
        // Обновляем состояние подписки в UI
        if (mounted) {
          setState(() {
            _hasActiveSubscription = true;
          });
        }

        // Подписка активна - открываем боттом шит с настройками
        final rosAviaTestCubit = context.read<RosAviaTestCubit>();
        rosAviaTestCubit.setTestMode(TestMode.training);

        // Сохраняем выбранный режим в БД
        final certificateTypeId = rosAviaTestCubit.state.typeSertificate.id;
        final db = getIt<AppDb>();
        await db.saveTestMode(certificateTypeId: certificateTypeId, testMode: 'training');

        // Открываем боттом шит с настройками
        if (context.mounted) {
          final rootContext = navigatorKey.currentContext;
          if (rootContext != null && rootContext.mounted) {
            await selectTopics(context: rootContext, testMode: TestMode.training);
          } else if (context.mounted) {
            await selectTopics(context: context, testMode: TestMode.training);
          }
        }
      } else {
        // Подписка не активна - переходим на оплату
        print('🔵 Подписка не активна, переходим на оплату');
        await _navigateToPayment(context);
      }
    } catch (e, stackTrace) {
      // В случае ошибки переходим на оплату
      print('❌ Ошибка при проверке подписки: $e');
      print('StackTrace: $stackTrace');
      await _navigateToPayment(context);
    }
  }

  Future<void> _navigateToPayment(BuildContext context) async {
    print('🔵 _navigateToPayment: начинаем навигацию');

    // Добавляем небольшую задержку для стабилизации UI
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // Используем Navigator напрямую для модального экрана
    // Это обходит проблему с табами и открывает экран поверх всего
    if (!context.mounted) {
      print('⚠️  Контекст не mounted, используем rootNavigator');
      final rootContext = navigatorKey.currentContext;
      if (rootContext != null && rootContext.mounted) {
        await _openPaymentScreen(rootContext);
      }
      return;
    }

    await _openPaymentScreen(context);
  }

  Future<void> _openPaymentScreen(BuildContext context) async {
    try {
      if (!context.mounted) return;

      // Загружаем типы подписок и находим yearly
      final paymentRepository = getIt<PaymentRepository>();
      final subscriptionTypes = await paymentRepository.getSubscriptionTypes();
      final yearlyType = subscriptionTypes.firstWhere(
        (type) => type.code == 'rosaviatest_365' && type.isActive,
        orElse: () => throw Exception('Годовая подписка не найдена'),
      );

      if (!context.mounted) return;

      await PaymentHelper.createPaymentAndRedirect(
        context: context,
        amount: yearlyType.price.toDouble(),
        currency: 'RUB',
        description: '${yearlyType.name}, ${yearlyType.description} на ${yearlyType.periodDays} дней',
        subscriptionTypeId: yearlyType.id,
        returnRouteSource: 'testing_mode',
      );
    } catch (e, stackTrace) {
      print('❌ Ошибка при создании платежа: $e');
      print('StackTrace: $stackTrace');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при загрузке типов подписок: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleModeSelection(BuildContext context, TestMode testMode) async {
    final rosAviaTestCubit = context.read<RosAviaTestCubit>();
    rosAviaTestCubit.setTestMode(testMode);

    // Сохраняем выбранный режим в БД
    final certificateTypeId = rosAviaTestCubit.state.typeSertificate.id;
    final db = getIt<AppDb>();
    final testModeString = testMode.name; // 'training' или 'standart'
    await db.saveTestMode(certificateTypeId: certificateTypeId, testMode: testModeString);

    // Открываем боттом шит с настройками
    if (context.mounted) {
      // Используем root контекст для открытия боттом шита
      final rootContext = navigatorKey.currentContext;
      if (rootContext != null && rootContext.mounted) {
        await selectTopics(context: rootContext, testMode: testMode);
      } else if (context.mounted) {
        await selectTopics(context: context, testMode: testMode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Формируем title в зависимости от наличия активной подписки
    final trainingModeTitle = _hasActiveSubscription
        ? 'Тренировочный\nрежим'
        : 'Тренировочный\nрежим (Подписка 1000 ₽/год)';

    return BlocProvider.value(
      value: getIt<RosAviaTestCubit>(),
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          // Слушаем изменения isAuthenticated и обновляем подписку только при изменении
          final currentAuthStatus = appState.isAuthenticated;
          if (_previousAuthStatus != currentAuthStatus) {
            _previousAuthStatus = currentAuthStatus;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                _checkSubscription();
              }
            });
          }
          return child!;
        },
        child: Scaffold(
          appBar: CustomAppBar(title: 'Выберите режим тестирования', withBack: true),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.h),
                  TestingModeElement(
                    title: trainingModeTitle,
                    subTitle: 'Правильные ответы появляются сразу',
                    onTap: () => _handleTrainingModePayment(context),
                    image: Pictures.zamok,
                    bg: Pictures.traningTestBgPng,
                    isLock: !_hasActiveSubscription, // Показываем анимацию, если нет активной подписки
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Тренировочный режим позволит вам готовиться к экзамену с большей эффективностью. У вас появится возможность перемешать вопросы и ответы. После выбора ответа вы сразу же увидите правильный ответ. Так же вам будет доступно обоснование правильного ответа.',
                    style: AppStyles.regular12s.copyWith(color: Color(0xFF1F2937), height: 1),
                  ),
                  SizedBox(height: 16.h),
                  TestingModeElement(
                    title: 'Стандартный\nтест',
                    subTitle: 'Результаты появятся вконце теста',
                    onTap: () => _handleModeSelection(context, TestMode.standart),
                    image: Pictures.mozgi,
                    bg: Pictures.testMySelfBgPng,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Стандартный режим позволит вам бесплатно готовиться к экзамену. Статистика по правильно отвечнным вопросам появится вконце всех вопросов',
                    style: AppStyles.regular12s.copyWith(color: Color(0xFF1F2937), height: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
