import 'package:aviapoint/config/firebase/firebase_options_dev.dart';
import 'package:aviapoint/core/services/app_crashlytics.dart';
import 'package:aviapoint/core/services/app_messaging.dart';
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAUpF0WBtlj71lOIhqfOP8SGLg8PYpMlYM',
    appId: '1:393856996606:web:3a9dbb7e9bd0bac16f81af',
    messagingSenderId: '393856996606',
    projectId: 'silk-42ca2',
    authDomain: 'silk-42ca2.firebaseapp.com',
    storageBucket: 'silk-42ca2.appspot.com',
  );

  Future<void> init() async {
    if (kIsWeb) {
      // await Firebase.initializeApp(
      //   options: web,
      // );
    } else {
      await Firebase.initializeApp(
        //name: 'Silk',
        options: DefaultFirebaseOptions.currentPlatform,
      ).whenComplete(
        () {
          if (kDebugMode) {
            print('FIREBASE INITIALIZED================>');
          }
        },
      );

      /// Инициализация Crashlytics.
      await AppCrashlytics().init();
    }

    /// Инициализируем Firebase message.
    if (!kIsWeb) {
      await AppMessaging().init();
      _fcmToken = AppMessaging().fcmToken;
    }
  }
}
