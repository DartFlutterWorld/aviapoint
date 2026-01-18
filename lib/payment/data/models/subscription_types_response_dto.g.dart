// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_types_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionTypesResponseDto _$SubscriptionTypesResponseDtoFromJson(
  Map<String, dynamic> json,
) => _SubscriptionTypesResponseDto(
  subscriptionTypes: (json['subscription_types'] as List<dynamic>)
      .map((e) => SubscriptionTypeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubscriptionTypesResponseDtoToJson(
  _SubscriptionTypesResponseDto instance,
) => <String, dynamic>{'subscription_types': instance.subscriptionTypes};
