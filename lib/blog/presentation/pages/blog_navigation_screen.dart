import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BlogNavigationScreen extends StatelessWidget {
  const BlogNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(controller: HeroController(), child: const AutoRouter());
  }
}
