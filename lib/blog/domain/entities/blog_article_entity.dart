import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';
import 'package:aviapoint/blog/domain/entities/blog_tag_entity.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

class BlogArticleEntity {
  final int id;
  final int authorId;
  final int? categoryId;
  final int? aircraftModelId;
  final String title;
  final String? excerpt;
  final String content;
  final String? coverImageUrl;
  final String status;
  final int viewCount;
  final String? publishedAt;
  final String? createdAt;
  final String? updatedAt;

  // Вложенные объекты
  final ProfileEntity? author;
  final BlogCategoryEntity? category;
  final AircraftModelDto? aircraftModel;
  final List<BlogTagEntity>? tags;

  BlogArticleEntity({
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
}
