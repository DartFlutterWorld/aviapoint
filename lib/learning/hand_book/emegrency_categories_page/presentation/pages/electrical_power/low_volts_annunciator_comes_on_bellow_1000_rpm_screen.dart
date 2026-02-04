import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/utils/learning_share_helper.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class LowVoltsAnnunciatorComesOnBellow1000RpmScreen extends StatelessWidget {
  const LowVoltsAnnunciatorComesOnBellow1000RpmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'electrical_power_supply_system_malfunctions'.tr(),
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary100p),
            onPressed: () => LearningShareHelper.shareLearningPage(
              context,
              title: 'electrical_power_supply_system_malfunctions'.tr(),
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
                  'low_volts_annunciator_comes_on_bellow_1000_rpm',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow('1', 'throttle_controle', '1000_rpm'),
                  customTableRow('2', 'low_volts_annunciator', 'check_off'),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'low_volts_annunciator_remains_on_at_1000_rpm',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              SizedBox(height: 8),
              Table(
                columnWidths: {0: FixedColumnWidth(32), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                border: TableBorder.all(color: Colors.grey),
                children: [
                  customTableRow(
                    '3',
                    'service',
                    'authorized_maintenance_personnel_must_do_electrical_system_inspection_prior_to_next_flight',
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

  TableRow customTableRow(String number, String name, String doing) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Text(number == '0' ? '' : number)),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(name).tr()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(doing, textAlign: TextAlign.right).tr(),
        ),
      ],
    );
  }
}
