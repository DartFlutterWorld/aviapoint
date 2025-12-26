import 'package:aviapoint/learning/hand_book/main_categories_page/data/models/hand_book_main_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/domain/entities/hand_book_categories_entity.dart';

class HandBookMainCategoriesMapper {
  static HandBookMainCategoriesEntity toEntity(HandBookMainCategoriesDto model) {
    return HandBookMainCategoriesEntity(
      mainCategoryId: model.mainCategoryId,
      title: model.title,
      subTitle: model.subTitle,
      picture: model.picture,
    );
  }

  static List<HandBookMainCategoriesEntity> toEntities(List<HandBookMainCategoriesDto> models) {
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
