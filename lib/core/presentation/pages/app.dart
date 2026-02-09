import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/auth_page/presentation/bloc/sms_bloc.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/routes/route_observer.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/bloc/emergency_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/bloc/hand_book_main_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/presentation/bloc/normal_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_check_list_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_check_list_by_category_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/bloc/preflight_inspection_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_by_category_bloc.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/app_settings_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_with_list_questions_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/type_correct_answers_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/type_sertificates_bloc.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/repositories/video_for_students_repository.dart';
import 'package:aviapoint/learning/video_for_students_page/presentation/bloc/video_for_students_bloc.dart';
import 'package:aviapoint/main_page/stories/domain/repositories/story_repository.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/cache_manager_bloc.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/detail_story_bloc.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/story_cubit.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:aviapoint/news/presentation/bloc/category_news_bloc.dart';
import 'package:aviapoint/news/presentation/bloc/detail_news_bloc.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
import 'package:aviapoint/news/presentation/cubit/news_cubit.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_categories_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_tags_bloc.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_article_detail_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_bloc.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_resumes_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_favorite_toggle_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_favorites_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_vacancies_bloc.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/bookings_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:aviapoint/core/utils/pending_actions.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_ownership_request_bottom_sheet.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/core/services/app_messaging.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:aviapoint/generated/l10n.dart';

