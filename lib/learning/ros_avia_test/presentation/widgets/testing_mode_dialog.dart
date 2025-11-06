import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/testing_mode_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/data/database/app_db.dart';

class TestingModeDialog extends StatefulWidget {
  const TestingModeDialog({super.key});

  @override
  State<TestingModeDialog> createState() => _TestingModeDialogState();
}

class _TestingModeDialogState extends State<TestingModeDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  // padding: const EdgeInsets.only(top: 8),
                  icon: SvgPicture.asset(Pictures.closeAuth, alignment: Alignment.centerRight),
                  onPressed: () => context.router.pop(),
                ),
              ),
              Text(
                'Выберите режим тестирования',
                style: AppStyles.regular15s.copyWith(color: Color(0xFF6E7A89), height: 1),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),
              TestingModeElement(
                title: 'Тренировочный\nрежим',
                subTitle: 'Правильные ответы появляются сразу',
                onTap: () => context.router.pop(TestMode.training),
                image: Pictures.zamok,
                bg: Pictures.traningTestBg,
              ),
              SizedBox(height: 16.h),
              TestingModeElement(
                title: 'Стандартный\nтест',
                subTitle: 'Результаты появятся вконце теста',
                onTap: () => context.router.pop(TestMode.standart),
                image: Pictures.mozgi,
                bg: Pictures.testMySelfBg,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
