// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) =>
    _SubscriptionDto(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      paymentId: json['payment_id'] as String,
      subscriptionTypeId: (json['subscription_type_id'] as num).toInt(),
      periodDays: (json['period_days'] as num).toInt(),
      startDate: _dateTimeFromJson(json['start_date']),
      endDate: _dateTimeFromJson(json['end_date']),
      isActive: json['is_active'] as bool,
      createdAt: _dateTimeFromJson(json['created_at']),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$SubscriptionDtoToJson(_SubscriptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'payment_id': instance.paymentId,
      'subscription_type_id': instance.subscriptionTypeId,
      'period_days': instance.periodDays,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'amount': instance.amount,
    };
