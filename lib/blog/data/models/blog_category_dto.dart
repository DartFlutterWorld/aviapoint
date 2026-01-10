import 'package:json_annotation/json_annotation.dart';

part 'blog_category_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class BlogCategoryDto {
  final int id;
  final String name;
  final String? iconUrl;
  final String? color;
  @JsonKey(name: 'order_index')
  final int? orderIndex;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  BlogCategoryDto({
    required this.id,
    required this.name,
    this.iconUrl,
    this.color,
    this.orderIndex,
    this.createdAt,
    this.updatedAt,
  });

  factory BlogCategoryDto.fromJson(Map<String, dynamic> json) => _$BlogCategoryDtoFromJson(json);
}
