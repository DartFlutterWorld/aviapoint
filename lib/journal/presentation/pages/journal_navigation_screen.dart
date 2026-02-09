import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class JournalNavigationScreen extends StatelessWidget {
  const JournalNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter(placeholder: (context) => Scaffold(backgroundColor: AppColors.background));
  }
}
