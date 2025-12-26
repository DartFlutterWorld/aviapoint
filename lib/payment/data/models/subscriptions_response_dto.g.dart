// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionsResponseDto _$SubscriptionsResponseDtoFromJson(Map<String, dynamic> json) => _SubscriptionsResponseDto(
  subscriptions: (json['subscriptions'] as List<dynamic>)
      .map((e) => SubscriptionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubscriptionsResponseDtoToJson(_SubscriptionsResponseDto instance) => <String, dynamic>{
  'subscriptions': instance.subscriptions,
};
