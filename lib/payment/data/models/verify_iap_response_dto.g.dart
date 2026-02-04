// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_iap_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyIAPResponseDto _$VerifyIAPResponseDtoFromJson(
  Map<String, dynamic> json,
) => VerifyIAPResponseDto(
  status: json['status'] as String,
  message: json['message'] as String?,
  paymentId: json['paymentId'] as String?,
  transactionId: json['transactionId'] as String?,
  productId: json['productId'] as String?,
  expiresDate: json['expiresDate'] as String?,
  error: json['error'] as String?,
  details: json['details'] as String?,
);

Map<String, dynamic> _$VerifyIAPResponseDtoToJson(
  VerifyIAPResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'paymentId': instance.paymentId,
  'transactionId': instance.transactionId,
  'productId': instance.productId,
  'expiresDate': instance.expiresDate,
  'error': instance.error,
  'details': instance.details,
};
