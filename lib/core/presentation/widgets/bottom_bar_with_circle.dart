import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/bottom_bar_with_circle_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:aviapoint/core/domain/service_locator.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/utils/const/theme.dart';

/// Нижнаяя панель навигации.
class BottomBarWithCircle extends StatefulWidget {
  const BottomBarWithCircle({
    Key? key,
    this.tabsRouter,
  }) : super(key: key);

  final TabsRouter? tabsRouter;

  @override
  BottomBarWithCircleState createState() => BottomBarWithCircleState();
}

class BottomBarWithCircleState extends State<BottomBarWithCircle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom) / 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFF3EBFF),
                Color(0xFFFFFAF1),
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: BottomBarWithCircleItem(
                  icon: widget.tabsRouter!.activeIndex == 0 ? Pictures.ordersTabGradient : Pictures.ordersTabGrey,
                  text: 'Обучение',
                  colors: widget.tabsRouter!.activeIndex == 0 ? AppColors.mainSolid : AppColors.inactive,
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 0) {
                      AutoRouter.of(context).navigate(
                        const LearningNavigationRoute(),
                      );
                    } else {
                      widget.tabsRouter!.setActiveIndex(0);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: BottomBarWithCircleItem(
                  icon: widget.tabsRouter!.activeIndex == 1 ? Pictures.ntbTabGradient : Pictures.ntbTabGrey,
                  text: 'Биржа',
                  colors: widget.tabsRouter!.activeIndex == 1 ? AppColors.mainSolid : AppColors.inactive,
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 1) {
                      AutoRouter.of(context).navigate(
                        const TradingsNavigationRoute(),
                      );
                    } else {
                      widget.tabsRouter!.setActiveIndex(1);
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 80,
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: BottomBarWithCircleItem(
                  icon: widget.tabsRouter!.activeIndex == 3 || widget.tabsRouter!.activeIndex == 3 ? Pictures.pricesTabGradient : Pictures.pricesTabGrey,
                  text: 'Цены',
                  colors: widget.tabsRouter!.activeIndex == 3 || widget.tabsRouter!.activeIndex == 3 ? AppColors.mainSolid : AppColors.inactive,
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 3) {
                      AutoRouter.of(context).navigate(
                        const PricesNavigationRoute(),
                      );
                    } else {
                      widget.tabsRouter!.setActiveIndex(3);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: BottomBarWithCircleItem(
                  icon: widget.tabsRouter!.activeIndex == 4 ? Pictures.newsTabGradient : Pictures.newsTabGrey,
                  text: 'Новости',
                  colors: widget.tabsRouter!.activeIndex == 4 ? AppColors.mainSolid : AppColors.inactive,
                  onPressed: () {
                    if (widget.tabsRouter!.activeIndex == 4) {
                      AutoRouter.of(context).navigate(
                        const NewsNavigationRoute(),
                      );
                    } else {
                      widget.tabsRouter!.setActiveIndex(4);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -12,
          child: Container(
            height: 92,
            width: 92,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(247, 241, 250, 1),
              borderRadius: BorderRadius.all(Radius.circular(900)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(247, 241, 250, 1),
                  Color.fromRGBO(249, 244, 246, 1),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(900),
              ),
              child: Center(
                child: BottomBarWithCircleItem(
                  icon: widget.tabsRouter!.activeIndex == 2 ? Pictures.mainTabGradient : Pictures.mainTabGrey,
                  text: 'Главная',
                  colors: widget.tabsRouter!.activeIndex == 2 ? AppColors.mainSolid : AppColors.inactive,
                  onPressed: () {
                    const int index = 2;
                    bool isCurrentTab = false;
                    String prevPath = context.router.currentPath;

                    if (widget.tabsRouter!.activeIndex == index) {
                      isCurrentTab = true;
                      AutoRouter.of(context).navigate(
                        const MainNavigationRoute(),
                      );
                    } else {
                      widget.tabsRouter!.setActiveIndex(index);
                    }

                    // ServiceLocator.instance
                    //     .get<AppState>()
                    //     .bottomBarIndexClickController
                    //     .add((index, prevPath, isCurrentTab));
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
