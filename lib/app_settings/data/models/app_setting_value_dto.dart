import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_setting_value_dto.freezed.dart';
part 'app_setting_value_dto.g.dart';

@freezed
abstract class AppSettingValueDto with _$AppSettingValueDto {
  const factory AppSettingValueDto({required String key, required bool value}) = _AppSettingValueDto;

  factory AppSettingValueDto.fromJson(Map<String, dynamic> json) => _$AppSettingValueDtoFromJson(json);
}
