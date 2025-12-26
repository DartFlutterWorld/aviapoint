import 'package:aviapoint/learning/hand_book/normal_check_list/data/models/normal_check_list_dto.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';

class NormalCheckListMapper {
  static NormalCheckListEntity toEntity(NormalCheckListDto model) {
    return NormalCheckListEntity(
      id: model.id,
      normalCategoryId: model.normalCategoryId,
      title: model.title,
      doing: model.doing,
      picture: model.picture,
      titleEng: model.titleEng,
      doingEng: model.doingEng,
      checkList: model.checkList,
      subCategory: model.subCategory,
      subCategoryEng: model.subCategoryEng,
    );
  }

  static List<NormalCheckListEntity> toEntities(List<NormalCheckListDto> models) {
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
