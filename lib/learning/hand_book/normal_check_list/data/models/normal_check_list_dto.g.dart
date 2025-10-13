// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal_check_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NormalCheckListDtoImpl _$$NormalCheckListDtoImplFromJson(
  Map<String, dynamic> json,
) => _$NormalCheckListDtoImpl(
  id: (json['id'] as num).toInt(),
  normalCategoryId: (json['normal_category_id'] as num).toInt(),
  title: json['title'] as String,
  doing: json['doing'] as String,
  picture: json['picture'] as String? ?? '',
  titleEng: json['title_eng'] as String,
  doingEng: json['doing_eng'] as String,
  checkList: json['check_list'] as bool,
  subCategory: json['sub_category'] as String?,
  subCategoryEng: json['sub_category_eng'] as String?,
);

Map<String, dynamic> _$$NormalCheckListDtoImplToJson(
  _$NormalCheckListDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'normal_category_id': instance.normalCategoryId,
  'title': instance.title,
  'doing': instance.doing,
  'picture': instance.picture,
  'title_eng': instance.titleEng,
  'doing_eng': instance.doingEng,
  'check_list': instance.checkList,
  'sub_category': instance.subCategory,
  'sub_category_eng': instance.subCategoryEng,
};
