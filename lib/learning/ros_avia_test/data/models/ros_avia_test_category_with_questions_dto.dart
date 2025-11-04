import 'package:freezed_annotation/freezed_annotation.dart';

part 'ros_avia_test_category_with_questions_dto.freezed.dart';
part 'ros_avia_test_category_with_questions_dto.g.dart';

@freezed
abstract class RosAviaTestCategoryWithQuestionsDto with _$RosAviaTestCategoryWithQuestionsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RosAviaTestCategoryWithQuestionsDto({
    required int categoryId,
    required String categoryTitle,
    String? categoryImage,
    required int categoryPosition,
    required int questionsCount,
    required List<QuestionWithAnswersDto> questionsWithAnswers,
  }) = _RosAviaTestCategoryWithQuestionsDto;

  factory RosAviaTestCategoryWithQuestionsDto.fromJson(Map<String, dynamic> json) => _$RosAviaTestCategoryWithQuestionsDtoFromJson(json);
}

@freezed
abstract class QuestionWithAnswersDto with _$QuestionWithAnswersDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QuestionWithAnswersDto({
    required int questionId,
    required String questionText,
    String? explanation,
    int? correctAnswer,
    required List<AnswerDto> answers,
    required String categoryTitle,
    required int categoryId,
  }) = _QuestionWithAnswersDto;

  factory QuestionWithAnswersDto.fromJson(Map<String, dynamic> json) => _$QuestionWithAnswersDtoFromJson(json);
}

@freezed
abstract class AnswerDto with _$AnswerDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AnswerDto({required int answerId, required String answerText, required bool isCorrect, required bool isOfficial, required int position}) = _AnswerDto;

  factory AnswerDto.fromJson(Map<String, dynamic> json) => _$AnswerDtoFromJson(json);
}
