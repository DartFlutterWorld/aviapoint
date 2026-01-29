import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestMySelfWidget extends StatelessWidget {
  const TestMySelfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0xff045EC5).withOpacity(0.08),
        //     blurRadius: 9.3,
        //     spreadRadius: 0,
        //     offset: Offset(
        //       0.0,
        //       4.0,
        //     ),
        //   ),
        // ],
        image: DecorationImage(image: AssetImage(Pictures.pilotWithFon), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 74, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            Text(Provider.of<RosAviaTestCubit>(context).state.typeSertificate.title, style: AppStyles.bold16s.copyWith(color: const Color(0xFF1F2937))),
            SizedBox(height: 4),
            Text('Подготовьтесь к экзамену', style: AppStyles.regular13s.copyWith(color: const Color(0xFF6E7A89))),
            SizedBox(height: 12),
            CustomButton(
              title: 'Тестирование',
              verticalPadding: 8,
              backgroundColor: const Color(0xFF0A6EFA),
              onPressed: () => startTestingFlowNew(context: context),
              borderRadius: 46,
              textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
              borderColor: const Color(0xFF0A6EFA),
              boxShadow: [BoxShadow(color: const Color(0xff0064D6).withOpacity(0.28), blurRadius: 17.8, spreadRadius: 0, offset: const Offset(0.0, 7.0))],
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
