import 'package:aviapoint/learning/ros_avia_test/data/models/privat_pilot_plane_category_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/privat_pilot_plane_category_entity.dart';

class PrivatPilotPlaneCategoryMapper {
  static PrivatPilotPlaneCategoryEntity toEntity(
    PrivatPilotPlaneCategoryDto model,
  ) {
    return PrivatPilotPlaneCategoryEntity(
      id: model.id,
      title: model.title,
      image: model.image,
      typeCertificatesId: model.typeCertificatesId,
    );
  }

  static List<PrivatPilotPlaneCategoryEntity> toEntities(
    List<PrivatPilotPlaneCategoryDto> models,
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
