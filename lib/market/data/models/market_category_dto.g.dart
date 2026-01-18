// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketCategoryDto _$MarketCategoryDtoFromJson(Map<String, dynamic> json) => MarketCategoryDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nameEn: json['name_en'] as String?,
  iconUrl: json['icon_url'] as String?,
  productType: json['product_type'] as String,
  parentId: (json['parent_id'] as num?)?.toInt(),
  displayOrder: (json['display_order'] as num?)?.toInt(),
  isMain: json['is_main'] as bool?,
);
