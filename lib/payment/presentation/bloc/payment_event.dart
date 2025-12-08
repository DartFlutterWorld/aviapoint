import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_event.freezed.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  /// Создание платежа
  const factory PaymentEvent.createPayment({
    required double amount,
    required String currency,
    required String description,
    required int userId,
    required int subscriptionTypeId,
    required int periodDays,
    String? customerPhone,
    String? returnUrl,
  }) = CreatePaymentEvent;

  /// Проверка статуса платежа
  const factory PaymentEvent.checkPaymentStatus(String paymentId) = CheckPaymentStatusEvent;

  /// Сброс состояния
  const factory PaymentEvent.reset() = ResetPaymentEvent;
}
