import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class EngineFailureScreen extends StatelessWidget {
  const EngineFailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'engine_failure'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(context, title: 'engine_failure'.tr()),
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
              Center(
                child: Text(
                  'engine_failure_during_take_off_roll',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(25), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'throttle_controle', 'idle_pull_full_out'),
                  customTableRow(2, 'brakes', 'apply'),
                  customTableRow(3, 'wing_flaps', 'retract'),
                  customTableRow(4, 'mixture_controle', 'idle_cutoff_pull_full_out'),
                  customTableRow(5, 'magnetos_switch', 'off'),
                  customTableRow(6, 'stby_batt_switch', 'off'),
                  customTableRow(7, 'master_switch_alt_and_bat', 'off'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'engine_failure_immediately_after_take_off',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(25), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'airspeed_70_kias', 'flaps_up'),
                  customTableRow(2, 'airspeed_65_kias', 'flaps_10_full'),
                  customTableRow(3, 'mixture_controle', 'idle_cutoff_pull_full_out'),
                  customTableRow(4, 'fuel_shutoff_valve', 'off_pull_full_out'),
                  customTableRow(5, 'magnetos_switch', 'off'),
                  customTableRow(6, 'wing_flaps', 'as_required_full_recommended'),
                  customTableRow(7, 'stby_batt_switch', 'off'),
                  customTableRow(8, 'master_switch_alt_and_bat', 'off'),
                  customTableRow(9, 'cabin_door', 'unlatch'),
                  customTableRow(10, 'land', 'straight_ahead'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'engine_failure_during_flight_restart_procedures',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(25), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'airspeed', '68_kias_best_glide_speed'),
                  customTableRow(2, 'fuel_shutoff_valve', 'on_push_full_in'),
                  customTableRow(3, 'fuel_selector_valve', 'both'),
                  customTableRow(4, 'fuel_pump_switch', 'on'),
                  customTableRow(5, 'mixture_controle', 'rich_if_restart_has_not_occurred'),
                  customTableRow(6, 'magnetos_switch', 'both_or_start_if_propeller_is_stoped'),
                  customTableRow(0, 'note', 'note_if_the_propeller'),
                  customTableRow(7, 'fuel_pump_switch', 'off'),
                  customTableRow(0, 'note', 'note_if_the_indicated'),
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
