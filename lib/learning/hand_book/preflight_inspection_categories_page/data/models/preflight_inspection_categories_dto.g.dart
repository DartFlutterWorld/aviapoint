// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preflight_inspection_categories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreflightInspectionCategoriesDtoImpl
    _$$PreflightInspectionCategoriesDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$PreflightInspectionCategoriesDtoImpl(
          id: (json['id'] as num).toInt(),
          title: json['title'] as String,
          mainCategoryId: (json['mainCategoryId'] as num).toInt(),
          titleEng: json['titleEng'] as String,
          picture: json['picture'] as String,
        );

Map<String, dynamic> _$$PreflightInspectionCategoriesDtoImplToJson(
        _$PreflightInspectionCategoriesDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainCategoryId': instance.mainCategoryId,
      'titleEng': instance.titleEng,
      'picture': instance.picture,
    };
