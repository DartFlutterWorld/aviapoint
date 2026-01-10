import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';

@RoutePage()
class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.background,
      transitionBuilder: (_, child, __) => child,
      animationDuration: Duration.zero,
      routes: const [
        MainNavigationRoute(), // Главная (индекс 0)
        LearningNavigationRoute(), // Обучение (индекс 1)
        OnTheWayNavigationRoute(), // По пути (индекс 2)
        NewsNavigationRoute(), // Новости (индекс 3)
        MarketNavigationRoute(), // Маркет (индекс 4)
        BlogNavigationRoute(), // Блог (индекс 5)
        // SaleRequestNavigationRoute(),
      ],
      bottomNavigationBuilder: MediaQuery.of(context).size.width < 768
          ? (_, tabsRouter) {
              return BottomNavBar(tabsRouter: tabsRouter);
            }
          :
            // Помеенять на null если хотим чтоб не покзывался BottomNavBar
            (_, tabsRouter) {
              return BottomNavBar(tabsRouter: tabsRouter);
            },
    );
  }
}
