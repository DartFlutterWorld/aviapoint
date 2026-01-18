// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogCategoryDto _$BlogCategoryDtoFromJson(Map<String, dynamic> json) => BlogCategoryDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  iconUrl: json['icon_url'] as String?,
  color: json['color'] as String?,
  orderIndex: (json['order_index'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);
