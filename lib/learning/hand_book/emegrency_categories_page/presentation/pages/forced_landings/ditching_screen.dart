import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class DitchingScreen extends StatelessWidget {
  const DitchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ditching'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(
              context,
              title: 'ditching'.tr(),
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
                  customTableRow(1, 'radio', 'transmit_mayday_on_125_mhz_give_location_intensions_and_squawk_7700'),
                  customTableRow(2, 'heavy_objects_in_baggage_area', 'secure_or_jettison_if_possible'),
                  customTableRow(3, 'pilot_and_passenger_seat_backs', 'most_upright_position'),
                  customTableRow(4, 'seats_and_seat_belts', 'secure'),
                  customTableRow(5, 'wing_flaps', '20_full'),
                  customTableRow(6, 'power', 'establish_300_ft_min_descent_at_55_kias'),
                  customTableRow(
                    7,
                    'note',
                    'if_no_power_is_available_approach_at70_kias_with_flaps_up_or_at_65_kias_with_flaps_10',
                  ),
                  customTableRow(8, 'approach_high_winds_heavy_seas', 'into_the_wind'),
                  customTableRow(9, 'approach_light_winds_heavy_swells', 'parallel_to_swells'),
                  customTableRow(10, 'doors', 'unlatch'),
                  customTableRow(11, 'touchdown', 'level_attitude_at_established_rate_of_descent'),
                  customTableRow(12, 'face', 'cushion_at_ouchdown_with_folded_coat'),
                  customTableRow(13, 'elt', 'activate'),
                  customTableRow(14, 'airplane', 'evacuate_throught_cabin_doors'),
                  customTableRow(
                    15,
                    'note',
                    'if_necessary_open_window_and_flood_cabin_to_equalize_pressure_so_doors_can_be_opened',
                  ),
                  customTableRow(16, 'lie_vest_and_raft', 'inflate_when_clear_of_airplane'),
                  customTableRow(17, 'emergency_radio', 'according_to_attached_instructions'),
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
