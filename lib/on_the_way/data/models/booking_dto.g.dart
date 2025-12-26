// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingDto _$BookingDtoFromJson(Map<String, dynamic> json) => _BookingDto(
  id: _intFromJson(json['id']),
  flightId: _intFromJson(json['flight_id']),
  passengerId: _intFromJson(json['passenger_id']),
  seatsCount: _intFromJson(json['seats_count']),
  totalPrice: _intFromJson(json['total_price']),
  status: json['status'] as String?,
  createdAt: _dateTimeFromJsonNullable(json['created_at']),
  updatedAt: _dateTimeFromJsonNullable(json['updated_at']),
  passengerFirstName: json['passenger_first_name'] as String?,
  passengerLastName: json['passenger_last_name'] as String?,
  passengerAvatarUrl: json['passenger_avatar_url'] as String?,
  passengerAverageRating: _doubleFromJsonNullable(json['passenger_average_rating']),
);

Map<String, dynamic> _$BookingDtoToJson(_BookingDto instance) => <String, dynamic>{
  'id': instance.id,
  'flight_id': instance.flightId,
  'passenger_id': instance.passengerId,
  'seats_count': instance.seatsCount,
  'total_price': instance.totalPrice,
  'status': instance.status,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'passenger_first_name': instance.passengerFirstName,
  'passenger_last_name': instance.passengerLastName,
  'passenger_avatar_url': instance.passengerAvatarUrl,
  'passenger_average_rating': instance.passengerAverageRating,
};
