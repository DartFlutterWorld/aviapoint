import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Утилиты для определения типа устройства
class DeviceUtils {
  DeviceUtils._();

  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static bool? _isTabletCache;

  /// Инициализация определения типа устройства
  /// Должна быть вызвана при старте приложения
  static Future<void> initialize() async {
    if (_isTabletCache == null) {
      debugPrint('DeviceUtils: Initializing device type detection...');
      final result = await isTablet();
      debugPrint('DeviceUtils: Device type detection completed. IsTablet: $result');
    } else {
      debugPrint('DeviceUtils: Already initialized. IsTablet: $_isTabletCache');
    }
  }

  /// Определяет, является ли устройство планшетом
  /// Использует device_info_plus для точного определения типа устройства
  /// Кэширует результат для избежания повторных запросов
  static Future<bool> isTablet() async {
    if (_isTabletCache != null) {
      return _isTabletCache!;
    }

    try {
      if (kIsWeb) {
        // Для веба используем размер экрана
        // Это будет определено через MediaQuery в контексте
        _isTabletCache = false;
        return _isTabletCache!;
      }

      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        
        // Проверяем по модели устройства
        final model = androidInfo.model.toLowerCase();
        final brand = androidInfo.brand.toLowerCase();
        
        // Проверяем по названию модели (tablet, tab, pad и т.д.)
        final isTabletByModel = model.contains('tablet') ||
                               model.contains('tab') ||
                               model.contains('pad') ||
                               brand.contains('tablet');
        
        // Проверяем по системным свойствам
        // На планшетах обычно есть определенные характеристики
        // Используем размер экрана в dp через системные настройки
        // Если это не сработает, полагаемся на модель
        
        _isTabletCache = isTabletByModel;
        return _isTabletCache!;
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        // Для iOS проверяем модель устройства
        final model = iosInfo.model.toLowerCase();
        final name = iosInfo.name.toLowerCase();
        final identifier = iosInfo.utsname.machine.toLowerCase();
        
        // iPad всегда планшет - проверяем по модели, имени и идентификатору
        final isIPad = model.contains('ipad') || 
                      name.contains('ipad') ||
                      identifier.contains('ipad');
        
        debugPrint('iOS Device Info - Model: $model, Name: $name, Identifier: $identifier, IsTablet: $isIPad');
        
        _isTabletCache = isIPad;
        return _isTabletCache!;
      }
    } catch (e) {
      debugPrint('Error detecting device type: $e');
    }

    _isTabletCache = false;
    return _isTabletCache!;
  }

  /// Синхронная версия для использования в build методах
  /// Использует кэш, если он уже был определен
  /// Если кэш пуст, возвращает false (предполагаем телефон по умолчанию)
  static bool isTabletSync() {
    return _isTabletCache ?? false;
  }

  /// Определяет, является ли устройство телефоном
  static Future<bool> isPhone() async {
    return !(await isTablet());
  }

  /// Сброс кэша (полезно при тестировании или смене устройства)
  static void clearCache() {
    _isTabletCache = null;
  }

  /// Получает ширину экрана
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Получает высоту экрана
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Получает минимальную сторону экрана
  static double getShortestSide(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide;
  }
}

/// Тип устройства
enum DeviceType {
  /// Обычный телефон (< 400dp)
  phone,

  /// Большой телефон (400-599dp)
  largePhone,

  /// Планшет (>= 600dp)
  tablet,
}
