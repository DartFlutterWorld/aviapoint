import 'package:json_annotation/json_annotation.dart';

part 'create_blog_article_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class CreateBlogArticleDto {
  final int? categoryId;
  @JsonKey(name: 'aircraft_model_id')
  final int? aircraftModelId;
  final String title;
  final String? excerpt;
  final String content;
  final String? coverImageUrl;
  final String? status;
  final List<int>? tagIds;

  CreateBlogArticleDto({
    this.categoryId,
    this.aircraftModelId,
    required this.title,
    this.excerpt,
    required this.content,
    this.coverImageUrl,
    this.status,
    this.tagIds,
  });

  factory CreateBlogArticleDto.fromJson(Map<String, dynamic> json) => _$CreateBlogArticleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBlogArticleDtoToJson(this);
}
