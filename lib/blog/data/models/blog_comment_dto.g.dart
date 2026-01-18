// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlogCommentDto _$BlogCommentDtoFromJson(Map<String, dynamic> json) => _BlogCommentDto(
  id: (json['id'] as num).toInt(),
  articleId: (json['article_id'] as num).toInt(),
  authorId: (json['author_id'] as num).toInt(),
  parentCommentId: (json['parent_comment_id'] as num?)?.toInt(),
  content: json['content'] as String,
  isApproved: json['is_approved'] as bool? ?? true,
  createdAt: _dateTimeFromJsonNullable(json['created_at']),
  updatedAt: _dateTimeFromJsonNullable(json['updated_at']),
  authorFirstName: json['author_first_name'] as String?,
  authorLastName: json['author_last_name'] as String?,
  authorAvatarUrl: json['author_avatar_url'] as String?,
  authorRating: _doubleFromJsonNullable(json['author_rating']),
);

Map<String, dynamic> _$BlogCommentDtoToJson(_BlogCommentDto instance) => <String, dynamic>{
  'id': instance.id,
  'article_id': instance.articleId,
  'author_id': instance.authorId,
  'parent_comment_id': instance.parentCommentId,
  'content': instance.content,
  'is_approved': instance.isApproved,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'author_first_name': instance.authorFirstName,
  'author_last_name': instance.authorLastName,
  'author_avatar_url': instance.authorAvatarUrl,
  'author_rating': instance.authorRating,
};
