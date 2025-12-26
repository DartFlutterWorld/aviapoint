import 'package:aviapoint/learning/ros_avia_test/data/models/type_sertificates_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';

class TypeSertificatesMapper {
  static TypeSertificatesEntity toEntity(TypeSertificatesDto model) {
    return TypeSertificatesEntity(id: model.id, title: model.title, image: model.image);
  }

  static List<TypeSertificatesEntity> toEntities(List<TypeSertificatesDto> models) {
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
