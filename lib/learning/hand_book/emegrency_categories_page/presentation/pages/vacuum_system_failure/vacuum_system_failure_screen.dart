import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class VacuumSystemFailureScreen extends StatelessWidget {
  const VacuumSystemFailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'vacuum_system_failure'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(
              context,
              title: 'vacuum_system_failure'.tr(),
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
              Center(
                child: Text(
                  'low_vacuum_annunciator_comes_on',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(
                    1,
                    'vacuum_indicator_vac',
                    'check_eis_engine_page_make_sure_vacuum_pointer_is_in_green_band_limits',
                  ),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text('warning', style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary)).tr(),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'if_vacuum_pointer_is_out_of_the_green_band_during_flight_or_the_gyro_flag_is_shown_on_the_standby_attitude_indicator_the_standby_attitude_indicator_must_not_be_used_for_attitude_information',
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
