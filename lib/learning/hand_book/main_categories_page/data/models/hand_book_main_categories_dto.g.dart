// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hand_book_main_categories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HandBookMainCategoriesDtoImpl _$$HandBookMainCategoriesDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$HandBookMainCategoriesDtoImpl(
      mainCategoryId: (json['mainCategoryId'] as num).toInt(),
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$$HandBookMainCategoriesDtoImplToJson(
        _$HandBookMainCategoriesDtoImpl instance) =>
    <String, dynamic>{
      'mainCategoryId': instance.mainCategoryId,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'picture': instance.picture,
    };
