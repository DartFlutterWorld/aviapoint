import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/data/models/preflight_inspection_check_list_dto.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';

class PreflightInspectionCheckListMapper {
  static PreflightInspectionCheckListEntity toEntity(PreflightInspectionCheckListDto model) {
    return PreflightInspectionCheckListEntity(
      id: model.id,
      preflightInspectionCategoryId: model.preflightInspectionCategoryId,
      title: model.title,
      doing: model.doing,
      picture: model.picture,
      titleEng: model.titleEng,
      doingEng: model.doingEng,
    );
  }

  static List<PreflightInspectionCheckListEntity> toEntities(List<PreflightInspectionCheckListDto> models) {
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
