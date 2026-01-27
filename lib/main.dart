import 'dart:async';
import 'dart:io';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:aviapoint/core/presentation/pages/app.dart';
import 'package:aviapoint/core/presentation/widgets/app_wrapper.dart';
import 'package:aviapoint/core/presentation/bloc/internet_connection_bloc.dart';
import 'package:aviapoint/core/services/app_firebase.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:aviapoint/core/domain/app_bloc_observer.dart';
import 'package:aviapoint/core/utils/talker_config.dart';
import 'package:aviapoint/core/utils/device_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SSlHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class StringStackTrace implements StackTrace {
  final String _stackTrace;
  const StringStackTrace(this._stackTrace);
  @override
  String toString() => _stackTrace;
}

/// Основной тред.
// ignore: long-method
Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    // Игнорируем некритичную ошибку QuillNativeBridgeApi.isIosSimulator
    if (details.exception is PlatformException) {
      final e = details.exception as PlatformException;
      if (e.code == 'channel-error' && (e.message?.contains('isIosSimulator') == true || e.message?.contains('QuillNativeBridgeApi') == true)) {
        // Это некритичная ошибка, просто игнорируем её
        return;
      }
    }
    AppTalker.error('Flutter Error', details.exception, details.stack);
    Zone.current.handleUncaughtError(details.exception, details.stack ?? StringStackTrace(details.stack.toString()));
  };

  runZonedGuarded<void>(_run, (error, stackTrace) async {
    AppTalker.error('Unexpected error', error, stackTrace);
  });
}

Future<void> _run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Инициализация определения типа устройства (телефон/планшет)
  await DeviceUtils.initialize();

  /// Задаем только портретный режим
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Задаем цвета статусбара.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark));

  /// Задаем обработку SSL.
  HttpOverrides.global = SSlHttpOverrides();

  if (!kIsWeb) {
  } else {
    MetaSEO().config();
  }

  /// Инициализация ServiceLocator (должна быть до Firebase, чтобы зависимости были доступны)
  await setupDependencies();

  await AppFirebase().init();

  Bloc.observer = AppBlocObserver.instance();
  Bloc.transformer = bloc_concurrency.sequential<Object?>();

  setPathUrlStrategy();

  runApp(
    TalkerWrapper(
      talker: AppTalker.instance,
      child: ScreenUtilInit(
        enableScaleWH: () => !kIsWeb, // Отключаем масштабирование ширины/высоты на вебе
        enableScaleText: () => !kIsWeb, // Отключаем масштабирование текста на вебе
        designSize: const Size(375, 812),
        minTextAdapt: !kIsWeb, // Отключаем адаптацию текста на вебе
        splitScreenMode: !kIsWeb, // Отключаем splitScreenMode на вебе
        rebuildFactor: kIsWeb ? RebuildFactors.none : RebuildFactors.size, // Не пересчитывать на вебе
        useInheritedMediaQuery: true,
        ensureScreenSize: !kIsWeb, // Отключаем ensureScreenSize на вебе
        fontSizeResolver: kIsWeb
            ? (fontSize, screenUtil) => fontSize
                  .toDouble() // На вебе возвращаем исходный размер
            : (fontSize, screenUtil) {
                // Используем минимальную сторону экрана для масштабирования
                // Это гарантирует, что размеры остаются стабильными при повороте
                final screenWidth = screenUtil.screenWidth;
                final screenHeight = screenUtil.screenHeight;
                final minDimension = screenWidth < screenHeight ? screenWidth : screenHeight;
                // Базовый дизайн: 375px (минимальная сторона в портретной ориентации)
                return (fontSize * (minDimension / 375.0)).toDouble();
              },
        child: EasyLocalization(
          supportedLocales: [Locale('en', 'EN'), Locale('ru', 'RU')],
          path: 'assets/translations',
          useOnlyLangCode: false,
          // startLocale: Locale('en', 'EN'),
          startLocale: Locale('ru', 'RU'),
          child: BlocProvider<InternetConnectionBloc>(
            create: (context) => InternetConnectionBloc()..add(const InternetConnectionEvent.startMonitoring()),
            lazy: false,
          child: AppWrapper(child: const App()),
          ),
        ),
      ),
    ),
  );
}
