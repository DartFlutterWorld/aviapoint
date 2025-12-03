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
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'dart:html' as html if (dart.library.io) 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<SubscriptionDto> _subscriptions = [];
  bool _isLoadingSubscription = false;
  String? _subscriptionError;

  @override
  void initState() {
    super.initState();
    if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
      BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
      _loadSubscription();
    }

    // Обрабатываем параметры из URL (для редиректа после оплаты)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handlePaymentRedirect();
    });
  }

  void _handlePaymentRedirect() {
    if (!kIsWeb) {
      // На мобильных WebView сам обработает через _handleUrl в PaymentWebViewScreen
      return;
    }

    try {
      // На веб получаем параметры из window.location.href
      // Параметры могут быть в query string или в hash
      String? paymentStatus;
      
      if (kIsWeb) {
        // Используем dart:html для получения полного URL
        final fullUrl = html.window.location.href;
        final uri = Uri.parse(fullUrl);
        
        // Пробуем получить из query параметров
        paymentStatus = uri.queryParameters['payment'];
        
        // Если не нашли в query, пробуем из hash (для SPA роутинга)
        // Формат: #/profile?payment=success
        if (paymentStatus == null && uri.fragment.isNotEmpty) {
          // Извлекаем query параметры из hash
          final hash = uri.fragment;
          final questionMarkIndex = hash.indexOf('?');
          if (questionMarkIndex != -1) {
            final queryString = hash.substring(questionMarkIndex + 1);
            final hashUri = Uri.parse('?$queryString');
            paymentStatus = hashUri.queryParameters['payment'];
          }
        }
      } else {
        // На мобильных используем Uri.base
        final uri = Uri.base;
        paymentStatus = uri.queryParameters['payment'];
      }

      if (paymentStatus == 'success') {
        // Показываем сообщение об успешной оплате
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж успешно выполнен!'), backgroundColor: Colors.green, duration: Duration(seconds: 3)));
        // Обновляем информацию о подписке
        _loadSubscription();
      } else if (paymentStatus == 'cancel') {
        // Показываем сообщение об отмене
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Оплата отменена'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
      }
    } catch (e) {
      // Игнорируем ошибки парсинга URL
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
      final subscriptions = await paymentRepository.getSubscriptionStatus();

      setState(() {
        _subscriptions = subscriptions;
        _isLoadingSubscription = false;
      });
    } catch (e) {
      // Не показываем технические ошибки пользователю
      // Если это ошибка парсинга HTML (SPA роутинг), просто не показываем подписку
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
            actions: [
              Provider.of<AppState>(context, listen: true).isAuthenticated
                  ? IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
                  : IconButton(onPressed: () => showLogin(context), icon: Icon(Icons.login)),
            ],
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 16),
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
                                  SizedBox(height: 16),
                                  // Информация о подписке
                                  if (_isLoadingSubscription)
                                    const Padding(padding: EdgeInsets.symmetric(vertical: 16.0), child: LoadingCustom())
                                  else if (_subscriptionError != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Column(
                                        children: [
                                          Text('Ошибка загрузки подписки: $_subscriptionError', style: AppStyles.regular14s.copyWith(color: Colors.red)),
                                          const SizedBox(height: 8),
                                          ElevatedButton(onPressed: _loadSubscription, child: const Text('Повторить')),
                                        ],
                                      ),
                                    )
                                  else if (_subscriptions.isNotEmpty)
                                    // Отображаем все подписки
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: _subscriptions.map((subscription) {
                                        final isActive = subscription.isActive && subscription.endDate.isAfter(DateTime.now());
                                        final isExpired = subscription.endDate.isBefore(DateTime.now());

                                        return Container(
                                          margin: const EdgeInsets.only(bottom: 12),
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            color: isActive
                                                ? Colors.green.withOpacity(0.1)
                                                : isExpired
                                                ? Colors.orange.withOpacity(0.1)
                                                : Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: isActive
                                                  ? Colors.green.withOpacity(0.3)
                                                  : isExpired
                                                  ? Colors.orange.withOpacity(0.3)
                                                  : Colors.grey.withOpacity(0.3),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    isActive ? Icons.check_circle : Icons.info_outline,
                                                    color: isActive
                                                        ? Colors.green
                                                        : isExpired
                                                        ? Colors.orange
                                                        : Colors.grey,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    isActive
                                                        ? 'Подписка активна'
                                                        : isExpired
                                                        ? 'Подписка истекла'
                                                        : 'Подписка неактивна',
                                                    style: AppStyles.bold16s.copyWith(
                                                      color: isActive
                                                          ? Colors.green
                                                          : isExpired
                                                          ? Colors.orange
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              _buildSubscriptionInfoRow('Стоимость:', '${subscription.amount.toStringAsFixed(2)} ₽'),
                                              const SizedBox(height: 8),
                                              _buildSubscriptionInfoRow('Дата начала:', DateFormat('dd.MM.yyyy').format(subscription.startDate)),
                                              const SizedBox(height: 8),
                                              _buildSubscriptionInfoRow('Дата окончания:', DateFormat('dd.MM.yyyy').format(subscription.endDate)),
                                              const SizedBox(height: 8),
                                              _buildSubscriptionInfoRow('Период:', '${subscription.periodDays} дней'),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  else
                                    // Подписки нет
                                    Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.subscriptions_outlined, color: Colors.grey, size: 20),
                                              const SizedBox(width: 8),
                                              Text('Подписка отсутствует', style: AppStyles.bold16s.copyWith(color: Colors.grey)),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            'У вас нет активной подписки. Для доступа к тренировочному режиму необходимо оформить подписку.',
                                            style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767)),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                children: [
                                  Image.asset(Pictures.planeProfile, height: 374, width: 286),
                                  SizedBox(height: 16),
                                  CustomButton(
                                    verticalPadding: 8,
                                    backgroundColor: Color(0xFF0A6EFA),
                                    title: 'Войти в профиль',
                                    textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                                    borderColor: Color(0xFF0A6EFA),
                                    borderRadius: 46,
                                    boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                                    onPressed: () => showLogin(context),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
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

  Widget _buildSubscriptionInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
        Text(value, style: AppStyles.bold14s.copyWith(color: Color(0xFF2B373E))),
      ],
    );
  }
}
