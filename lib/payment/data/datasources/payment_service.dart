import 'package:aviapoint/payment/data/models/create_payment_request_dto.dart';
import 'package:aviapoint/payment/data/models/payment_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_service.g.dart';

@RestApi()
abstract class PaymentService {
  factory PaymentService(Dio dio) = _PaymentService;

  /// Создание платежа
  @POST('/payments/create')
  Future<PaymentDto> createPayment(@Body() CreatePaymentRequestDto request);

  /// Проверка статуса платежа
  @GET('/payments/{paymentId}/status')
  Future<PaymentDto> getPaymentStatus(@Path('paymentId') String paymentId);
}
