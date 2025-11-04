// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ros_avia_test_category_with_questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RosAviaTestCategoryWithQuestionsDtoImpl
_$$RosAviaTestCategoryWithQuestionsDtoImplFromJson(Map<String, dynamic> json) =>
    _$RosAviaTestCategoryWithQuestionsDtoImpl(
      categoryId: (json['category_id'] as num).toInt(),
      categoryTitle: json['category_title'] as String,
      categoryImage: json['category_image'] as String?,
      categoryPosition: (json['category_position'] as num).toInt(),
      questionsCount: (json['questions_count'] as num).toInt(),
      questionsWithAnswers: (json['questions_with_answers'] as List<dynamic>)
          .map(
            (e) => QuestionWithAnswersDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$$RosAviaTestCategoryWithQuestionsDtoImplToJson(
  _$RosAviaTestCategoryWithQuestionsDtoImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_title': instance.categoryTitle,
  'category_image': instance.categoryImage,
  'category_position': instance.categoryPosition,
  'questions_count': instance.questionsCount,
  'questions_with_answers': instance.questionsWithAnswers,
};

_$QuestionWithAnswersDtoImpl _$$QuestionWithAnswersDtoImplFromJson(
  Map<String, dynamic> json,
) => _$QuestionWithAnswersDtoImpl(
  questionId: (json['question_id'] as num).toInt(),
  questionText: json['question_text'] as String,
  explanation: json['explanation'] as String?,
  correctAnswer: (json['correct_answer'] as num?)?.toInt(),
  answers: (json['answers'] as List<dynamic>)
      .map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  categoryTitle: json['category_title'] as String?,
  categoryId: (json['category_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$$QuestionWithAnswersDtoImplToJson(
  _$QuestionWithAnswersDtoImpl instance,
) => <String, dynamic>{
  'question_id': instance.questionId,
  'question_text': instance.questionText,
  'explanation': instance.explanation,
  'correct_answer': instance.correctAnswer,
  'answers': instance.answers,
  'category_title': instance.categoryTitle,
  'category_id': instance.categoryId,
};

_$AnswerDtoImpl _$$AnswerDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnswerDtoImpl(
      answerId: (json['answer_id'] as num).toInt(),
      answerText: json['answer_text'] as String,
      isCorrect: json['is_correct'] as bool,
      isOfficial: json['is_official'] as bool,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$$AnswerDtoImplToJson(_$AnswerDtoImpl instance) =>
    <String, dynamic>{
      'answer_id': instance.answerId,
      'answer_text': instance.answerText,
      'is_correct': instance.isCorrect,
      'is_official': instance.isOfficial,
      'position': instance.position,
    };
