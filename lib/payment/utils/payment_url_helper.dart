import 'package:aviapoint/config/environment.dart';
import 'package:flutter/foundation.dart';

// Conditional import: use dart:html on web, stub on mobile
import 'payment_url_helper_stub.dart' if (dart.library.html) 'payment_url_helper_web.dart' as html;

/// Вспомогательный класс для генерации URL для платежей
class PaymentUrlHelper {
  /// Генерирует URL для успешного возврата после оплаты
  /// ЮKassa требует полные HTTP/HTTPS URL, поэтому всегда возвращаем полный URL
  /// [source] - опциональный параметр для указания исходного экрана (например, 'profile' или 'testing_mode')
  static String buildReturnUrl({String? source}) {
    if (kIsWeb) {
      // На веб используем текущий origin (протокол + хост + порт)
      // Передаем прямой путь к экрану, чтобы ЮКасса редиректила туда при нажатии "Вернуться на сайт"
      // Статус платежа проверяется по payment_id из localStorage, параметр payment=success не нужен
      final origin = html.getWindowOrigin();
      if (source == 'profile') {
        return '$origin/profile';
      } else if (source == 'testing_mode') {
        return '$origin/learning/testing_mode';
      }
      // По умолчанию возвращаем на профиль
      return '$origin/profile';
    } else {
      // На мобильных используем Environment.apiUrl
      final baseUrl = Environment.apiUrl;
      final url = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      if (source != null) {
        return '${url}payments/return?source=$source';
      }
      return '${url}payments/return';
    }
  }
}
