import 'package:aviapoint/core/services/app_crashlytics.dart';
import 'package:aviapoint/core/services/app_messaging.dart';
import 'package:aviapoint/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AppFirebase {
  static AppFirebase? _instance;

  AppFirebase._internal() {
    _instance = this;
  }

  factory AppFirebase() => _instance ?? AppFirebase._internal();

  bool initialized = false;
  String? _fcmToken;

  String? get fcmToken => _fcmToken;

  Future<void> init() async {
    // Проверяем, не был ли уже вызван init()
    if (initialized) {
      if (kDebugMode) {
        debugPrint('⚠️ AppFirebase.init() уже был вызван, пропускаем повторную инициализацию');
      }
      return;
    }

    // Проверяем, не инициализирован ли уже Firebase
    final apps = Firebase.apps;
    if (apps.isNotEmpty) {
      if (kDebugMode) {
        debugPrint('⚠️ Firebase уже инициализирован (найдено ${apps.length} приложений), пропускаем повторную инициализацию');
      }
    } else {
      // Firebase еще не инициализирован, инициализируем
      if (kIsWeb) {
        // Используем конфигурацию из firebase_options.dart для синхронизации с service worker
        await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
      } else {
        await Firebase.initializeApp(name: 'aviapoint', options: DefaultFirebaseOptions.currentPlatform).whenComplete(() {
          if (kDebugMode) {}
        });

        /// Инициализация Crashlytics.
        await AppCrashlytics().init();
      }
    }

    /// Инициализируем Firebase message (включая веб)
    await AppMessaging().init();
    _fcmToken = AppMessaging().fcmToken;
    initialized = true;
  }
}
