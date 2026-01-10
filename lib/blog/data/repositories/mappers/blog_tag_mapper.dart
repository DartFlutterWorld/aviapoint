import 'package:aviapoint/blog/data/models/blog_tag_dto.dart';
import 'package:aviapoint/blog/domain/entities/blog_tag_entity.dart';

class BlogTagMapper {
  static BlogTagEntity toEntity(BlogTagDto dto) {
    return BlogTagEntity(id: dto.id, name: dto.name, slug: dto.slug, createdAt: dto.createdAt);
  }

  static List<BlogTagEntity> toEntities(List<BlogTagDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}
