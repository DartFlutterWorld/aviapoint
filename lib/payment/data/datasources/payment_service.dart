import 'package:aviapoint/payment/data/models/payment_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_service.g.dart';

@RestApi()
abstract class PaymentService {
  factory PaymentService(Dio dio) = _PaymentService;

  /// Создание платежа
  @POST('/payments/create')
  Future<PaymentDto> createPayment(@Body() Map<String, dynamic> request);

  /// Проверка статуса платежа
  @GET('/payments/{paymentId}/status')
  Future<PaymentDto> getPaymentStatus(@Path('paymentId') String paymentId);

  /// Проверка статуса подписки пользователя
  @GET('/subscriptions/active')
  Future<Map<String, dynamic>> getSubscriptionStatus();
}
