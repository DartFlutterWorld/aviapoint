import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/abnormal_landings/abnormal_landings_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/air_speeds/airspeeds_for_emergency_operations.dart';
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
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/icing/icing_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/static_source_blockage/static_source_blockage_screen.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/pages/hand_book_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/presentation/pages/normal_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/pages/normal_check_list_screen.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/pages/preflight_inspection_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/pages/preflight_inspection_check_list_screen.dart';
import 'package:aviapoint/learning/learning_screen.dart';
import 'package:aviapoint/learning/learning_navigation_screen.dart';
import 'package:aviapoint/learning/video_for_students_page/presentation/pages/video_for_students_screen.dart';
import 'package:aviapoint/news/news_navigation_screen.dart';
import 'package:aviapoint/news/news_screen.dart';
import 'package:aviapoint/ntb/presentation/pages/tradings_navigation_screen.dart';
import 'package:aviapoint/ntb/presentation/pages/tradings_screen.dart';
import 'package:aviapoint/sale/sale_request_navigation_screen.dart';
import 'package:aviapoint/sale/sale_request_screen.dart';
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

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom();

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
                  children: [
                    // AutoRoute(
                    //   path: 'video_for_students',
                    //   page: ViseoForStudentsRoute.page,
                    // ),
                  ],
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
                  path: 'hand_book/emergeny_categories',
                  page: EmergencyCategoriesRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/airspeeds_for_emergency_operations',
                  page: AirspeedsForEmergencyOperationsRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/engine_failure',
                  page: EngineFailureRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/forced_landings_sub_categories',
                  page: ForcedLandingsSubCategoriesRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/forced_landings_sub_categories/emergency_landing_with_engine_power',
                  page: EmergencyLandingWithoutEnginePowerRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/forced_landings_sub_categories/emergency_landing_with_engine_power',
                  page: EmergencyLandingWithEnginePowerRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/forced_landings_sub_categories/ditching',
                  page: DitchingRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/fires_sub_categories',
                  page: FiresSubCategoriesRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/fires_sub_categories/fires_during_start_on_ground',
                  page: FiresDuringStartOnGroundRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/fires_sub_categories/engine_fire_in_flight',
                  page: EngineFireInFlightRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/fires_sub_categories/electrical_fire_in_flight',
                  page: ElectricalFireInFlightRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/fires_sub_categories/cabin_fire',
                  page: CabinFireRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/fires_sub_categories/wing_fire',
                  page: WingFireRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/icing',
                  page: IcingRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/static_source_blockage',
                  page: StaticSourceBlockageRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/excessive_fuel_vapor',
                  page: ExcessiveFuelVaporRoute.page,
                ),
                AutoRoute(
                  path: 'hand_book/emergeny_categories/abnormal_landings',
                  page: AbnormalLandingsRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'profile',
              //guards: [AuthGuard()],
              page: ProfileNavigationRoute.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: ProfileRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'news',
              page: NewsNavigationRoute.page,
              children: [
                AutoRoute(initial: true, page: NewsRoute.page),
              ],
            ),
            AutoRoute(
              path: 'tradings',
              page: TradingsNavigationRoute.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: TradingsRoute.page,
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

Route<T> notDismissibleModalSheetBuilder<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  return ModalBottomSheetRoute(
    isDismissible: false,
    enableDrag: false,
    settings: page,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
    },
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

Route<T> modalSheetBuilder<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  return ModalBottomSheetRoute(
    settings: page,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
    },
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     // the navigation is paused until resolver.next() is called with either
//     // true to resume/continue navigation or false to abort navigation
//     if (ServiceLocator.instance.get<AppState>().auth != null) {
//       // if user is authenticated we continue
//       resolver.next(true);
//     } else {
//       // we redirect the user to our login page
//       // tip: use resolver.redirect to have the redirected route
//       // automatically removed from the stack when the resolver is completed
//       resolver.redirect(AuthRoute(
//         onResult: (isLogin) => resolver.next(isLogin),
//       ));
//     }
//   }
// }

// class BusinessTypeGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     // the navigation is paused until resolver.next() is called with either
//     // true to resume/continue navigation or false to abort navigation
//     if (ServiceLocator.instance.get<AppState>().auth == null ||
//         ServiceLocator.instance
//                 .get<AppState>()
//                 .auth!
//                 .profile
//                 .company
//                 .businessType ==
//             'individual') {
//       resolver.redirect(const BaseRoute());
//     } else {
//       resolver.next(true);
//     }
//   }
// }
