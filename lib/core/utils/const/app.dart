// Импортируем Environment
import 'package:aviapoint/config/environment.dart';

// ===== ПЕРЕКЛЮЧАТЕЛЬ СЕРВЕРА =====
// Окружения контролируются через build flags в Environment
//
// Development (по умолчанию):
// flutter run -d chrome
// flutter build web --release
//
// Production (для VPS):
// flutter build web --release --dart-define=isDevelopment=false
//
// Локальные и удаленные URL серверов (для совместимости)
const String localServerUrl = 'http://0.0.0.0:8080/'; // Development
const String remoteServerUrl = 'https://avia-point.com/'; // Production

// Получить текущий URL на основе Environment
// Параметр useLocal игнорируется, всегда используется Environment.apiUrl
String getBackUrl({bool useLocal = true}) {
  return Environment.apiUrl;
}

/// Получить URL для изображения/видео из папки public
/// В development: использует путь как есть (бэкенд отдает без /public/)
/// В production: добавляет префикс /public/ (Nginx отдает из /app/public/)
String getImageUrl(String? imagePath) {
  if (imagePath == null || imagePath.isEmpty) {
    return '';
  }

  // Нормализуем baseUrl: убираем завершающий слеш, если есть
  String baseUrl = Environment.apiUrl;
  if (baseUrl.endsWith('/')) {
    baseUrl = baseUrl.substring(0, baseUrl.length - 1);
  }

  // В development: бэкенд отдает файлы напрямую по /stories/, /news/ и т.д. (без /public/)
  if (Environment.isDevelopment) {
    // Если путь уже начинается с /, используем как есть
    if (imagePath.startsWith('/')) {
      return baseUrl + imagePath;
    }
    // Если путь не начинается с /, добавляем /
    return baseUrl + '/' + imagePath;
  }

  // В production: Nginx отдает файлы из /app/public/, поэтому добавляем /public/
  // Если путь уже начинается с /public/, возвращаем как есть
  if (imagePath.startsWith('/public/')) {
    return baseUrl + imagePath;
  }

  // Если путь начинается с /, но не с /public/, добавляем /public/
  if (imagePath.startsWith('/')) {
    return baseUrl + '/public' + imagePath;
  }

  // Если путь не начинается с /, добавляем /public/
  return baseUrl + '/public/' + imagePath;
}