/// Корень приложения.
@immutable
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _profileRequested = false;
  // FirebaseAnalytics инициализируется лениво, только если Firebase доступен
  // Может использоваться для аналитики в будущем
  // ignore: unused_field
  FirebaseAnalytics? _analytics;

  @override
  void initState() {
    super.initState();
    // Инициализируем FirebaseAnalytics только если Firebase доступен
    _initAnalytics();
    // БД инициализируется автоматически при первом использовании через Drift
  }

  /// Инициализирует FirebaseAnalytics только если Firebase доступен
  void _initAnalytics() {
    try {
      // Проверяем, инициализирован ли Firebase
      if (Firebase.apps.isNotEmpty) {
        _analytics = FirebaseAnalytics.instance;
        if (kDebugMode) {
          debugPrint('✅ FirebaseAnalytics инициализирован');
        }
      } else {
        // Если Firebase не инициализирован, пробуем подождать немного
        // и инициализировать позже (Firebase инициализируется в фоне)
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted && Firebase.apps.isNotEmpty) {
            setState(() {
              _analytics = FirebaseAnalytics.instance;
            });
            if (kDebugMode) {
              debugPrint('✅ FirebaseAnalytics инициализирован (отложенная инициализация)');
            }
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('⚠️ Не удалось инициализировать FirebaseAnalytics: $e');
        debugPrint('💡 Приложение продолжит работу без аналитики');
      }
      // Не критично, продолжаем без аналитики
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (context) => getIt<AppState>()),
        BlocProvider<VideoForStudentsBloc>(
          create: (context) => VideoForStudentsBloc(videoForStudentsRepository: getIt<VideoForStudentsRepository>()),
        ),
        BlocProvider<HandBookMainCategoriesBloc>(
          create: (context) => HandBookMainCategoriesBloc(handBookRepository: getIt<HandBookRepository>()),
        ),
        BlocProvider<PreflightInspectionCategoriesBloc>(
          create: (context) => PreflightInspectionCategoriesBloc(handBookRepository: getIt<HandBookRepository>()),
        ),
        BlocProvider<PreflightInspectionCheckListByCategoryBloc>(
          create: (context) => PreflightInspectionCheckListByCategoryBloc(
            handBookRepository: getIt<HandBookRepository>(),
            preflightCheckedCubit: getIt<PreflightCheckedCubit>(),
          ),
          lazy: false,
        ),
        BlocProvider<PreflightInspectionCheckListBloc>(
          create: (context) => PreflightInspectionCheckListBloc(handBookRepository: getIt<HandBookRepository>()),
        ),
        BlocProvider<PreflightCheckedCubit>(create: (context) => getIt<PreflightCheckedCubit>()),
        BlocProvider<NormalCategoriesBloc>(
          create: (context) => NormalCategoriesBloc(handBookRepository: getIt<HandBookRepository>()),
        ),
        BlocProvider<NormalCheckListByCategoryBloc>(
          create: (context) => NormalCheckListByCategoryBloc(
            handBookRepository: getIt<HandBookRepository>(),
            normalCheckedCubit: getIt<NormalCheckedCubit>(),
          ),
          lazy: false,
        ),
        BlocProvider<NormalCheckListBloc>(
          create: (context) => NormalCheckListBloc(handBookRepository: getIt<HandBookRepository>()),
        ),
        BlocProvider<NormalCheckedCubit>(create: (context) => getIt<NormalCheckedCubit>()),
        BlocProvider<EmergencyCategoriesBloc>(
          create: (context) => EmergencyCategoriesBloc(handBookRepository: getIt<HandBookRepository>()),
        ),
        BlocProvider<SmsBloc>(create: (context) => SmsBloc(authRepository: getIt<AuthRepository>())),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: getIt<AuthRepository>(), appState: getIt<AppState>()),
        ),
        BlocProvider<CacheManagerBloc>(
          create: (context) =>
              CacheManagerBloc(storyRepository: getIt<StoryRepository>())..add(const GetStoriesCacheManagerEvent()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(profileRepository: getIt<ProfileRepository>(), initState: getIt<AppState>()),
        ),
        BlocProvider<StoryCubit>(create: (context) => StoryCubit()),
        BlocProvider<DetailStoryBloc>(create: (context) => DetailStoryBloc(storyRepository: getIt<StoryRepository>())),
        BlocProvider<DetailNewsBloc>(create: (context) => DetailNewsBloc(newsRepository: getIt<NewsRepository>())),
        BlocProvider<NewsBloc>(create: (context) => NewsBloc(newsRepository: getIt<NewsRepository>())),
        BlocProvider<CategoryNewsBloc>(create: (context) => CategoryNewsBloc(newsRepository: getIt<NewsRepository>())),
        BlocProvider<NewsCubit>(create: (context) => NewsCubit()),
        BlocProvider<BlogCategoriesBloc>(
          create: (context) => BlogCategoriesBloc(blogRepository: getIt<BlogRepository>()),
        ),
        BlocProvider<BlogTagsBloc>(create: (context) => BlogTagsBloc(blogRepository: getIt<BlogRepository>())),
        BlocProvider<BlogArticlesBloc>(create: (context) => BlogArticlesBloc(blogRepository: getIt<BlogRepository>())),
        BlocProvider<BlogArticleDetailBloc>(
          create: (context) => BlogArticleDetailBloc(blogRepository: getIt<BlogRepository>()),
        ),
        BlocProvider<MarketCategoriesBloc>(
          create: (context) => MarketCategoriesBloc(repository: getIt<MarketRepository>()),
        ),
        BlocProvider<AircraftMarketBloc>(
          create: (context) => AircraftMarketBloc(repository: getIt<MarketRepository>()),
        ),
        BlocProvider<PartsMarketBloc>(create: (context) => PartsMarketBloc(repository: getIt<MarketRepository>())),
        BlocProvider<JobsVacanciesBloc>(
          create: (context) =>
              JobsVacanciesBloc(repository: getIt<JobsRepository>())
                ..add(const JobsVacanciesEvent.get(includeInactive: false)),
        ),
        BlocProvider<JobVacancyFavoritesBloc>(
          create: (context) => JobVacancyFavoritesBloc(repository: getIt<JobsRepository>()),
        ),
        BlocProvider<JobVacancyFavoriteToggleBloc>(
          create: (context) => JobVacancyFavoriteToggleBloc(repository: getIt<JobsRepository>()),
        ),
        BlocProvider<JobsResumesBloc>(
          create: (context) => JobsResumesBloc(repository: getIt<JobsRepository>())..add(const JobsResumesEvent.get()),
        ),
        BlocProvider<TypeSertificatesBloc>(
          create: (context) => TypeSertificatesBloc(rosAviaTestRepository: getIt<RosAviaTestRepository>()),
        ),
        BlocProvider<TypeCorrectAnswersBloc>(
          create: (context) => TypeCorrectAnswersBloc(rosAviaTestRepository: getIt<RosAviaTestRepository>()),
        ),
        BlocProvider<CategoriesWithListQuestionsBloc>(
          create: (context) => CategoriesWithListQuestionsBloc(rosAviaTestRepository: getIt<RosAviaTestRepository>()),
        ),
        BlocProvider<PaymentBloc>(create: (context) => PaymentBloc(paymentRepository: getIt<PaymentRepository>())),
        BlocProvider<CategoriesBloc>(
          create: (context) => CategoriesBloc(rosAviaTestRepository: getIt<RosAviaTestRepository>()),
        ),
        BlocProvider<AppSettingsBloc>(
          create: (context) =>
              AppSettingsBloc(db: getIt<AppDb>(), rosAviaTestCubit: getIt<RosAviaTestCubit>())
                ..add(SetAppSettingsEvent()),
          lazy: false,
        ),
        BlocProvider<RosAviaTestCubit>(create: (context) => getIt<RosAviaTestCubit>()),
        BlocProvider<FlightsBloc>(create: (context) => FlightsBloc(onTheWayRepository: getIt<OnTheWayRepository>())),
        BlocProvider<BookingsBloc>(create: (context) => BookingsBloc(onTheWayRepository: getIt<OnTheWayRepository>())),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // При успешной авторизации запрашиваем профиль
          if (state is SuccessAuthState) {
            _profileRequested = true;
            context.read<ProfileBloc>().add(const GetProfileEvent());

            // Проверяем, есть ли отложенная заявка на владение аэродромом
            if (PendingActions.hasPendingOwnershipRequest()) {
              final airportCode = PendingActions.getPendingAirportCode();
              if (airportCode != null) {
                // Открываем форму заявки или страницу редактирования после небольшой задержки, чтобы UI успел обновиться
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Future.delayed(Duration(milliseconds: 500), () async {
                    // Используем navigatorKey для получения актуального контекста
                    final navigatorContext = navigatorKey.currentContext;
                    if (navigatorContext != null && navigatorContext.mounted) {
                      try {
                        // Получаем ProfileBloc из navigatorContext
                        final profileBloc = navigatorContext.read<ProfileBloc>();

                        // Всегда загружаем профиль заново, чтобы получить актуальные данные
                        profileBloc.add(const GetProfileEvent());

                        // Ждем загрузки профиля (максимум 10 секунд)
                        ProfileState? finalProfileState;
                        try {
                          finalProfileState = await profileBloc.stream
                              .where((state) => state is SuccessProfileState || state is ErrorProfileState)
                              .timeout(const Duration(seconds: 10))
                              .first;
                        } catch (e) {
                          // Если таймаут, берем текущее состояние
                          finalProfileState = profileBloc.state;
                        }

                        // Получаем ID аэропорта по коду
                        final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
                        final airportService = AirportService(dataSource.dio);
                        final airport = await airportService.getAirportByCode(airportCode);

                        if (airport != null && finalProfileState is SuccessProfileState) {
                          final profile = finalProfileState.profile;
                          final ownedAirports = profile.ownedAirports;

                          // Проверяем, есть ли ID аэропорта в списке owned_airports
                          final isOwner = ownedAirports != null && ownedAirports.contains(airport.id);

                          print(
                            '🔍 Проверка владельца: airportId=${airport.id}, ownedAirports=$ownedAirports, isOwner=$isOwner',
                          );

                          if (isOwner) {
                            // Если владелец - открываем страницу редактирования
                            AutoRouter.of(navigatorContext).push(EditAirportRoute(airportCode: airportCode));
                          } else {
                            // Если не владелец - открываем форму заявки
                            showAirportOwnershipRequestBottomSheet(navigatorContext, airportCode: airportCode);
                          }
                        } else {
                          // Если аэропорт не найден или профиль не загружен, открываем форму заявки
                          print(
                            '⚠️ Аэропорт не найден или профиль не загружен: airport=${airport != null}, profileState=${finalProfileState.runtimeType}',
                          );
                          showAirportOwnershipRequestBottomSheet(navigatorContext, airportCode: airportCode);
                        }

                        PendingActions.clearPendingOwnershipRequest();
                      } catch (e) {
                        print('Ошибка при проверке владельца: $e');
                        // В случае ошибки открываем форму заявки
                        try {
                          showAirportOwnershipRequestBottomSheet(navigatorContext, airportCode: airportCode);
                        } catch (_) {
                          // Игнорируем ошибки открытия формы
                        }
                        PendingActions.clearPendingOwnershipRequest();
                      }
                    } else {
                      // Если контекст недоступен, очищаем отложенное действие
                      PendingActions.clearPendingOwnershipRequest();
                    }
                  });
                });
              }
            }

            // Проверяем, есть ли отложенная загрузка фотографий
            if (PendingActions.hasPendingPhotoUpload()) {
              final airportCode = PendingActions.getPendingPhotoUploadAirportCode();
              if (airportCode != null) {
                // Показываем UI индикацию и открываем загрузку фотографий после небольшой задержки
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Future.delayed(Duration(milliseconds: 500), () async {
                    final navigatorContext = navigatorKey.currentContext;
                    if (navigatorContext != null && navigatorContext.mounted) {
                      try {
                        // Показываем snackbar с информацией о том, что можно загружать фотографии
                        ScaffoldMessenger.of(navigatorContext).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.white),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Авторизация успешна! Теперь вы можете добавлять фотографии.',
                                    style: AppStyles.regular14s.copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 3),
                          ),
                        );

                        // Открываем bottom sheet с информацией об аэропорте, где пользователь сможет загрузить фотографии
                        await showAirportInfoBottomSheet(navigatorContext, airportCode);

                        PendingActions.clearPendingPhotoUpload();
                      } catch (e) {
                        print('Ошибка при открытии загрузки фотографий: $e');
                        PendingActions.clearPendingPhotoUpload();
                      }
                    } else {
                      PendingActions.clearPendingPhotoUpload();
                    }
                  });
                });
              }
            }
          }
        },
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            // Отправляем FCM токен на сервер после успешной загрузки профиля
            // В этот момент уже известен user_id, поэтому токен можно привязать к пользователю
            if (state is SuccessProfileState) {
              AppMessaging().sendTokenToServer();
            }
          },
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              // Определяем тип устройства (планшет/телефон) при первом построении
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  appState.setIsTabletIfUnset(context);
                }
              });

              // Слушаем изменения AppState.isAuthenticated
              // Если пользователь авторизован, но профиль еще не загружен, запрашиваем его
              if (appState.isAuthenticated && !_profileRequested) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) return;
                  final profileBloc = context.read<ProfileBloc>();
                  final profileState = profileBloc.state;
                  // Запрашиваем профиль только если он еще не загружен (initial или error состояние)
                  if (profileState is InitialProfileState || (profileState is ErrorProfileState)) {
                    _profileRequested = true;
                    profileBloc.add(const GetProfileEvent());
                  }
                });
              } else if (!appState.isAuthenticated) {
                // Сбрасываем флаг при выходе из системы
                _profileRequested = false;
              }
              return child!;
            },
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                ...context.localizationDelegates,
                S.delegate,
                FlutterQuillLocalizations.delegate,
              ],
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'AviaPoint',
              theme: ThemeData(fontFamily: 'Geologica'),
              routerDelegate: getIt<AppRouter>().delegate(navigatorObservers: () => [MyRouteObserver()]),
              routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
            ),
          ),
        ),
      ),
    );
  }
}
