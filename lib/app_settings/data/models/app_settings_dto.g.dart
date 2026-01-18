// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettingsDto _$AppSettingsDtoFromJson(Map<String, dynamic> json) => _AppSettingsDto(
  id: (json['id'] as num).toInt(),
  key: json['key'] as String,
  value: json['value'] as bool,
  description: json['description'] as String?,
  createdAt: _dateTimeFromJsonNullable(json['created_at']),
  updatedAt: _dateTimeFromJsonNullable(json['updated_at']),
);

Map<String, dynamic> _$AppSettingsDtoToJson(_AppSettingsDto instance) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'value': instance.value,
  'description': instance.description,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
