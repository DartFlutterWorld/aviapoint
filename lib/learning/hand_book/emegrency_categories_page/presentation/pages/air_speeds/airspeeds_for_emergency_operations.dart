import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class AirspeedsForEmergencyOperationsScreen extends StatelessWidget {
  const AirspeedsForEmergencyOperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'airspeeds_for_emergency_operations'.tr(),
        withBack: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => context.read<EmergencyCheckedCubit>().clearAllCategory(),
        //     icon: SvgPicture.asset(Pictures.round_clear2),
        //   ),
        // ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'engine_failure_after_take_off',
                style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
              ).tr(),
            ),
            SizedBox(height: 8),
            Table(
              columnWidths: {0: FlexColumnWidth(3), 1: FlexColumnWidth(1)},
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('wing_flaps_up').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('70_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('wing_flaps_10_full').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('65_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: Text('maneuvering_speed', style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary)).tr(),
            ),
            SizedBox(height: 8),
            Table(
              columnWidths: {0: FlexColumnWidth(3), 1: FlexColumnWidth(1)},
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('2550_pounds').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('105_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('2200_pounds').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('98_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('1900_pounds').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('90_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('maximum_glide').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('68_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('precautionary_landing_with_engine_power').tr(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('65_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'landing_without_engine_power',
                style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
              ).tr(),
            ),
            SizedBox(height: 8),
            Table(
              columnWidths: {0: FlexColumnWidth(3), 1: FlexColumnWidth(1)},
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('wing_flaps_up').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('70_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0), child: Text('wing_flaps_10_full').tr()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('65_kias', textAlign: TextAlign.right).tr(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
