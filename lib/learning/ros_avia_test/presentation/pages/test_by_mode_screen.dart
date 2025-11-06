import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/utils/talker_config.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/questions_by_type_certificate_and_categories_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/test_by_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TestByModeScreen extends StatefulWidget {
  final int typeCertificateId;

  const TestByModeScreen({super.key, @PathParam('typeCertificateId') required this.typeCertificateId});

  @override
  State<TestByModeScreen> createState() => _TestByModeScreenState();
}

class _TestByModeScreenState extends State<TestByModeScreen> {
  late QuestionsByTypeCertificateAndCategoriesBloc questionsByTypeCertificateAndCategoriesBloc;

  final ValueNotifier<int> indexQuestion = ValueNotifier<int>(0);
  final ValueNotifier<int?> currentSelectedAnswerIndex = ValueNotifier<int?>(null); // Отслеживаем выбранный ответ для текущего вопроса

  @override
  void initState() {
    questionsByTypeCertificateAndCategoriesBloc = QuestionsByTypeCertificateAndCategoriesBloc(rosAviaTestRepository: getIt<RosAviaTestRepository>());
    super.initState();
  }

  /// Сохранить выбранные вопросы в БД
  void _saveSelectedQuestions(List<dynamic> questions) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final questionIds = questions.map((q) => q.questionId as int).toList();
      await getIt<AppDb>().saveSelectedQuestions(certificateTypeId: widget.typeCertificateId, questionIds: questionIds);
    });
  }

  /// Получить только неотвеченные вопросы
  Future<List<dynamic>> _getUnansweredQuestions(List<dynamic> allQuestions) async {
    final db = getIt<AppDb>();
    final answeredQuestions = await db.getAnswersByCertificateType(widget.typeCertificateId);
    final answeredIds = answeredQuestions.map((a) => a.questionId).toSet();

    final unanswered = allQuestions.where((q) => !answeredIds.contains(q.questionId as int)).toList();

    return unanswered;
  }

  String getNameOfTestMode(TestMode testMode) {
    return testMode.name == TestMode.training.name ? 'Тренировочный режим' : 'Стандартный тест';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: questionsByTypeCertificateAndCategoriesBloc..add(GetQuestionsByTypeCertificateAndCategories(typeSsertificatesId: widget.typeCertificateId)),
      child: Scaffold(
        appBar: CustomAppBar(title: getNameOfTestMode(context.read<RosAviaTestCubit>().state.testMode), withBack: true),
        backgroundColor: AppColors.background,
        body: BlocBuilder<QuestionsByTypeCertificateAndCategoriesBloc, QuestionsByTypeCertificateAndCategoriesState>(
          builder: (context, state) => state.map(
            loading: (value) => Center(child: LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 20)),
            error: (value) => ErrorCustom(
              textError: value.errorForUser,
              repeat: () {
                questionsByTypeCertificateAndCategoriesBloc.add(GetQuestionsByTypeCertificateAndCategories(typeSsertificatesId: widget.typeCertificateId));
              },
            ),
            success: (value) {
              _saveSelectedQuestions(value.questionsWithAnswers);
              return FutureBuilder<List<dynamic>>(
                future: _getUnansweredQuestions(value.questionsWithAnswers),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 20));
                  }

                  if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 20));
                  }

                  final filteredQuestions = snapshot.data!;

                  // Сбросить индекс при загрузке новых вопросов
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (indexQuestion.value >= filteredQuestions.length) {
                      indexQuestion.value = 0;
                    }
                  });

                  return Column(
                    children: [
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: indexQuestion,
                          builder: (_, indexQuestionValue, __) {
                            if (indexQuestionValue >= filteredQuestions.length) {
                              return const Center(child: Text('No more questions'));
                            }

                            return TestByModeWidget(
                              questionId: filteredQuestions[indexQuestionValue].questionId,
                              categoryTitle: filteredQuestions[indexQuestionValue].categoryTitle ?? '',
                              question: filteredQuestions[indexQuestionValue],
                              testMode: BlocProvider.of<RosAviaTestCubit>(context).state.testMode,
                              buttonHint: value.buttonHint,
                              onStateChanged: (selectedAnswerIndex, showResults) {
                                // Только сохраняем выбранный ответ в памяти (не в БД)
                                currentSelectedAnswerIndex.value = selectedAnswerIndex;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Center(
                          child: SizedBox(
                            width: 200,
                            child: ValueListenableBuilder<int?>(
                              valueListenable: currentSelectedAnswerIndex,
                              builder: (context, selectedIndex, _) {
                                return CustomButton(
                                  title: 'Следующий',
                                  verticalPadding: 8.h,
                                  onPressed: selectedIndex != null
                                      ? () async {
                                          // Сохраняем ответ в БД перед переходом к следующему вопросу
                                          if (currentSelectedAnswerIndex.value != null) {
                                            final question = filteredQuestions[indexQuestion.value];
                                            await getIt<AppDb>().saveTestAnswer(
                                              certificateTypeId: widget.typeCertificateId,
                                              questionId: question.questionId,
                                              selectedAnswerId: currentSelectedAnswerIndex.value!,
                                              categoryId: question.categoryId,
                                              isCorrect: question.answers[currentSelectedAnswerIndex.value!].isCorrect,
                                            );
                                          }

                                          // Переходим к следующему вопросу
                                          if (indexQuestion.value + 1 < filteredQuestions.length) {
                                            currentSelectedAnswerIndex.value = null; // Сбрасываем выбор для нового вопроса
                                            indexQuestion.value++;
                                          } else {
                                            // Все вопросы ответчены - переходим на результаты БЕЗ очистки
                                            // Очистка будет при нажатии "Завершить" на экране результатов
                                            if (mounted) {
                                              context.router.push(TestResultsRoute(certificateTypeId: widget.typeCertificateId));
                                            }
                                          }
                                        }
                                      : null, // Кнопка неактивна если ответ не выбран
                                  boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.27), blurRadius: 9, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                                  borderColor: Colors.transparent,
                                  backgroundColor: selectedIndex != null ? Color(0xFF0A6EFA) : Colors.grey,
                                  borderRadius: 46,
                                  rightSvg: Pictures.rightArrowMini,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
