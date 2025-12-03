import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_dto.freezed.dart';
part 'payment_dto.g.dart';

@freezed
abstract class PaymentDto with _$PaymentDto {
  const factory PaymentDto({
    required String id,
    required String status,
    @JsonKey(fromJson: _amountFromJson) required double amount,
    required String currency,
    String? description,
    @JsonKey(name: 'payment_url') String? paymentUrl,
    @JsonKey(name: 'confirmation_token') String? confirmationToken,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'paid') bool? paid,
  }) = _PaymentDto;

  factory PaymentDto.fromJson(Map<String, dynamic> json) => _$PaymentDtoFromJson(json);
}

/// Конвертер для amount: обрабатывает и строки, и числа
double _amountFromJson(dynamic value) {
  if (value is num) {
    return value.toDouble();
  }
  if (value is String) {
    return double.parse(value);
  }
  throw ArgumentError('Cannot convert $value (${value.runtimeType}) to double');
}

/// Статусы платежа
enum PaymentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('waiting_for_capture')
  waitingForCapture,
  @JsonValue('succeeded')
  succeeded,
  @JsonValue('canceled')
  canceled,
}
