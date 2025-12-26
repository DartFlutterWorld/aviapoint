// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preflight_inspection_check_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreflightInspectionCheckListDtoImpl _$$PreflightInspectionCheckListDtoImplFromJson(Map<String, dynamic> json) =>
    _$PreflightInspectionCheckListDtoImpl(
      id: (json['id'] as num).toInt(),
      preflightInspectionCategoryId: (json['preflight_inspection_category_id'] as num).toInt(),
      title: json['title'] as String,
      doing: json['doing'] as String,
      picture: json['picture'] as String? ?? '',
      titleEng: json['title_eng'] as String,
      doingEng: json['doing_eng'] as String,
    );

Map<String, dynamic> _$$PreflightInspectionCheckListDtoImplToJson(_$PreflightInspectionCheckListDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'preflight_inspection_category_id': instance.preflightInspectionCategoryId,
      'title': instance.title,
      'doing': instance.doing,
      'picture': instance.picture,
      'title_eng': instance.titleEng,
      'doing_eng': instance.doingEng,
    };
