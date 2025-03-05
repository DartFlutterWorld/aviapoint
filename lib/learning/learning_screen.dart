import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/baner_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Обучение',
        withBack: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            BanerWidget(
              titleButtonColor: AppColors.mainSolid,
              circleBackGround: Pictures.bottom_p,
              picture: Pictures.rule,
              background: const Color(0xffD2C2FF),
              title: 'CESSNA-172S NAV III',
              desc: 'Выполнение учебных полётов с \nнавигацией Garmin G1000',
              titleButton: 'Смотреть видео',
              ontap: () => AutoRouter.of(context).push(
                VideoForStudentsRoute(),
              ),
            ),
            SizedBox(height: 16.h),
            BanerWidget(
              titleButtonColor: AppColors.mainSolid,
              circleBackGround: Pictures.bottom_p,
              picture: Pictures.rule,
              background: const Color(0xffD2C2FF),
              title: 'Учебное пособие',
              desc: 'Проведение предполётных, нормльных и аварийных процедур, карты контрольных проверок CESSNA-172S NAV III',
              titleButton: 'Начать обучение',
              ontap: () => AutoRouter.of(context).push(
                HandBookMainCategoriesRoute(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
