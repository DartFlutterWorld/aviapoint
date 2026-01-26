import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:dio/dio.dart';

/// Сервис проверки актуальности версии приложения через сторы
class AppVersionChecker {
  static const String _androidId = 'ru.dartflutter.aviapoint';
  static const String _iosId = '6757299344';
  static const String _googlePlayUrl = 'https://play.google.com/store/apps/details?id=$_androidId';
  static const String _appStoreUrl = 'https://apps.apple.com/app/id$_iosId';

  static final Dio _dio = Dio();

  /// Проверяет, нужно ли обновление приложения.
  /// Сравнивает текущую версию с версией в сторе.
  static Future<bool> checkForUpdate() async {
    if (kIsWeb) {
      // На вебе не проверяем версию приложения
      return false;
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      final currentBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;

      debugPrint('📱 Текущая версия: $currentVersion (build: $currentBuildNumber)');

      String? storeVersion;
      int? storeBuildNumber;

      if (Platform.isAndroid) {
        final versionInfo = await _getGooglePlayVersion();
        storeVersion = versionInfo['version'];
        storeBuildNumber = versionInfo['buildNumber'];
        debugPrint('🏪 Google Play версия: $storeVersion (build: $storeBuildNumber)');
      } else if (Platform.isIOS) {
        final versionInfo = await _getAppStoreVersion();
        storeVersion = versionInfo['version'];
        storeBuildNumber = versionInfo['buildNumber'];
        debugPrint('🏪 App Store версия: $storeVersion (build: $storeBuildNumber)');
      }

      if (storeVersion == null) {
        debugPrint('⚠️ Не удалось получить версию из стора');
        return false;
      }

      // Если build number не найден, сравниваем только версию
      if (storeBuildNumber == null || storeBuildNumber == 0) {
        debugPrint('⚠️ Build number не найден, сравниваем только версию');
        final versionCompare = _compareVersions(storeVersion, currentVersion);
        debugPrint('📊 Сравнение версий: $versionCompare (1 = store новее, -1 = текущая новее, 0 = равны)');
        return versionCompare > 0;
      }

      // Сравниваем build number (более надежно, чем версия)
      if (storeBuildNumber > currentBuildNumber) {
        debugPrint('✅ Обновление необходимо: build number в сторе ($storeBuildNumber) > текущий ($currentBuildNumber)');
        return true;
      }

      // Если build number одинаковый, сравниваем версию
      if (storeBuildNumber == currentBuildNumber) {
        final versionCompare = _compareVersions(storeVersion, currentVersion);
        debugPrint('📊 Build numbers равны, сравниваем версии: $versionCompare');
        return versionCompare > 0;
      }

      debugPrint('❌ Обновление не требуется: текущая версия актуальна');
      return false;
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка при проверке версии: $e');
      debugPrint('Stack trace: $stackTrace');
      return false;
    }
  }

