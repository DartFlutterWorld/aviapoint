import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final int id;
  final int flightId;
  final int passengerId;
  final int seatsCount;
  final int totalPrice;
  final String status;
  // Данные пассажира (загружаются через JOIN в SQL)
  final String? passengerFirstName;
  final String? passengerLastName;
  final String? passengerAvatarUrl;
  final String? passengerPhone;
  final String? passengerEmail;
  final String? passengerTelegram;
  final String? passengerMax;
  final double? passengerAverageRating;
  // Данные полёта (загружаются через JOIN в SQL)
  final DateTime? flightDepartureDate;
  final String? flightDepartureAirport;
  final String? flightArrivalAirport;
  final List<String>? flightWaypoints; // Все точки маршрута в порядке следования

  const BookingEntity({
    required this.id,
    required this.flightId,
    required this.passengerId,
    required this.seatsCount,
    required this.totalPrice,
    required this.status,
    this.passengerFirstName,
    this.passengerLastName,
    this.passengerAvatarUrl,
    this.passengerPhone,
    this.passengerEmail,
    this.passengerTelegram,
    this.passengerMax,
    this.passengerAverageRating,
    this.flightDepartureDate,
    this.flightDepartureAirport,
    this.flightArrivalAirport,
    this.flightWaypoints,
  });

  /// Получить полное имя пассажира
  String? get passengerFullName {
    if (passengerFirstName != null && passengerLastName != null) {
      return '$passengerFirstName $passengerLastName';
    } else if (passengerFirstName != null) {
      return passengerFirstName;
    } else if (passengerLastName != null) {
      return passengerLastName;
    }
    return null;
  }

  @override
  List<Object?> get props => [
    id,
    flightId,
    passengerId,
    seatsCount,
    totalPrice,
    status,
    passengerFirstName,
    passengerLastName,
    passengerAvatarUrl,
    passengerPhone,
    passengerEmail,
    passengerTelegram,
    passengerMax,
    passengerAverageRating,
    flightDepartureDate,
    flightDepartureAirport,
    flightArrivalAirport,
    flightWaypoints,
  ];
}
