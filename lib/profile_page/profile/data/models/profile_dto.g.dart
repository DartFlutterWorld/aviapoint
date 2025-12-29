// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => _ProfileDto(
  id: (json['id'] as num).toInt(),
  phone: json['phone'] as String,
  email: json['email'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  telegram: json['telegram'] as String?,
  max: json['max'] as String?,
  averageRating: _doubleFromJsonNullable(json['average_rating']),
  reviewsCount: _intFromJsonNullable(json['reviews_count']),
  ownedAirports: json['owned_airports'],
);

Map<String, dynamic> _$ProfileDtoToJson(_ProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
      'telegram': instance.telegram,
      'max': instance.max,
      'average_rating': instance.averageRating,
      'reviews_count': instance.reviewsCount,
      'owned_airports': instance.ownedAirports,
    };
