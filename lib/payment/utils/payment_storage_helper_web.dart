// Web implementation using dart:html
import 'dart:html' as html_web;

const String _paymentIdKey = 'payment_id';

Future<void> savePaymentId(String paymentId) async {
  html_web.window.localStorage[_paymentIdKey] = paymentId;
}

Future<String?> getPaymentId() async {
  return html_web.window.localStorage[_paymentIdKey];
}

Future<void> clearPaymentId() async {
  html_web.window.localStorage.remove(_paymentIdKey);
}
