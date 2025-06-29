import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TradingsScreen extends StatelessWidget {
  const TradingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.newbg,
      body: Center(
        child: Text('TradingsNavigationScreen'),
      ),
    );
  }
}
