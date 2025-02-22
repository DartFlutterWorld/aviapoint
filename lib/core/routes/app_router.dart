import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/app_state.dart';
import 'package:aviapoint/news/news_navigation_screen.dart';
import 'package:aviapoint/news/news_screen.dart';
import 'package:aviapoint/ntb/presentation/pages/tradings_navigation_screen.dart';
import 'package:aviapoint/ntb/presentation/pages/tradings_screen.dart';
import 'package:aviapoint/sale/sale_request_navigation_screen.dart';
import 'package:aviapoint/sale/sale_request_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/base_screen.dart';
import 'package:aviapoint/core/domain/service_locator.dart';
import 'package:aviapoint/core/presentation/pages/empty_navigation_screen.dart';
import 'package:aviapoint/main_page/main_navigation_screen.dart';
import 'package:aviapoint/main_page/main_screen.dart';
import 'package:aviapoint/price_page/prices_screen.dart';
import 'package:aviapoint/learning_page/orders/presentation/pages/learning_navigation_screen.dart';
import 'package:aviapoint/learning_page/orders/presentation/pages/learning_screen.dart';
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
              // initial: true,
              children: [
                AutoRoute(
                  path: '',
                  page: MainRoute.page,
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
              children: [
                AutoRoute(
                  path: '',
                  page: PricesRoute.page,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(
              initial: true,
              path: 'learning',
              page: LearningNavigationRoute.page,
              children: [
                AutoRoute(
                  path: '',
                  initial: true,
                  page: LearningRoute.page,
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
