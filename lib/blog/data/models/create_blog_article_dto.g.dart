// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_blog_article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBlogArticleDto _$CreateBlogArticleDtoFromJson(
  Map<String, dynamic> json,
) => CreateBlogArticleDto(
  categoryId: (json['category_id'] as num?)?.toInt(),
  aircraftModelId: (json['aircraft_model_id'] as num?)?.toInt(),
  title: json['title'] as String,
  excerpt: json['excerpt'] as String?,
  content: json['content'] as String,
  coverImageUrl: json['cover_image_url'] as String?,
  status: json['status'] as String?,
  tagIds: (json['tag_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$CreateBlogArticleDtoToJson(
  CreateBlogArticleDto instance,
) => <String, dynamic>{
  'category_id': ?instance.categoryId,
  'aircraft_model_id': ?instance.aircraftModelId,
  'title': instance.title,
  'excerpt': ?instance.excerpt,
  'content': instance.content,
  'cover_image_url': ?instance.coverImageUrl,
  'status': ?instance.status,
  'tag_ids': ?instance.tagIds,
};
