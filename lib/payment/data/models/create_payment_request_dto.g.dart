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
  userId: (json['user_id'] as num).toInt(),
  subscriptionTypeId: (json['subscription_type_id'] as num).toInt(),
  periodDays: (json['period_days'] as num).toInt(),
  customerPhone: json['customer_phone'] as String?,
  returnUrl: json['return_url'] as String?,
);

Map<String, dynamic> _$CreatePaymentRequestDtoToJson(
  _CreatePaymentRequestDto instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'description': instance.description,
  'user_id': instance.userId,
  'subscription_type_id': instance.subscriptionTypeId,
  'period_days': instance.periodDays,
  'customer_phone': instance.customerPhone,
  'return_url': instance.returnUrl,
};
