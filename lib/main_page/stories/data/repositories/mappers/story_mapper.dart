import 'package:aviapoint/main_page/stories/data/models/story_dto.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';

class StoryMapper {
  static StoryEntity toEntity(StoryDto model) {
    return StoryEntity(
      image: model.image,
      video: model.video,
      position: model.position,
      id: model.id,
      textButton: model.textButton,
      hyperlink: model.hyperlink,
      timeShow: model.timeShow,
      colorButton: model.colorButton,
      logoStory: model.logoStory,
      textColor: model.textColor,
      title: model.title,
    );
  }

  static List<StoryEntity> toEntities(List<StoryDto> models) => models.map((model) => toEntity(model)).toList();
}
