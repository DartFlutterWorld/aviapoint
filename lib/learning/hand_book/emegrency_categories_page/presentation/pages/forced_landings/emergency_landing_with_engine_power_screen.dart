import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class EmergencyLandingWithEnginePowerScreen extends StatelessWidget {
  const EmergencyLandingWithEnginePowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'emergency_landing_with_engine_power'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(
              context,
              title: 'emergency_landing_with_engine_power'.tr(),
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
                  customTableRow(1, 'pilot_and_passenger_seat_backs', 'most_upright_position'),
                  customTableRow(2, 'seats_and_seat_belts', 'secure'),
                  customTableRow(3, 'airspeed', '65_kias'),
                  customTableRow(4, 'wing_flaps', '20'),
                  customTableRow(5, 'selected_field', 'fly_over_noting_terrain_and_obstructions'),
                  customTableRow(6, 'wing_flaps', 'full_on_final_approach'),
                  customTableRow(7, 'airspeed', '65_kias'),
                  customTableRow(8, 'stby_batt_switch', 'off'),
                  customTableRow(9, 'master_switch_alt_and_bat', 'off_when_landing_is_assured'),
                  customTableRow(10, 'doors', 'unlatch_prior_to_touchdown'),
                  customTableRow(11, 'touchdown', 'slightly_tail_low'),
                  customTableRow(12, 'mixture_controle', 'idle_cutoff_pull_full_out'),
                  customTableRow(13, 'magnetos_switch', 'off'),
                  customTableRow(14, 'brakes', 'apply_heavily'),
                  customTableRow(15, 'emergency_radio', 'according_to_attached_instructions'),
                ],
              ),
              SizedBox(height: 16),
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
