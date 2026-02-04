import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class StaticSourceBlockageScreen extends StatelessWidget {
  const StaticSourceBlockageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'static_source_blockage'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(
              context,
              title: 'static_source_blockage'.tr(),
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
              SizedBox(height: 8),
              Center(
                child: Text(
                  'erroneous_instrument_reading_suspected',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(1, 'alt_static_air_valve', 'on_pull_full_out'),
                  customTableRow(2, 'cabin_vents', 'closed'),
                  customTableRow(
                    3,
                    'cabin_ht_and_cabin_air_control_knobs',
                    'open_to_obtain_maximum_windshield_defroster_airflow',
                  ),
                  customTableRow(4, 'airspeed', 'view_airspeed_calibration_altermate_static_source_correction_chart'),
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
