import 'dart:convert';
import 'package:aviapoint/on_the_way/data/models/airport_review_dto.dart';
import 'package:aviapoint/on_the_way/data/models/booking_dto.dart';
import 'package:aviapoint/on_the_way/data/models/flight_dto.dart';
import 'package:aviapoint/on_the_way/data/models/flight_waypoint_dto.dart';
import 'package:aviapoint/on_the_way/data/models/review_dto.dart';
import 'package:aviapoint/on_the_way/data/models/flight_question_dto.dart';
import 'package:aviapoint/on_the_way/domain/entities/airport_review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_waypoint_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_question_entity.dart';

class OnTheWayMapper {
  static FlightEntity toFlightEntity(FlightDto dto) {
    return FlightEntity(
      id: dto.id,
      pilotId: dto.pilotId,
      departureAirport: dto.departureAirport,
      arrivalAirport: dto.arrivalAirport,
      departureAirportName: dto.departureAirportName,
      departureAirportCity: dto.departureAirportCity,
      departureAirportRegion: dto.departureAirportRegion,
      departureAirportType: dto.departureAirportType,
      departureAirportIdentRu: dto.departureAirportIdentRu,
      arrivalAirportName: dto.arrivalAirportName,
      arrivalAirportCity: dto.arrivalAirportCity,
      arrivalAirportRegion: dto.arrivalAirportRegion,
      arrivalAirportType: dto.arrivalAirportType,
      arrivalAirportIdentRu: dto.arrivalAirportIdentRu,
      departureDate: dto.departureDate,
      availableSeats: dto.availableSeats,
      totalSeats: dto.totalSeats,
      pricePerSeat: dto.pricePerSeat,
      aircraftType: dto.aircraftType,
      description: dto.description,
      status: dto.status ?? 'active',
      pilotFirstName: dto.pilotFirstName,
      pilotLastName: dto.pilotLastName,
      pilotAvatarUrl: dto.pilotAvatarUrl,
      pilotAverageRating: dto.pilotAverageRating,
      photos: dto.photos,
      waypoints: dto.waypoints?.map((wp) => toFlightWaypointEntity(wp)).toList(),
    );
  }

  static FlightWaypointEntity toFlightWaypointEntity(FlightWaypointDto dto) {
    return FlightWaypointEntity(
      id: dto.id,
      flightId: dto.flightId,
      airportCode: dto.airportCode,
      sequenceOrder: dto.sequenceOrder,
      arrivalTime: dto.arrivalTime,
      departureTime: dto.departureTime,
      comment: dto.comment,
      createdAt: dto.createdAt,
      airportName: dto.airportName,
      airportCity: dto.airportCity,
      airportRegion: dto.airportRegion,
      airportType: dto.airportType,
      airportIdentRu: dto.airportIdentRu,
    );
  }

  static List<FlightEntity> toFlightEntities(List<FlightDto> dtos) {
    return dtos.map((dto) => toFlightEntity(dto)).toList();
  }

