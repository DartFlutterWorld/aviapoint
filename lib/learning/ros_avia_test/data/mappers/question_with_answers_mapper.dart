import 'package:aviapoint/learning/ros_avia_test/data/mappers/answer_mapper.dart';
import 'package:aviapoint/learning/ros_avia_test/data/models/ros_avia_test_category_with_questions_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';

class QuestionWithAnswersMapper {
  static QuestionWithAnswersEntity toEntity(
    QuestionWithAnswersDto model,
  ) {
    return QuestionWithAnswersEntity(
      questionId: model.questionId,
      questionText: model.questionText,
      answers: AnswerMapper.toEntities(model.answers),
      explanation: model.explanation,
      correctAnswer: model.correctAnswer,
    );
  }

  static List<QuestionWithAnswersEntity> toEntities(
    List<QuestionWithAnswersDto> models,
  ) {
    return models.map((model) => toEntity(model)).toList();
  }
}
