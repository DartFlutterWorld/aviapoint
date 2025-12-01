import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_dto.freezed.dart';
part 'subscription_dto.g.dart';

@freezed
abstract class SubscriptionDto with _$SubscriptionDto {
  const factory SubscriptionDto({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'payment_id') required String paymentId,
    @JsonKey(name: 'subscription_type_id') required int subscriptionTypeId,
    @JsonKey(name: 'period_days') required int periodDays,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'auto_renew') @Default(false) bool autoRenew,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SubscriptionDto;

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) => _$SubscriptionDtoFromJson(json);
}
