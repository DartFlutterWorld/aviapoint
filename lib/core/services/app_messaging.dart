import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class AppMessaging {
  static AppMessaging? _instance;

  AppMessaging._internal() {
    _instance = this;
  }

  String? fcmToken;

  factory AppMessaging() => _instance ?? AppMessaging._internal();

  Future<void> init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(alert: true, announcement: false, badge: true, carPlay: false, criticalAlert: false, provisional: false, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {}

      if (Platform.isIOS) {
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
        fcmToken = await FirebaseMessaging.instance.getToken();
        debugPrint("FCM Token: $fcmToken");
      }

      log("PUSH Token: $fcmToken");
      if (kDebugMode) {}
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {}
    } else {
      if (kDebugMode) {}
    }

    //ServiceLocator.instance.get<PushHandlerRepository>()
  }
}
