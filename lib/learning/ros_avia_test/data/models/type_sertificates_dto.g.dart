// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_sertificates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TypeSertificatesDto _$TypeSertificatesDtoFromJson(Map<String, dynamic> json) =>
    _TypeSertificatesDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TypeSertificatesDtoToJson(
  _TypeSertificatesDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
};
