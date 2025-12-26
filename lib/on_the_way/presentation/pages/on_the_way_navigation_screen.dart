import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnTheWayNavigationScreen extends StatelessWidget {
  const OnTheWayNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(controller: HeroController(), child: const AutoRouter());
  }
}
