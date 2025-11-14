// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_categories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmergencyCategoriesDto _$EmergencyCategoriesDtoFromJson(
  Map<String, dynamic> json,
) => _EmergencyCategoriesDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  subTitle: json['sub_title'] as String,
  subTitleEng: json['sub_title_eng'] as String,
  mainCategoryId: (json['main_category_id'] as num).toInt(),
  titleEng: json['title_eng'] as String,
  picture: json['picture'] as String,
);

Map<String, dynamic> _$EmergencyCategoriesDtoToJson(
  _EmergencyCategoriesDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'sub_title': instance.subTitle,
  'sub_title_eng': instance.subTitleEng,
  'main_category_id': instance.mainCategoryId,
  'title_eng': instance.titleEng,
  'picture': instance.picture,
};
