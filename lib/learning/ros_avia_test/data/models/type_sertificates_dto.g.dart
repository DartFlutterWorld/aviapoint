// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_sertificates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeSertificatesDtoImpl _$$TypeSertificatesDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TypeSertificatesDtoImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$$TypeSertificatesDtoImplToJson(
  _$TypeSertificatesDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
};
