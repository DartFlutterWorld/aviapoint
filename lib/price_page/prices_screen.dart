import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PricesScreen extends StatelessWidget {
  const PricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: 'Price'),
      body: Column(
        children: [
          Center(child: Text('PricesScreen')),
          SizedBox(height: 20),
          TextButton(onPressed: () => FirebaseCrashlytics.instance.crash(), child: Text('Error')),
        ],
      ),
    );
  }
}
