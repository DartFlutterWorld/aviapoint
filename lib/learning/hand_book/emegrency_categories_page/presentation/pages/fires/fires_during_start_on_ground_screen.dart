import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class FiresDuringStartOnGroundScreen extends StatelessWidget {
  const FiresDuringStartOnGroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'fires_during_start_on_ground'.tr(),
        withBack: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => context.read<EmergencyCheckedCubit>().clearAllCategory(),
        //     icon: SvgPicture.asset(Pictures.round_clear2),
        //   ),
        // ],
      ),
      backgroundColor: AppColors.newbg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Table(
                columnWidths: {
                  0: FixedColumnWidth(32),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'magnetos_switch', 'start_continue_cranking_to_start_to_engine'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'if_engine_starts',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(32),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(2, 'power1', '1800_rpm_for_a_few_minutes'),
                  customTableRow(3, 'engine', 'shutdown_inspect_for_damage'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'if_engine_fails_to_start',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(32),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(2, 'throttle_controle', 'full_push_full_in'),
                  customTableRow(3, 'mixture_controle', 'idle_cutoff_pull_full_out'),
                  customTableRow(4, 'magnetos_switch', 'start_continue_cranking_to_start_to_engine'),
                  customTableRow(5, 'fuel_shutoff_valve', 'off_pull_full_out'),
                  customTableRow(6, 'fuel_pump_switch', 'off'),
                  customTableRow(7, 'magnetos_switch', 'off'),
                  customTableRow(8, 'stby_batt_switch', 'off'),
                  customTableRow(9, 'master_switch_alt_and_bat', 'off'),
                  customTableRow(10, 'engine', 'secure1'),
                  customTableRow(11, 'parking_brake', 'release'),
                  customTableRow(12, 'fire_extinguisher', 'obtain_have_ground_attendants_obtain_if_not_installed'),
                  customTableRow(13, 'airplane', 'evacuate'),
                  customTableRow(14, 'fires', 'inspect_repair_or_replace_damaged_components_and_or_wiring_before_conducting_another_flight'),
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
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(number == 0 ? '' : number.toString()),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name).tr(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          doing,
          textAlign: TextAlign.right,
        ).tr(),
      ),
    ]);
  }
}