  static BookingEntity toBookingEntity(BookingDto dto) {
    print('🔵 [OnTheWayMapper] Маппинг BookingDto в BookingEntity:');
    print('   - passengerFirstName: ${dto.passengerFirstName}');
    print('   - passengerLastName: ${dto.passengerLastName}');
    print('   - passengerAvatarUrl: ${dto.passengerAvatarUrl}');
    print('   - passengerAverageRating: ${dto.passengerAverageRating}');

    // Парсим waypoints из JSON
    List<String>? flightWaypoints;
    if (dto.flightWaypoints != null) {
      if (dto.flightWaypoints is List) {
        flightWaypoints = (dto.flightWaypoints as List).map((e) => e.toString()).toList();
      } else if (dto.flightWaypoints is String) {
        try {
          final decoded = jsonDecode(dto.flightWaypoints as String) as List;
          flightWaypoints = decoded.map((e) => e.toString()).toList();
        } catch (e) {
          // Игнорируем ошибки парсинга
          flightWaypoints = null;
        }
      }
    }

    final entity = BookingEntity(
      id: dto.id,
      flightId: dto.flightId,
      passengerId: dto.passengerId,
      seatsCount: dto.seatsCount,
      totalPrice: dto.totalPrice,
      status: dto.status ?? 'pending',
      passengerFirstName: dto.passengerFirstName,
      passengerLastName: dto.passengerLastName,
      passengerAvatarUrl: dto.passengerAvatarUrl,
      passengerPhone: dto.passengerPhone,
      passengerEmail: dto.passengerEmail,
      passengerTelegram: dto.passengerTelegram,
      passengerMax: dto.passengerMax,
      passengerAverageRating: dto.passengerAverageRating,
      flightDepartureDate: dto.flightDepartureDate,
      flightDepartureAirport: dto.flightDepartureAirport,
      flightArrivalAirport: dto.flightArrivalAirport,
      flightWaypoints: flightWaypoints,
    );

    print('✅ [OnTheWayMapper] BookingEntity создан:');
    print('   - passengerFullName: ${entity.passengerFullName}');
    print('   - passengerAverageRating: ${entity.passengerAverageRating}');

    return entity;
  }

  static List<BookingEntity> toBookingEntities(List<BookingDto> dtos) {
    return dtos.map((dto) => toBookingEntity(dto)).toList();
  }

  static ReviewEntity toReviewEntity(ReviewDto dto) {
    return ReviewEntity(
      id: dto.id,
      bookingId: dto.bookingId,
      reviewerId: dto.reviewerId,
      reviewedId: dto.reviewedId,
      rating: dto.rating,
      comment: dto.comment,
      replyToReviewId: dto.replyToReviewId,
      createdAt: dto.createdAt,
      reviewerFirstName: dto.reviewerFirstName,
      reviewerLastName: dto.reviewerLastName,
      reviewerAvatarUrl: dto.reviewerAvatarUrl,
      flightId: dto.flightId,
    );
  }

  static List<ReviewEntity> toReviewEntities(List<ReviewDto> dtos) {
    return dtos.map((dto) => toReviewEntity(dto)).toList();
  }

  static FlightQuestionEntity toFlightQuestionEntity(FlightQuestionDto dto) {
    return FlightQuestionEntity(
      id: dto.id,
      flightId: dto.flightId,
      authorId: dto.authorId,
      questionText: dto.questionText,
      answerText: dto.answerText,
      answeredById: dto.answeredById,
      answeredAt: dto.answeredAt,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      authorFirstName: dto.authorFirstName,
      authorLastName: dto.authorLastName,
      authorAvatarUrl: dto.authorAvatarUrl,
      answeredByFirstName: dto.answeredByFirstName,
      answeredByLastName: dto.answeredByLastName,
      answeredByAvatarUrl: dto.answeredByAvatarUrl,
    );
  }

  static List<FlightQuestionEntity> toFlightQuestionEntities(List<FlightQuestionDto> dtos) {
    return dtos.map((dto) => toFlightQuestionEntity(dto)).toList();
  }

  static AirportReviewEntity toAirportReviewEntity(AirportReviewDto dto) {
    return AirportReviewEntity(
      id: dto.id,
      airportCode: dto.airportCode,
      reviewerId: dto.reviewerId,
      rating: dto.rating,
      comment: dto.comment,
      photoUrls: dto.photoUrls,
      replyToReviewId: dto.replyToReviewId,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      reviewerFirstName: dto.reviewerFirstName,
      reviewerLastName: dto.reviewerLastName,
      reviewerAvatarUrl: dto.reviewerAvatarUrl,
    );
  }

  static List<AirportReviewEntity> toAirportReviewEntities(List<AirportReviewDto> dtos) {
    return dtos.map((dto) => toAirportReviewEntity(dto)).toList();
  }
}
