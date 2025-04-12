import 'package:aviapoint/learning/hand_book/normal_categories_page/data/models/normal_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/domain/entities/normal_categories_entity.dart';

class NormalCategoriesMapper {
  static NormalCategoriesEntity toEntity(
    NormalCategoriesDto model,
  ) {
    return NormalCategoriesEntity(
      id: model.id,
      title: model.title,
      subTitle: model.subTitle,
      mainCategoryId: model.mainCategoryId,
      titleEng: model.titleEng,
      picture: model.picture,
    );
  }

  static List<NormalCategoriesEntity> toEntities(
    List<NormalCategoriesDto> models,
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
