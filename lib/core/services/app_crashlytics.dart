import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

enum Environment { dev, prod }

class AppCrashlytics {
  static AppCrashlytics? _instance;

  AppCrashlytics._internal() {
    _instance = this;
  }

  Environment getEnvironment() {
    // Здесь можно использовать флаги, переменные окружения или конфигурации сборки
    const bool isProd = bool.fromEnvironment('dart.vm.product');
    return isProd ? Environment.prod : Environment.dev;
  }

  factory AppCrashlytics() => _instance ?? AppCrashlytics._internal();

  Future<void> init() async {
    // Проверка инициализации Crashlytics
    try {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      var originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails errorDetails) async {
        await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
        if (originalOnError != null) originalOnError(errorDetails);
      };

      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics.
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

        return true;
      };
      final environment = getEnvironment();

      FirebaseCrashlytics.instance.setCustomKey('environment', environment.name);

      // Crashlytics initialized successfully
    } catch (e) {
      // Failed to initialize Crashlytics
    }
  }
}
