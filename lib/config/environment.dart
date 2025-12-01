import 'package:flutter/foundation.dart';

/// Environment configuration for development and production
abstract class Environment {
  // Build flag для определения окружения
  // true = Development, false = Production
  static const bool isDevelopment = bool.fromEnvironment('isDevelopment', defaultValue: true);

  // IP адрес локального сервера для мобильных устройств
  // Можно переопределить через --dart-define=localServerIp=192.168.1.100
  // static const String localServerIp = String.fromEnvironment('localServerIp', defaultValue: '172.20.10.11');

  // Дома Вайфай
  // static const String localServerIp = String.fromEnvironment('localServerIp', defaultValue: '192.168.1.159');

  // Кардон Вайфай
  static const String localServerIp = String.fromEnvironment('localServerIp', defaultValue: '192.168.1.105');

  // Megafon phone
  // static const String localServerIp = String.fromEnvironment('localServerIp', defaultValue: '172.20.10.11');

  /// API базовый URL
  static String get apiUrl {
    if (isDevelopment) {
      // Development окружение (локальный)
      // На веб-платформе используем 0.0.0.0, на мобильных - IP адрес компьютера
      if (kIsWeb) {
        return 'http://0.0.0.0:8080/';
      } else {
        // На мобильных устройствах используем IP адрес компьютера в локальной сети
        return 'http://$localServerIp:8080/';
      }
    } else {
      // Production окружение
      // На веб-платформе: относительный путь (Nginx проксирует на backend)
      // На мобильных: полный URL продакшн сервера
      if (kIsWeb) {
        // Nginx конфиг обрабатывает: /api, /stories, /news, /auth, /learning, /profiles, /openapi
        return '';
      } else {
        // Для мобильных приложений нужен полный URL
        return 'https://avia-point.com/';
      }
    }
  }

  /// Приложение имя
  static String get appName {
    if (isDevelopment) {
      return 'AviAPoint (Dev)';
    } else {
      return 'AviAPoint';
    }
  }

  /// Флаг для логирования
  static bool get enableLogging => isDevelopment;

  /// Флаг для Firebase Crashlytics
  static bool get enableCrashlytics => !isDevelopment;
}
