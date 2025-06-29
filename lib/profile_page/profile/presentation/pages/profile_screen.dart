import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.newbg,
      body: Center(
        child: Text('Профиль2'),
      ),
    );
  }
}
