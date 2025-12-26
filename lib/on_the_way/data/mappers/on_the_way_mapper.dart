import 'package:aviapoint/on_the_way/data/models/booking_dto.dart';
import 'package:aviapoint/on_the_way/data/models/flight_dto.dart';
import 'package:aviapoint/on_the_way/data/models/review_dto.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';

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
      passengerAverageRating: dto.passengerAverageRating,
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
}
