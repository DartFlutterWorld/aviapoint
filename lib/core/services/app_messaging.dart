import 'dart:developer';
import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';

class AppMessaging {
  static AppMessaging? _instance;

  AppMessaging._internal() {
    _instance = this;
  }

  String? fcmToken;

  factory AppMessaging() => _instance ?? AppMessaging._internal();

  Future<void> init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    debugPrint('🔔 Запрос разрешения на уведомления...');
    NotificationSettings settings = await messaging.requestPermission(alert: true, announcement: false, badge: true, carPlay: false, criticalAlert: false, provisional: false, sound: true);

    debugPrint('🔔 Статус разрешения: ${settings.authorizationStatus}');
    debugPrint('🔔 Alert: ${settings.alert}, Sound: ${settings.sound}, Badge: ${settings.badge}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        debugPrint('✅ Разрешение на уведомления получено');
      }

      if (kIsWeb) {
        debugPrint('🌐 Инициализация FCM для веба...');
        // Для веба нужен VAPID ключ для Web Push API
        // firebase_options.dart содержит базовую конфигурацию Firebase, но НЕ содержит VAPID
        // VAPID - это отдельный ключ, необходимый для push-уведомлений в браузерах
        try {
          // Пробуем получить токен без VAPID сначала (может сработать в некоторых случаях)
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
            debugPrint("✅ FCM Token (Web without VAPID): $fcmToken");
          } catch (e) {
            // Если не получилось без VAPID, пробуем с VAPID
            // VAPID ключ для Web Push API (получен из Firebase Console)
            // Важно: VAPID ключ должен соответствовать проекту Firebase (aviapoint)
            const String vapidKey = 'BBVjvKV9xek3jh_kqIWArGLRUONL0LDzt1F9MtDaeRQJStGQ9HaCy9EvLJqL9hAESCMVQnI-OvW51vD2Ld7_95Y';

            debugPrint("⚠️ Попытка получения токена без VAPID не удалась: $e");
            debugPrint("🔄 Пробуем с VAPID ключом...");

            // С VAPID ключом - стабильная работа push-уведомлений на всех браузерах
            fcmToken = await FirebaseMessaging.instance.getToken(vapidKey: vapidKey);
            debugPrint("✅ FCM Token (Web with VAPID): $fcmToken");
          }
        } catch (err) {
          debugPrint("❌ Ошибка получения FCM токена на вебе: $err");
          debugPrint("💡 Проблемы могут быть связаны с:");
          debugPrint("   1. Несоответствие конфигурации Firebase между приложением и Service Worker");
          debugPrint("   2. Неправильный или устаревший VAPID ключ");
          debugPrint("   3. Service Worker не зарегистрирован или не может получить доступ к Firebase");
          debugPrint("📝 Как исправить:");
          debugPrint("   1. Откройте https://console.firebase.google.com -> проект 'aviapoint'");
          debugPrint("   2. Project Settings (⚙️) -> Cloud Messaging");
          debugPrint("   3. Web Push certificates -> Generate key pair (если нет) или проверьте текущий");
          debugPrint("   4. Убедитесь, что конфигурация в firebase_options.dart совпадает с firebase-messaging-sw.js");
          debugPrint("   5. Проверьте, что Service Worker зарегистрирован (DevTools -> Application -> Service Workers)");
        }
      } else if (Platform.isIOS) {
        // Для iOS сначала получаем APNS токен
        String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();

        if (apnsToken != null) {
          debugPrint("APNS Token: $apnsToken");
          fcmToken = await FirebaseMessaging.instance.getToken();
          debugPrint("FCM Token: $fcmToken");
        } else {
          debugPrint("APNS Token not available, waiting ...");

          await Future<void>.delayed(const Duration(seconds: 3));

          apnsToken = await FirebaseMessaging.instance.getAPNSToken();

          if (apnsToken != null) {
            debugPrint("APNS Token: $apnsToken");
            fcmToken = await FirebaseMessaging.instance.getToken();
            debugPrint("FCM Token: $fcmToken");
          } else {
            debugPrint("APNS Token not available, trying to get FCM token anyway ...");

            try {
              fcmToken = await FirebaseMessaging.instance.getToken();
            } catch (err) {
              debugPrint("FCM Token not available ($err)");
            }
          }
        }
      } else {
        // Для Android получаем токен напрямую
        fcmToken = await FirebaseMessaging.instance.getToken();
        debugPrint("FCM Token (Android): $fcmToken");
      }

      log("PUSH Token: $fcmToken");
      if (kDebugMode) {
        if (fcmToken == null) {
          debugPrint('⚠️ FCM токен не получен!');
        } else {
          debugPrint('✅ FCM токен успешно получен: ${fcmToken!.substring(0, 20)}...');
        }
      }

      // Слушаем обновление токена
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        debugPrint('🔄 FCM токен обновлен: $newToken');
        fcmToken = newToken;
        // Отправляем новый токен на сервер (авторизованным или анонимно)
        await _sendTokenToServer(newToken);
      });

      // Обработка уведомлений, когда приложение открыто
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        debugPrint('📬 Получено уведомление, пока приложение открыто: ${message.notification?.title}');
        debugPrint('📬 Данные уведомления: ${message.data}');
        // Можно показать локальное уведомление или обновить UI
        // На вебе можно показать собственное уведомление через Notification API
        if (kIsWeb) {
          _showWebNotification(message.notification?.title ?? '', message.notification?.body ?? '', message.data);
        }
      });

      // Обработка нажатия на уведомление, когда приложение было открыто из закрытого состояния
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint('📬 Приложение открыто по уведомлению: ${message.notification?.title}');
        debugPrint('📬 Данные уведомления: ${message.data}');
        _handleNotificationTap(message.data);
      });

      // Обработка уведомления, когда приложение запущено из закрытого состояния
      final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        debugPrint('📬 Приложение запущено по уведомлению: ${initialMessage.notification?.title}');
        debugPrint('📬 Данные уведомления: ${initialMessage.data}');
        // Обработаем после инициализации приложения (через WidgetsBinding)
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleNotificationTap(initialMessage.data);
        });
      }

      // Отправляем токен на сервер сразу (анонимно, если пользователь не авторизован)
      // Если пользователь авторизован, токен будет обновлен после загрузки профиля с user_id
      // Это позволяет собирать токены даже от неавторизованных пользователей для массовых рассылок
      if (fcmToken != null && fcmToken!.isNotEmpty) {
        debugPrint('💾 FCM токен получен: $fcmToken');
        await _sendTokenToServer(fcmToken!);
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        debugPrint('⚠️ Разрешение на уведомления получено условно (provisional)');
      }
    } else {
      if (kDebugMode) {
        debugPrint('❌ Разрешение на уведомления НЕ получено. Статус: ${settings.authorizationStatus}');
        debugPrint('💡 Пользователь должен разрешить уведомления в настройках браузера');
      }
    }

    //ServiceLocator.instance.get<PushHandlerRepository>()
  }

  /// Обработка нажатия на уведомление
  void _handleNotificationTap(Map<String, dynamic> data) {
    try {
      final type = data['type'] as String?;
      debugPrint('🔔 Обработка уведомления типа: $type');

      if (type == 'new_booking') {
        // Уведомление о новом бронировании
        final flightIdStr = data['flight_id'] as String?;
        final screen = data['screen'] as String?;

        if (flightIdStr != null && screen == 'flight_detail') {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId');
            _navigateToFlightDetail(flightId);
          } else {
            debugPrint('⚠️ Не удалось распарсить flight_id: $flightIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: flight_id=$flightIdStr, screen=$screen');
        }
      } else if (type == 'booking_confirmed') {
        // Уведомление о подтверждении бронирования
        final flightIdStr = data['flight_id'] as String?;
        final screen = data['screen'] as String?;

        if (flightIdStr != null && screen == 'flight_detail') {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId (бронирование подтверждено)');
            _navigateToFlightDetail(flightId);
          } else {
            debugPrint('⚠️ Не удалось распарсить flight_id: $flightIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: flight_id=$flightIdStr, screen=$screen');
        }
      } else if (type == 'booking_cancelled') {
        // Уведомление об отмене бронирования
        final flightIdStr = data['flight_id'] as String?;
        final screen = data['screen'] as String?;

        if (flightIdStr != null && screen == 'flight_detail') {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId (бронирование отменено)');
            _navigateToFlightDetail(flightId);
          } else {
            debugPrint('⚠️ Не удалось распарсить flight_id: $flightIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: flight_id=$flightIdStr, screen=$screen');
        }
      } else if (type == 'listing_unpublished') {
        // Уведомление о снятии объявления с публикации
        final listingIdStr = data['listing_id'] as String?;
        final screen = data['screen'] as String?;

        if (listingIdStr != null && screen == 'listing_detail') {
          final listingId = int.tryParse(listingIdStr);
          if (listingId != null) {
            debugPrint('🔔 Переход на детальную страницу объявления #$listingId (снято с публикации)');
            _navigateToAircraftMarketDetail(listingId);
          } else {
            debugPrint('⚠️ Не удалось распарсить listing_id: $listingIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: listing_id=$listingIdStr, screen=$screen');
        }
      } else if (type == 'flight_reminder') {
        // Уведомление о напоминании завершить полет
        final flightIdStr = data['flight_id'] as String?;
        if (flightIdStr != null) {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId (напоминание)');
            _navigateToFlightDetail(flightId);
          }
        }
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка при обработке нажатия на уведомление: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  /// Навигация на детальную страницу полета
  void _navigateToFlightDetail(int flightId) {
    try {
      // Получаем глобальный контекст через navigatorKey
      final context = navigatorKey.currentContext;
      if (context != null) {
        context.router.push(
          BaseRoute(
            children: [
              OnTheWayNavigationRoute(children: [FlightDetailRoute(flightId: flightId)]),
            ],
          ),
        );
        debugPrint('✅ Навигация на детальную страницу полета #$flightId выполнена');
      } else {
        debugPrint('⚠️ Контекст недоступен для навигации');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка навигации на детальную страницу полета: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  /// Навигация на детальную страницу объявления
  void _navigateToAircraftMarketDetail(int listingId) {
    try {
      // Получаем глобальный контекст через navigatorKey
      final context = navigatorKey.currentContext;
      if (context != null) {
        context.router.push(
          BaseRoute(
            children: [
              MarketNavigationRoute(children: [AircraftMarketDetailRoute(id: listingId)]),
            ],
          ),
        );
        debugPrint('✅ Навигация на детальную страницу объявления #$listingId выполнена');
      } else {
        debugPrint('⚠️ Контекст недоступен для навигации');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка навигации на детальную страницу объявления: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  /// Отправка токена на сервер (работает для авторизованных и анонимных пользователей)
  Future<void> _sendTokenToServer(String token) async {
    try {
      // Проверяем, зарегистрирован ли ProfileRepository в GetIt
      if (!getIt.isRegistered<ProfileRepository>()) {
        debugPrint('⚠️ ProfileRepository еще не зарегистрирован, пропускаем отправку токена');
        return;
      }

      final profileRepository = getIt<ProfileRepository>();

      // Проверяем, авторизован ли пользователь
      bool isAuthenticated = false;
      if (getIt.isRegistered<AppState>()) {
        final appState = getIt<AppState>();
        isAuthenticated = appState.isAuthenticated;
      }

      if (isAuthenticated) {
        // Для авторизованных пользователей - токен будет привязан к user_id
        final result = await profileRepository.saveFcmToken(token);
        result.fold(
          (failure) {
            debugPrint('❌ Ошибка сохранения FCM токена (авторизованный): ${failure.message}');
          },
          (_) {
            debugPrint('✅ FCM токен отправлен на сервер (пользователь авторизован, будет привязан к user_id)');
          },
        );
      } else {
        // Для анонимных пользователей - отправляем как анонимный токен
        final result = await profileRepository.saveAnonymousFcmToken(token);
        result.fold(
          (failure) {
            debugPrint('❌ Ошибка сохранения анонимного FCM токена: ${failure.message}');
            debugPrint('   Status code: ${failure.statusCode}');
            debugPrint('   Response: ${failure.responseMessage}');
          },
          (_) {
            debugPrint('✅ FCM токен отправлен на сервер (анонимный, для массовых рассылок)');
          },
        );
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка отправки FCM токена на сервер: $e');
      debugPrint('Stack trace: $stackTrace');
      // Не критично, если не удалось отправить
    }
  }

  /// Публичный метод для отправки токена (вызывается после загрузки профиля)
  /// Обновляет анонимный токен на токен с user_id
  Future<void> sendTokenToServer() async {
    if (fcmToken != null && fcmToken!.isNotEmpty) {
      await _sendTokenToServer(fcmToken!);
    }
  }

  /// Показать веб-уведомление (для веба, когда приложение открыто)
  void _showWebNotification(String title, String body, Map<String, dynamic> data) {
    if (!kIsWeb) return;

    // Используем Web Notification API для показа уведомления
    // Это нужно только если хотим показывать уведомления, когда вкладка открыта
    // Firebase Messaging автоматически покажет уведомление в фоне
    try {
      // Можно использовать Notification API, но лучше полагаться на Firebase Messaging
      debugPrint('📱 Веб-уведомление: $title - $body');
    } catch (e) {
      debugPrint('⚠️ Ошибка показа веб-уведомления: $e');
    }
  }
}
