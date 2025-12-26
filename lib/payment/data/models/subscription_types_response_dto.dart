import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';

part 'subscription_types_response_dto.freezed.dart';
part 'subscription_types_response_dto.g.dart';

@freezed
abstract class SubscriptionTypesResponseDto with _$SubscriptionTypesResponseDto {
  const factory SubscriptionTypesResponseDto({
    @JsonKey(name: 'subscription_types') required List<SubscriptionTypeModel> subscriptionTypes,
  }) = _SubscriptionTypesResponseDto;

  factory SubscriptionTypesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionTypesResponseDtoFromJson(json);
}
