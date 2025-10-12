import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({
    super.key,
    required this.questionWithAnswers,
  });

  final QuestionWithAnswersEntity questionWithAnswers;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: getColors(questionWithAnswers.correctAnswer ?? 0).$1,
      ),
      child: Center(
        child: Text(
          questionWithAnswers.questionId.toString(),
          style: AppStyles.regular13s.copyWith(
            color: getColors(questionWithAnswers.correctAnswer ?? 0).$2,
          ),
        ),
      ),
    );
  }
}
