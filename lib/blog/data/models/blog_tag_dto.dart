import 'package:json_annotation/json_annotation.dart';

part 'blog_tag_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class BlogTagDto {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  BlogTagDto({required this.id, required this.name, required this.slug, this.createdAt});

  factory BlogTagDto.fromJson(Map<String, dynamic> json) => _$BlogTagDtoFromJson(json);
}
