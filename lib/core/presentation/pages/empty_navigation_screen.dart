import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/utils/const/theme.dart';

@RoutePage()
class EmptyNavigationScreen extends StatelessWidget {
  const EmptyNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      placeholder: (_) => Container(
        color: AppColors.newbg,
      ),
    );
  }
}
