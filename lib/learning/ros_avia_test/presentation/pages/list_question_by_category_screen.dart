import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/detail_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/themes/app_styles.dart';

@RoutePage()
class ListQuestionByCategoryScreen extends StatefulWidget {
  final int categoryId;
  final List<QuestionWithAnswersEntity>? questionWithAnswersList;
  final String? categoryTitle;

  const ListQuestionByCategoryScreen({super.key, @PathParam('categoryId') required this.categoryId, this.questionWithAnswersList, @QueryParam('categoryTitle') this.categoryTitle});

  @override
  State<ListQuestionByCategoryScreen> createState() => _ListQuestionByCategoryScreenState();
}

class _ListQuestionByCategoryScreenState extends State<ListQuestionByCategoryScreen> {
  final ValueNotifier<int> indexQuestion = ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'РосАвиаТест. Обучение', withBack: true),
      backgroundColor: AppColors.background,
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: 20),
        child: Column(
          // shrinkWrap: true,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: indexQuestion,
                builder: (_, indexQuestionValue, __) {
                  return DetailQuestionScreen(
                    questionId: widget.questionWithAnswersList?[indexQuestionValue].questionId ?? 0,
                    categoryTitle: widget.categoryTitle,
                    question: widget.questionWithAnswersList?[indexQuestionValue] ?? emptyQuestion,
                  );
                },
              ),
            ),
            // SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: indexQuestion,
              builder: (_, indexQuestionValue, __) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    spacing: 22,
                    children: [
                      Flexible(
                        child: CustomButton(
                          title: 'Предыдущий',
                          verticalPadding: 8,
                          onPressed: () {
                            if (indexQuestionValue != 0) {
                              indexQuestion.value--;
                            }
                          },
                          boxShadow: [BoxShadow(color: Color(0xff106BD2).withOpacity(0.11), blurRadius: 9, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                          textStyle: AppStyles.bold16s.copyWith(color: const Color(0xFF0A6EFA)),
                          borderColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          borderRadius: 46,
                          leftSvg: Pictures.leftArrowMini,
                          disabled: indexQuestionValue == 0,
                        ),
                      ),
                      Flexible(
                        child: CustomButton(
                          title: 'Следующий',
                          verticalPadding: 8,
                          onPressed: () {
                            if (indexQuestionValue + 1 < widget.questionWithAnswersList!.length) {
                              indexQuestion.value++;
                            } else {
                              context.router.maybePop();
                            }
                          },
                          boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.27), blurRadius: 9, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                          textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                          borderColor: Colors.transparent,
                          backgroundColor: Color(0xFF0A6EFA),
                          borderRadius: 46,
                          rightSvg: Pictures.rightArrowMini,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
