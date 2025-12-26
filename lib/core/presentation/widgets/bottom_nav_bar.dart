import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.tabsRouter});

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
    // final hideBottomNavMeta = ServiceLocator.instance.get<AppRouter>().topMatch.meta['hideBottomNav'] == true;
    const List<String> hideBottomNavPath = [
      'learning/hand_book/preflight_inspection_categories/check_list',
      'learning/hand_book/normal_categories/check_list',
      '/stories',
      'base_questions/',
    ];

    final shouldHide = hideBottomNavPath.any((path) => context.router.currentPath.contains(path));

    return Visibility(
      visible: !shouldHide,
      maintainState: true,
      maintainAnimation: true,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: shouldHide ? 0.0 : 1.0,
        child: IgnorePointer(
          ignoring: shouldHide,
          child: BottomBar(tabsRouter: widget.tabsRouter),
        ),
      ),
    );
  }
}
