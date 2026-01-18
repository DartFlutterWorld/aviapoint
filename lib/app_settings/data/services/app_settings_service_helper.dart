import 'package:aviapoint/app_settings/domain/repositories/app_settings_repository.dart';
import 'package:aviapoint/injection_container.dart';

/// Сервис для работы с настройками приложения (feature flags)
class AppSettingsServiceHelper {
  static final AppSettingsServiceHelper _instance = AppSettingsServiceHelper._internal();
  factory AppSettingsServiceHelper() => _instance;
  AppSettingsServiceHelper._internal();

  final AppSettingsRepository _repository = getIt<AppSettingsRepository>();

  /// Получить значение настройки по ключу из БД (асинхронно)
  /// Возвращает false, если настройка не найдена или произошла ошибка
  Future<bool> getSettingValue(String key) async {
    try {
      final result = await _repository.getSettingValue(key);
      return result.fold((failure) => false, (value) => value);
    } catch (e) {
      return false;
    }
  }
}
