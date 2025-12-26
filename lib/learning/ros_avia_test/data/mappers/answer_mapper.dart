import 'package:aviapoint/learning/ros_avia_test/data/models/ros_avia_test_category_with_questions_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/answer_entity.dart';

class AnswerMapper {
  static AnswerEntity toEntity(AnswerDto model) {
    return AnswerEntity(
      answerId: model.answerId,
      answerText: model.answerText,
      isCorrect: model.isCorrect,
      isOfficial: model.isOfficial,
      position: model.position,
    );
  }

  static List<AnswerEntity> toEntities(List<AnswerDto> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
