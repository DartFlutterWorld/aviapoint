// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogArticleDto _$BlogArticleDtoFromJson(Map<String, dynamic> json) =>
    BlogArticleDto(
      id: (json['id'] as num).toInt(),
      authorId: (json['author_id'] as num).toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      aircraftModelId: (json['aircraft_model_id'] as num?)?.toInt(),
      title: json['title'] as String,
      excerpt: json['excerpt'] as String?,
      content: json['content'] as String,
      coverImageUrl: json['cover_image_url'] as String?,
      status: json['status'] as String,
      viewCount: (json['view_count'] as num).toInt(),
      publishedAt: json['published_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      author: _profileDtoFromJsonNullable(json['author']),
      category: json['category'] == null
          ? null
          : BlogCategoryDto.fromJson(json['category'] as Map<String, dynamic>),
      aircraftModel: _aircraftModelDtoFromJsonNullable(json['aircraft_model']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => BlogTagDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
