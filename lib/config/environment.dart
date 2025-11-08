/// Environment configuration for development and production
abstract class Environment {
  // Build flag для определения окружения
  // true = Development, false = Production
  static const bool isDevelopment = bool.fromEnvironment('isDevelopment', defaultValue: true);

  /// API базовый URL
  static String get apiUrl {
    if (isDevelopment) {
      // Development окружение (локальный)
      return 'http://0.0.0.0:8080/';
    } else {
      // Production окружение (относительный путь, Nginx проксирует на backend)
      // Nginx конфиг обрабатывает: /api, /stories, /news, /auth, /learning, /profiles, /openapi
      return '';
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
