// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privat_pilot_plane_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivatPilotPlaneCategoryDtoImpl _$$PrivatPilotPlaneCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivatPilotPlaneCategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      typeCertificatesId: (json['type_certificates_id'] as num).toInt(),
    );

Map<String, dynamic> _$$PrivatPilotPlaneCategoryDtoImplToJson(
        _$PrivatPilotPlaneCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'type_certificates_id': instance.typeCertificatesId,
    };
