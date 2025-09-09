import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestMySelfWidget extends StatelessWidget {
  const TestMySelfWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
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
        image: DecorationImage(
          image: AssetImage(
            Pictures.pilotWithFon,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 74, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 12),
            Flexible(
              child: Text(
                'Частный пилот (вертолёт)',
                style: AppStyles.bold16s.copyWith(
                  color: Color(0xFF1F2937),
                ),
              ),
            ),
            Text(
              'Проверьте себя',
              style: AppStyles.regular13s.copyWith(
                color: Color(0xFF6E7A89),
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Тестирование',
              verticalPadding: 8.h,
              backgroundColor: Color(0xFF0A6EFA),
              onPressed: () {},
              borderRadius: 46.r,
              textStyle: AppStyles.bold14s.copyWith(color: Colors.white),
              borderColor: Color(0xFF0A6EFA),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff0064D6).withOpacity(0.28),
                  blurRadius: 17.8,
                  spreadRadius: 0,
                  offset: Offset(
                    0.0,
                    7.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
