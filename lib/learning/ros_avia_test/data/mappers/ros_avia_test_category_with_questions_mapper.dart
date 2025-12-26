import 'package:aviapoint/learning/ros_avia_test/data/mappers/question_with_answers_mapper.dart';
import 'package:aviapoint/learning/ros_avia_test/data/models/ros_avia_test_category_with_questions_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';

class RosAviaTestCategoryWithQuestionsMapper {
  static RosAviaTestCategoryWithQuestionsEntity toEntity(RosAviaTestCategoryWithQuestionsDto model) {
    return RosAviaTestCategoryWithQuestionsEntity(
      categoryId: model.categoryId,
      categoryTitle: model.categoryTitle,
      categoryPosition: model.categoryPosition,
      questionsCount: model.questionsCount,
      questionsWithAnswers: QuestionWithAnswersMapper.toEntities(model.questionsWithAnswers),
    );
  }

  static List<RosAviaTestCategoryWithQuestionsEntity> toEntities(List<RosAviaTestCategoryWithQuestionsDto> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
