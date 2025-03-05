import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/bottom_bar_with_circle.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool hideBottomNav = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final hideBottomNavMeta = ServiceLocator.instance.get<AppRouter>().topMatch.meta['hideBottomNav'] == true;
    const List<String> hideBottomNavPath = [
      // 'learning'
      // '/requests/create_sale_request',
      // '/requests/order_spec/',
      // '/orders/order_spec/',
      // '/signing_spec_screen/docview',
      // '/tradings/trading_schedule/',
      // '/result_map_cpt',
      // '/result_map_exw',
      // '/stories',
    ];

    return Visibility(
      visible: !hideBottomNavPath.any((path) => context.router.currentPath.contains(path)),

      // child: Provider.of<AppState>(context).auth != null ? BottomBarWithCircle(tabsRouter: widget.tabsRouter) : BottomBarPromo(tabsRouter: widget.tabsRouter),
      child: BottomBarWithCircle(tabsRouter: widget.tabsRouter),
    );
  }
}
