import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/on_the_way/domain/entities/airport_review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_question_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class OnTheWayRepository {
  Future<Either<Failure, List<FlightEntity>>> getFlights({
    String? airport,
    String? departureAirport,
    String? arrivalAirport,
    DateTime? dateFrom,
    DateTime? dateTo,
  });
  Future<Either<Failure, List<FlightEntity>>> getMyFlights();

  Future<Either<Failure, FlightEntity>> getFlight(int id);
  Future<Either<Failure, FlightEntity>> createFlight({
    required String departureAirport,
    required String arrivalAirport,
    required DateTime departureDate,
    required int availableSeats,
    required double pricePerSeat,
    String? aircraftType,
    String? description,
    List<Map<String, dynamic>>? waypoints,
    List<XFile>? photos,
  });
  Future<Either<Failure, FlightEntity>> updateFlight({
    required int id,
    String? departureAirport,
    String? arrivalAirport,
    DateTime? departureDate,
    int? availableSeats,
    double? pricePerSeat,
    String? aircraftType,
    String? description,
    String? status,
    List<Map<String, dynamic>>? waypoints,
  });
  Future<Either<Failure, FlightEntity>> deleteFlight(int id);

  Future<Either<Failure, List<BookingEntity>>> getBookings();
  Future<Either<Failure, List<BookingEntity>>> getBookingsByFlightId(int flightId);
  Future<Either<Failure, BookingEntity>> createBooking({required int flightId, required int seatsCount});
  Future<Either<Failure, BookingEntity>> confirmBooking(int id);
  Future<Either<Failure, BookingEntity>> cancelBooking(int id);

  Future<Either<Failure, List<ReviewEntity>>> getReviews(int userId);
  Future<Either<Failure, List<ReviewEntity>>> getReviewsByFlightId(int flightId);
  Future<Either<Failure, ReviewEntity>> createReview({
    required int bookingId,
    required int reviewedId,
    int? rating,
    String? comment,
    int? replyToReviewId,
  });
  Future<Either<Failure, ReviewEntity>> updateReview({required int reviewId, required int rating, String? comment});
  Future<Either<Failure, void>> deleteReview(int reviewId);

  Future<Either<Failure, FlightEntity>> uploadFlightPhotos({required int flightId, required List<XFile> photos});
  Future<Either<Failure, FlightEntity>> deleteFlightPhoto({required int flightId, required String photoUrl});

  // Вопросы пилоту
  Future<Either<Failure, List<FlightQuestionEntity>>> getQuestionsByFlightId(int flightId);
  Future<Either<Failure, FlightQuestionEntity>> createQuestion({required int flightId, required String questionText});
  Future<Either<Failure, FlightQuestionEntity>> updateQuestion({
    required int flightId,
    required int questionId,
    String? questionText,
    String? answerText,
  });
  Future<Either<Failure, void>> deleteQuestion({required int flightId, required int questionId});

  // Отзывы об аэропортах
  Future<Either<Failure, List<AirportReviewEntity>>> getAirportReviews(String airportCode);
  Future<Either<Failure, AirportReviewEntity>> createAirportReview({
    required String airportCode,
    required int reviewerId,
    required int rating,
    String? comment,
    int? replyToReviewId,
    List<XFile>? photos,
  });
  Future<Either<Failure, AirportReviewEntity>> updateAirportReview({
    required int reviewId,
    required int rating,
    String? comment,
  });
  Future<Either<Failure, AirportReviewEntity>> addAirportReviewPhotos({
    required int reviewId,
    required List<XFile> photos,
  });
  Future<Either<Failure, AirportReviewEntity>> deleteAirportReviewPhoto({
    required int reviewId,
    required String photoUrl,
  });
  Future<Either<Failure, void>> deleteAirportReview(int reviewId);
}
