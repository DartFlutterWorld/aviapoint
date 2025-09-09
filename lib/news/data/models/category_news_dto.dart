import 'package:json_annotation/json_annotation.dart';

part 'category_news_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class CategoryNewsDto {
  final int id;
  final String title;

  CategoryNewsDto({
    required this.id,
    required this.title,
  });

  factory CategoryNewsDto.fromJson(Map<String, dynamic> json) => _$CategoryNewsDtoFromJson(json);
}
