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
      transitionBuilder: (context, child, __) {
        if (kIsWeb) {
          // Определяем, является ли это мобильным устройством (ширина < 600px)
          final isMobile = MediaQuery.of(context).size.width < 600;
          
          if (isMobile) {
            // На мобильных устройствах определяем ориентацию
            final orientation = MediaQuery.of(context).orientation;
            final isLandscape = orientation == Orientation.landscape;
            
            if (isLandscape) {
              // В ландшафтной ориентации - sidebar слева, контент справа
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sidebar будет управляться через bottomNavigationBuilder
                  // Но для layout нужен контейнер
                  Builder(
                    builder: (ctx) {
                      final tabsRouter = AutoTabsRouter.of(ctx);
                      return BottomNavBar(tabsRouter: tabsRouter);
                    },
                  ),
                  // Контент справа
                  Expanded(child: child),
                ],
              );
            }
            
            // В портретной ориентации bottom bar будет внизу через bottomNavigationBuilder
            return child;
          }
          
          // На десктопе - обычный layout с sidebar
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
      bottomNavigationBuilder: (context, tabsRouter) {
        if (kIsWeb) {
          // На вебе для мобильных устройств используем BottomBar с определением ориентации
          final isMobile = MediaQuery.of(context).size.width < 600;
          if (isMobile) {
            // Проверяем ориентацию
            final orientation = MediaQuery.of(context).orientation;
            final isLandscape = orientation == Orientation.landscape;
            
            // В ландшафтной ориентации sidebar показывается в transitionBuilder
            if (isLandscape) {
              return const SizedBox.shrink();
            }
            
            // В портретной ориентации показываем bottom bar внизу
            return BottomNavBar(tabsRouter: tabsRouter);
          }
          // На десктопе bottom bar в sidebar, возвращаем пустой виджет
          return const SizedBox.shrink();
        }
        // На нативных мобильных платформах
        return BottomNavBar(tabsRouter: tabsRouter);
      },
    );
  }
}
