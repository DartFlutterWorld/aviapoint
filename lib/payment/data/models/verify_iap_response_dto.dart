import 'package:json_annotation/json_annotation.dart';

part 'verify_iap_response_dto.g.dart';

@JsonSerializable()
class VerifyIAPResponseDto {
  final String status;
  final String? message;
  final String? paymentId;
  final String? transactionId;
  final String? productId;
  final String? expiresDate;
  final String? error;
  final String? details;

  VerifyIAPResponseDto({
    required this.status,
    this.message,
    this.paymentId,
    this.transactionId,
    this.productId,
    this.expiresDate,
    this.error,
    this.details,
  });

  factory VerifyIAPResponseDto.fromJson(Map<String, dynamic> json) => _$VerifyIAPResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyIAPResponseDtoToJson(this);
}
