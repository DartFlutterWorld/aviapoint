// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ros_avia_test_category_with_questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RosAviaTestCategoryWithQuestionsDto _$RosAviaTestCategoryWithQuestionsDtoFromJson(Map<String, dynamic> json) =>
    _RosAviaTestCategoryWithQuestionsDto(
      categoryId: (json['category_id'] as num).toInt(),
      categoryTitle: json['category_title'] as String,
      categoryImage: json['category_image'] as String?,
      categoryPosition: (json['category_position'] as num).toInt(),
      questionsCount: (json['questions_count'] as num).toInt(),
      questionsWithAnswers: (json['questions_with_answers'] as List<dynamic>)
          .map((e) => QuestionWithAnswersDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RosAviaTestCategoryWithQuestionsDtoToJson(_RosAviaTestCategoryWithQuestionsDto instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_title': instance.categoryTitle,
      'category_image': instance.categoryImage,
      'category_position': instance.categoryPosition,
      'questions_count': instance.questionsCount,
      'questions_with_answers': instance.questionsWithAnswers,
    };

_QuestionWithAnswersDto _$QuestionWithAnswersDtoFromJson(Map<String, dynamic> json) => _QuestionWithAnswersDto(
  questionId: (json['question_id'] as num).toInt(),
  questionText: json['question_text'] as String,
  explanation: json['explanation'] as String?,
  correctAnswer: (json['correct_answer'] as num?)?.toInt(),
  answers: (json['answers'] as List<dynamic>).map((e) => AnswerDto.fromJson(e as Map<String, dynamic>)).toList(),
  categoryTitle: json['category_title'] as String,
  categoryId: (json['category_id'] as num).toInt(),
);

Map<String, dynamic> _$QuestionWithAnswersDtoToJson(_QuestionWithAnswersDto instance) => <String, dynamic>{
  'question_id': instance.questionId,
  'question_text': instance.questionText,
  'explanation': instance.explanation,
  'correct_answer': instance.correctAnswer,
  'answers': instance.answers,
  'category_title': instance.categoryTitle,
  'category_id': instance.categoryId,
};

_AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) => _AnswerDto(
  answerId: (json['answer_id'] as num).toInt(),
  answerText: json['answer_text'] as String,
  isCorrect: json['is_correct'] as bool,
  isOfficial: json['is_official'] as bool,
  position: (json['position'] as num).toInt(),
);

Map<String, dynamic> _$AnswerDtoToJson(_AnswerDto instance) => <String, dynamic>{
  'answer_id': instance.answerId,
  'answer_text': instance.answerText,
  'is_correct': instance.isCorrect,
  'is_official': instance.isOfficial,
  'position': instance.position,
};
