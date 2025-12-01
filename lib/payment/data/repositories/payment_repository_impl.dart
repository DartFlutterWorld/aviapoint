import 'package:dio/dio.dart';
import 'package:aviapoint/payment/data/datasources/payment_service.dart';
import 'package:aviapoint/payment/data/models/create_payment_request_dto.dart';
import 'package:aviapoint/payment/data/models/payment_dto.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';
import 'package:aviapoint/payment/domain/entities/payment_entity.dart';
import 'package:aviapoint/payment/domain/entities/subscription_type.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentService _paymentService;

  PaymentRepositoryImpl({required PaymentService paymentService}) : _paymentService = paymentService;

  @override
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
  }) async {
    try {
      // ЮKassa требует, чтобы return_url и cancel_url начинались с http:// или https://
      // Используем переданные URL как есть (они должны быть валидными HTTP URL)
      final request = CreatePaymentRequestDto(
        amount: amount,
        currency: currency,
        description: description,
        userId: userId,
        subscriptionType: subscriptionType,
        periodDays: periodDays,
        customerPhone: customerPhone,
        returnUrl: returnUrl,
        cancelUrl: cancelUrl,
      );

      // Явно сериализуем в JSON перед отправкой
      final jsonData = request.toJson();

      // Удаляем null значения из JSON, чтобы бэкенд не получал null вместо строк
      jsonData.removeWhere((key, value) => value == null);

      final dto = await _paymentService.createPayment(jsonData);
      return _mapDtoToEntity(dto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PaymentEntity> getPaymentStatus(String paymentId) async {
    try {
      final dto = await _paymentService.getPaymentStatus(paymentId);
      return _mapDtoToEntity(dto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SubscriptionDto?> getSubscriptionStatus() async {
    try {
      return await _paymentService.getSubscriptionStatus();
    } on DioException catch (e) {
      // Если подписка не найдена (404) - возвращаем null
      if (e.response?.statusCode == 404) {
        return null;
      }
      // Для других ошибок пробрасываем исключение
      rethrow;
    } catch (e) {
      // Для других типов ошибок возвращаем null
      return null;
    }
  }

  PaymentEntity _mapDtoToEntity(PaymentDto dto) {
    return PaymentEntity(
      id: dto.id,
      status: dto.status,
      amount: dto.amount,
      currency: dto.currency,
      description: dto.description,
      paymentUrl: dto.paymentUrl,
      confirmationToken: dto.confirmationToken,
      createdAt: dto.createdAt != null ? DateTime.tryParse(dto.createdAt!) : null,
      paid: dto.paid,
    );
  }
}
