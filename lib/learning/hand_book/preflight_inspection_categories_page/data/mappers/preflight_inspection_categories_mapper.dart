import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/data/models/preflight_inspection_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';

class PreflightInspectionCategoriesMapper {
  static PreflightInspectionCategoriesEntity toEntity(
    PreflightInspectionCategoriesDto model,
  ) {
    return PreflightInspectionCategoriesEntity(
      id: model.id,
      title: model.title,
      subTitle: model.subTitle,
      mainCategoryId: model.mainCategoryId,
      titleEng: model.titleEng,
      picture: model.picture,
    );
  }

  static List<PreflightInspectionCategoriesEntity> toEntities(
    List<PreflightInspectionCategoriesDto> models,
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
