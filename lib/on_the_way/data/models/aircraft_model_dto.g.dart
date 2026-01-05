// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AircraftModelDto _$AircraftModelDtoFromJson(Map<String, dynamic> json) =>
    _AircraftModelDto(
      id: (json['id'] as num).toInt(),
      manufacturerId: (json['manufacturer_id'] as num).toInt(),
      modelCode: json['model_code'] as String,
      fullName: json['full_name'] as String,
      category: json['category'] as String?,
      engineType: json['engine_type'] as String?,
      engineCount: (json['engine_count'] as num?)?.toInt() ?? 1,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      manufacturer: json['manufacturer'] == null
          ? null
          : AircraftManufacturerDto.fromJson(
              json['manufacturer'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AircraftModelDtoToJson(_AircraftModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'manufacturer_id': instance.manufacturerId,
      'model_code': instance.modelCode,
      'full_name': instance.fullName,
      'category': instance.category,
      'engine_type': instance.engineType,
      'engine_count': instance.engineCount,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'manufacturer': instance.manufacturer,
    };
