import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';

import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';

/// Нижнаяя панель навигации.
class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    this.tabsRouter,
  });

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
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom / 2, left: 10, right: 10),
      decoration: const BoxDecoration(color: Color(0xFFF9FDFF)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
            ),
            child: BottomBarItem(
              icon: Pictures.bookNavbar,
              text: 'Обучение',
              activeColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 0 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 0) {
                  AutoRouter.of(context).navigate(
                    const LearningNavigationRoute(),
                  );
                } else {
                  widget.tabsRouter!.setActiveIndex(0);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomBarItem(
              icon: Pictures.marketNavbar,
              text: 'Маркет',
              activeColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 1 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 1) {
                  AutoRouter.of(context).navigate(
                    const MarketNavigationRoute(),
                  );
                } else {
                  widget.tabsRouter!.setActiveIndex(1);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomBarItem(
              icon: Pictures.mainNavbar,
              text: 'Главная',
              activeColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 2 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 2) {
                  AutoRouter.of(context).navigate(
                    const MainNavigationRoute(),
                  );
                } else {
                  widget.tabsRouter!.setActiveIndex(2);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomBarItem(
              icon: Pictures.newsNavbar,
              text: 'Новости',
              activeColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 3 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 3) {
                  AutoRouter.of(context).navigate(
                    const NewsNavigationRoute(),
                  );
                } else {
                  widget.tabsRouter!.setActiveIndex(3);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomBarItem(
              icon: Pictures.profileNavbar,
              text: 'Профиль',
              activeColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFFE3F1FF) : Colors.transparent,
              textColor: widget.tabsRouter!.activeIndex == 4 ? Color(0xFF0970FF) : Color(0xFF4B5767),
              onPressed: () {
                if (widget.tabsRouter!.activeIndex == 4) {
                  AutoRouter.of(context).navigate(
                    const ProfileNavigationRoute(),
                  );
                } else {
                  widget.tabsRouter!.setActiveIndex(4);
                }
              },
              isActive: widget.tabsRouter!.activeIndex == 4,
            ),
          ),
        ],
      ),
    );
  }
}
