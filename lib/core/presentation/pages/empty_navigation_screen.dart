import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/themes/app_colors.dart';

@RoutePage()
class EmptyNavigationScreen extends StatelessWidget {
  const EmptyNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      placeholder: (_) => Scaffold(
        backgroundColor: AppColors.newbg,
      ),
    );
  }
}
