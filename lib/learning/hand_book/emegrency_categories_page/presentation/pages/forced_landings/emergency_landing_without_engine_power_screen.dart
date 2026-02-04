import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class EmergencyLandingWithoutEnginePowerScreen extends StatelessWidget {
  const EmergencyLandingWithoutEnginePowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'emergency_landing_without_engine_power'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(
              context,
              title: 'emergency_landing_without_engine_power'.tr(),
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
                  customTableRow(3, 'airspeed_70_kias', 'flaps_up'),
                  customTableRow(4, 'airspeed_65_kias', 'flaps_10_full'),
                  customTableRow(5, 'mixture_controle', 'idle_cutoff_pull_full_out'),
                  customTableRow(6, 'fuel_shutoff_valve', 'off'),
                  customTableRow(7, 'magnetos_switch', 'off'),
                  customTableRow(8, 'wing_flaps', 'as_required_full_recommended'),
                  customTableRow(9, 'stby_batt_switch', 'off'),
                  customTableRow(10, 'doors', 'unlatch_prior_to_touchdown'),
                  customTableRow(11, 'touchdown', 'slightly_tail_low'),
                  customTableRow(12, 'brakes', 'apply_heavily'),
                  customTableRow(13, 'emergency_radio', 'according_to_attached_instructions'),
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
