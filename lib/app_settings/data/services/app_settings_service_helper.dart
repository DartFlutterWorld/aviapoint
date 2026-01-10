import 'package:aviapoint/app_settings/domain/repositories/app_settings_repository.dart';
import 'package:aviapoint/injection_container.dart';

/// Сервис для работы с настройками приложения (feature flags)
/// Кеширует значения для быстрого доступа
class AppSettingsServiceHelper {
  static final AppSettingsServiceHelper _instance = AppSettingsServiceHelper._internal();
  factory AppSettingsServiceHelper() => _instance;
  AppSettingsServiceHelper._internal();

  final AppSettingsRepository _repository = getIt<AppSettingsRepository>();
  
  // Кеш для значений настроек
  final Map<String, bool> _cache = {};
  bool _isInitialized = false;

  /// Инициализация - загрузка всех настроек в кеш
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      final result = await _repository.getAllSettings();
      result.fold(
        (failure) {
          // При ошибке используем значения по умолчанию
          _cache['showPaidContent'] = true;
        },
        (settings) {
          for (final setting in settings) {
            _cache[setting.key] = setting.value;
          }
          // Устанавливаем значение по умолчанию, если настройка не найдена
          if (!_cache.containsKey('showPaidContent')) {
            _cache['showPaidContent'] = true;
          }
        },
      );
      _isInitialized = true;
    } catch (e) {
      // При ошибке используем значения по умолчанию
      _cache['showPaidContent'] = true;
      _isInitialized = true;
    }
  }

  /// Получить значение настройки по ключу
  /// Возвращает false, если настройка не найдена или не инициализирована
  bool getSettingValue(String key) {
    if (!_isInitialized) {
      // Если не инициализировано, возвращаем значение по умолчанию
      return key == 'showPaidContent' ? true : false;
    }
    return _cache[key] ?? false;
  }

  /// Обновить значение настройки в кеше (после изменения на сервере)
  void updateSettingValue(String key, bool value) {
    _cache[key] = value;
  }

  /// Обновить все настройки из сервера
  Future<void> refresh() async {
    _isInitialized = false;
    await initialize();
  }
}
