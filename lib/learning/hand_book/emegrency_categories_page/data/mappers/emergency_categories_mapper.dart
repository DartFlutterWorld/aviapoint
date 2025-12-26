import 'package:aviapoint/learning/hand_book/emegrency_categories_page/data/models/emergency_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/domain/entities/emergency_categories_entity.dart';

class EmergencyCategoriesMapper {
  static EmergencyCategoriesEntity toEntity(EmergencyCategoriesDto model) {
    return EmergencyCategoriesEntity(
      id: model.id,
      title: model.title,
      subTitle: model.subTitle,
      subTitleEng: model.subTitleEng,
      mainCategoryId: model.mainCategoryId,
      titleEng: model.titleEng,
      picture: model.picture,
    );
  }

  static List<EmergencyCategoriesEntity> toEntities(List<EmergencyCategoriesDto> models) {
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
