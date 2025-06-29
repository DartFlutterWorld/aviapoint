import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:easy_localization/easy_localization.dart' as hello;
import 'package:flutter/material.dart';

@RoutePage()
class ExcessiveFuelVaporScreen extends StatelessWidget {
  const ExcessiveFuelVaporScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'excessive_fuel_vapor'.tr(),
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
                  'fuel_flow_stabilization_procedures',
                  style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
                ).tr(),
              ),
              Center(
                child: Text(
                  'if_flow_fluctuations_of_1_gph_or_more_or_power_surges_occur',
                  textAlign: TextAlign.center,
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
                  customTableRow(1, 'fuel_pump_switch', 'on'),
                  customTableRow(2, 'mixture_controle', 'adjust_as_necessary_for_smooth_engine_operation'),
                  customTableRow(3, 'fuel_selector_valve', 'select_opposite_tank_if_vapor_symptoms_continue'),
                  customTableRow(4, 'fuel_pump_switch', 'off_after_fuel_flow_has_stabilized'),
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
