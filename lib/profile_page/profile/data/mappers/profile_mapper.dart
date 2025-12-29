import 'dart:convert';
import 'package:aviapoint/profile_page/profile/data/models/profile_dto.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';

class ProfileMapper {
  static ProfileEntity toEntity(ProfileDto model) {
    // Парсим owned_airports из JSONB
    List<int>? ownedAirports;
    if (model.ownedAirports != null) {
      if (model.ownedAirports is List) {
        ownedAirports = (model.ownedAirports as List).map((e) => e as int).toList();
      } else if (model.ownedAirports is String) {
        try {
          final decoded = jsonDecode(model.ownedAirports as String) as List;
          ownedAirports = decoded.map((e) => e as int).toList();
        } catch (e) {
          // Игнорируем ошибки парсинга
          ownedAirports = null;
        }
      }
    }

    return ProfileEntity(
      id: model.id,
      phone: model.phone,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      avatarUrl: model.avatarUrl,
      telegram: model.telegram,
      max: model.max,
      averageRating: model.averageRating,
      reviewsCount: model.reviewsCount,
      ownedAirports: ownedAirports,
    );
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
