// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionTypeModel _$SubscriptionTypeModelFromJson(Map<String, dynamic> json) => _SubscriptionTypeModel(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  periodDays: (json['period_days'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  isActive: json['is_active'] as bool,
  createdAt: _dateTimeFromJson(json['created_at']),
  description: json['description'] as String,
);

Map<String, dynamic> _$SubscriptionTypeModelToJson(_SubscriptionTypeModel instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'period_days': instance.periodDays,
  'price': instance.price,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'description': instance.description,
};
