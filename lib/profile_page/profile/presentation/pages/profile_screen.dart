import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/utils/payment_storage_helper.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/Subscribe_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/subscribe_widget_active.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<SubscriptionDto> _subscriptions = [];
  List<SubscriptionTypeModel> _subscriptionTypes = [];
  bool _isLoadingSubscription = false;
  bool _isLoadingSubscriptionTypes = false;
  String? _subscriptionError;

  @override
  void initState() {
    super.initState();
    if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
      BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
      _loadSubscription();
      _loadSubscriptionTypes();
    }

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

          // Очищаем payment_id из localStorage
          await PaymentStorageHelper.clearPaymentId();

          // Показываем сообщение в зависимости от реального статуса
          if (payment.status == 'succeeded') {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж успешно выполнен!'), backgroundColor: Colors.green, duration: Duration(seconds: 3)));
            // Обновляем информацию о подписке
            _loadSubscription();
          } else if (payment.status == 'canceled') {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Оплата отменена'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
          } else {
            // pending или waiting_for_capture
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж обрабатывается...'), backgroundColor: Colors.blue, duration: Duration(seconds: 3)));
          }
        } catch (e) {
          print('Ошибка при проверке статуса платежа: $e');
          // Очищаем payment_id даже при ошибке
          await PaymentStorageHelper.clearPaymentId();
          // Показываем общее сообщение
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось проверить статус платежа'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
        }
      }
    } catch (e) {
      // Игнорируем ошибки
      print('Ошибка при обработке редиректа: $e');
    }
  }

  Future<void> _loadSubscription() async {
    if (!Provider.of<AppState>(context, listen: false).isAuthenticated) {
      return;
    }

    setState(() {
      _isLoadingSubscription = true;
      _subscriptionError = null;
    });

    try {
      final paymentRepository = getIt<PaymentRepository>();
      // Бэкенд теперь всегда возвращает успешный ответ с массивом (пустым или с данными)
      final subscriptions = await paymentRepository.getSubscriptionStatus();

      setState(() {
        _subscriptions = subscriptions;
        _isLoadingSubscription = false;
        _subscriptionError = null;
      });
    } catch (e) {
      // Обрабатываем только реальные ошибки (сеть, парсинг и т.д.)
      // PaymentRepositoryImpl в большинстве случаев возвращает пустой список вместо исключения
      print('Ошибка при загрузке подписок: $e');
      final errorString = e.toString();
      if (errorString.contains('type \'String\' is not a subtype of type \'Map') || errorString.contains('<!DOCTYPE html>') || errorString.contains('DioException [unknown]')) {
        // Это ошибка SPA роутинга - просто не показываем подписку
        setState(() {
          _subscriptions = [];
          _subscriptionError = null;
          _isLoadingSubscription = false;
        });
      } else {
        // Для других ошибок показываем сообщение
        setState(() {
          _subscriptionError = 'Не удалось загрузить информацию о подписке';
          _isLoadingSubscription = false;
        });
      }
    }
  }

  Future<void> _loadSubscriptionTypes() async {
    if (!Provider.of<AppState>(context, listen: false).isAuthenticated) {
      print('⚠️ Пользователь не авторизован, пропускаем загрузку типов подписок');
      return;
    }

    print('🔵 Начинаем загрузку типов подписок...');
    setState(() {
      _isLoadingSubscriptionTypes = true;
    });

    try {
      final paymentRepository = getIt<PaymentRepository>();
      final subscriptionTypes = await paymentRepository.getSubscriptionTypes();
      print('✅ Загружено типов подписок: ${subscriptionTypes.length}');

      setState(() {
        // Фильтруем только активные типы подписок
        _subscriptionTypes = subscriptionTypes.where((type) => type.isActive).toList();
        print('✅ Активных типов подписок: ${_subscriptionTypes.length}');
        _isLoadingSubscriptionTypes = false;
      });
    } catch (e, stackTrace) {
      print('❌ Ошибка при загрузке типов подписок: $e');
      print('StackTrace: $stackTrace');
      setState(() {
        _subscriptionTypes = [];
        _isLoadingSubscriptionTypes = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, paymentState) {
        // Если платеж успешен, обновляем информацию о подписке
        paymentState.maybeWhen(
          success: (payment) {
            if (payment.isSucceeded) {
              // Обновляем информацию о подписке после успешной оплаты
              _loadSubscription();
            }
          },
          orElse: () {},
        );
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessAuthState) {
            BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
            _loadSubscription();
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Профиль',
            withBack: false,
            // backgroundColor: AppColors.background,
          ),
          backgroundColor: AppColors.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Provider.of<AppState>(context, listen: true).isAuthenticated
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Image.asset(Pictures.pilot, height: 63, width: 63),

                                      BlocBuilder<ProfileBloc, ProfileState>(
                                        builder: (context, state) => state.map(
                                          success: (state) => Padding(
                                            padding: const EdgeInsets.only(left: 12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text('${state.profile.firstName ?? ''} ${state.profile.lastName ?? ''}', style: AppStyles.bold16s.copyWith(color: Color(0xFF2B373E))),
                                                Text(state.profile.phone, style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
                                                Text(state.profile.email ?? '', style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
                                              ],
                                            ),
                                          ),
                                          error: (state) => Center(
                                            child: ErrorCustom(
                                              textError: state.errorForUser,
                                              repeat: () {
                                                if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
                                                  BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
                                                }
                                              },
                                            ),
                                          ),
                                          loading: (state) => LoadingCustom(),
                                          initial: (state) => SizedBox(),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 16),
                                  // Информация о подписке
                                  if (_isLoadingSubscription)
                                    const Padding(padding: EdgeInsets.symmetric(vertical: 16.0), child: LoadingCustom())
                                  else if (_subscriptions.isNotEmpty)
                                    // Отображаем все подписки
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: _subscriptions.map((subscription) {
                                        // Находим соответствующий тип подписки по subscriptionTypeId

                                        return SubscribeWidgetActive(subscription: subscription, fon: Pictures.podpiskaActiveFon);
                                      }).toList(),
                                    )
                                  else ...[
                                    // Подписки нет - показываем виджет без подписки
                                    if (_isLoadingSubscriptionTypes)
                                      // Пока загружаются типы, показываем заглушку (нужно будет обновить SubscribeWidget для поддержки nullable)
                                      const SizedBox(height: 225)
                                    else if (_subscriptionTypes.isNotEmpty)
                                      // Используем первый доступный тип подписки (приоритет yearly)
                                      SubscribeWidget(
                                        subscriptionType: _subscriptionTypes.firstWhere((type) => type.code == 'rosaviatest_365' && type.isActive, orElse: () => _subscriptionTypes.first),
                                        fon: Pictures.podpiskaNoActiveFon,
                                      )
                                    else
                                      // Если типов подписок нет, показываем заглушку
                                      const SizedBox(height: 225),
                                  ],
                                  SizedBox(height: 16),
                                  // Кнопка очистки БД
                                  // ElevatedButton.icon(
                                  //   onPressed: () {
                                  //     showDialog<void>(
                                  //       context: context,
                                  //       builder: (ctx) => AlertDialog(
                                  //         title: Text('Очистить прогресс?'),
                                  //         content: Text('Это удалит все сохраненные сессии тестирования и прогресс. Это действие нельзя отменить.'),
                                  //         actions: [
                                  //           TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Отмена')),
                                  //           ElevatedButton(
                                  //             onPressed: () async {
                                  //               Navigator.pop(ctx);
                                  //               await getIt<AppDb>().clearAllData();
                                  //               if (context.mounted) {
                                  //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Прогресс очищен')));
                                  //               }
                                  //             },
                                  //             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                  //             child: Text('Очистить', style: TextStyle(color: Colors.white)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  //   icon: Icon(Icons.delete_outline),
                                  //   label: Text('Очистить прогресс'),
                                  //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.1), foregroundColor: Colors.red),
                                  // ),
                                  // SizedBox(height: 16),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Image.asset(Pictures.planeProfile, height: 374, width: 286), SizedBox(height: 16)],
                              ),
                      ],
                    ),
                  ),
                ),
                // Кнопки входа и выхода (прижаты к низу)
                if (Provider.of<AppState>(context, listen: true).isAuthenticated) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: CustomButton(
                      verticalPadding: 8,
                      backgroundColor: Color(0xFFFF6B6B),
                      title: 'Выйти',
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: Color(0xFFFF6B6B),
                      borderRadius: 46,
                      boxShadow: [BoxShadow(color: Color(0xFFE53E3E).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                      onPressed: () => logOut(context),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: CustomButton(
                      verticalPadding: 8,
                      backgroundColor: Color(0xFF0A6EFA),
                      title: 'Войти в профиль',
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: Color(0xFF0A6EFA),
                      borderRadius: 46,
                      boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                      onPressed: () => showLogin(context),
                    ),
                  ),
                ],
                // Ссылка на политику конфиденциальности внизу
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextButton(
                    onPressed: () {
                      context.router.push(const PrivacyPolicyRoute());
                    },
                    child: Text(
                      'Политика конфиденциальности',
                      style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA), decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
