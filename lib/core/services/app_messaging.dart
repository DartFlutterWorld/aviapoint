import 'dart:async';
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
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      debugPrint('🔔 Запрос разрешения на уведомления...');
      // Добавляем таймаут для requestPermission, особенно важно для iOS Safari
      NotificationSettings settings;
      try {
        settings = await messaging
            .requestPermission(
              alert: true,
              announcement: false,
              badge: true,
              carPlay: false,
              criticalAlert: false,
              provisional: false,
              sound: true,
            )
            .timeout(
              const Duration(seconds: 5),
              onTimeout: () {
                if (kDebugMode) {
                  debugPrint('⏱️ Запрос разрешения на уведомления превысил таймаут (5 сек)');
                }
                // Возвращаем дефолтные настройки при таймауте
                throw TimeoutException('requestPermission timeout');
              },
            );
      } catch (e) {
        if (kDebugMode) {
          debugPrint('❌ Ошибка запроса разрешения на уведомления: $e');
          debugPrint('💡 Продолжаем без push-уведомлений');
        }
        return; // Выходим, если не удалось получить разрешение
      }

      debugPrint('🔔 Статус разрешения: ${settings.authorizationStatus}');
      debugPrint('🔔 Alert: ${settings.alert}, Sound: ${settings.sound}, Badge: ${settings.badge}');

      // На веб-платформе (особенно Safari на iOS) отдельные настройки могут быть notSupported,
      // но если AuthorizationStatus.authorized, то Web Push API все равно работает
      if (kIsWeb && settings.authorizationStatus != AuthorizationStatus.authorized) {
        final isNotSupported =
            settings.alert.toString().contains('notSupported') ||
            settings.sound.toString().contains('notSupported') ||
            settings.badge.toString().contains('notSupported');

        if (isNotSupported) {
          if (kDebugMode) {
            debugPrint('ℹ️ Push-уведомления не поддерживаются на этой веб-платформе');
            debugPrint('💡 Это нормальное поведение для некоторых браузеров');
          }
          // Выходим только если статус не authorized И настройки notSupported
          return;
        }
      }

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
              fcmToken = await FirebaseMessaging.instance.getToken().timeout(
                const Duration(seconds: 5),
                onTimeout: () {
                  if (kDebugMode) {
                    debugPrint('⏱️ Получение FCM токена без VAPID превысило таймаут (5 сек)');
                  }
                  throw TimeoutException('getToken timeout');
                },
              );
              debugPrint("✅ FCM Token (Web without VAPID): $fcmToken");
            } catch (e) {
              // Если не получилось без VAPID, пробуем с VAPID
              // VAPID ключ для Web Push API (получен из Firebase Console)
              // Важно: VAPID ключ должен соответствовать проекту Firebase (aviapoint)
              const String vapidKey =
                  'BBVjvKV9xek3jh_kqIWArGLRUONL0LDzt1F9MtDaeRQJStGQ9HaCy9EvLJqL9hAESCMVQnI-OvW51vD2Ld7_95Y';

              debugPrint("⚠️ Попытка получения токена без VAPID не удалась: $e");
              debugPrint("🔄 Пробуем с VAPID ключом...");

              // С VAPID ключом - стабильная работа push-уведомлений на всех браузерах
              try {
                fcmToken = await FirebaseMessaging.instance
                    .getToken(vapidKey: vapidKey)
                    .timeout(
                      const Duration(seconds: 5),
                      onTimeout: () {
                        if (kDebugMode) {
                          debugPrint('⏱️ Получение FCM токена с VAPID превысило таймаут (5 сек)');
                        }
                        throw TimeoutException('getToken with VAPID timeout');
                      },
                    );
                debugPrint("✅ FCM Token (Web with VAPID): $fcmToken");
              } catch (vapidError) {
                if (kDebugMode) {
                  debugPrint("❌ Ошибка получения FCM токена с VAPID: $vapidError");
                }
                rethrow;
              }
            }
          } catch (err) {
            debugPrint("❌ Ошибка получения FCM токена на вебе: $err");
            debugPrint("💡 Проблемы могут быть связаны с:");
            debugPrint("   1. Несоответствие конфигурации Firebase между приложением и Service Worker");
            debugPrint("   2. Неправильный или устаревший VAPID ключ");
            debugPrint("   3. Service Worker не зарегистрирован или не может получить доступ к Firebase");
            debugPrint("   4. iOS Safari может блокировать Firebase инициализацию");
            debugPrint("📝 Как исправить:");
            debugPrint("   1. Откройте https://console.firebase.google.com -> проект 'aviapoint'");
            debugPrint("   2. Project Settings (⚙️) -> Cloud Messaging");
            debugPrint("   3. Web Push certificates -> Generate key pair (если нет) или проверьте текущий");
            debugPrint(
              "   4. Убедитесь, что конфигурация в firebase_options.dart совпадает с firebase-messaging-sw.js",
            );
            debugPrint(
              "   5. Проверьте, что Service Worker зарегистрирован (DevTools -> Application -> Service Workers)",
            );
            // Не прерываем выполнение, продолжаем без токена
          }
        } else if (Platform.isIOS) {
          // Для iOS сначала получаем APNS токен с таймаутом
          try {
            String? apnsToken = await FirebaseMessaging.instance.getAPNSToken().timeout(
              const Duration(seconds: 3),
              onTimeout: () {
                if (kDebugMode) {
                  debugPrint('⏱️ Получение APNS токена превысило таймаут (3 сек)');
                }
                return null;
              },
            );

            if (apnsToken != null) {
              debugPrint("APNS Token: $apnsToken");
              try {
                fcmToken = await FirebaseMessaging.instance.getToken().timeout(
                  const Duration(seconds: 5),
                  onTimeout: () {
                    if (kDebugMode) {
                      debugPrint('⏱️ Получение FCM токена превысило таймаут (5 сек)');
                    }
                    throw TimeoutException('getToken timeout');
                  },
                );
                debugPrint("FCM Token: $fcmToken");
              } catch (e) {
                debugPrint("FCM Token not available ($e)");
              }
            } else {
              debugPrint("APNS Token not available, waiting ...");

              await Future<void>.delayed(const Duration(seconds: 2));

              try {
                apnsToken = await FirebaseMessaging.instance.getAPNSToken().timeout(
                  const Duration(seconds: 3),
                  onTimeout: () => null,
                );

                if (apnsToken != null) {
                  debugPrint("APNS Token: $apnsToken");
                  try {
                    fcmToken = await FirebaseMessaging.instance.getToken().timeout(
                      const Duration(seconds: 5),
                      onTimeout: () {
                        throw TimeoutException('getToken timeout');
                      },
                    );
                    debugPrint("FCM Token: $fcmToken");
                  } catch (e) {
                    debugPrint("FCM Token not available ($e)");
                  }
                } else {
                  debugPrint("APNS Token not available, trying to get FCM token anyway ...");

                  try {
                    fcmToken = await FirebaseMessaging.instance.getToken().timeout(
                      const Duration(seconds: 5),
                      onTimeout: () {
                        throw TimeoutException('getToken timeout');
                      },
                    );
                  } catch (err) {
                    debugPrint("FCM Token not available ($err)");
                  }
                }
              } catch (e) {
                debugPrint("Error getting APNS token: $e");
              }
            }
          } catch (e) {
            debugPrint("Error in iOS token initialization: $e");
          }
        } else {
          // Для Android получаем токен напрямую с таймаутом
          try {
            fcmToken = await FirebaseMessaging.instance.getToken().timeout(
              const Duration(seconds: 5),
              onTimeout: () {
                if (kDebugMode) {
                  debugPrint('⏱️ Получение FCM токена (Android) превысило таймаут (5 сек)');
                }
                throw TimeoutException('getToken timeout');
              },
            );
            debugPrint("FCM Token (Android): $fcmToken");
          } catch (e) {
            debugPrint("FCM Token (Android) not available: $e");
          }
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

        // Обработка уведомления, когда приложение запущено из закрытого состояния (с таймаутом)
        try {
          final initialMessage = await FirebaseMessaging.instance.getInitialMessage().timeout(
            const Duration(seconds: 2),
            onTimeout: () {
              if (kDebugMode) {
                debugPrint('⏱️ Получение initial message превысило таймаут (2 сек)');
              }
              return null;
            },
          );
          if (initialMessage != null) {
            debugPrint('📬 Приложение запущено по уведомлению: ${initialMessage.notification?.title}');
            debugPrint('📬 Данные уведомления: ${initialMessage.data}');
            // Обработаем после инициализации приложения (через WidgetsBinding)
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _handleNotificationTap(initialMessage.data);
            });
          }
        } catch (e) {
          if (kDebugMode) {
            debugPrint('⚠️ Ошибка получения initial message: $e');
          }
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
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint('❌ Критическая ошибка инициализации AppMessaging: $e');
        debugPrint('Stack trace: $stackTrace');
        debugPrint('💡 Приложение продолжит работу без push-уведомлений');
      }
      // Не прерываем выполнение, продолжаем без push-уведомлений
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
      } else if (type == 'new_question') {
        // Уведомление о новом вопросе (для пилота)
        final flightIdStr = data['flight_id'] as String?;
        final screen = data['screen'] as String?;

        if (flightIdStr != null && screen == 'flight_detail') {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId (новый вопрос)');
            _navigateToFlightDetail(flightId);
          } else {
            debugPrint('⚠️ Не удалось распарсить flight_id: $flightIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: flight_id=$flightIdStr, screen=$screen');
        }
      } else if (type == 'question_answered') {
        // Уведомление об ответе на вопрос (для пассажира)
        final flightIdStr = data['flight_id'] as String?;
        final screen = data['screen'] as String?;

        if (flightIdStr != null && screen == 'flight_detail') {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId (ответ на вопрос)');
            _navigateToFlightDetail(flightId);
          } else {
            debugPrint('⚠️ Не удалось распарсить flight_id: $flightIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: flight_id=$flightIdStr, screen=$screen');
        }
      } else if (type == 'new_review') {
        // Уведомление о новом отзыве (для пилота)
        final flightIdStr = data['flight_id'] as String?;
        final screen = data['screen'] as String?;

        if (flightIdStr != null && screen == 'flight_detail') {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId (новый отзыв)');
            _navigateToFlightDetail(flightId);
          } else {
            debugPrint('⚠️ Не удалось распарсить flight_id: $flightIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: flight_id=$flightIdStr, screen=$screen');
        }
      } else if (type == 'review_received') {
        // Уведомление о получении отзыва (для пассажира)
        final flightIdStr = data['flight_id'] as String?;
        final screen = data['screen'] as String?;

        if (flightIdStr != null && screen == 'flight_detail') {
          final flightId = int.tryParse(flightIdStr);
          if (flightId != null) {
            debugPrint('🔔 Переход на детальную страницу полета #$flightId (получен отзыв)');
            _navigateToFlightDetail(flightId);
          } else {
            debugPrint('⚠️ Не удалось распарсить flight_id: $flightIdStr');
          }
        } else {
          debugPrint('⚠️ Отсутствуют необходимые данные для навигации: flight_id=$flightIdStr, screen=$screen');
        }
      } else if (type == 'vacancy_new_response') {
        // Уведомление работодателю о новом отклике на вакансию
        final screen = data['screen'] as String?;
        if (screen == 'employer_vacancy_responses') {
          debugPrint('🔔 Переход в «Отклики по моим вакансиям»');
          _navigateToEmployerVacancyResponses();
        }
      } else if (type == 'vacancy_response_reply') {
        // Уведомление кандидату об ответе на отклик
        final screen = data['screen'] as String?;
        if (screen == 'my_vacancy_responses') {
          debugPrint('🔔 Переход в «Мои отклики»');
          _navigateToMyVacancyResponses();
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

  /// Навигация в «Отклики по моим вакансиям» (для работодателя)
  void _navigateToEmployerVacancyResponses() {
    try {
      final context = navigatorKey.currentContext;
      if (context != null) {
        context.router.push(
          BaseRoute(
            children: [
              WorkNavigationRoute(children: [const EmployerVacancyResponsesRoute()]),
            ],
          ),
        );
        debugPrint('✅ Навигация в «Отклики по моим вакансиям» выполнена');
      } else {
        debugPrint('⚠️ Контекст недоступен для навигации');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка навигации в отклики работодателя: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  /// Навигация в «Мои отклики» (для кандидата)
  void _navigateToMyVacancyResponses() {
    try {
      final context = navigatorKey.currentContext;
      if (context != null) {
        context.router.push(
          BaseRoute(
            children: [
              WorkNavigationRoute(children: [const MyVacancyResponsesRoute()]),
            ],
          ),
        );
        debugPrint('✅ Навигация в «Мои отклики» выполнена');
      } else {
        debugPrint('⚠️ Контекст недоступен для навигации');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка навигации в мои отклики: $e');
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
