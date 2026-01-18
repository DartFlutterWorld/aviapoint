// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlightDto _$FlightDtoFromJson(Map<String, dynamic> json) => _FlightDto(
  id: (json['id'] as num).toInt(),
  pilotId: (json['pilot_id'] as num).toInt(),
  departureAirport: json['departure_airport'] as String,
  arrivalAirport: json['arrival_airport'] as String,
  departureAirportName: json['departure_airport_name'] as String?,
  departureAirportCity: json['departure_airport_city'] as String?,
  departureAirportRegion: json['departure_airport_region'] as String?,
  departureAirportType: json['departure_airport_type'] as String?,
  departureAirportIdentRu: json['departure_airport_ident_ru'] as String?,
  arrivalAirportName: json['arrival_airport_name'] as String?,
  arrivalAirportCity: json['arrival_airport_city'] as String?,
  arrivalAirportRegion: json['arrival_airport_region'] as String?,
  arrivalAirportType: json['arrival_airport_type'] as String?,
  arrivalAirportIdentRu: json['arrival_airport_ident_ru'] as String?,
  departureDate: _dateTimeFromJson(json['departure_date']),
  availableSeats: (json['available_seats'] as num).toInt(),
  totalSeats: (json['total_seats'] as num?)?.toInt(),
  pricePerSeat: (json['price_per_seat'] as num).toDouble(),
  aircraftType: json['aircraft_type'] as String?,
  description: json['description'] as String?,
  status: json['status'] as String?,
  createdAt: _dateTimeFromJsonNullable(json['created_at']),
  updatedAt: _dateTimeFromJsonNullable(json['updated_at']),
  pilotFirstName: json['pilot_first_name'] as String?,
  pilotLastName: json['pilot_last_name'] as String?,
  pilotAvatarUrl: json['pilot_avatar_url'] as String?,
  pilotAverageRating: _doubleFromJsonNullable(json['pilot_average_rating']),
  photos: _photosFromJson(json['photos']),
  waypoints: _waypointsFromJson(json['waypoints']),
);

Map<String, dynamic> _$FlightDtoToJson(_FlightDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pilot_id': instance.pilotId,
      'departure_airport': instance.departureAirport,
      'arrival_airport': instance.arrivalAirport,
      'departure_airport_name': instance.departureAirportName,
      'departure_airport_city': instance.departureAirportCity,
      'departure_airport_region': instance.departureAirportRegion,
      'departure_airport_type': instance.departureAirportType,
      'departure_airport_ident_ru': instance.departureAirportIdentRu,
      'arrival_airport_name': instance.arrivalAirportName,
      'arrival_airport_city': instance.arrivalAirportCity,
      'arrival_airport_region': instance.arrivalAirportRegion,
      'arrival_airport_type': instance.arrivalAirportType,
      'arrival_airport_ident_ru': instance.arrivalAirportIdentRu,
      'departure_date': instance.departureDate.toIso8601String(),
      'available_seats': instance.availableSeats,
      'total_seats': instance.totalSeats,
      'price_per_seat': instance.pricePerSeat,
      'aircraft_type': instance.aircraftType,
      'description': instance.description,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'pilot_first_name': instance.pilotFirstName,
      'pilot_last_name': instance.pilotLastName,
      'pilot_avatar_url': instance.pilotAvatarUrl,
      'pilot_average_rating': instance.pilotAverageRating,
      'photos': instance.photos,
      'waypoints': instance.waypoints,
    };
