import 'package:aviapoint/on_the_way/data/models/airport_dto.dart';
import 'package:aviapoint/on_the_way/data/models/booking_dto.dart';
import 'package:aviapoint/on_the_way/data/models/flight_dto.dart';
import 'package:aviapoint/on_the_way/data/models/review_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'on_the_way_service.g.dart';

@RestApi()
abstract class OnTheWayService {
  factory OnTheWayService(Dio dio) = _OnTheWayService;

  @GET('/api/flights')
  Future<List<FlightDto>> getFlights({
    @Query('departure_airport') String? departureAirport,
    @Query('arrival_airport') String? arrivalAirport,
    @Query('date_from') DateTime? dateFrom,
    @Query('date_to') DateTime? dateTo,
  });

  @GET('/api/flights/{id}')
  Future<FlightDto> getFlight(@Path('id') int id);

  @GET('/api/flights/my')
  Future<List<FlightDto>> getMyFlights();

  @POST('/api/flights')
  Future<FlightDto> createFlight(@Body() Map<String, dynamic> request);

  @PUT('/api/flights/{id}')
  Future<FlightDto> updateFlight(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/api/flights/{id}')
  Future<FlightDto> deleteFlight(@Path('id') int id);

  @GET('/api/bookings')
  Future<List<BookingDto>> getBookings();

  @GET('/api/flights/{flightId}/bookings')
  Future<List<BookingDto>> getBookingsByFlightId(@Path('flightId') int flightId);

  @POST('/api/bookings')
  Future<BookingDto> createBooking(@Body() Map<String, dynamic> request);

  @PUT('/api/bookings/{id}/confirm')
  Future<BookingDto> confirmBooking(@Path('id') int id);

  @PUT('/api/bookings/{id}/cancel')
  Future<BookingDto> cancelBooking(@Path('id') int id);

  @GET('/api/reviews/{userId}')
  Future<List<ReviewDto>> getReviews(@Path('userId') int userId);

  @GET('/api/reviews/flight/{flightId}')
  Future<List<ReviewDto>> getReviewsByFlightId(@Path('flightId') int flightId);

  @POST('/api/reviews')
  Future<ReviewDto> createReview(@Body() Map<String, dynamic> request);

  @PUT('/api/reviews/{id}')
  Future<ReviewDto> updateReview(@Path('id') int id, @Body() Map<String, dynamic> body);

  @POST('/api/flights/{id}/photos')
  @MultiPart()
  Future<FlightDto> uploadFlightPhotos(@Path('id') int id, @Part(name: 'photos') List<MultipartFile> photos);

  @DELETE('/api/flights/{id}/photos')
  Future<FlightDto> deleteFlightPhoto(@Path('id') int id, @Query('photo_url') String photoUrl);

  @DELETE('/api/reviews/{id}')
  Future<void> deleteReview(@Path('id') int id);

  // Аэропорты
  @GET('/api/airports')
  Future<List<AirportDto>> searchAirports({
    @Query('q') String? query,
    @Query('country') String? country,
    @Query('type') String? type,
    @Query('limit') int? limit,
  });

  @GET('/api/airports/{code}')
  Future<AirportDto> getAirportByCode(@Path('code') String code);

  @GET('/api/airports/country/{country}')
  Future<List<AirportDto>> getAirportsByCountry(@Path('country') String country, {@Query('limit') int? limit});

  @POST('/api/airports/{code}/photos')
  @MultiPart()
  Future<AirportDto> uploadAirportPhotos(@Path('code') String code, @Part(name: 'photos') List<MultipartFile> photos);

  @POST('/api/airports/{code}/visitor-photos')
  @MultiPart()
  Future<AirportDto> uploadVisitorPhotos(@Path('code') String code, @Part(name: 'photos') List<MultipartFile> photos);

  @DELETE('/api/airports/{code}/visitor-photos')
  Future<AirportDto> deleteVisitorPhoto(@Path('code') String code, @Body() Map<String, dynamic> body);
}
