// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hand_book_main_categories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HandBookMainCategoriesDto _$HandBookMainCategoriesDtoFromJson(Map<String, dynamic> json) => _HandBookMainCategoriesDto(
  mainCategoryId: (json['main_category_id'] as num).toInt(),
  title: json['title'] as String,
  subTitle: json['sub_title'] as String,
  picture: json['picture'] as String,
);

Map<String, dynamic> _$HandBookMainCategoriesDtoToJson(_HandBookMainCategoriesDto instance) => <String, dynamic>{
  'main_category_id': instance.mainCategoryId,
  'title': instance.title,
  'sub_title': instance.subTitle,
  'picture': instance.picture,
};
