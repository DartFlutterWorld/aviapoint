// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateBookingRequestDto _$CreateBookingRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateBookingRequestDto(
  flightId: (json['flight_id'] as num).toInt(),
  seatsCount: (json['seats_count'] as num).toInt(),
);

Map<String, dynamic> _$CreateBookingRequestDtoToJson(
  _CreateBookingRequestDto instance,
) => <String, dynamic>{
  'flight_id': instance.flightId,
  'seats_count': instance.seatsCount,
};
