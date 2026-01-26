import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class NewsDto {
  final int id;
  final String title;
  final String subTitle;
  final String source;
  final String date;
  final String body;
  final String? content; // Quill Delta JSON
  final String pictureMini;
  final String pictureBig;
  final bool isBigNews;
  final int categoryId;
  @JsonKey(name: 'author_id')
  final int? authorId;
  final bool published;
  @JsonKey(name: 'additional_images')
  final List<String>? additionalImages; // Дополнительные изображения

  NewsDto({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.source,
    required this.date,
    required this.body,
    this.content,
    required this.pictureMini,
    required this.pictureBig,
    required this.isBigNews,
    required this.categoryId,
    this.authorId,
    required this.published,
    this.additionalImages,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);
}
