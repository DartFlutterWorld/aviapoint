import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payment_request_dto.freezed.dart';
part 'create_payment_request_dto.g.dart';

@freezed
abstract class CreatePaymentRequestDto with _$CreatePaymentRequestDto {
  const factory CreatePaymentRequestDto({
    required double amount,
    required String currency,
    required String description,
    @JsonKey(name: 'return_url') String? returnUrl,
    @JsonKey(name: 'cancel_url') String? cancelUrl,
  }) = _CreatePaymentRequestDto;

  factory CreatePaymentRequestDto.fromJson(Map<String, dynamic> json) => _$CreatePaymentRequestDtoFromJson(json);
}
