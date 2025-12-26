// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentDto _$PaymentDtoFromJson(Map<String, dynamic> json) => _PaymentDto(
  id: json['id'] as String,
  status: json['status'] as String,
  amount: _amountFromJson(json['amount']),
  currency: json['currency'] as String,
  description: json['description'] as String?,
  paymentUrl: json['payment_url'] as String?,
  confirmationToken: json['confirmation_token'] as String?,
  createdAt: json['created_at'] as String?,
  paid: json['paid'] as bool?,
);

Map<String, dynamic> _$PaymentDtoToJson(_PaymentDto instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'amount': instance.amount,
  'currency': instance.currency,
  'description': instance.description,
  'payment_url': instance.paymentUrl,
  'confirmation_token': instance.confirmationToken,
  'created_at': instance.createdAt,
  'paid': instance.paid,
};
