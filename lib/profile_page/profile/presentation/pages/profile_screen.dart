import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/utils/payment_storage_helper.dart';
import 'package:aviapoint/payment/utils/payment_helper.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/Subscribe_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/profile_data_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/subscribe_widget_active.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/review_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    _loadDataIfAuthenticated();

    // Обрабатываем параметры из URL (для редиректа после оплаты)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handlePaymentRedirect();
    });
  }

  void _loadDataIfAuthenticated() {
    if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
      BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
      _loadSubscription();
      _loadSubscriptionTypes();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Перезагружаем данные при изменении состояния авторизации
    final isAuthenticated = Provider.of<AppState>(context, listen: true).isAuthenticated;
    if (isAuthenticated && _subscriptions.isEmpty && !_isLoadingSubscription) {
      // Если пользователь авторизован, но подписки не загружены, загружаем их
      _loadDataIfAuthenticated();
    }
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
            _loadSubscription();
            // Навигируем на исходный экран используя ту же логику, что и при отмене
            PaymentHelper.navigateToSource(context, 'profile');
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

  Future<void> _loadSubscription() async {
    if (!mounted) return;

    if (!Provider.of<AppState>(context, listen: false).isAuthenticated) {
      if (mounted) {
        setState(() {
          _subscriptions = [];
          _isLoadingSubscription = false;
        });
      }
      return;
    }

    if (mounted) {
      setState(() {
        _isLoadingSubscription = true;
        _subscriptionError = null;
      });
    }

    try {
      final paymentRepository = getIt<PaymentRepository>();
      // Бэкенд теперь всегда возвращает успешный ответ с массивом (пустым или с данными)
      final subscriptions = await paymentRepository.getSubscriptionStatus();

      if (mounted) {
        setState(() {
          _subscriptions = subscriptions;
          _isLoadingSubscription = false;
          _subscriptionError = null;
        });
        print('✅ Подписки загружены: ${subscriptions.length}');
      }
    } catch (e) {
      // Обрабатываем только реальные ошибки (сеть, парсинг и т.д.)
      // PaymentRepositoryImpl в большинстве случаев возвращает пустой список вместо исключения
      print('❌ Ошибка при загрузке подписок: $e');
      final errorString = e.toString();
      if (!mounted) return;

      if (errorString.contains('type \'String\' is not a subtype of type \'Map') ||
          errorString.contains('<!DOCTYPE html>') ||
          errorString.contains('DioException [unknown]')) {
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
    if (!mounted) return;

    if (!Provider.of<AppState>(context, listen: false).isAuthenticated) {
      print('⚠️ Пользователь не авторизован, пропускаем загрузку типов подписок');
      if (mounted) {
        setState(() {
          _subscriptionTypes = [];
          _isLoadingSubscriptionTypes = false;
        });
      }
      return;
    }

    print('🔵 Начинаем загрузку типов подписок...');
    if (mounted) {
      setState(() {
        _isLoadingSubscriptionTypes = true;
      });
    }

    try {
      final paymentRepository = getIt<PaymentRepository>();
      final subscriptionTypes = await paymentRepository.getSubscriptionTypes();
      print('✅ Загружено типов подписок: ${subscriptionTypes.length}');

      if (mounted) {
        setState(() {
          // Фильтруем только активные типы подписок
          _subscriptionTypes = subscriptionTypes.where((type) => type.isActive).toList();
          print('✅ Активных типов подписок: ${_subscriptionTypes.length}');
          _isLoadingSubscriptionTypes = false;
        });
      }
    } catch (e, stackTrace) {
      print('❌ Ошибка при загрузке типов подписок: $e');
      print('StackTrace: $stackTrace');
      if (mounted) {
        setState(() {
          _subscriptionTypes = [];
          _isLoadingSubscriptionTypes = false;
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
            _loadSubscriptionTypes();
          }
        },
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            // При обновлении профиля (включая загрузку фото) обновляем UI
            state.maybeWhen(
              success: (profile) {
                // Профиль обновлен - BlocBuilder автоматически перестроит виджет
                print('✅ Профиль обновлен, avatarUrl: ${profile.avatarUrl}');
              },
              orElse: () {},
            );
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
                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (context, state) {
                                            final avatarUrl = state.maybeWhen(
                                              success: (profile) => profile.avatarUrl,
                                              orElse: () => null,
                                            );

                                            // Для фото профиля используем avatarUrl (уже содержит timestamp в имени файла на бэкенде)
                                            final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty
                                                ? getImageUrl(avatarUrl)
                                                : null;

                                            return ClipOval(
                                              child: imageUrl != null && imageUrl.isNotEmpty
                                                  ? CachedNetworkImage(
                                                      imageUrl: imageUrl,
                                                      width: 63,
                                                      height: 63,
                                                      fit: BoxFit.cover,
                                                      cacheManager: getIt<DefaultCacheManager>(),
                                                      cacheKey:
                                                          avatarUrl, // Используем avatarUrl как ключ кеша (уникален благодаря timestamp)
                                                      placeholder: (context, url) => Image.asset(
                                                        Pictures.pilot,
                                                        width: 63,
                                                        height: 63,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      errorWidget: (context, url, error) => Image.asset(
                                                        Pictures.pilot,
                                                        width: 63,
                                                        height: 63,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  : Image.asset(
                                                      Pictures.pilot,
                                                      height: 63,
                                                      width: 63,
                                                      fit: BoxFit.cover,
                                                    ),
                                            );
                                          },
                                        ),

                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (context, state) => state.map(
                                            success: (state) => Padding(
                                              padding: const EdgeInsets.only(left: 12.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    '${state.profile.firstName ?? ''} ${state.profile.lastName ?? ''}',
                                                    style: AppStyles.bold16s.copyWith(color: Color(0xFF2B373E)),
                                                  ),
                                                  Text(
                                                    state.profile.phone,
                                                    style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767)),
                                                  ),
                                                  Text(
                                                    state.profile.email ?? '',
                                                    style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767)),
                                                  ),
                                                  // Рейтинг пользователя
                                                  if (state.profile.averageRating != null &&
                                                      state.profile.averageRating! > 0) ...[
                                                    SizedBox(height: 8.h),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        RatingWidget(
                                                          rating: state.profile.averageRating!.round(),
                                                          size: 16,
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          '${state.profile.averageRating!.toStringAsFixed(1)}',
                                                          style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                                                        ),
                                                        if (state.profile.reviewsCount != null &&
                                                            state.profile.reviewsCount! > 0) ...[
                                                          SizedBox(width: 4.w),
                                                          Text(
                                                            '(${state.profile.reviewsCount} ${_getReviewsCountText(state.profile.reviewsCount!)})',
                                                            style: AppStyles.regular12s.copyWith(
                                                              color: Color(0xFF9CA5AF),
                                                            ),
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                  ],
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
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 16.0),
                                        child: LoadingCustom(),
                                      )
                                    else if (_subscriptions.isNotEmpty)
                                      // Отображаем все подписки
                                      Row(
                                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: _subscriptions.map((subscription) {
                                          // Находим соответствующий тип подписки по subscriptionTypeId

                                          return SubscribeWidgetActive(
                                            subscription: subscription,
                                            fon: Pictures.podpiskaActiveFon,
                                          );
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
                                          subscriptionType: _subscriptionTypes.firstWhere(
                                            (type) => type.code == 'rosaviatest_365' && type.isActive,
                                            orElse: () => _subscriptionTypes.first,
                                          ),
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
                                    SizedBox(height: 16),
                                    // Секция отзывов
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => _buildReviewsSection(context, profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 16),
                                    ProfileDataWidget(
                                      title: 'Изменить данные',
                                      icon: Pictures.user,
                                      onTap: () => openProfileEdit(context: context),
                                    ),
                                    Divider(height: 18.h),
                                    ProfileDataWidget(
                                      title: 'Политика конфиденциальности',
                                      icon: Pictures.securitySafe,
                                      onTap: () => context.router.push(const PrivacyPolicyRoute()),
                                    ),
                                    Divider(height: 18.h),
                                    ProfileDataWidget(
                                      title: 'Связаться с нами',
                                      icon: Pictures.smsEdit,
                                      onTap: () => openContactUs(context: context),
                                    ),
                                    Divider(height: 18.h),
                                    ProfileDataWidget(
                                      title: 'Выйти',
                                      icon: Pictures.logout,
                                      onTap: () => logOut(context),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(Pictures.planeProfile, height: 374, width: 286),
                                      SizedBox(height: 16),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                                        child: CustomButton(
                                          verticalPadding: 8,
                                          backgroundColor: Color(0xFF0A6EFA),
                                          title: 'Войти в профиль',
                                          textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                                          borderColor: Color(0xFF0A6EFA),
                                          borderRadius: 46,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff0064D6).withOpacity(0.25),
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              offset: Offset(0.0, 7.0),
                                            ),
                                          ],
                                          onPressed: () => showLogin(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  // Кнопки входа и выхода (прижаты к низу)
                  // if (Provider.of<AppState>(context, listen: true).isAuthenticated) ...[
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  //     child: CustomButton(
                  //       verticalPadding: 8,
                  //       backgroundColor: Color(0xFFFF6B6B),
                  //       title: 'Выйти',
                  //       textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                  //       borderColor: Color(0xFFFF6B6B),
                  //       borderRadius: 46,
                  //       boxShadow: [BoxShadow(color: Color(0xFFE53E3E).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                  //       onPressed: () => logOut(context),
                  //     ),
                  //   ),
                  // ] else
                  ...[
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    //   child: CustomButton(
                    //     verticalPadding: 8,
                    //     backgroundColor: Color(0xFF0A6EFA),
                    //     title: 'Войти в профиль',
                    //     textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                    //     borderColor: Color(0xFF0A6EFA),
                    //     borderRadius: 46,
                    //     boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                    //     onPressed: () => showLogin(context),
                    //   ),
                    // ),
                  ],
                  // Ссылка на политику конфиденциальности внизу
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       context.router.push(const PrivacyPolicyRoute());
                  //     },
                  //     child: Text(
                  //       'Политика конфиденциальности',
                  //       style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA), decoration: TextDecoration.underline),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context, int userId) {
    print('🔵 [ProfileScreen] Загружаем отзывы для id: $userId');

    return BlocProvider(
      create: (context) {
        final bloc = ReviewsBloc(onTheWayRepository: getIt<OnTheWayRepository>());
        bloc.add(GetReviewsEvent(userId: userId));
        return bloc;
      },
      child: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, reviewsState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Отзывы', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
              SizedBox(height: 12.h),
              reviewsState.when(
                loading: () => Center(
                  child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                ),
                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                  ),
                ),
                success: (reviews) {
                  if (reviews.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.reviews_outlined, size: 48, color: Color(0xFF9CA5AF)),
                            SizedBox(height: 12.h),
                            Text('Пока нет отзывов', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                          ],
                        ),
                      ),
                    );
                  }

                  // Группируем отзывы: основные и ответы
                  final mainReviews = reviews.where((r) => r.replyToReviewId == null).toList();
                  final replies = reviews.where((r) => r.replyToReviewId != null).toList();

                  return Column(
                    children: mainReviews.take(5).map((review) {
                      final reviewReplies = replies.where((r) => r.replyToReviewId == review.id).toList();

                      return Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: review.flightId != null
                                  ? () async {
                                      // Переходим на детальную страницу полёта
                                      if (!context.mounted) return;

                                      try {
                                        print('🔵 [ProfileScreen] Переход к полёту: flightId=${review.flightId}');
                                        // Используем OnTheWayNavigationRoute с дочерним FlightDetailRoute
                                        await context.router.push(
                                          OnTheWayNavigationRoute(
                                            children: [FlightDetailRoute(flightId: review.flightId!)],
                                          ),
                                        );
                                      } catch (e, stackTrace) {
                                        print('❌ [ProfileScreen] Ошибка перехода к полёту: $e');
                                        print('❌ [ProfileScreen] StackTrace: $stackTrace');
                                        // Пробуем альтернативный способ через pushNamed
                                        try {
                                          await context.router.pushNamed('/on-the-way/${review.flightId}');
                                        } catch (e2) {
                                          print('❌ [ProfileScreen] Альтернативный способ тоже не сработал: $e2');
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Не удалось открыть детали полёта'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        }
                                      }
                                    }
                                  : null,
                              borderRadius: BorderRadius.circular(12.r),
                              child: Stack(
                                children: [
                                  ReviewCard(
                                    review: review,
                                    canDelete: false, // В профиле показываются отзывы о пользователе, их нельзя удалять
                                  ),
                                  // Индикатор кликабельности
                                  if (review.flightId != null)
                                    Positioned(
                                      right: 8.w,
                                      bottom: 8.h,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF0A6EFA).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.flight_takeoff, size: 14, color: Color(0xFF0A6EFA)),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'К полёту',
                                              style: AppStyles.regular12s.copyWith(color: Color(0xFF0A6EFA)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          // Ответы на отзыв
                          if (reviewReplies.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(left: 40.w),
                              child: Column(
                                children: reviewReplies.map((reply) {
                                  return ReviewCard(
                                    review: reply,
                                    isReply: true,
                                    canDelete: false, // В профиле показываются отзывы о пользователе, их нельзя удалять
                                  );
                                }).toList(),
                              ),
                            ),
                        ],
                      );
                    }).toList(),
                  );
                },
                reviewCreated: (review) => SizedBox.shrink(),
                reviewUpdated: (review) => SizedBox.shrink(),
                reviewDeleted: () => SizedBox.shrink(),
              ),
            ],
          );
        },
      ),
    );
  }

  String _getReviewsCountText(int count) {
    if (count % 10 == 1 && count % 100 != 11) {
      return 'отзыв';
    } else if (count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 >= 20)) {
      return 'отзыва';
    } else {
      return 'отзывов';
    }
  }
}
