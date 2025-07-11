import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmScreen extends StatelessWidget {
  const LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'low_volts_annunciator'.tr(),
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
              SizedBox(height: 8),
              Center(
                child: Text(
                  'low_volts_annunciator_comes_on_or_does_not_go_off_at_higher_rpm',
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
                  customTableRow('1', 'master_switch_alt_only', 'off'),
                  customTableRow('2', 'alt_field_circuit_breaker', 'check_in'),
                  customTableRow('3', 'master_switch_alt_and_bat', 'on'),
                  customTableRow('4', 'low_volts_annunciator', 'check_off'),
                  customTableRow('5', 'm_bus_volts', 'check_27_5_v_minimum'),
                  customTableRow('6', 'm_batt_amps', 'check_charging_plus'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'if_low_volts_annunciator_remains_on',
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
                  customTableRow('7', 'master_switch_alt_only', 'off'),
                  customTableRow('8', 'electrical_load', 'reduce_immediatly_as_follows'),
                ],
              ),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(32),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow('а', 'avionics_switch_bus1', 'off'),
                  customTableRow('б', 'pitot_heat_switch', 'off'),
                  customTableRow('в', 'beacon_light_switch', 'off'),
                  customTableRow('г', 'land_light_switch', 'off_use_as_required_for_landing'),
                  customTableRow('д', 'taxi_light_switch', 'off'),
                  customTableRow('е', 'nav_light_switch', 'off'),
                  customTableRow('ж', 'strobe_light_switch', 'off'),
                  customTableRow('з', 'cabin_pwr_12v_switch', 'off'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'note',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              Center(
                child: Text(
                  'note1',
                ).tr(),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'note2',
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
                  customTableRow('и', 'com_1_nav_1', 'tune_to_active_frequency'),
                  customTableRow('к', 'com_1_mic_and_nav_1', 'select_com_2_mic_and_nav2_will_be_inoperative_once_avionics_bus2_is_seleted_to_off'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'note',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'note3',
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
                  customTableRow('л', 'avionics_switch_bus_2', 'off_keep_on_if_in_clouds'),
                  customTableRow('9', 'land', 'land_as_soon_as_practical'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'note',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'note4',
                ).tr(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  TableRow customTableRow(String number, String name, String doing) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(number == '0' ? '' : number),
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
