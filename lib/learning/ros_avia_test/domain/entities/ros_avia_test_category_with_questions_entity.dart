import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:equatable/equatable.dart';

class RosAviaTestCategoryWithQuestionsEntity extends Equatable {
  final int categoryId;
  final String categoryTitle;
  final String? categoryImage;
  final int categoryPosition;
  final int questionsCount;
  final List<QuestionWithAnswersEntity> questionsWithAnswers;

  const RosAviaTestCategoryWithQuestionsEntity({
    required this.categoryId,
    required this.categoryTitle,
    this.categoryImage,
    required this.categoryPosition,
    required this.questionsCount,
    required this.questionsWithAnswers,
  });
  @override
  List<Object?> get props => [
    categoryId,
    categoryTitle,
    categoryImage,
    categoryPosition,
    questionsCount,
    questionsCount,
  ];
}

extension QuestionCountExtension on RosAviaTestCategoryWithQuestionsEntity {
  int get questionCount => questionsWithAnswers.length;
}
