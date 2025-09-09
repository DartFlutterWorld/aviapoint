import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/baner_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/data/models/ros_avia_test_category_with_questions_dto.dart';
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
        // backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            BanerWidget(
              background: Pictures.watchVideoBackground,
              picture: Pictures.aviaWatch,
              title: 'CESSNA-172S NAV III',
              desc: 'Обучающий видеоролик\nо полётах с навигацией\nGarmin G1000',
              titleButton: 'Смотреть видео',
              onTap: () => AutoRouter.of(context).push(
                VideoForStudentsRoute(),
              ),
              alignPicture: Alignment.centerRight,
            ),
            SizedBox(height: 16.h),
            BanerWidget(
              background: Pictures.startLearningBackground,
              picture: Pictures.bookLearning,
              title: 'Учебное пособие',
              desc: 'Проведение предполётных, нормальных\nи аварийных процедур, чек-листы\nCESSNA-172S NAV III',
              titleButton: 'Начать обучение',
              onTap: () => AutoRouter.of(context).push(
                HandBookMainCategoriesRoute(),
              ),
              alignPicture: Alignment.topRight,
            ),
            SizedBox(height: 16.h),
            BanerWidget(
              heightPicture: 194,
              background: Pictures.backgroundRta,
              picture: Pictures.pilotRta,
              title: 'РосАвиаТест',
              titleStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF1F2937),
              ),
              descStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                height: 1.3,
                color: Color(0xFF4B5767),
              ),
              desc: 'Актуальные экзаменационные\nбилеты для пилотов\nи авиаперсонала',
              titleButton: 'Обучение',
              onTap: () => AutoRouter.of(context).push(
                BaseQuestionsRoute(),
              ),
              alignPicture: Alignment.topRight,
              titleButton2: 'Тестирование',
              boxShadowButton: [
                BoxShadow(
                  color: Color(0xff106BD2).withOpacity(0.11),
                  blurRadius: 9,
                  spreadRadius: 0,
                  offset: Offset(
                    0.0,
                    7.0,
                  ),
                ),
              ],
              boxShadowButton2: [
                BoxShadow(
                  color: Color(0xff0064D6).withOpacity(0.27),
                  blurRadius: 9,
                  spreadRadius: 0,
                  offset: Offset(
                    0.0,
                    7.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
