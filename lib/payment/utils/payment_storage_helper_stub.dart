// Stub implementation for mobile platforms
Future<void> savePaymentId(String paymentId) async {
  // На мобильных не используем localStorage, payment_id сохраняется в состоянии
  // Это заглушка для совместимости
}

Future<String?> getPaymentId() async {
  // На мобильных не используем localStorage
  return null;
}

Future<void> clearPaymentId() async {
  // На мобильных не используем localStorage
}
