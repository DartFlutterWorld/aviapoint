// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_manufacturer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AircraftManufacturerDto _$AircraftManufacturerDtoFromJson(
  Map<String, dynamic> json,
) => _AircraftManufacturerDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  country: json['country'] as String?,
  website: json['website'] as String?,
  description: json['description'] as String?,
  isActive: json['is_active'] as bool? ?? true,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AircraftManufacturerDtoToJson(
  _AircraftManufacturerDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country': instance.country,
  'website': instance.website,
  'description': instance.description,
  'is_active': instance.isActive,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
