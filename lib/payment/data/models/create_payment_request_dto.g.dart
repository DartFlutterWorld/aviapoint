// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePaymentRequestDto _$CreatePaymentRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreatePaymentRequestDto(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
  description: json['description'] as String,
  returnUrl: json['return_url'] as String?,
  cancelUrl: json['cancel_url'] as String?,
);

Map<String, dynamic> _$CreatePaymentRequestDtoToJson(
  _CreatePaymentRequestDto instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'description': instance.description,
  'return_url': instance.returnUrl,
  'cancel_url': instance.cancelUrl,
};
