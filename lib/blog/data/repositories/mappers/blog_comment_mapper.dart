import 'package:aviapoint/blog/data/models/blog_comment_dto.dart';
import 'package:aviapoint/blog/domain/entities/blog_comment_entity.dart';

class BlogCommentMapper {
  static BlogCommentEntity toEntity(BlogCommentDto dto) {
    return BlogCommentEntity(
      id: dto.id,
      articleId: dto.articleId,
      authorId: dto.authorId,
      parentCommentId: dto.parentCommentId,
      content: dto.content,
      isApproved: dto.isApproved,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      authorFirstName: dto.authorFirstName,
      authorLastName: dto.authorLastName,
      authorAvatarUrl: dto.authorAvatarUrl,
      authorRating: dto.authorRating,
    );
  }

  static List<BlogCommentEntity> toEntities(List<BlogCommentDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}
