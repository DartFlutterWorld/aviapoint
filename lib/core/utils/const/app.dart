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
/// Если путь уже начинается с /public/, возвращает как есть
/// Если нет, добавляет префикс /public/
String getImageUrl(String? imagePath) {
  if (imagePath == null || imagePath.isEmpty) {
    return '';
  }

  // Если путь уже начинается с /public/, возвращаем как есть
  if (imagePath.startsWith('/public/')) {
    return Environment.apiUrl + imagePath;
  }

  // Если путь начинается с /, но не с /public/, добавляем /public/
  if (imagePath.startsWith('/')) {
    return Environment.apiUrl + '/public' + imagePath;
  }

  // Если путь не начинается с /, добавляем /public/
  return Environment.apiUrl + '/public/' + imagePath;
}
