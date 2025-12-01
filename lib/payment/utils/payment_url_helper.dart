import 'package:aviapoint/config/environment.dart';
import 'package:flutter/foundation.dart';

/// Вспомогательный класс для генерации URL для платежей
class PaymentUrlHelper {
  /// Генерирует URL для успешного возврата после оплаты
  static String buildReturnUrl() {
    final baseUrl = Environment.apiUrl;
    if (kIsWeb && !Environment.isDevelopment) {
      // На веб в production используем относительный путь
      return '/payments/return';
    } else {
      // На мобильных или в development используем полный URL
      final url = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      return '${url}payments/return';
    }
  }

  /// Генерирует URL для отмены платежа
  static String buildCancelUrl() {
    final baseUrl = Environment.apiUrl;
    if (kIsWeb && !Environment.isDevelopment) {
      // На веб в production используем относительный путь
      return '/payments/cancel';
    } else {
      // На мобильных или в development используем полный URL
      final url = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      return '${url}payments/cancel';
    }
  }
}
