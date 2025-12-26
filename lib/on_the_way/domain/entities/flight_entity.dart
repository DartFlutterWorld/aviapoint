import 'package:equatable/equatable.dart';

class FlightEntity extends Equatable {
  final int id;
  final int pilotId;
  final String departureAirport;
  final String arrivalAirport;
  // Дополнительная информация об аэропорте отправления
  final String? departureAirportName;
  final String? departureAirportCity;
  final String? departureAirportRegion;
  final String? departureAirportType;
  final String? departureAirportIdentRu;
  // Дополнительная информация об аэропорте прибытия
  final String? arrivalAirportName;
  final String? arrivalAirportCity;
  final String? arrivalAirportRegion;
  final String? arrivalAirportType;
  final String? arrivalAirportIdentRu;
  final DateTime departureDate;
  final int availableSeats;
  final int? totalSeats;
  final double pricePerSeat;
  final String? aircraftType;
  final String? description;
  final String status;
  // Данные пилота (создателя полёта) - загружаются через JOIN в SQL
  final String? pilotFirstName;
  final String? pilotLastName;
  final String? pilotAvatarUrl;
  final double? pilotAverageRating;
  final List<String>? photos;

  const FlightEntity({
    required this.id,
    required this.pilotId,
    required this.departureAirport,
    required this.arrivalAirport,
    this.departureAirportName,
    this.departureAirportCity,
    this.departureAirportRegion,
    this.departureAirportType,
    this.departureAirportIdentRu,
    this.arrivalAirportName,
    this.arrivalAirportCity,
    this.arrivalAirportRegion,
    this.arrivalAirportType,
    this.arrivalAirportIdentRu,
    required this.departureDate,
    required this.availableSeats,
    this.totalSeats,
    required this.pricePerSeat,
    this.aircraftType,
    this.description,
    required this.status,
    this.pilotFirstName,
    this.pilotLastName,
    this.pilotAvatarUrl,
    this.pilotAverageRating,
    this.photos,
  });

  @override
  List<Object?> get props => [
    id,
    pilotId,
    departureAirport,
    arrivalAirport,
    departureAirportName,
    departureAirportCity,
    departureAirportRegion,
    departureAirportType,
    departureAirportIdentRu,
    arrivalAirportName,
    arrivalAirportCity,
    arrivalAirportRegion,
    arrivalAirportType,
    arrivalAirportIdentRu,
    departureDate,
    availableSeats,
    totalSeats,
    pricePerSeat,
    aircraftType,
    description,
    status,
    pilotFirstName,
    pilotLastName,
    pilotAvatarUrl,
    pilotAverageRating,
    photos,
  ];

  /// Получить полное имя пилота
  String? get pilotFullName {
    if (pilotFirstName != null && pilotLastName != null) {
      return '$pilotFirstName $pilotLastName';
    } else if (pilotFirstName != null) {
      return pilotFirstName;
    } else if (pilotLastName != null) {
      return pilotLastName;
    }
    return null;
  }
}
