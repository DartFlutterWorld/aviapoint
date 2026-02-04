import 'package:aviapoint/payment/data/models/payment_dto.dart';
import 'package:aviapoint/payment/data/models/subscriptions_response_dto.dart';
import 'package:aviapoint/payment/data/models/subscription_types_response_dto.dart';
import 'package:aviapoint/payment/data/models/verify_iap_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_service.g.dart';

@RestApi()
abstract class PaymentService {
  factory PaymentService(Dio dio) = _PaymentService;

  /// Создание платежа
  @POST('/api/payments/create')
  Future<PaymentDto> createPayment(@Body() Map<String, dynamic> request);

  /// Проверка статуса платежа
  @GET('/api/payments/{paymentId}/status')
  Future<PaymentDto> getPaymentStatus(@Path('paymentId') String paymentId);

  /// Проверка статуса подписки пользователя
  @GET('/api/subscriptions/active')
  Future<SubscriptionsResponseDto> getSubscriptionStatus();

  /// Получение списка типов подписок
  @GET('/api/subscriptions/types')
  Future<SubscriptionTypesResponseDto> getSubscriptionTypes();

  /// Верификация Apple In-App Purchase
  @POST('/api/payments/verify-iap')
  Future<VerifyIAPResponseDto> verifyIAP(@Body() Map<String, dynamic> request);
}
