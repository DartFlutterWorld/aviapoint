import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class NewsDto {
  final int id;
  final String title;
  final String subTitle;
  final String source;
  final String date;
  final String body;
  final String pictureMini;
  final String pictureBig;
  final bool isBigNews;
  final int categoryId;

  NewsDto({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.source,
    required this.date,
    required this.body,
    required this.pictureMini,
    required this.pictureBig,
    required this.isBigNews,
    required this.categoryId,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);
}
