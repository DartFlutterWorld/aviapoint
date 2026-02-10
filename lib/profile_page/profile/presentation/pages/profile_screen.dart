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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aviapoint/generated/l10n.dart';
import 'package:aviapoint/app_settings/data/services/app_settings_service_helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/utils/payment_storage_helper.dart';
import 'package:aviapoint/payment/utils/payment_helper.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/cubit/subscription_purchase_cubit.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/subscribe_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/profile_data_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/subscribe_widget_active.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/my_aircraft_ads_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/my_parts_ads_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/my_vacancies_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/my_resumes_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/my_blog_articles_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/my_flights_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/my_bookings_widget.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/review_card.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';

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
  String _appVersion = '';
  bool _showPaidContent = true; // Значение из БД, по умолчанию true

  @override
  void initState() {
    super.initState();
    _loadDataIfAuthenticated();
    _loadAppVersion();
    _loadShowPaidContentSetting();

    // Обрабатываем параметры из URL (для редиректа после оплаты)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handlePaymentRedirect();
    });
  }

  Future<void> _loadShowPaidContentSetting() async {
    if (!kIsWeb && Platform.isIOS) {
      try {
        final value = await AppSettingsServiceHelper().getSettingValue('showPaidContent');
        if (mounted) {
          setState(() {
            _showPaidContent = value;
          });
        }
      } catch (e) {
        // При ошибке оставляем true (значение по умолчанию)
      }
    }
  }

  Future<void> _loadAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';
      });
    } catch (e) {
      // Игнорируем ошибки при получении версии
    }
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
          _isLoadingSubscription = false;
        });
      } else {
        // Для других ошибок просто не показываем подписку
        setState(() {
          _subscriptions = [];
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

  bool _shouldShowSubscriptionWidget() {
    // На веб всегда показываем
    if (kIsWeb) return true;

    // На iOS показываем только если showPaidContent = true
    if (Platform.isIOS) {
      return _showPaidContent;
    }

    // На Android и других платформах всегда показываем
    return true;
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
              deleted: () async {
                // Закрываем диалог загрузки
                if (context.mounted) {
                  // Используем rootNavigator для гарантированного закрытия диалога
                  final navigator = Navigator.of(context, rootNavigator: true);
                  if (navigator.canPop()) {
                    navigator.pop();
                  }

                  // Небольшая задержка, чтобы диалог успел закрыться
                  await Future<void>.delayed(const Duration(milliseconds: 100));

                  if (context.mounted) {
                    // Показываем сообщение об успешном удалении
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Аккаунт успешно удален'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Выходим из аккаунта (это обновит AppState и покажет неавторизованное состояние профиля)
                    logOut(context);
                  }
                }
              },
              deleting: () {
                // Показываем индикатор загрузки (уже показан в _deleteAccount)
              },
              error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                // Закрываем диалог загрузки при ошибке
                if (context.mounted) {
                  Navigator.of(context).pop(); // Закрываем диалог загрузки
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorForUser),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              orElse: () {},
            );
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: 'Профиль',
              withBack: true,
              actions: Provider.of<AppState>(context, listen: true).isAuthenticated
                  ? [
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () => _showDeleteAccountConfirmation(context),
                        tooltip: 'Удалить аккаунт',
                      ),
                    ]
                  : [],
              // backgroundColor: AppColors.background,
            ),
            backgroundColor: AppColors.background,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
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
                                    // Чипс "Администратор" в правом верхнем углу
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        final isAdmin = profileState.maybeWhen(
                                          success: (profile) => profile.isAdmin,
                                          orElse: () => false,
                                        );

                                        return isAdmin
                                            ? Align(
                                                alignment: Alignment.centerRight,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary100p,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Text(
                                                    'Администратор',
                                                    style: AppStyles.regular12s.copyWith(color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            : SizedBox.shrink();
                                      },
                                    ),
                                    SizedBox(height: 8),
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

                                            return GestureDetector(
                                              onTap: () {
                                                if (imageUrl != null && imageUrl.isNotEmpty) {
                                                  _showPhotoViewer(context, imageUrl);
                                                }
                                              },
                                              child: ClipOval(
                                                child: imageUrl != null && imageUrl.isNotEmpty
                                                    ? NetworkImageWidget(
                                                        imageUrl: imageUrl,
                                                        width: 120,
                                                        height: 120,
                                                        fit: BoxFit.cover,
                                                        placeholder: Image.asset(
                                                          Pictures.pilot,
                                                          width: 120,
                                                          height: 120,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        errorWidget: Image.asset(
                                                          Pictures.pilot,
                                                          width: 120,
                                                          height: 120,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )
                                                    : Image.asset(
                                                        Pictures.pilot,
                                                        height: 120,
                                                        width: 120,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            );
                                          },
                                        ),

                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (context, state) => state.map(
                                            success: (state) => Padding(
                                              padding: EdgeInsets.only(left: 12),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    '${state.profile.firstName ?? ''} ${state.profile.lastName ?? ''}',
                                                    style: AppStyles.bold16s.copyWith(color: const Color(0xFF2B373E)),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      const Icon(Icons.phone, size: 16, color: Color(0xFF4B5767)),
                                                      SizedBox(width: 6),
                                                      Text(
                                                        formatPhone(state.profile.phone),
                                                        style: AppStyles.regular14s.copyWith(
                                                          color: const Color(0xFF4B5767),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (state.profile.telegram != null &&
                                                      state.profile.telegram!.isNotEmpty) ...[
                                                    SizedBox(height: 4),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        SvgPicture.asset(Pictures.telegramm, width: 16, height: 16),
                                                        SizedBox(width: 6),
                                                        Text(
                                                          state.profile.telegram!,
                                                          style: AppStyles.regular14s.copyWith(
                                                            color: const Color(0xFF4B5767),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                  if (state.profile.max != null && state.profile.max!.isNotEmpty) ...[
                                                    SizedBox(height: 4),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        SvgPicture.asset(Pictures.max, width: 16, height: 16),
                                                        SizedBox(width: 6),
                                                        Text(
                                                          state.profile.max!,
                                                          style: AppStyles.regular14s.copyWith(
                                                            color: const Color(0xFF4B5767),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                  if (state.profile.email != null &&
                                                      state.profile.email!.isNotEmpty) ...[
                                                    SizedBox(height: 4),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon(Icons.email, size: 16, color: Color(0xFF4B5767)),
                                                        SizedBox(width: 6),
                                                        Text(
                                                          state.profile.email!,
                                                          style: AppStyles.regular14s.copyWith(
                                                            color: const Color(0xFF4B5767),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                  // Рейтинг пользователя
                                                  if (state.profile.averageRating != null &&
                                                      state.profile.averageRating! > 0) ...[
                                                    SizedBox(height: 8),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        RatingWidget(
                                                          rating: state.profile.averageRating!.round(),
                                                          size: 16,
                                                        ),
                                                        SizedBox(width: 8),
                                                        Text(
                                                          '${state.profile.averageRating!.toStringAsFixed(1)}',
                                                          style: AppStyles.bold14s.copyWith(
                                                            color: const Color(0xFF374151),
                                                          ),
                                                        ),
                                                        if (state.profile.reviewsCount != null &&
                                                            state.profile.reviewsCount! > 0) ...[
                                                          SizedBox(width: 4),
                                                          Text(
                                                            '(${state.profile.reviewsCount} ${_getReviewsCountText(state.profile.reviewsCount!)})',
                                                            style: AppStyles.regular12s.copyWith(
                                                              color: const Color(0xFF9CA5AF),
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
                                            loading: (state) => const LoadingCustom(),
                                            initial: (state) => const SizedBox(),
                                            deleting: (state) => const LoadingCustom(),
                                            deleted: (state) => const SizedBox(),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 16),
                                    // На iOS показываем только если showPaidContent = true, на остальных платформах всегда показываем
                                    if (_shouldShowSubscriptionWidget()) ...[
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
                                          BlocProvider(
                                            create: (_) => SubscriptionPurchaseCubit(),
                                            child: BlocListener<SubscriptionPurchaseCubit, SubscriptionPurchaseState>(
                                              listenWhen: (prev, curr) => curr is SubscriptionPurchaseError,
                                              listener: (context, state) {
                                                if (state is SubscriptionPurchaseError) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text(state.errorForUser),
                                                      backgroundColor: Colors.red,
                                                      duration: const Duration(seconds: 5),
                                                      action: SnackBarAction(
                                                        label: 'Повторить',
                                                        textColor: Colors.white,
                                                        onPressed: () => context.read<SubscriptionPurchaseCubit>().retry(context),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                              child: BlocBuilder<SubscriptionPurchaseCubit, SubscriptionPurchaseState>(
                                                builder: (context, purchaseState) {
                                                  final subscriptionType = _subscriptionTypes.firstWhere(
                                                    (type) => type.code == 'rosaviatest_365' && type.isActive,
                                                    orElse: () => _subscriptionTypes.first,
                                                  );
                                                  if (purchaseState is SubscriptionPurchaseLoading) {
                                                    return const Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 16.0),
                                                      child: LoadingCustom(),
                                                    );
                                                  }
                                                  if (purchaseState is SubscriptionPurchaseError) {
                                                    return ErrorCustom(
                                                      textError: purchaseState.errorForUser,
                                                      repeat: () => context.read<SubscriptionPurchaseCubit>().retry(context),
                                                      paddingTop: 0,
                                                    );
                                                  }
                                                  return SubscribeWidget(
                                                    subscriptionType: subscriptionType,
                                                    fon: Pictures.podpiskaNoActiveFon,
                                                    onPurchase: () => context.read<SubscriptionPurchaseCubit>().startPurchase(
                                                      context,
                                                      subscriptionType: subscriptionType,
                                                      returnRouteSource: 'profile',
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        else
                                          // Если типов подписок нет, показываем заглушку
                                          const SizedBox(height: 225),
                                      ],
                                      SizedBox(height: 16),
                                    ],
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
                                    ProfileDataWidget(
                                      title: 'Изменить данные',
                                      icon: Pictures.user,
                                      onTap: () => openProfileEdit(context: context),
                                    ),
                                    Divider(height: 18),
                                    ProfileDataWidget(
                                      title: 'Политика конфиденциальности',
                                      icon: Pictures.securitySafe,
                                      onTap: () => context.router.push(const PrivacyPolicyRoute()),
                                    ),
                                    Divider(height: 18),
                                    ProfileDataWidget(
                                      title: 'Условия использования (EULA)',
                                      icon: Pictures.securitySafe,
                                      onTap: () => context.router.push(const EulaRoute()),
                                    ),
                                    Divider(height: 18),
                                    ProfileDataWidget(
                                      title: 'Связаться с нами',
                                      icon: Pictures.smsEdit,
                                      onTap: () => openContactUs(context: context),
                                    ),
                                    Divider(height: 18),
                                    ProfileDataWidget(
                                      title: 'Выйти',
                                      icon: Pictures.logout,
                                      onTap: () => logOut(context),
                                    ),
                                    SizedBox(height: 16),
                                    // Секция моих самолётов
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => MyAircraftAdsWidget(userId: profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 24),
                                    // Секция моих запчастей
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => MyPartsAdsWidget(userId: profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 24),
                                    // Секция моих вакансий
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => MyVacanciesWidget(userId: profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 24),
                                    // Секция моих резюме
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => MyResumesWidget(userId: profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 24),
                                    // Секция моего авиажурнала
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => MyBlogArticlesWidget(userId: profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 16),
                                    // Секция моих полётов
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => MyFlightsWidget(userId: profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    // Секция моих бронирований
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => MyBookingsWidget(userId: profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 24),
                                    // Секция отзывов
                                    BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (context, profileState) {
                                        return profileState.maybeWhen(
                                          success: (profile) => _buildReviewsSection(context, profile.id),
                                          orElse: () => SizedBox.shrink(),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 24),
                                    // Версия приложения (незаметно внизу)
                                    if (_appVersion.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 16),
                                        child: Center(
                                          child: Text(
                                            'Версия $_appVersion',
                                            style: AppStyles.regular12s.copyWith(
                                              color: Color(0xFF9CA5AF),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
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
                                      // Версия приложения (незаметно внизу)
                                      if (_appVersion.isNotEmpty)
                                        Padding(
                                          padding: EdgeInsets.only(top: 24, bottom: 16),
                                          child: Text(
                                            'Версия $_appVersion',
                                            style: AppStyles.regular12s.copyWith(
                                              color: Color(0xFF9CA5AF),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
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
              Text('Отзывы о вас', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
              SizedBox(height: 12),
              reviewsState.map(
                loading: (_) => Center(
                  child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                ),
                error: (state) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(state.errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                  ),
                ),
                success: (state) {
                  final reviews = state.reviews;
                  final flights = state.flights;
                  if (reviews.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.reviews_outlined, size: 48, color: Color(0xFF9CA5AF)),
                            SizedBox(height: 12),
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
                      final flight = review.flightId != null ? flights[review.flightId] : null;

                      return Column(
                        children: [
                          ReviewCard(
                            review: review,
                            canDelete: false, // В профиле показываются отзывы о пользователе, их нельзя удалять
                            // Передаем рейтинг конкретно за этот полёт
                            reviewedRating: review.rating != null ? review.rating!.toDouble() : null,
                            // Передаем информацию о полёте
                            departureAirport: flight?.departureAirport,
                            arrivalAirport: flight?.arrivalAirport,
                            departureDate: flight?.departureDate,
                            waypoints: flight?.waypoints,
                            onTap: () {
                              if (review.flightId != null) {
                                if (context.mounted) {
                                  context.router.push(
                                    BaseRoute(
                                      children: [
                                        OnTheWayNavigationRoute(
                                          children: [FlightDetailRoute(flightId: review.flightId!)],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          // Ответы на отзыв
                          if (reviewReplies.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Column(
                                children: reviewReplies.map((reply) {
                                  return ReviewCard(
                                    review: reply,
                                    isReply: true,
                                    canDelete: false, // В профиле показываются отзывы о пользователе, их нельзя удалять
                                    onTap: () {}, // Ответы не требуют навигации
                                  );
                                }).toList(),
                              ),
                            ),
                        ],
                      );
                    }).toList(),
                  );
                },
                reviewCreated: (_) => SizedBox.shrink(),
                reviewUpdated: (_) => SizedBox.shrink(),
                reviewDeleted: (_) => SizedBox.shrink(),
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

  /// Просмотр фотографии профиля в полноэкранном режиме
  void _showPhotoViewer(BuildContext context, String imageUrl) {
    bool showControls = true;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogBuilderContext, setState) => GestureDetector(
          onTap: () {
            setState(() {
              showControls = !showControls;
            });
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                // Основной контент с фотографией
                InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 5.0,
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: NetworkImageWidget(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: Container(
                          color: Colors.black,
                          child: Center(child: CircularProgressIndicator(color: Colors.white)),
                        ),
                        errorWidget: Container(
                          color: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                SizedBox(height: 16),
                                Text(
                                  'Не удалось загрузить изображение',
                                  style: AppStyles.regular14s.copyWith(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Верхняя панель с кнопками действий
                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 48), // Для центрирования
                            // Кнопки действий
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопка "Поделиться"
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.white, size: 24),
                                  onPressed: () => _sharePhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

  /// Поделиться фотографией
  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      await Share.shareUri(Uri.parse(photoUrl));
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось поделиться фотографией'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last.split('?').first; // Убираем query параметры
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(photoUrl, filePath);

      // Запрашиваем разрешение на запись (для Android)
      if (await Permission.storage.request().isGranted) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final savedFile = await File(filePath).copy('${appDocDir.path}/$fileName');

        if (context.mounted) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text('Фотография сохранена: ${savedFile.path}'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        if (context.mounted) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text('Необходимо разрешение на сохранение файлов'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось скачать фотографию: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// Показывает модальное окно подтверждения удаления аккаунта
  void _showDeleteAccountConfirmation(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                S.of(context).atantion_delete_acc,
                style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).description_delete_acc, style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFFF3CD),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFFFC107)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Color(0xFFFF9800), size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Это действие нельзя отменить. Все ваши данные будут безвозвратно удалены.',
                      style: AppStyles.regular12s.copyWith(color: Color(0xFF856404)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(S.of(context).no_delete_acc, style: AppStyles.regular14s.copyWith(color: Color(0xFF6B7280))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _deleteAccount(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(S.of(context).yes_delete_acc, style: AppStyles.bold16s.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  /// Удаляет аккаунт пользователя
  void _deleteAccount(BuildContext context) {
    // Показываем индикатор загрузки
    // Используем rootNavigator для гарантированного отображения поверх всех виджетов
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (dialogContext) => const Center(child: CircularProgressIndicator()),
    );

    // Инициируем удаление аккаунта
    context.read<ProfileBloc>().add(const DeleteAccountEvent());
  }
}
