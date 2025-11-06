import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/widgets/clear_progress.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/utils/talker_config.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_with_list_questions_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/detail_question_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/select_topics_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/type_sertificates_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/testing_mode_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Future<void> checkList({required BuildContext context, required List<NormalCheckListEntity> checkList}) async {
  return await showModalBottomSheet<void>(
    useRootNavigator: false,
    isDismissible: false,
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    barrierColor: AppColors.bgOverlay,
    backgroundColor: AppColors.background,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 24),
          child: Column(
            spacing: 24,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Карта контрольных проверок', textAlign: TextAlign.center, style: AppStyles.bigButtonCulture.copyWith(fontSize: 22)),
              Table(
                border: TableBorder.all(width: 0.5),
                children: [
                  ...checkList.map(
                    (e) => TableRow(
                      decoration: BoxDecoration(color: e.id.floor().isEven ? Colors.grey[200] : Colors.transparent),
                      children: [
                        Padding(padding: const EdgeInsets.all(6.0), child: Text(e.title)),
                        Padding(padding: const EdgeInsets.all(6.0), child: Text(e.doing)),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(
                verticalPadding: 8,
                backgroundColor: Color(0xFF0A6EFA),
                title: 'Проверено',
                textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                borderColor: Color(0xFF0A6EFA),
                borderRadius: 46,
                boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                onPressed: () => context.router.maybePop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> selectTypeCertificate({required BuildContext context, required Enum screen}) async {
  final result = await showModalBottomSheet<TypeSertificatesEntity>(
    useRootNavigator: true,
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    barrierColor: AppColors.bgOverlay,
    backgroundColor: AppColors.background,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        child: TypeSertificatesScreen(title: 'Выбирите свидетельство'),
      );
    },
  );
  if (result != null) {
    if (screen == Screens.learning) {
      BlocProvider.of<RosAviaTestCubit>(context).setTypeCertificate(result);

      BlocProvider.of<CategoriesWithListQuestionsBloc>(context).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: result.id));
    }
    if (screen == Screens.selectTopicsScreen) {
      BlocProvider.of<RosAviaTestCubit>(context).setTypeCertificate(result);
      BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent(typeSsertificatesId: result.id));
    }
  }
}

Future<bool?> showDialogCustom({required BuildContext context}) async {
  final bool? result = await showDialog<bool>(
    context: context,
    // barrierColor: Color(0xFF1F2937),
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: ClearProgress(onTap1: () => Navigator.pop(context, true), onTap2: () => Navigator.pop(context, false)),
          ),
        ),
      );
    },
  );
  return result;

  // if (result != null) {}
}

Future<void> openQuestion({required BuildContext context, required QuestionWithAnswersEntity? question, required int questionId, required String? categoryTitle}) async {
  await showModalBottomSheet<void>(
    useRootNavigator: true,
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    barrierColor: AppColors.bgOverlay,
    backgroundColor: AppColors.background,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
    builder: (bottomSheetContext) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
          height: MediaQuery.of(bottomSheetContext).size.height - 100,
          child: DetailQuestionScreen(questionId: questionId, categoryTitle: categoryTitle, question: question, withClose: true),
        ),
      );
    },
  );
}

Future<void> selectTopics({required BuildContext context, TestMode? testMode}) async {
  final result = await showModalBottomSheet<(int certificateTypeId, bool mixAnswers, bool buttonHint, Set<int> selectedCategoryIds, String title, String image, bool mixQuestions)>(
    useRootNavigator: true,
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    barrierColor: AppColors.bgOverlay,
    backgroundColor: Color(0xFFF1F7FF),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
    builder: (context) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(height: MediaQuery.of(context).size.height - 100, child: SelectTopicsScreen()),
      );
    },
  );

  if (result != null) {
    // Очистить старые ответы и выбранные вопросы перед новым тестом
    await getIt<AppDb>().deleteAnswersByCertificateType(result.$1);
    await getIt<AppDb>().deleteSelectedQuestions(result.$1);

    await getIt<AppDb>().saveSettings(
      certificateTypeId: result.$1,
      mixAnswers: result.$2,
      buttonHint: result.$3,
      selectedCategoryIds: result.$4,
      title: result.$5,
      image: result.$6,
      mixQuestions: result.$7,
    );

    // Установить режим тестирования если он был передан
    if (testMode != null && context.mounted) {
      BlocProvider.of<RosAviaTestCubit>(context).setTestMode(testMode);
    }

    // Переходим на экран тестирования
    if (context.mounted) {
      context.router.push(TestByModeRoute(typeCertificateId: result.$1));
    }
  }
}

