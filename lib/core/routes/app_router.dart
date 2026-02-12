import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/abnormal_landings/abnormal_landings_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/air_data_system_failure/air_data_system_failure_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/air_speeds/airspeeds_for_emergency_operations.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/attitude_and_heading_reference_system_ahrs_failure/attitude_and_heading_reference_system_ahrs_failure_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/autopilot/autopilot_or_electric_trim_failure_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/display_cooling_advisory/display_cooling_advisory_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/electrical_power/electrical_power_sub_category_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/electrical_power/electrical_power_supply_system_malfunctions_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/electrical_power/low_volts_annunciator_comes_on_bellow_1000_rpm_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/electrical_power/low_volts_annunciator_comes_on_or_does_not_go_off_at_higher_rpm_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/engine_failure/engine_failure_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/emergency_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/excessive_fuel_vapor/excessive_fuel_vapor_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/fires/cabin_fire_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/fires/electrical_fire_in_flight_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/fires/engine_fire_in_flight_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/fires/fires_during_start_on_ground_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/fires/fires_sub_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/fires/wing_fire_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/forced_landings/ditching_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/forced_landings/emergency_landing_with_engine_power_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/forced_landings/emergency_landing_without_engine_power_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/forced_landings/forced_landings_sub_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/high_carbon_monoxide/high_carbon_monoxide_co_level_advisory_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/icing/icing_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/static_source_blockage/static_source_blockage_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/vacuum_system_failure/vacuum_system_failure_screen.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/pages/hand_book_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/presentation/pages/normal_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/pages/normal_check_list_screen.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/pages/preflight_inspection_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/pages/preflight_inspection_check_list_screen.dart';
import 'package:aviapoint/learning/learning_screen.dart';
import 'package:aviapoint/learning/learning_navigation_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/base_questions_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/detail_question_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/list_question_by_category_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/test_by_mode_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/testing_mode_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/test_results_screen.dart';
import 'package:aviapoint/learning/video_for_students_page/presentation/pages/video_for_students_screen.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/presentation/pages/detail_story_screen.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/presentation/pages/aircraft_market_detail_screen.dart';
import 'package:aviapoint/market/presentation/pages/edit_aircraft_market_screen.dart';
import 'package:aviapoint/market/presentation/pages/create_aircraft_market_screen.dart';
import 'package:aviapoint/market/presentation/pages/parts_market_detail_screen.dart';
import 'package:aviapoint/market/presentation/pages/edit_parts_market_screen.dart';
import 'package:aviapoint/market/presentation/pages/create_parts_market_screen.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/pages/create_news_screen.dart';
import 'package:aviapoint/news/presentation/pages/detail_news_screen.dart';
import 'package:aviapoint/news/presentation/pages/edit_news_screen.dart';
import 'package:aviapoint/news/presentation/pages/news_navigation_screen.dart';
import 'package:aviapoint/news/presentation/pages/news_screen.dart';
import 'package:aviapoint/news/presentation/pages/user_news_screen.dart';
import 'package:aviapoint/blog/presentation/pages/blog_article_detail_screen.dart';
import 'package:aviapoint/blog/presentation/pages/blog_navigation_screen.dart';
import 'package:aviapoint/blog/presentation/pages/blog_screen.dart';
import 'package:aviapoint/blog/presentation/pages/create_blog_article_screen.dart';
import 'package:aviapoint/blog/presentation/pages/edit_blog_article_screen.dart';
import 'package:aviapoint/journal/presentation/pages/journal_screen.dart';
import 'package:aviapoint/journal/presentation/pages/journal_navigation_screen.dart';
import 'package:aviapoint/market/presentation/pages/market_navigation_screen.dart';
import 'package:aviapoint/market/presentation/pages/market_screen.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/pages/create_flight_screen.dart';
import 'package:aviapoint/on_the_way/presentation/pages/edit_flight_screen.dart';
import 'package:aviapoint/on_the_way/presentation/pages/edit_airport_screen.dart';
import 'package:aviapoint/on_the_way/presentation/pages/flight_detail_screen.dart';
import 'package:aviapoint/on_the_way/presentation/pages/flights_list_screen.dart';
import 'package:aviapoint/on_the_way/presentation/pages/on_the_way_navigation_screen.dart';
import 'package:aviapoint/sale/sale_request_navigation_screen.dart';
import 'package:aviapoint/sale/sale_request_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/base_screen.dart';
import 'package:aviapoint/core/presentation/pages/empty_navigation_screen.dart';
import 'package:aviapoint/main_page/main_navigation_screen.dart';
import 'package:aviapoint/main_page/main_screen.dart';
import 'package:aviapoint/price_page/prices_screen.dart';
import 'package:aviapoint/price_page/prices_navigation_screen.dart';
import 'package:aviapoint/payment/presentation/pages/payment_screen.dart';
import 'package:aviapoint/payment/presentation/pages/payment_webview_screen.dart';
import 'package:aviapoint/profile_page/profile/presentation/pages/profile_navigation_screen.dart';
import 'package:aviapoint/profile_page/profile/presentation/pages/profile_screen.dart';
import 'package:aviapoint/profile_page/profile/presentation/pages/eula_screen.dart';
import 'package:aviapoint/profile_page/profile/presentation/pages/privacy_policy_screen.dart';
import 'package:aviapoint/work/presentation/pages/work_screen.dart';
import 'package:aviapoint/work/presentation/pages/work_navigation_screen.dart';
import 'package:aviapoint/work/presentation/pages/create_job_vacancy_screen.dart';
import 'package:aviapoint/work/presentation/pages/create_job_resume_screen.dart';
import 'package:aviapoint/work/presentation/pages/create_vacancy_response_screen.dart';
import 'package:aviapoint/work/presentation/pages/edit_job_vacancy_screen.dart';
import 'package:aviapoint/work/presentation/pages/edit_job_resume_screen.dart';
import 'package:aviapoint/work/presentation/pages/job_vacancy_detail_screen.dart';
import 'package:aviapoint/work/presentation/pages/job_resume_detail_screen.dart';
import 'package:aviapoint/work/presentation/pages/vacancy_responses_screen.dart';
import 'package:aviapoint/work/presentation/pages/my_vacancy_responses_screen.dart';
import 'package:aviapoint/work/presentation/pages/employer_vacancy_responses_screen.dart';

