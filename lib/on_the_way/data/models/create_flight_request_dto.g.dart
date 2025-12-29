// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flight_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateFlightRequestDto _$CreateFlightRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateFlightRequestDto(
  departureAirport: json['departure_airport'] as String,
  arrivalAirport: json['arrival_airport'] as String,
  departureDate: _dateTimeFromJson(json['departure_date']),
  availableSeats: (json['available_seats'] as num).toInt(),
  pricePerSeat: (json['price_per_seat'] as num).toDouble(),
  aircraftType: json['aircraft_type'] as String?,
  description: json['description'] as String?,
  waypoints: (json['waypoints'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$CreateFlightRequestDtoToJson(
  _CreateFlightRequestDto instance,
) => <String, dynamic>{
  'departure_airport': instance.departureAirport,
  'arrival_airport': instance.arrivalAirport,
  'departure_date': instance.departureDate.toIso8601String(),
  'available_seats': instance.availableSeats,
  'price_per_seat': instance.pricePerSeat,
  'aircraft_type': instance.aircraftType,
  'description': instance.description,
  'waypoints': instance.waypoints,
};
