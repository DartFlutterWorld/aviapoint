import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/utils/const/theme.dart';

@RoutePage()
class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.newbg,
      // backgroundColor: Colors.transparent,
      transitionBuilder: (_, child, __) => child,
      animationDuration: Duration.zero,
      routes: const [
        LearningNavigationRoute(),
        TradingsNavigationRoute(),

        // MainRoute(),
        MainNavigationRoute(),

        PricesNavigationRoute(),

        NewsNavigationRoute(),

        // ProfileNavigationRoute(),
        // SaleRequestNavigationRoute(),
      ],
      bottomNavigationBuilder: MediaQuery.of(context).size.width < 768
          ? (_, tabsRouter) {
              return BottomNavBar(tabsRouter: tabsRouter);
            }
          : null,
    );
  }
}
