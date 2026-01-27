import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/answer_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/chips_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

@RoutePage()
class DetailQuestionScreen extends StatefulWidget {
  final QuestionWithAnswersEntity? question;
  final int questionId;
  final String? categoryTitle;
  final bool withClose;

  const DetailQuestionScreen({
    super.key,
    @QueryParam('question') this.question,
    @QueryParam('withClose') this.withClose = false,
    @QueryParam('categoryTitle') this.categoryTitle,

    @PathParam('questionId') required this.questionId,
  });

  @override
  State<DetailQuestionScreen> createState() => _DetailQuestionScreenState();
}

class _DetailQuestionScreenState extends State<DetailQuestionScreen> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<CategoriesWithListQuestionsBloc>(context).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: 1));
    // BlocProvider.of<EmergencyCheckListBloc>(context).add(GetEmergencyCheckListEvent());
  }

  (String, Color) getIcon({required bool isCorrect, required bool isOfficial}) {
    if (isCorrect == false && isOfficial == false) {
      return (Pictures.unright, Color(0xFFF1F7FF));
    }
    if (isCorrect == false && isOfficial == true) {
      return (Pictures.isOfficial, Color(0xFF0A6EFA).withAlpha((0.26 * 255).toInt()));
    }
    if (isCorrect == true && isOfficial == false) {
      return (Pictures.isCorrect, Color(0xFFC4F4E1));
    }
    if (isCorrect == true && isOfficial == true) {
      return (Pictures.isCorrect, Color(0xFFC4F4E1));
    }
    return (Pictures.unright, Color(0xFFF1F7FF));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SizedBox(height: 16.h),
          if (widget.withClose)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => context.router.maybePop(null),
                child: SizedBox(width: 30, height: 30, child: Center(child: SvgPicture.asset(Pictures.closeAuth))),
              ),
            ),
          // Убрали Expanded, так как виджет используется внутри SingleChildScrollView
          // Используем Column с shrinkWrap для правильной работы внутри скролла
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 12.w,
                children: [
                  ChipsWidget(questionWithAnswers: widget.question ?? emptyQuestion),
                  Flexible(
                    child: Text(bigFirstSymbol(widget.categoryTitle ?? ''), style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(widget.question?.questionText ?? '', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
              SizedBox(height: 12.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.question?.answers.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Column(
                    children: [
                      AnswerWidget(
                        backgroundColor: getIcon(isCorrect: widget.question?.answers[index].isCorrect ?? false, isOfficial: widget.question?.answers[index].isOfficial ?? false).$2,
                        title: widget.question?.answers[index].answerText ?? '',
                        icon: getIcon(isCorrect: widget.question?.answers[index].isCorrect ?? false, isOfficial: widget.question?.answers[index].isOfficial ?? false).$1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                spacing: 6,
                children: [
                  SvgPicture.asset(Pictures.isCorrect),
                  Flexible(
                    child: Text('Правильный и обоснованный вариант ответа', style: AppStyles.light12s.copyWith(color: Color(0xFF6E7A89))),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                spacing: 6,
                children: [
                  SvgPicture.asset(Pictures.isOfficial),
                  Flexible(
                    child: Text('Вариант ответа, считающийся правильным в официальном тесте', style: AppStyles.light12s.copyWith(color: Color(0xFF6E7A89))),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              if (widget.question?.explanation != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xFFF1F7FF)),
                  child: HtmlWidget(widget.question!.explanation!, textStyle: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
