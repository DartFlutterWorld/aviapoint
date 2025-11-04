import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class IcingScreen extends StatelessWidget {
  const IcingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'inadvertent_icing_encounter_during_flight'.tr(),
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
                  customTableRow(1, 'pitot_heat_switch', 'on'),
                  customTableRow(2, 'turnback', 'turn_back_or_change_altitude_to_obtain_an_outside_air_temperature_that_is_less_conducive_to_icing'),
                  customTableRow(3, 'cabin_ht_control_knobs', 'on_pull_full_out'),
                  customTableRow(4, 'cabin_ht_and_cabin_air_control_knobs', 'open_to_obtain_maximum_windshield_defroster_airflow'),
                  customTableRow(5, 'cabin_air_control_knob', 'adjust_to_obtain_maximum_defroster_heat_and_airflow'),
                ],
              ),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('6')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'watch_for_signs_of_induction_air_filter_icing_a_loss_of_engine_rpm_could_be_caused_by_ice_blocking_the_air_intake_filter_adjust_the_throtle_as_necessary_to_hold_engine_rpm_adjust_mixture_as_necessary_for_any_change_in_power_settings',
                          textAlign: TextAlign.right,
                        ).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('7')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('plan_a_landing_at_the_nearest_airport_wit_an_extermely_rapid_ice_buildup_select_a_suitable_off_airport_landing_site', textAlign: TextAlign.right).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('8')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'with_an_ice_accumulation_of_025_inch_or_more_on_the_wing_leading_edges_be_prepared_for_significantly_higher_power_requirements_higher_approach_and_stall_speeds_and_longer_landing_roll',
                          textAlign: TextAlign.right,
                        ).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('9')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'leave_wing_flaps_retracted_with_a_severe_ice_build_up_on_the_horizontal_tail_the_change_in_wing_wake_airflow_direction_caused_by_wing_flap_extension_could_result_in_a_loss_of_elevator_effectiveness',
                          textAlign: TextAlign.right,
                        ).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('10')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('open_left_window_and_if_practical_scrape_ic_from_a_portion_of_he_windshield_for_visibiliy_in_the_landing_approach', textAlign: TextAlign.right).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('11')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('perform_a_landing_approach_using_a_forward_slip_if_necessary_for_improved_visibility', textAlign: TextAlign.right).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('12')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('approach_at_65_to75_kias_depending_upon_te_amount_of_ice_accumulation', textAlign: TextAlign.right).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('13')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('perform_landing_in_level_attitude', textAlign: TextAlign.right).tr(),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('14')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('missed_approaches_should_be_avoided_whenever_possible_because_of_severely_reduced_climb_capability', textAlign: TextAlign.right).tr(),
                      ),
                    ],
                  ),
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