/// Новая логика: проверить есть ли активный тест и показать соответствующий диалог
Future<void> startTestingFlowNew({required BuildContext context}) async {
  final rosAviaTestCubit = context.read<RosAviaTestCubit>();
  final certificateTypeId = rosAviaTestCubit.state.typeSertificate.id;
  final db = getIt<AppDb>();

  // Проверяем есть ли активный тест (ответы в БД)
  final hasActive = await db.hasActiveTest(certificateTypeId);

  if (!context.mounted) return;

  if (hasActive) {
    // Есть активный тест - показываем диалог продолжения
    final certificateSettings = await db.getSettingsForCertificate(certificateTypeId: certificateTypeId);
    final unansweredCount = await db.getUnansweredQuestionsCount(certificateTypeId);

    if (!context.mounted) return;

    // Если нет неотвеченных вопросов - значит тест завершен, не показываем модалку
    if (unansweredCount == 0) {
      if (context.mounted) {
        testingModeDialog(context: context);
      }
    } else {
      // Есть неотвеченные вопросы - показываем диалог продолжения
      final testModeName = certificateSettings?.testMode == 'training' ? 'тренировочном режиме' : 'стандартном тесте';

      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (dialogContext) => ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: AlertDialog(
            icon: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                AutoRouter.of(context).maybePop();
              },
              child: Align(alignment: Alignment.topRight, child: SvgPicture.asset(Pictures.closeAuth)),
            ),
            iconPadding: EdgeInsets.all(8),
            backgroundColor: Colors.white,
            title: Text(
              'У вас есть незаконченный тест!',
              style: AppStyles.bold14s.copyWith(color: Color(0xFF223B76)),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'В $testModeName у вас осталось $unansweredCount вопросов. Хотите продолжить?',
              style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767)),
              textAlign: TextAlign.center,
            ),
            actions: [
              CustomButton(
                verticalPadding: 4,
                backgroundColor: Color(0xFF0A6EFA),
                title: 'Продолжить',
                textStyle: AppStyles.bold15s.copyWith(color: Colors.white),
                borderColor: Color(0xFF0A6EFA),
                borderRadius: 46,
                boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                onPressed: () {
                  Navigator.pop(dialogContext);
                  // Продолжить тест
                  context.router.push(TestByModeRoute(typeCertificateId: certificateTypeId));
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                verticalPadding: 4,
                backgroundColor: Colors.white,
                title: 'Начать сначала',
                textStyle: AppStyles.bold15s.copyWith(color: Color(0xFF0A6EFA)),
                borderColor: Color(0xFF0A6EFA),
                borderRadius: 46,
                boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                onPressed: () async {
                  Navigator.pop(dialogContext);
                  // Очистить ответы и начать заново
                  await db.deleteAnswersByCertificateType(certificateTypeId);
                  await db.deleteSelectedQuestions(certificateTypeId);
                  if (context.mounted) {
                    testingModeDialog(context: context);
                  }
                },
              ),
            ],
          ),
        ),
      );
    }
  } else {
    // Нет активного теста - показываем выбор режима
    if (context.mounted) {
      testingModeDialog(context: context);
    }
  }
}

// Модалка выбор режима тестирования
Future<void> testingModeDialog({required BuildContext context}) async {
  final result = await showDialog<TestMode?>(
    context: context,
    // barrierColor: Color(0xFF1F2937),
    builder: (BuildContext context) {
      return BlocProvider.value(value: getIt<RosAviaTestCubit>(), child: TestingModeDialog());
    },
  );

  if (result != null && context.mounted) {
    final rosAviaTestCubit = BlocProvider.of<RosAviaTestCubit>(context);
    rosAviaTestCubit.setTestMode(result);

    // Проверяем что context все еще валиден после await
    if (!context.mounted) return;

    // Сохраняем выбранный режим в БД
    final certificateTypeId = rosAviaTestCubit.state.typeSertificate.id;
    final db = getIt<AppDb>();
    final testModeString = result.name; // 'training' или 'standart'
    await db.saveTestMode(certificateTypeId: certificateTypeId, testMode: testModeString);

    // Нет активной сессии, открыть selectTopics для выбора категорий
    if (context.mounted) {
      selectTopics(context: context, testMode: result);
    }
  }
}
