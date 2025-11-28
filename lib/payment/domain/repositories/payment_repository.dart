import 'package:aviapoint/payment/domain/entities/payment_entity.dart';

abstract class PaymentRepository {
  /// Создание платежа
  Future<PaymentEntity> createPayment({required double amount, required String currency, required String description, String? returnUrl, String? cancelUrl});

  /// Получение статуса платежа
  Future<PaymentEntity> getPaymentStatus(String paymentId);
}
