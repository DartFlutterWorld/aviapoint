import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
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
      transitionBuilder: (_, child, __) {
        if (kIsWeb) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 600, maxWidth: 1400),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Фиксированный sidebar
                  Builder(
                    builder: (context) {
                      final tabsRouter = AutoTabsRouter.of(context);
                      return BottomNavBar(tabsRouter: tabsRouter);
                    },
                  ),
                  // Отступ между sidebar и контентом
                  const SizedBox(width: 16),
                  // Основной контент
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: child,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return child;
      },
      animationDuration: Duration.zero,
      routes: const [
        MainNavigationRoute(), // Главная (индекс 0)
        LearningNavigationRoute(), // Обучение (индекс 1)
        OnTheWayNavigationRoute(), // По пути (индекс 2)
        NewsNavigationRoute(), // Новости (индекс 3)
        MarketNavigationRoute(), // Маркет (индекс 4)
        BlogNavigationRoute(), // Блог (индекс 5)
      ],
      bottomNavigationBuilder: kIsWeb
          ? null
          : (_, tabsRouter) {
              return BottomNavBar(tabsRouter: tabsRouter);
            },
    );
  }
}
