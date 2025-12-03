import 'package:aviapoint/config/environment.dart';
import 'package:flutter/foundation.dart';

// Conditional import: use dart:html on web, stub on mobile
import 'payment_url_helper_stub.dart' if (dart.library.html) 'payment_url_helper_web.dart' as html;

/// Вспомогательный класс для генерации URL для платежей
class PaymentUrlHelper {
  /// Генерирует URL для успешного возврата после оплаты
  /// ЮKassa требует полные HTTP/HTTPS URL, поэтому всегда возвращаем полный URL
  static String buildReturnUrl() {
    if (kIsWeb) {
      // На веб используем текущий origin (протокол + хост + порт)
      final origin = html.getWindowOrigin();
      return '$origin/payments/return';
    } else {
      // На мобильных используем Environment.apiUrl
      final baseUrl = Environment.apiUrl;
      final url = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      return '${url}payments/return';
    }
  }

  /// Генерирует URL для отмены платежа
  /// ЮKassa требует полные HTTP/HTTPS URL, поэтому всегда возвращаем полный URL
  static String buildCancelUrl() {
    if (kIsWeb) {
      // На веб используем текущий origin (протокол + хост + порт)
      final origin = html.getWindowOrigin();
      return '$origin/payments/cancel';
    } else {
      // На мобильных используем Environment.apiUrl
      final baseUrl = Environment.apiUrl;
      final url = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      return '${url}payments/cancel';
    }
  }
}