  /// Получает версию из Google Play
  static Future<Map<String, dynamic>> _getGooglePlayVersion() async {
    try {
      final response = await _dio.get<String>(
        _googlePlayUrl,
        options: Options(
          headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7',
          },
        ),
      );
      
      if (response.statusCode == 200 && response.data != null) {
        final html = response.data!;
        debugPrint('📄 Получен HTML от Google Play, длина: ${html.length} символов');
        
        // Пробуем разные паттерны для поиска версии в Google Play HTML
        List<RegExp> patterns = [
          // Паттерн 1: В структурированных данных JSON-LD (самый надежный)
          RegExp(r'"softwareVersion"\s*:\s*"([^"]+)"', caseSensitive: false),
          RegExp(r'"version"\s*:\s*"([^"]+)"', caseSensitive: false),
          
          // Паттерн 2: В тексте "Версия" или "Version" с цифрами после
          RegExp(r'(?:Версия|Version)[\s:]+(\d+\.\d+(?:\.\d+)?)', caseSensitive: false),
          
          // Паттерн 3: В div с классом или атрибутом version
          RegExp(r'<[^>]*version[^>]*>([^<]*\d+\.\d+(?:\.\d+)?)', caseSensitive: false),
          
          // Паттерн 4: В span или div с текстом версии
          RegExp(r'<[^>]*>([^<]*(?:Версия|Version)[^<]*\d+\.\d+(?:\.\d+)?)', caseSensitive: false),
          
          // Паттерн 5: Просто ищем формат версии X.X.X или X.X
          RegExp(r'\b(\d+\.\d+(?:\.\d+)?)\b', caseSensitive: false),
        ];
        
        String? foundVersion;
        for (final pattern in patterns) {
          final matches = pattern.allMatches(html);
          for (final match in matches) {
            final candidate = match.group(1)?.trim();
            if (candidate != null && _isValidVersion(candidate)) {
              foundVersion = candidate;
              debugPrint('✅ Найдена версия паттерном ${patterns.indexOf(pattern) + 1}: $foundVersion');
              break;
            }
          }
          if (foundVersion != null) break;
        }
        
        if (foundVersion != null) {
          // Пытаемся найти build number из pubspec.yaml формата (version+buildNumber)
          int buildNumber = 0;
          
          // Если версия содержит "+", извлекаем build number
          if (foundVersion.contains('+')) {
            final parts = foundVersion.split('+');
            if (parts.length > 1) {
              buildNumber = int.tryParse(parts[1]) ?? 0;
              foundVersion = parts[0]; // Убираем build number из версии
            }
          }
          
          return {
            'version': foundVersion,
            'buildNumber': buildNumber,
          };
        } else {
          debugPrint('⚠️ Версия не найдена в HTML Google Play');
          // Ищем ключевые слова в HTML для отладки
          if (html.contains('Версия') || html.contains('Version')) {
            debugPrint('💡 В HTML есть слово "Версия/Version", но паттерны не сработали');
          }
          // Сохраняем часть HTML для отладки (ищем участок с информацией о версии)
          final versionSection = html.contains('Версия') 
              ? html.substring(html.indexOf('Версия') - 100, html.indexOf('Версия') + 500)
              : (html.contains('Version') 
                  ? html.substring(html.indexOf('Version') - 100, html.indexOf('Version') + 500)
                  : html.substring(0, 1000));
          debugPrint('📄 HTML фрагмент для отладки: $versionSection');
        }
      } else {
        debugPrint('❌ Неверный статус ответа от Google Play: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка при получении версии из Google Play: $e');
      debugPrint('Stack trace: $stackTrace');
    }
    
    return {'version': null, 'buildNumber': null};
  }

  /// Проверяет, является ли строка валидной версией (формат X.X или X.X.X)
  static bool _isValidVersion(String version) {
    final parts = version.split('.');
    if (parts.length < 2 || parts.length > 3) return false;
    
    for (final part in parts) {
      if (int.tryParse(part.trim()) == null) return false;
    }
    
    return true;
  }

  /// Получает версию из App Store
  static Future<Map<String, dynamic>> _getAppStoreVersion() async {
    try {
      final response = await _dio.get<String>(_appStoreUrl);
      
      if (response.statusCode == 200 && response.data != null) {
        final html = response.data!;
        
        // Парсим версию из HTML App Store
        // Ищем паттерн "version" или "Версия" в метаданных
        final versionRegex = RegExp(r'"version":"([^"]+)"', caseSensitive: false);
        final versionMatch = versionRegex.firstMatch(html);
        
        if (versionMatch != null) {
          final version = versionMatch.group(1);
          // Для App Store build number обычно не доступен через HTML
          return {
            'version': version,
            'buildNumber': 0,
          };
        }
      }
    } catch (e) {
      debugPrint('Ошибка при получении версии из App Store: $e');
    }
    
    return {'version': null, 'buildNumber': null};
  }

  /// Сравнивает две версии (например, "1.2.3" и "1.2.4")
  /// Возвращает: 1 если version1 > version2, -1 если version1 < version2, 0 если равны
  static int _compareVersions(String version1, String version2) {
    final parts1 = version1.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final parts2 = version2.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    
    // Дополняем до одинаковой длины нулями
    while (parts1.length < parts2.length) parts1.add(0);
    while (parts2.length < parts1.length) parts2.add(0);
    
    for (int i = 0; i < parts1.length; i++) {
      if (parts1[i] > parts2[i]) return 1;
      if (parts1[i] < parts2[i]) return -1;
    }
    
    return 0;
  }

  /// URL соответствующего стора для текущей платформы
  static String getStoreUrl() {
    if (Platform.isAndroid) {
      return _googlePlayUrl;
    } else if (Platform.isIOS) {
      return _appStoreUrl;
    }
    return '';
  }
}
