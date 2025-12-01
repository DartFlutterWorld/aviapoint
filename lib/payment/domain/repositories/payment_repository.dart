import 'package:aviapoint/payment/domain/entities/payment_entity.dart';
import 'package:aviapoint/payment/domain/entities/subscription_type.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';

abstract class PaymentRepository {
  /// Создание платежа
  Future<PaymentEntity> createPayment({
    required double amount,
    required String currency,
    required String description,
    required int userId,
    required SubscriptionType subscriptionType,
    required int periodDays,
    String? customerPhone,
    String? returnUrl,
    String? cancelUrl,
  });

  /// Получение статуса платежа
  Future<PaymentEntity> getPaymentStatus(String paymentId);

  /// Проверка статуса подписки пользователя
  Future<SubscriptionDto?> getSubscriptionStatus();
}
