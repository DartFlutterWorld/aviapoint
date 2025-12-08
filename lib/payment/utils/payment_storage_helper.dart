// Conditional import: use dart:html on web, stub on mobile
import 'payment_storage_helper_stub.dart' if (dart.library.html) 'payment_storage_helper_web.dart' as storage;

/// Вспомогательный класс для работы с localStorage на веб
class PaymentStorageHelper {
  /// Сохраняет payment_id в localStorage (веб) или в памяти (мобильные)
  static Future<void> savePaymentId(String paymentId) async {
    await storage.savePaymentId(paymentId);
  }

  /// Читает payment_id из localStorage (веб) или из памяти (мобильные)
  static Future<String?> getPaymentId() async {
    return await storage.getPaymentId();
  }

  /// Удаляет payment_id из хранилища
  static Future<void> clearPaymentId() async {
    await storage.clearPaymentId();
  }
}
