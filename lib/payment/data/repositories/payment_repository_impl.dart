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

      // Логируем запрос для отладки
      print('🔵 Payment Request JSON:');
      print(jsonData);
      print('🔵 Subscription Type: ${request.subscriptionType.value}');
      print('🔵 Return URL: ${request.returnUrl}');
      print('🔵 Cancel URL: ${request.cancelUrl}');

      try {
        final dto = await _paymentService.createPayment(jsonData);
        return _mapDtoToEntity(dto);
      } on DioException catch (e) {
        // Логируем детали ошибки для отладки
        print('❌ Payment Error:');
        print('   Status Code: ${e.response?.statusCode}');
        print('   Response Data: ${e.response?.data}');
        print('   Request Data: ${jsonData}');
        rethrow;
      }
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
  Future<List<SubscriptionDto>> getSubscriptionStatus() async {
    try {
      final response = await _paymentService.getSubscriptionStatus();

      if (response.subscriptions.isEmpty) {
        return [];
      }

      // Сортируем по end_date (самая поздняя первая)
      final subscriptions = List<SubscriptionDto>.from(response.subscriptions);
      subscriptions.sort((a, b) => b.endDate.compareTo(a.endDate));

      return subscriptions;
    } on DioException catch (e) {
      // Если подписка не найдена (404) или пользователь не авторизован (401) - возвращаем пустой список
      if (e.response?.statusCode == 404 || e.response?.statusCode == 401) {
        return [];
      }

      // Если ошибка 400 (Bad Request) - вероятно проблема с сериализацией на бэкенде
      if (e.response?.statusCode == 400) {
        print('⚠️  Ошибка 400 при получении подписки. Возможно, проблема с сериализацией DateTime на бэкенде.');
        print('   Ошибка: ${e.response?.data}');
        return []; // Возвращаем пустой список вместо ошибки
      }

      // Проверяем, не вернул ли сервер HTML вместо JSON (SPA роутинг)
      final responseData = e.response?.data;
      if (responseData is String && responseData.contains('<!DOCTYPE html>')) {
        print('⚠️  Сервер вернул HTML вместо JSON. Возможно, неправильный baseUrl или маршрут не проксируется.');
        print('   URL: ${e.requestOptions.uri}');
        print('   Base URL: ${e.requestOptions.baseUrl}');
        return []; // Возвращаем пустой список вместо ошибки
      }

      // Для других ошибок пробрасываем исключение
      rethrow;
    } catch (e, stackTrace) {
      // Проверяем, не является ли ошибка попыткой распарсить HTML как JSON
      final errorString = e.toString();
      if (errorString.contains('type \'String\' is not a subtype of type \'Map') || errorString.contains('<!DOCTYPE html>') || errorString.contains('DioException [unknown]')) {
        print('⚠️  Ошибка парсинга: сервер вернул HTML вместо JSON');
        print('   Ошибка: $e');
        return []; // Возвращаем пустой список вместо ошибки
      }

      // Логируем неожиданные ошибки для отладки
      print('⚠️  Неожиданная ошибка при проверке подписки: $e');
      print('   StackTrace: $stackTrace');

      // Для других типов ошибок возвращаем пустой список (не показываем ошибку пользователю)
      return [];
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
