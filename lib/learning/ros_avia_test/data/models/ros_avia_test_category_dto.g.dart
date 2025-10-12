// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ros_avia_test_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RosAviaTestCategoryDtoImpl _$$RosAviaTestCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RosAviaTestCategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$RosAviaTestCategoryDtoImplToJson(
        _$RosAviaTestCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
