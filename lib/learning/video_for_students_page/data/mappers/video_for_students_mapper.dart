import 'package:aviapoint/learning/video_for_students_page/data/models/video_for_students_dto.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/entities/video_for_students_entity.dart';

class VideoForStudentsMapper {
  static VideoForStudentsEntity toEntity(VideoForStudentsDto model) {
    return VideoForStudentsEntity(id: model.id, title: model.title, fileName: model.fileName, url: model.url);
  }

  static List<VideoForStudentsEntity> toEntities(List<VideoForStudentsDto> models) {
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
