// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AircraftModelDto _$AircraftModelDtoFromJson(Map<String, dynamic> json) => _AircraftModelDto(
  id: (json['id'] as num).toInt(),
  manufacturerId: (json['manufacturer_id'] as num).toInt(),
  modelCode: json['model_code'] as String,
  manufacturer: json['manufacturer'] == null
      ? null
      : AircraftManufacturerDto.fromJson(json['manufacturer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AircraftModelDtoToJson(_AircraftModelDto instance) => <String, dynamic>{
  'id': instance.id,
  'manufacturer_id': instance.manufacturerId,
  'model_code': instance.modelCode,
  'manufacturer': instance.manufacturer,
};
