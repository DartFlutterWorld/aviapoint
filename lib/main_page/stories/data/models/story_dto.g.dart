// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryDto _$StoryDtoFromJson(Map<String, dynamic> json) => StoryDto(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String?,
  video: json['video'] as String?,
  textButton: json['text_button'] as String,
  hyperlink: json['hyperlink'] as String,
  timeShow: (json['time_show'] as num).toInt(),
  position: (json['position'] as num).toInt(),
  colorButton: json['color_button'] as String,
  logoStory: json['logo_story'] as String,
  textColor: json['text_color'] as String,
);
