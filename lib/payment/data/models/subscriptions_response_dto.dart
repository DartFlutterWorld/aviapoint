import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';

part 'subscriptions_response_dto.freezed.dart';
part 'subscriptions_response_dto.g.dart';

@freezed
abstract class SubscriptionsResponseDto with _$SubscriptionsResponseDto {
  const factory SubscriptionsResponseDto({required List<SubscriptionDto> subscriptions}) = _SubscriptionsResponseDto;

  factory SubscriptionsResponseDto.fromJson(Map<String, dynamic> json) => _$SubscriptionsResponseDtoFromJson(json);
}
