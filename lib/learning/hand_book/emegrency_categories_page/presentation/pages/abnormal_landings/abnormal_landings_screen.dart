import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class AbnormalLandingsScreen extends StatelessWidget {
  const AbnormalLandingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'abnormal_landings'.tr(),
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
              SizedBox(height: 8),
              Center(
                child: Text(
                  'landing_with_a_flat_main_tire',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'approach', 'normal'),
                  customTableRow(2, 'wing_flaps', 'full'),
                  customTableRow(
                    3,
                    'touchdown',
                    'good_main_tire_first_hold_airplane_off_flat_tire_as_long_as_possible_with_aileron_control',
                  ),
                  customTableRow(4, 'directional_control', 'maintain_using_brake_on_good_wheel_as_required'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'landing_with_a_flat_nose_tire',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'approach', 'normal'),
                  customTableRow(2, 'wing_flaps', 'as_required'),
                  customTableRow(0, '85_110_kias', 'flaps_up_10'),
                  customTableRow(0, 'below_85_kias', 'flaps_10_full'),
                  customTableRow(3, 'touchdown', 'on_mains_hold_nose_wheel_off_the_ground_as_long_as_possible'),
                ],
              ),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('4')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'when_nose_wheel_touches_down_maintain_full_up_elevator_as_airplane_slows_to_stop',
                          textAlign: TextAlign.right,
                        ).tr(),
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
