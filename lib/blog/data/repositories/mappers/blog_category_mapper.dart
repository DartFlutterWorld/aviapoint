import 'package:aviapoint/blog/data/models/blog_category_dto.dart';
import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';

class BlogCategoryMapper {
  static BlogCategoryEntity toEntity(BlogCategoryDto dto) {
    return BlogCategoryEntity(
      id: dto.id,
      name: dto.name,
      iconUrl: dto.iconUrl,
      color: dto.color,
      orderIndex: dto.orderIndex,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static List<BlogCategoryEntity> toEntities(List<BlogCategoryDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}
