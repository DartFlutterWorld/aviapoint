import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class WingFireScreen extends StatelessWidget {
  const WingFireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'wing_fire'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(
              context,
              title: 'wing_fire'.tr(),
            ),
            tooltip: 'Поделиться',
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'land_and_taxi_light_switches', 'off'),
                  customTableRow(2, 'nav_light_switch', 'off'),
                  customTableRow(3, 'strobe_light_switch', 'off'),
                  customTableRow(4, 'pitot_heat_switch', 'off'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text('note', style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary)).tr(),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'perform_a_sideslip_to_keep_the_flames_away_from_the_fuel_tank_and_cabin_land_as_soon_as_possible_using_flaps_only_as_required_for_final_approach_and_touchdown',
                ).tr(),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  TableRow customTableRow(int number, String name, String doing) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Text(number == 0 ? '' : number.toString())),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(name).tr()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(doing, textAlign: TextAlign.right).tr(),
        ),
      ],
    );
  }
}
