import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/bottom_bar_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';

/// Нижнаяя панель навигации.
class BottomBar extends StatefulWidget {
  const BottomBar({super.key, this.tabsRouter});

  final TabsRouter? tabsRouter;

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Определяем, является ли это мобильным устройством (ширина < 600px)
      final isMobile = MediaQuery.of(context).size.width < 600;

      if (isMobile) {
        // На мобильных устройствах определяем ориентацию
        final orientation = MediaQuery.of(context).orientation;
        final isLandscape = orientation == Orientation.landscape;

        if (isLandscape) {
          // В ландшафтной ориентации - вертикальный sidebar слева
          return Container(
            width: 80, // Узкий sidebar для ландшафта
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: const BoxDecoration(color: Color(0xFFF5F7FA)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Логотип
                Center(child: SvgPicture.asset(Pictures.logoTitle, height: 30)),
                const SizedBox(height: 16),
                // Главная (индекс 0)
                BottomBarItem(
                  icon: Pictures.mainNavbar,
                  text: 'Главная',
                  activeColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFFE3F1FF) : Colors.transparent,
                  textColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFF0970FF) : Color(0xFF4B5767),
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 0) {
                      AutoRouter.of(context).navigate(const MainNavigationRoute());
                    } else {
                      widget.tabsRouter!.setActiveIndex(0);
                    }
                  },
                  isActive: widget.tabsRouter!.activeIndex == 0,
                ),
                const SizedBox(height: 8),
                // Обучение (индекс 1)
                BottomBarItem(
                  icon: Pictures.bookNavbar,
                  text: 'Обучение',
                  activeColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFFE3F1FF) : Colors.transparent,
                  textColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFF0970FF) : Color(0xFF4B5767),
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 1) {
                      AutoRouter.of(context).navigate(const LearningNavigationRoute());
                    } else {
                      widget.tabsRouter!.setActiveIndex(1);
                    }
                  },
                  isActive: widget.tabsRouter!.activeIndex == 1,
                ),
                const SizedBox(height: 8),
                // По пути (индекс 2)
                BottomBarItem(
                  iconData: Icons.flight,
                  text: 'По пути',
                  activeColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFFE3F1FF) : Colors.transparent,
                  textColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFF0970FF) : Color(0xFF4B5767),
                  onPressed: () {
                    widget.tabsRouter!.setActiveIndex(2);
                  },
                  isActive: widget.tabsRouter!.activeIndex == 2,
                ),
                const SizedBox(height: 8),
                // Новости (индекс 3)
                BottomBarItem(
                  icon: Pictures.newsNavbar,
                  text: 'Новости',
                  activeColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFFE3F1FF) : Colors.transparent,
                  textColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFF0970FF) : Color(0xFF4B5767),
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 3) {
                      AutoRouter.of(context).navigate(const NewsNavigationRoute());
                    } else {
                      widget.tabsRouter!.setActiveIndex(3);
                    }
                  },
                  isActive: widget.tabsRouter!.activeIndex == 3,
                ),
                const SizedBox(height: 8),
                // Маркет (индекс 4)
                BottomBarItem(
                  icon: Pictures.marketNavbar,
                  text: 'Маркет',
                  activeColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFFE3F1FF) : Colors.transparent,
                  textColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFF0970FF) : Color(0xFF4B5767),
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 4) {
                      AutoRouter.of(context).navigate(const MarketNavigationRoute());
                    } else {
                      widget.tabsRouter!.setActiveIndex(4);
                    }
                  },
                  isActive: widget.tabsRouter!.activeIndex == 4,
                ),
                const SizedBox(height: 8),
                // Журнал (индекс 5)
                BottomBarItem(
                  iconData: Icons.article,
                  text: 'Журнал',
                  activeColor: widget.tabsRouter!.activeIndex == 5 ? Color(0xFFE3F1FF) : Colors.transparent,
                  textColor: widget.tabsRouter!.activeIndex == 5 ? Color(0xFF0970FF) : Color(0xFF4B5767),
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 5) {
                      AutoRouter.of(context).navigate(const BlogNavigationRoute());
                    } else {
                      widget.tabsRouter!.setActiveIndex(5);
                    }
                  },
                  isActive: widget.tabsRouter!.activeIndex == 5,
                ),
              ],
            ),
          );
        } else {
          // В портретной ориентации - используем тот же bottom bar, что и в приложении
          return _buildMobileBottomBar(context);
        }
      }

      // На десктопе - вертикальный sidebar слева с иконкой и текстом в строку
      return Container(
        width: 200, // Фиксированная ширина для веба
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: const BoxDecoration(color: Color(0xFFF5F7FA)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Логотип
            Center(child: SvgPicture.asset(Pictures.logoTitle, height: 40)),
            const SizedBox(height: 24),
            // Главная (индекс 0)
            BottomBarItem(
              icon: Pictures.mainNavbar,
              text: 'Главная',
              activeColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 0) {
                  AutoRouter.of(context).navigate(const MainNavigationRoute());
                } else {
                  widget.tabsRouter!.setActiveIndex(0);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 0,
            ),
            const SizedBox(height: 13),
            // Обучение (индекс 1)
            BottomBarItem(
              icon: Pictures.bookNavbar,
              text: 'Обучение',
              activeColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 1) {
                  AutoRouter.of(context).navigate(const LearningNavigationRoute());
                } else {
                  widget.tabsRouter!.setActiveIndex(1);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 1,
            ),
            const SizedBox(height: 13),
            // По пути (индекс 2)
            BottomBarItem(
              iconData: Icons.flight,
              text: 'По пути',
              activeColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                widget.tabsRouter!.setActiveIndex(2);
              },
              isActive: widget.tabsRouter!.activeIndex == 2,
            ),
            const SizedBox(height: 13),
            // Новости (индекс 3)
            BottomBarItem(
              icon: Pictures.newsNavbar,
              text: 'Новости',
              activeColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 3) {
                  AutoRouter.of(context).navigate(const NewsNavigationRoute());
                } else {
                  widget.tabsRouter!.setActiveIndex(3);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 3,
            ),
            const SizedBox(height: 13),
            // Маркет (индекс 4)
            BottomBarItem(
              icon: Pictures.marketNavbar,
              text: 'Маркет',
              activeColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 4) {
                  AutoRouter.of(context).navigate(const MarketNavigationRoute());
                } else {
                  widget.tabsRouter!.setActiveIndex(4);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 4,
            ),
            const SizedBox(height: 13),
            // Журнал (индекс 5)
            BottomBarItem(
              iconData: Icons.article,
              text: 'Журнал',
              activeColor: widget.tabsRouter!.activeIndex == 5 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 5 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 5) {
                  AutoRouter.of(context).navigate(const BlogNavigationRoute());
                } else {
                  widget.tabsRouter!.setActiveIndex(5);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 5,
            ),
          ],
        ),
      );
    } else {
      // На мобильных - используем тот же bottom bar, что и в приложении
      return _buildMobileBottomBar(context);
    }
  }

  /// Строит мобильный bottom bar (используется и на вебе в портрете, и на нативных платформах)
  Widget _buildMobileBottomBar(BuildContext context) {
    // На вебе ScreenUtil отключен, поэтому используем фиксированные значения
    // которые соответствуют масштабированным значениям на нативных платформах
    final screenWidth = MediaQuery.of(context).size.width;
    final paddingLeft = kIsWeb ? (6.0 * screenWidth / 375.0) : 6.0;
    final paddingRight = kIsWeb ? (6.0 * screenWidth / 375.0) : 6.0;
    final paddingTop = kIsWeb ? (3.0 * screenWidth / 375.0) : 3.0;

    return Container(
      width: kIsWeb ? double.infinity : MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom / 2, left: paddingLeft, right: paddingRight, top: paddingTop),
      decoration: const BoxDecoration(color: Color(0xFFF9FDFF)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Главная (индекс 0)
          BottomBarItem(
            icon: Pictures.mainNavbar,
            text: 'Главная',
            activeColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFFE3F1FF) : Colors.transparent,
            textColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFF0970FF) : Color(0xFF4B5767),
            onPressed: () {
              if (widget.tabsRouter!.activeIndex == 0) {
                AutoRouter.of(context).navigate(const MainNavigationRoute());
              } else {
                widget.tabsRouter!.setActiveIndex(0);
              }
            },
            isActive: widget.tabsRouter!.activeIndex == 0,
          ),
          // Обучение (индекс 1)
          BottomBarItem(
            icon: Pictures.bookNavbar,
            text: 'Обучение',
            activeColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFFE3F1FF) : Colors.transparent,
            textColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFF0970FF) : Color(0xFF4B5767),
            onPressed: () {
              if (widget.tabsRouter!.activeIndex == 1) {
                AutoRouter.of(context).navigate(const LearningNavigationRoute());
              } else {
                widget.tabsRouter!.setActiveIndex(1);
              }
            },
            isActive: widget.tabsRouter!.activeIndex == 1,
          ),
          // По пути (индекс 2)
          BottomBarItem(
            iconData: Icons.flight,
            text: 'По пути',
            activeColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFFE3F1FF) : Colors.transparent,
            textColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFF0970FF) : Color(0xFF4B5767),
            onPressed: () {
              widget.tabsRouter!.setActiveIndex(2);
            },
            isActive: widget.tabsRouter!.activeIndex == 2,
          ),
          // Новости (индекс 3)
          BottomBarItem(
            icon: Pictures.newsNavbar,
            text: 'Новости',
            activeColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFFE3F1FF) : Colors.transparent,
            textColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFF0970FF) : Color(0xFF4B5767),
            onPressed: () {
              if (widget.tabsRouter!.activeIndex == 3) {
                AutoRouter.of(context).navigate(const NewsNavigationRoute());
              } else {
                widget.tabsRouter!.setActiveIndex(3);
              }
            },
            isActive: widget.tabsRouter!.activeIndex == 3,
          ),
          // Маркет (индекс 4)
          BottomBarItem(
            icon: Pictures.marketNavbar,
            text: 'Маркет',
            activeColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFFE3F1FF) : Colors.transparent,
            textColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFF0970FF) : Color(0xFF4B5767),
            onPressed: () {
              if (widget.tabsRouter!.activeIndex == 4) {
                AutoRouter.of(context).navigate(const MarketNavigationRoute());
              } else {
                widget.tabsRouter!.setActiveIndex(4);
              }
            },
            isActive: widget.tabsRouter!.activeIndex == 4,
          ),
          // Журнал (индекс 5)
          BottomBarItem(
            iconData: Icons.article,
            text: 'Журнал',
            activeColor: widget.tabsRouter!.activeIndex == 5 ? Color(0xFFE3F1FF) : Colors.transparent,
            textColor: widget.tabsRouter!.activeIndex == 5 ? Color(0xFF0970FF) : Color(0xFF4B5767),
            onPressed: () {
              if (widget.tabsRouter!.activeIndex == 5) {
                AutoRouter.of(context).navigate(const BlogNavigationRoute());
              } else {
                widget.tabsRouter!.setActiveIndex(5);
              }
            },
            isActive: widget.tabsRouter!.activeIndex == 5,
          ),
        ],
      ),
    );
  }
}
