import 'package:aviapoint/blog/data/models/blog_article_dto.dart';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/data/repositories/mappers/blog_category_mapper.dart';
import 'package:aviapoint/blog/data/repositories/mappers/blog_tag_mapper.dart';
import 'package:aviapoint/profile_page/profile/data/mappers/profile_mapper.dart';

class BlogArticleMapper {
  static BlogArticleEntity toEntity(BlogArticleDto dto) {
    return BlogArticleEntity(
      id: dto.id,
      authorId: dto.authorId,
      categoryId: dto.categoryId,
      aircraftModelId: dto.aircraftModelId,
      title: dto.title,
      excerpt: dto.excerpt,
      content: dto.content,
      coverImageUrl: dto.coverImageUrl,
      status: dto.status,
      viewCount: dto.viewCount,
      publishedAt: dto.publishedAt,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      author: dto.author != null ? ProfileMapper.toEntity(dto.author!) : null,
      category: dto.category != null ? BlogCategoryMapper.toEntity(dto.category!) : null,
      aircraftModel: dto.aircraftModel,
      tags: dto.tags != null ? BlogTagMapper.toEntities(dto.tags!) : null,
    );
  }

  static List<BlogArticleEntity> toEntities(List<BlogArticleDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}
