import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class EngineFireInFlightScreen extends StatelessWidget {
  const EngineFireInFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'engine_fire_in_flight'.tr(),
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
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'mixture_controle', 'idle_cutoff_pull_full_out'),
                  customTableRow(2, 'fuel_shutoff_valve', 'off_pull_full_out'),
                  customTableRow(3, 'fuel_pump_switch', 'off'),
                  customTableRow(4, 'master_switch_alt_and_bat', 'off'),
                  customTableRow(5, 'cabin_vents', 'open_as_needed'),
                  customTableRow(6, 'cabin_ht_and_cabin_air_control_knobs', 'off_push_full_in_to_avoid_drafts'),
                  customTableRow(7, 'airspeed', '100_kias_if_fire_is_not_extinguished_increase_glid_speed_to_find_an_airspeed_within_airspeed_limitations_which_will_provide_an_incombustible_mixture'),
                  customTableRow(8, 'forced_landing', 'execute_refer_to_emergency_landing_without_engine_power'),
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
