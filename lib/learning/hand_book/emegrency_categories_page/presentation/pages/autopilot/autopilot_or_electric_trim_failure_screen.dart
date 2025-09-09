import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class AutopilotOrElectricTrimFailureScreen extends StatelessWidget {
  const AutopilotOrElectricTrimFailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'autopilot_or_electric_trim_failure'.tr(),
        withBack: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => context.read<EmergencyCheckedCubit>().clearAllCategory(),
        //     icon: SvgPicture.asset(Pictures.round_clear2),
        //   ),
        // ],
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
                  'ap_or_ptrm_annunciators_come_on',
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
                  customTableRow(1, 'control_wheel', 'crasp_firmly_regain_control_of_airplane'),
                  customTableRow(2, 'ap_trim_disc_button', 'press_and_hold_throughout_recovery'),
                  customTableRow(3, 'elevator_trim_control', 'adjust_manually_as_necessary'),
                  customTableRow(4, 'auto_pilot_circuit_breaker', 'open_pull_out'),
                  customTableRow(5, 'ap_trim_disc_button', 'release'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'warning',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              Center(
                child: Text(
                  'following_an_autopilot_autotrim_or_manual_electric_trim_system_malfunction_do_not_engage_the_autopilot_unil_the_cause_of_the_malfuction_has_been_correxted',
                ).tr(),
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
