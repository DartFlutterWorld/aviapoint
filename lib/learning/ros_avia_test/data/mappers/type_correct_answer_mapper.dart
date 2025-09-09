import 'package:aviapoint/learning/ros_avia_test/data/models/type_correct_answer_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_correct_answer_entity.dart';

class TypeCorrectAnswerMapper {
  static TypeCorrectAnswerEntity toEntity(
    TypeCorrectAnswerDto model,
  ) {
    return TypeCorrectAnswerEntity(
      id: model.id,
      title: model.title,
    );
  }

  static List<TypeCorrectAnswerEntity> toEntities(
    List<TypeCorrectAnswerDto> models,
  ) {
    return models.map((model) => toEntity(model)).toList();
  }

  // static NewsCategoryModel toModel(
  //   NewsCategoryEntity entity,
  // ) {
  //   return NewsCategoryModel(
  //     id: entity.id,
  //     name: entity.name,
  //   );
  // }

  // static List<NewsCategoryModel> toModels(
  //   List<NewsCategoryEntity> entities,
  // ) {
  //   return entities.map((entity) => toModel(entity)).toList();
  // }
}
