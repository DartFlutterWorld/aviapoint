import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class CabinFireScreen extends StatelessWidget {
  const CabinFireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'cabin_fire'.tr(),
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
                  customTableRow(1, 'stby_batt_switch', 'off'),
                  customTableRow(2, 'master_switch_alt_and_bat', 'off'),
                  customTableRow(3, 'cabin_vents', 'closed_to_avoid_drafts'),
                  customTableRow(4, 'cabin_ht_and_cabin_air_control_knobs', 'off_push_full_in_to_avoid_drafts'),
                  customTableRow(5, 'fire_extinguisher', 'activate_if_available'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'warning',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'after_the_fire_extinguisher_has_been_used_make_sure_that_the_fire_is_extinguished_before_exterior_air_is_used_to_remove_smoke_from_the_cabin',
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
                  customTableRow(6, 'cabin_vents', 'open_when_sure_that_fire_is_completely_extinguished'),
                  customTableRow(7, 'cabin_ht_and_cabin_air_control_knobs', 'on_pull_full_out_when_sure_that_fire_is_completely_extinguished'),
                  customTableRow(8, 'touchdown1', 'land_the_airplane_as_soon_as_possible_to_inspect_for_damage'),
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
