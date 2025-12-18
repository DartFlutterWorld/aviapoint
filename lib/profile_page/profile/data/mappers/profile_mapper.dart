import 'package:aviapoint/profile_page/profile/data/models/profile_dto.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';

class ProfileMapper {
  static ProfileEntity toEntity(ProfileDto model) {
    return ProfileEntity(id: model.id, phone: model.phone, firstName: model.firstName, lastName: model.lastName, email: model.email, avatarUrl: model.avatarUrl);
  }

  static List<ProfileEntity> toEntities(List<ProfileDto> models) {
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
