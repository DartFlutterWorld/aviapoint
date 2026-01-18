// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_waypoint_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlightWaypointDto _$FlightWaypointDtoFromJson(Map<String, dynamic> json) =>
    _FlightWaypointDto(
      id: (json['id'] as num).toInt(),
      flightId: (json['flight_id'] as num).toInt(),
      airportCode: json['airport_code'] as String,
      sequenceOrder: (json['sequence_order'] as num).toInt(),
      arrivalTime: _dateTimeFromJsonNullable(json['arrival_time']),
      departureTime: _dateTimeFromJsonNullable(json['departure_time']),
      comment: json['comment'] as String?,
      createdAt: _dateTimeFromJsonNullable(json['created_at']),
      airportName: json['airport_name'] as String?,
      airportCity: json['airport_city'] as String?,
      airportRegion: json['airport_region'] as String?,
      airportType: json['airport_type'] as String?,
      airportIdentRu: json['airport_ident_ru'] as String?,
    );

Map<String, dynamic> _$FlightWaypointDtoToJson(_FlightWaypointDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flight_id': instance.flightId,
      'airport_code': instance.airportCode,
      'sequence_order': instance.sequenceOrder,
      'arrival_time': instance.arrivalTime?.toIso8601String(),
      'departure_time': instance.departureTime?.toIso8601String(),
      'comment': instance.comment,
      'created_at': instance.createdAt?.toIso8601String(),
      'airport_name': instance.airportName,
      'airport_city': instance.airportCity,
      'airport_region': instance.airportRegion,
      'airport_type': instance.airportType,
      'airport_ident_ru': instance.airportIdentRu,
    };
