import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/baner_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';

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
        withProfile: true,
        // backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontal),
        child: ListView(
          children: [
            SizedBox(height: AppSpacing.section),
            BanerWidget(
              heightPicture: 150,
              background: Pictures.watchVideoBackground,
              picture: Pictures.aviaWatch,
              title: 'CESSNA-172S NAV III',
              titleStyle: AppStyles.bold20s.copyWith(color: Colors.white),
              descStyle: AppStyles.regular13s.copyWith(height: 1.3, color: const Color(0xFFF1F7FF)),
              desc: 'Обучающий видеоролик\nо полётах с навигацией\nGarmin G1000',
              titleButton: 'Смотреть видео',
              titleButtonStyle: AppStyles.bold16s.copyWith(color: const Color(0xFF0A6EFA)),
              onTap: () => AutoRouter.of(context).push(VideoForStudentsRoute()),
              alignPicture: Alignment.centerRight,
            ),
            SizedBox(height: AppSpacing.section),
            BanerWidget(
              heightPicture: 150,
              background: Pictures.startLearningBackground,
              picture: Pictures.bookLearning,
              title: 'Учебное пособие',
              titleStyle: AppStyles.bold20s.copyWith(color: Colors.white),
              descStyle: AppStyles.regular13s.copyWith(height: 1.3, color: const Color(0xFFF1F7FF)),
              desc: 'Проведение предполётных, нормальных\nи аварийных процедур, чек-листы\nCESSNA-172S NAV III',
              titleButton: 'Начать обучение',
              titleButtonStyle: AppStyles.bold16s.copyWith(color: const Color(0xFF0A6EFA)),
              onTap: () => AutoRouter.of(context).push(HandBookMainCategoriesRoute()),
              alignPicture: Alignment.topRight,
            ),
            SizedBox(height: AppSpacing.section),
            BanerWidget(
              heightPicture: 150,
              background: Pictures.backgroundRta,
              picture: Pictures.pilotRta,
              title: 'РосАвиаТест 2026',
              titleStyle: AppStyles.bold20s.copyWith(color: const Color(0xFF1F2937)),
              descStyle: AppStyles.regular13s.copyWith(height: 1.3, color: const Color(0xFF4B5767)),
              desc: 'Актуальные экзаменационные\nбилеты для пилотов\nи авиаперсонала',
              titleButton: 'Обучение',
              titleButtonStyle: AppStyles.bold16s.copyWith(color: const Color(0xFF0A6EFA)),
              onTap: () => AutoRouter.of(context).push(BaseQuestionsRoute()),
              onTap2: () => startTestingFlowNew(context: context),
              alignPicture: Alignment.bottomRight,
              titleButton2: 'Тестирование',
              titleButtonStyle2: AppStyles.bold16s.copyWith(color: Colors.white),
              boxShadowButton: [BoxShadow(color: Color(0xff106BD2).withOpacity(0.11), blurRadius: 9, spreadRadius: 0, offset: Offset(0.0, 7))],
              boxShadowButton2: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.27), blurRadius: 9, spreadRadius: 0, offset: Offset(0.0, 7))],
            ),
          ],
        ),
      ),
    );
  }
}
