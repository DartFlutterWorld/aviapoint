// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal_categories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NormalCategoriesDto _$NormalCategoriesDtoFromJson(Map<String, dynamic> json) => _NormalCategoriesDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  subTitle: json['sub_title'] as String,
  mainCategoryId: (json['main_category_id'] as num).toInt(),
  titleEng: json['title_eng'] as String,
  picture: json['picture'] as String,
);

Map<String, dynamic> _$NormalCategoriesDtoToJson(_NormalCategoriesDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'sub_title': instance.subTitle,
  'main_category_id': instance.mainCategoryId,
  'title_eng': instance.titleEng,
  'picture': instance.picture,
};
