import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payment_request_dto.freezed.dart';
part 'create_payment_request_dto.g.dart';

@freezed
abstract class CreatePaymentRequestDto with _$CreatePaymentRequestDto {
  const factory CreatePaymentRequestDto({
    required double amount,
    required String currency,
    required String description,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'subscription_type_id') required int subscriptionTypeId,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    @JsonKey(name: 'return_url') String? returnUrl,
  }) = _CreatePaymentRequestDto;

  factory CreatePaymentRequestDto.fromJson(Map<String, dynamic> json) => _$CreatePaymentRequestDtoFromJson(json);
}
