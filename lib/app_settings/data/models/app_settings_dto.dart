import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_dto.freezed.dart';
part 'app_settings_dto.g.dart';

@freezed
abstract class AppSettingsDto with _$AppSettingsDto {
  const factory AppSettingsDto({
    required int id,
    required String key,
    required bool value,
    String? description,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,
  }) = _AppSettingsDto;

  factory AppSettingsDto.fromJson(Map<String, dynamic> json) => _$AppSettingsDtoFromJson(json);
}

/// Парсит nullable DateTime
DateTime? _dateTimeFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value);
  return null;
}
