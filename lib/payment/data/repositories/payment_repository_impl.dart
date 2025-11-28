import 'package:aviapoint/payment/data/datasources/payment_service.dart';
import 'package:aviapoint/payment/data/models/create_payment_request_dto.dart';
import 'package:aviapoint/payment/data/models/payment_dto.dart';
import 'package:aviapoint/payment/domain/entities/payment_entity.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentService _paymentService;

  PaymentRepositoryImpl({required PaymentService paymentService}) : _paymentService = paymentService;

  @override
  Future<PaymentEntity> createPayment({required double amount, required String currency, required String description, String? returnUrl, String? cancelUrl}) async {
    try {
      final request = CreatePaymentRequestDto(amount: amount, currency: currency, description: description, returnUrl: returnUrl, cancelUrl: cancelUrl);

      final dto = await _paymentService.createPayment(request);
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
