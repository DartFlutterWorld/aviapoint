import 'dart:async';
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

    try {
      // Проверяем, не инициализирован ли уже Firebase
      final apps = Firebase.apps;
      if (apps.isNotEmpty) {
        if (kDebugMode) {
          debugPrint('⚠️ Firebase уже инициализирован (найдено ${apps.length} приложений), пропускаем повторную инициализацию');
        }
      } else {
        // Firebase еще не инициализирован, инициализируем с таймаутом
        if (kIsWeb) {
          // Для веба используем короткий таймаут (5 секунд), особенно важно для iOS Safari
          try {
            await Firebase.initializeApp(options: DefaultFirebaseOptions.web)
                .timeout(
              const Duration(seconds: 5),
              onTimeout: () {
                if (kDebugMode) {
                  debugPrint('⏱️ Firebase инициализация превысила таймаут (5 сек) на вебе, продолжаем без Firebase');
                }
                throw TimeoutException('Firebase initialization timeout');
              },
            );
            if (kDebugMode) {
              debugPrint('✅ Firebase успешно инициализирован на вебе');
            }
          } catch (e) {
            if (kDebugMode) {
              debugPrint('❌ Ошибка инициализации Firebase на вебе: $e');
              debugPrint('💡 Приложение продолжит работу без Firebase (push-уведомления могут быть недоступны)');
            }
            // Устанавливаем initialized = true, чтобы не блокировать приложение
            initialized = true;
            return;
          }
        } else {
          // Для мобильных платформ используем более длинный таймаут (10 секунд)
          try {
            await Firebase.initializeApp(name: 'aviapoint', options: DefaultFirebaseOptions.currentPlatform)
                .timeout(
              const Duration(seconds: 10),
              onTimeout: () {
                if (kDebugMode) {
                  debugPrint('⏱️ Firebase инициализация превысила таймаут (10 сек) на мобильной платформе');
                }
                throw TimeoutException('Firebase initialization timeout');
              },
            );

            /// Инициализация Crashlytics с таймаутом
            try {
              await AppCrashlytics().init().timeout(
                    const Duration(seconds: 5),
                    onTimeout: () {
                      if (kDebugMode) {
                        debugPrint('⏱️ Crashlytics инициализация превысила таймаут');
                      }
                    },
                  );
            } catch (e) {
              if (kDebugMode) {
                debugPrint('⚠️ Ошибка инициализации Crashlytics: $e');
              }
              // Не критично, продолжаем
            }
          } catch (e) {
            if (kDebugMode) {
              debugPrint('❌ Ошибка инициализации Firebase на мобильной платформе: $e');
            }
            initialized = true;
            return;
          }
        }
      }

      /// Инициализируем Firebase message (включая веб) с таймаутом
      try {
        await AppMessaging().init().timeout(
              const Duration(seconds: 10),
              onTimeout: () {
                if (kDebugMode) {
                  debugPrint('⏱️ AppMessaging инициализация превысила таймаут (10 сек)');
                }
              },
            );
        _fcmToken = AppMessaging().fcmToken;
        if (kDebugMode) {
          if (_fcmToken != null) {
            debugPrint('✅ FCM токен получен: ${_fcmToken!.substring(0, 20)}...');
          } else {
            debugPrint('⚠️ FCM токен не получен');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint('❌ Ошибка инициализации AppMessaging: $e');
          debugPrint('💡 Приложение продолжит работу без push-уведомлений');
        }
        // Не критично, продолжаем
      }

      initialized = true;
      if (kDebugMode) {
        debugPrint('✅ AppFirebase инициализация завершена');
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint('❌ Критическая ошибка инициализации Firebase: $e');
        debugPrint('Stack trace: $stackTrace');
        debugPrint('💡 Приложение продолжит работу без Firebase');
      }
      // Устанавливаем initialized = true, чтобы не блокировать приложение
      initialized = true;
    }
  }
}