part 'app_router.gr.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: navigatorKey);
  @override
  RouteType get defaultRouteType => RouteType.custom();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      // initial: kIsWeb || !ServiceLocator.instance.get<AppState>().isNewUser,
      initial: true,
      page: BaseRoute.page,
      path: kIsWeb ? '/' : null,
      children: [
        AutoRoute(
          page: MainNavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(path: '', page: MainRoute.page, initial: true),
            // На главной и в ценах есть одинаковый виджет сравнения цен, чтоб кнопка назад возвращала
            // с какого экрана пришли продублировал  пути

            // AutoRoute(
            //   path: 'monitoring',
            //   page: MonitoringNavigationRoute.page,
            //   children: [
            //     AutoRoute(
            //       path: '',
            //       page: MonitoringPriceRoute.page,
            //     ),
            //     AutoRoute(
            //       path: 'result',
            //       page: ResultMonitoringRoute.page,
            //     ),
            //     AutoRoute(
            //       path: 'result_map_cpt',
            //       page: MonitoringMapCptRoute.page,
            //     ),
            //     AutoRoute(
            //       path: 'result_map_exw',
            //       page: MonitoringMapExwRoute.page,
            //     ),
            //   ],
            // ),
            CustomRoute<CustomRoute<dynamic>>(
              path: 'stories/:id',
              page: DetailStoryRoute.page,
              // duration: const Duration(milliseconds: 500),
              transitionsBuilder:
                  (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,
                  ) {
                    return FadeTransition(opacity: animation, alwaysIncludeSemantics: true, child: child);
                  },
              meta: const {'hideBottomNav': true},
            ),
          ],
        ),
        AutoRoute(
          path: 'prices',
          page: PricesNavigationRoute.page,
          // initial: true,
          children: [AutoRoute(path: '', page: PricesRoute.page, initial: true)],
        ),
        AutoRoute(
          // initial: true,
          path: 'learning',
          page: LearningNavigationRoute.page,
          children: [
            AutoRoute(
              path: '',
              // initial: true,
              page: LearningRoute.page,
            ),
            AutoRoute(path: 'video_for_students', page: VideoForStudentsRoute.page),
            AutoRoute(path: 'hand_book', page: HandBookMainCategoriesRoute.page),
            AutoRoute(path: 'hand_book/preflight_inspection_categories', page: PreflightInspectionCategoriesRoute.page),
            AutoRoute(
              path: 'hand_book/preflight_inspection_categories/check_list/:preflihgtInspectionCategoryId',
              page: PreflightInspectionCheckListRoute.page,
            ),
            AutoRoute(path: 'hand_book/normal_categories', page: NormalCategoriesRoute.page),
            AutoRoute(
              path: 'hand_book/normal_categories/check_list/:normalCategoryId',
              page: NormalCheckListRoute.page,
            ),
            AutoRoute(path: 'hand_book/emergency_categories', page: EmergencyCategoriesRoute.page),
            AutoRoute(
              path: 'hand_book/emergency_categories/airspeeds_for_emergency_operations',
              page: AirspeedsForEmergencyOperationsRoute.page,
            ),
            AutoRoute(path: 'hand_book/emergency_categories/engine_failure', page: EngineFailureRoute.page),
            AutoRoute(
              path: 'hand_book/emergency_categories/forced_landings_sub_categories',
              page: ForcedLandingsSubCategoriesRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/forced_landings_sub_categories/emergency_landing_with_engine_power',
              page: EmergencyLandingWithoutEnginePowerRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/forced_landings_sub_categories/emergency_landing_with_engine_power',
              page: EmergencyLandingWithEnginePowerRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/forced_landings_sub_categories/ditching',
              page: DitchingRoute.page,
            ),
            AutoRoute(path: 'hand_book/emergency_categories/fires_sub_categories', page: FiresSubCategoriesRoute.page),
            AutoRoute(
              path: 'hand_book/emergency_categories/fires_sub_categories/fires_during_start_on_ground',
              page: FiresDuringStartOnGroundRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/fires_sub_categories/engine_fire_in_flight',
              page: EngineFireInFlightRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/fires_sub_categories/electrical_fire_in_flight',
              page: ElectricalFireInFlightRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/fires_sub_categories/cabin_fire',
              page: CabinFireRoute.page,
            ),
            AutoRoute(path: 'hand_book/emergency_categories/fires_sub_categories/wing_fire', page: WingFireRoute.page),
            AutoRoute(path: 'hand_book/emergency_categories/icing', page: IcingRoute.page),
            AutoRoute(
              path: 'hand_book/emergency_categories/static_source_blockage',
              page: StaticSourceBlockageRoute.page,
            ),
            AutoRoute(path: 'hand_book/emergency_categories/excessive_fuel_vapor', page: ExcessiveFuelVaporRoute.page),
            AutoRoute(path: 'hand_book/emergency_categories/abnormal_landings', page: AbnormalLandingsRoute.page),
            AutoRoute(
              path: 'hand_book/emergency_categories/electrical_power',
              page: ElectricalPowerSubCategoryRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/electrical_power/electrical_power_supply_system_malfunctions',
              page: ElectricalPowerSupplySystemMalfunctionsRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/electrical_power/low_volts_annunciator_comes_on_bellow_1000_rpm',
              page: LowVoltsAnnunciatorComesOnBellow1000RpmRoute.page,
            ),
            AutoRoute(
              path:
                  'hand_book/emergency_categories/electrical_power/low_volts_annunciator_comes_on_or_does_not_go_off_at_higher_rpm',
              page: LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/air_data_system_failure',
              page: AirDataSystemFailureRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/attitude_and_heading_reference_system_ahrs_failure',
              page: AttitudeAndHeadingReferenceSystemAhrsFailureRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/autopilot_or_electric_trim_failure',
              page: AutopilotOrElectricTrimFailureRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/display_cooling_advisory',
              page: DisplayCoolingAdvisoryRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/vacuum_system_failure',
              page: VacuumSystemFailureRoute.page,
            ),
            AutoRoute(
              path: 'hand_book/emergency_categories/high_carbon_monoxide_co_level_advisory',
              page: HighCarbonMonoxideCoLevelAdvisoryRoute.page,
            ),
            AutoRoute(path: 'base_questions', page: BaseQuestionsRoute.page),
            AutoRoute(path: 'base_questions/:categoryId', page: ListQuestionByCategoryRoute.page),
            AutoRoute(path: 'type_sertificates/:typeCertificate/:questionId', page: DetailQuestionRoute.page),
            AutoRoute(path: 'testing_mode', page: TestingModeRoute.page),
            AutoRoute(path: 'test_by_mode/:typeCertificateId', page: TestByModeRoute.page),
            AutoRoute(path: 'test_results', page: TestResultsRoute.page),
          ],
        ),
        // Журнал (блог + новости): вложенная навигация, деталки и экраны создания
        AutoRoute(
          path: 'journal',
          page: JournalNavigationRoute.page,
          children: [
            AutoRoute(path: '', page: JournalRoute.page, initial: true),
            AutoRoute(path: 'article/create', page: CreateBlogArticleRoute.page),
            AutoRoute(path: 'news/create', page: CreateNewsRoute.page),
            AutoRoute(path: 'news/:id', page: DetailNewsRoute.page),
            AutoRoute(path: 'article/:id', page: BlogArticleDetailRoute.page),
          ],
        ),

        // Работа (вакансии и резюме): список, создание и детали вложены в work (как в маркете — переход из профиля и "Назад" работают)
        AutoRoute(
          path: 'work',
          page: WorkNavigationRoute.page,
          children: [
            AutoRoute(path: '', page: WorkRoute.page, initial: true),
            AutoRoute(path: 'my-responses', page: MyVacancyResponsesRoute.page),
            AutoRoute(path: 'employer-responses', page: EmployerVacancyResponsesRoute.page),
            AutoRoute(path: 'vacancies/create', page: CreateJobVacancyRoute.page),
            AutoRoute(path: 'resumes/create', page: CreateJobResumeRoute.page),
            AutoRoute(path: 'vacancies/:id', page: JobVacancyDetailRoute.page),
            AutoRoute(path: 'vacancies/:id/edit', page: EditJobVacancyRoute.page),
            AutoRoute(path: 'vacancies/:id/respond', page: CreateVacancyResponseRoute.page),
            AutoRoute(path: 'vacancies/:id/responses', page: VacancyResponsesRoute.page),
            AutoRoute(path: 'resumes/:id', page: JobResumeDetailRoute.page),
            AutoRoute(path: 'resumes/:id/edit', page: EditJobResumeRoute.page),
          ],
        ),
        // Прямые пути для глубоких ссылок (jobs/...)
        AutoRoute(path: 'jobs/vacancies/:id', page: JobVacancyDetailRoute.page),
        AutoRoute(path: 'jobs/vacancies/:id/edit', page: EditJobVacancyRoute.page),
        AutoRoute(path: 'jobs/vacancies/:id/respond', page: CreateVacancyResponseRoute.page),
        AutoRoute(path: 'jobs/vacancies/:id/responses', page: VacancyResponsesRoute.page),
        AutoRoute(path: 'jobs/resumes/:id', page: JobResumeDetailRoute.page),
        AutoRoute(path: 'jobs/resumes/:id/edit', page: EditJobResumeRoute.page),
        // (vacancy/resume edit, respond, responses дублированы выше внутри work)

        // Раздел новостей (для прямых ссылок и детальных экранов)
        AutoRoute(
          path: 'news',
          page: NewsNavigationRoute.page,
          children: [
            AutoRoute(initial: true, page: NewsRoute.page),
            AutoRoute(path: 'create', page: CreateNewsRoute.page),
            AutoRoute(path: 'edit/:id', page: EditNewsRoute.page),
            AutoRoute(path: ':id', page: DetailNewsRoute.page),
          ],
        ),

        AutoRoute(path: 'user-news', page: UserNewsRoute.page),

        AutoRoute(
          path: 'market',
          page: MarketNavigationRoute.page,
          children: [
            AutoRoute(initial: true, page: MarketRoute.page),
            AutoRoute(path: 'create-aircraft', page: CreateAircraftMarketRoute.page),
            AutoRoute(path: 'create-part', page: CreatePartsMarketRoute.page),
            AutoRoute(path: 'parts/:id', page: PartsMarketDetailRoute.page),
            AutoRoute(path: 'parts/:id/edit', page: EditPartsMarketRoute.page),
            AutoRoute(path: ':id', page: AircraftMarketDetailRoute.page),
            AutoRoute(path: ':id/edit', page: EditAircraftMarketRoute.page),
          ],
        ),
        AutoRoute(
          path: 'on-the-way',
          page: OnTheWayNavigationRoute.page,
          children: [
            AutoRoute(initial: true, page: FlightsListRoute.page, path: ''),
            AutoRoute(path: 'create', page: CreateFlightRoute.page),
            AutoRoute(path: ':id', page: FlightDetailRoute.page),
            AutoRoute(path: ':id/edit', page: EditFlightRoute.page),
            AutoRoute(path: 'airports/:airportCode/edit', page: EditAirportRoute.page),
          ],
        ),
        AutoRoute(path: 'payment', page: PaymentRoute.page),
        AutoRoute(path: 'payment/webview', page: PaymentWebViewRoute.page),
        AutoRoute(
          path: 'blog',
          page: BlogNavigationRoute.page,
          children: [
            AutoRoute(initial: true, page: BlogRoute.page, path: ''),
            AutoRoute(path: 'create', page: CreateBlogArticleRoute.page),
            AutoRoute(path: ':id', page: BlogArticleDetailRoute.page),
            AutoRoute(path: ':id/edit', page: EditBlogArticleRoute.page),
          ],
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileNavigationRoute.page,
          children: [
            AutoRoute(
              initial: true,
              // guards: [AuthGuard()],
              page: ProfileRoute.page,
            ),
            AutoRoute(path: 'privacy-policy', page: PrivacyPolicyRoute.page),
            AutoRoute(path: 'eula', page: EulaRoute.page),
          ],
        ),
      ],
    ),
  ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      // final isAuthenticated = await TokenStorage.isAccessTokenValid();
      final isAuthenticated = await getIt<AppState>().checkAuthStatus();

      if (isAuthenticated) {
        resolver.next(true);
        return;
      }

      // Получаем контекст из любого доступного источника
      final context = navigatorKey.currentContext;

      if (context == null) {
        resolver.next(false);
        return;
      }

      final result = await _showLoginBottomSheet(context);

      if (result == true) {
        resolver.next(true);
      } else {
        resolver.next(false);
        router.pop();
      }
    } catch (e) {
      resolver.next(false);
      router.pop();
    }
  }

  Future<bool?> _showLoginBottomSheet(BuildContext context) async {
    return await showLogin(context);
  }
}
