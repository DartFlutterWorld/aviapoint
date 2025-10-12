import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
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
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/base_questions_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/detail_question_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/list_question_by_category_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/type_sertificates_screen.dart';
import 'package:aviapoint/learning/video_for_students_page/presentation/pages/video_for_students_screen.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/presentation/pages/detail_story_screen.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/pages/detail_news_screen.dart';
import 'package:aviapoint/news/presentation/pages/news_navigation_screen.dart';
import 'package:aviapoint/news/presentation/pages/news_screen.dart';
import 'package:aviapoint/market/presentation/pages/market_navigation_screen.dart';
import 'package:aviapoint/market/presentation/pages/market_screen.dart';
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
import 'package:aviapoint/profile_page/profile/presentation/pages/profile_navigation_screen.dart';
import 'package:aviapoint/profile_page/profile/presentation/pages/profile_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

part 'app_router.gr.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter()
      : super(
          navigatorKey: navigatorKey,
        );
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
                AutoRoute(
                  path: '',
                  page: MainRoute.page,
                  initial: true,
                ),
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
                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                    return FadeTransition(
                      opacity: animation,
                      alwaysIncludeSemantics: true,
                      child: child,
                    );
                  },
                  meta: const {'hideBottomNav': true},
                ),
              ],
            ),
            AutoRoute(
              path: 'prices',
              page: PricesNavigationRoute.page,
              // initial: true,
              children: [
                AutoRoute(
                  path: '',
                  page: PricesRoute.page,
                  initial: true,
                ),
              ],
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
                AutoRoute(
                  path: 'video_for_students',
                  page: VideoForStudentsRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book',
                  page: HandBookMainCategoriesRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/preflight_inspection_categories',
                  page: PreflightInspectionCategoriesRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/preflight_inspection_categories/check_list/:preflihgtInspectionCategoryId',
                  page: PreflightInspectionCheckListRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/normal_categories',
                  page: NormalCategoriesRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/normal_categories/check_list/:normalCategoryId',
                  page: NormalCheckListRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergency_categories',
                  page: EmergencyCategoriesRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergency_categories/airspeeds_for_emergency_operations',
                  page: AirspeedsForEmergencyOperationsRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergency_categories/engine_failure',
                  page: EngineFailureRoute.page,
                ),
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
                AutoRoute(
                  path: 'hand_book/emergency_categories/fires_sub_categories',
                  page: FiresSubCategoriesRoute.page,
                ),
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
                AutoRoute(
                  path: 'hand_book/emergency_categories/fires_sub_categories/wing_fire',
                  page: WingFireRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergency_categories/icing',
                  page: IcingRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergency_categories/static_source_blockage',
                  page: StaticSourceBlockageRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergency_categories/excessive_fuel_vapor',
                  page: ExcessiveFuelVaporRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergency_categories/abnormal_landings',
                  page: AbnormalLandingsRoute.page,
                ),
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
                  path: 'hand_book/emergency_categories/electrical_power/low_volts_annunciator_comes_on_or_does_not_go_off_at_higher_rpm',
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
                AutoRoute(
                  path: 'base_questions',
                  page: BaseQuestionsRoute.page,
                ),
                AutoRoute(
                  path: 'base_questions/:categoryId',
                  page: ListQuestionByCategoryRoute.page,
                ),
                AutoRoute(
                  path: 'type_sertificates/:typeCertificate/:questionId',
                  page: DetailQuestionRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'profile',
              // guards: [AuthGuard()],
              page: ProfileNavigationRoute.page,
              children: [
                AutoRoute(
                  initial: true,
                  // guards: [AuthGuard()],
                  page: ProfileRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'news',
              page: NewsNavigationRoute.page,
              children: [
                AutoRoute(initial: true, page: NewsRoute.page),
                AutoRoute(path: ':id', page: DetailNewsRoute.page),
              ],
            ),
            AutoRoute(
              path: 'market',
              page: MarketNavigationRoute.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: MarketRoute.page,
                ),
              ],
            ),
          ],
        ),

        // AutoRoute(
        //   initial: !kIsWeb && ServiceLocator.instance.get<AppState>().isNewUser,
        //   page: OnboardingRoute.page,
        // ),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
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
    return await showCupertinoModalBottomSheet<bool>(
      barrierColor: Colors.black12,
      topRadius: const Radius.circular(20),
      context: context,
      builder: (context) => PhoneAuthScreen(),
    );
  }
}
