import 'package:aviapoint/learning/ros_avia_test/data/models/ros_avia_test_category_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';

class RosAviaTestCategoryMapper {
  static RosAviaTestCategoryEntity toEntity(RosAviaTestCategoryDto model) {
    return RosAviaTestCategoryEntity(id: model.id, title: model.title, image: model.image);
  }

  static List<RosAviaTestCategoryEntity> toEntities(List<RosAviaTestCategoryDto> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
