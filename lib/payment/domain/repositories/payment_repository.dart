import 'package:aviapoint/payment/domain/entities/payment_entity.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';

abstract class PaymentRepository {
  /// Создание платежа
  Future<PaymentEntity> createPayment({
    required double amount,
    required String currency,
    required String description,
    required int userId,
    required int subscriptionTypeId,
    required int periodDays,
    String? customerPhone,
    String? returnUrl,
  });

  /// Получение статуса платежа
  Future<PaymentEntity> getPaymentStatus(String paymentId);

  /// Проверка статуса подписки пользователя
  /// Возвращает список всех подписок пользователя
  Future<List<SubscriptionDto>> getSubscriptionStatus();

  /// Получение списка типов подписок
  Future<List<SubscriptionTypeModel>> getSubscriptionTypes();
}
