import 'package:aviapoint/app_settings/data/models/app_settings_dto.dart';
import 'package:aviapoint/app_settings/data/models/app_setting_value_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_settings_service.g.dart';

@RestApi()
abstract class AppSettingsService {
  factory AppSettingsService(Dio dio) = _AppSettingsService;

  /// Получить все настройки приложения
  @GET('/api/app-settings')
  Future<List<AppSettingsDto>> getAllSettings();

  /// Получить настройку по ключу
  @GET('/api/app-settings/{key}')
  Future<AppSettingsDto> getSettingByKey(@Path('key') String key);

  /// Получить значение настройки по ключу (упрощенный endpoint)
  @GET('/api/app-settings/{key}/value')
  Future<AppSettingValueDto> getSettingValue(@Path('key') String key);
}
