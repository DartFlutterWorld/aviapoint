import 'package:json_annotation/json_annotation.dart';
import 'package:aviapoint/blog/data/models/blog_category_dto.dart';
import 'package:aviapoint/blog/data/models/blog_tag_dto.dart';
import 'package:aviapoint/profile_page/profile/data/models/profile_dto.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

part 'blog_article_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class BlogArticleDto {
  final int id;
  @JsonKey(name: 'author_id')
  final int authorId;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'aircraft_model_id')
  final int? aircraftModelId;
  final String title;
  final String? excerpt;
  final String content;
  @JsonKey(name: 'cover_image_url')
  final String? coverImageUrl;
  final String status;
  @JsonKey(name: 'view_count')
  final int viewCount;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  // Вложенные объекты
  @JsonKey(fromJson: _profileDtoFromJsonNullable)
  final ProfileDto? author;
  final BlogCategoryDto? category;
  @JsonKey(name: 'aircraft_model', fromJson: _aircraftModelDtoFromJsonNullable)
  final AircraftModelDto? aircraftModel;
  final List<BlogTagDto>? tags;

  BlogArticleDto({
    required this.id,
    required this.authorId,
    this.categoryId,
    this.aircraftModelId,
    required this.title,
    this.excerpt,
    required this.content,
    this.coverImageUrl,
    required this.status,
    required this.viewCount,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.author,
    this.category,
    this.aircraftModel,
    this.tags,
  });

  factory BlogArticleDto.fromJson(Map<String, dynamic> json) => _$BlogArticleDtoFromJson(json);
}

/// Безопасно парсит ProfileDto, возвращает null при ошибке
ProfileDto? _profileDtoFromJsonNullable(dynamic json) {
  if (json == null) return null;
  try {
    if (json is Map<String, dynamic>) {
      return ProfileDto.fromJson(json);
    }
    return null;
  } catch (e) {
    // Игнорируем ошибки парсинга author, возвращаем null
    return null;
  }
}

/// Безопасно парсит AircraftModelDto, возвращает null при ошибке
AircraftModelDto? _aircraftModelDtoFromJsonNullable(dynamic json) {
  if (json == null) return null;
  try {
    if (json is Map<String, dynamic>) {
      return AircraftModelDto.fromJson(json);
    }
    return null;
  } catch (e) {
    // Игнорируем ошибки парсинга aircraftModel, возвращаем null
    return null;
  }
}
