// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal_categories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NormalCategoriesDtoImpl _$$NormalCategoriesDtoImplFromJson(
  Map<String, dynamic> json,
) => _$NormalCategoriesDtoImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  subTitle: json['sub_title'] as String,
  mainCategoryId: (json['main_category_id'] as num).toInt(),
  titleEng: json['title_eng'] as String,
  picture: json['picture'] as String,
);

Map<String, dynamic> _$$NormalCategoriesDtoImplToJson(
  _$NormalCategoriesDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'sub_title': instance.subTitle,
  'main_category_id': instance.mainCategoryId,
  'title_eng': instance.titleEng,
  'picture': instance.picture,
};
