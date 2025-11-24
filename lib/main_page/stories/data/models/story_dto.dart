import 'package:json_annotation/json_annotation.dart';

part 'story_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class StoryDto {
  final int id;
  final String? image;
  final String? video;
  final String textButton;
  final String hyperlink;
  final int timeShow;
  final int position;
  final String colorButton;
  final String logoStory;
  final String textColor;
  final String title;

  StoryDto({
    required this.id,
    required this.image,
    this.video,
    required this.textButton,
    required this.hyperlink,
    required this.timeShow,
    required this.position,
    required this.colorButton,
    required this.logoStory,
    required this.textColor,
    required this.title,
  });

  factory StoryDto.fromJson(Map<String, dynamic> json) => _$StoryDtoFromJson(json);
}
