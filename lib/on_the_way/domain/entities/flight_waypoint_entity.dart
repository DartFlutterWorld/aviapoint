import 'package:equatable/equatable.dart';

class FlightWaypointEntity extends Equatable {
  final int id;
  final int flightId;
  final String airportCode;
  final int sequenceOrder;
  final DateTime? arrivalTime;
  final DateTime? departureTime;
  final String? comment;
  final DateTime? createdAt;
  // Дополнительная информация об аэропорте
  final String? airportName;
  final String? airportCity;
  final String? airportRegion;
  final String? airportType;
  final String? airportIdentRu;

  const FlightWaypointEntity({
    required this.id,
    required this.flightId,
    required this.airportCode,
    required this.sequenceOrder,
    this.arrivalTime,
    this.departureTime,
    this.comment,
    this.createdAt,
    this.airportName,
    this.airportCity,
    this.airportRegion,
    this.airportType,
    this.airportIdentRu,
  });

  @override
  List<Object?> get props => [
    id,
    flightId,
    airportCode,
    sequenceOrder,
    arrivalTime,
    departureTime,
    comment,
    createdAt,
    airportName,
    airportCity,
    airportRegion,
    airportType,
    airportIdentRu,
  ];
}

