import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/on_the_way/data/datasources/on_the_way_service.dart';
import 'package:aviapoint/on_the_way/data/mappers/on_the_way_mapper.dart';
import 'package:aviapoint/on_the_way/data/models/create_booking_request_dto.dart';
import 'package:aviapoint/on_the_way/data/models/create_flight_request_dto.dart';
import 'package:aviapoint/on_the_way/data/models/create_review_request_dto.dart';
import 'package:aviapoint/on_the_way/domain/entities/airport_review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_question_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class OnTheWayRepositoryImpl extends OnTheWayRepository {
  final OnTheWayService _onTheWayService;

  OnTheWayRepositoryImpl({required OnTheWayService onTheWayService}) : _onTheWayService = onTheWayService;

  @override
  Future<Either<Failure, List<FlightEntity>>> getFlights({
    String? airport,
    String? departureAirport,
    String? arrivalAirport,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) async {
    try {
      print('🔵 [OnTheWayRepositoryImpl] getFlights: airport = $airport, dateFrom = $dateFrom, dateTo = $dateTo');
      final response = await _onTheWayService.getFlights(
        airport: airport,
        departureAirport: departureAirport,
        arrivalAirport: arrivalAirport,
        dateFrom: dateFrom,
        dateTo: dateTo,
      );

      print('🔵 [OnTheWayRepositoryImpl] getFlights: received ${response.length} flights from API');
      final cancelledFlights = response.where((f) => f.status == 'cancelled').toList();
      print('🔵 [OnTheWayRepositoryImpl] getFlights: cancelled flights count = ${cancelledFlights.length}');
      if (cancelledFlights.isNotEmpty) {
        print(
          '🔵 [OnTheWayRepositoryImpl] getFlights: cancelled flight IDs: ${cancelledFlights.map((f) => f.id).toList()}',
        );
      }

      return right(OnTheWayMapper.toFlightEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<FlightEntity>>> getMyFlights() async {
    try {
      final response = await _onTheWayService.getMyFlights();

      return right(OnTheWayMapper.toFlightEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FlightEntity>> getFlight(int id) async {
    try {
      final response = await _onTheWayService.getFlight(id);

      return right(OnTheWayMapper.toFlightEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
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
  }) async {
    try {
      // ВАЖНО: В БД поле price_per_seat имеет тип INTEGER, поэтому округляем до int перед созданием DTO
      final priceAsInt = pricePerSeat.round().toInt();

      // Преобразуем waypoints в формат для отправки
      List<Map<String, dynamic>>? waypointsDto;
      if (waypoints != null && waypoints.isNotEmpty) {
        waypointsDto = waypoints.map((wp) => {
          'airport_code': wp['airport_code'],
          'sequence_order': wp['sequence_order'],
          'arrival_time': wp['arrival_time'],
          'departure_time': wp['departure_time'],
          'comment': wp['comment'],
        }).toList();
      }

      final request = CreateFlightRequestDto(
        departureAirport: departureAirport,
        arrivalAirport: arrivalAirport,
        departureDate: departureDate,
        availableSeats: availableSeats,
        pricePerSeat: priceAsInt.toDouble(), // Передаем как double для DTO, но уже округленное значение
        aircraftType: aircraftType,
        description: description,
        waypoints: waypointsDto,
      );

      // Явно сериализуем в JSON перед отправкой
      final jsonData = request.toJson();
      // Убеждаемся, что price_per_seat отправляется как int, а не double
      if (jsonData.containsKey('price_per_seat')) {
        jsonData['price_per_seat'] = priceAsInt;
      }
      print('🔵 Create Flight Request JSON:');
      print(jsonData);

      // Сначала создаем полет обычным JSON запросом (как для аэропортов)
      final response = await _onTheWayService.createFlight(jsonData);
      final flightEntity = OnTheWayMapper.toFlightEntity(response);

      // Если есть фотографии, загружаем их отдельно (как для аэропортов)
      if (photos != null && photos.isNotEmpty) {
        // Конвертируем XFile в MultipartFile
        final multipartFiles = await Future.wait(
          photos.map((photo) async {
            if (kIsWeb) {
              // Для веб-платформы
              final bytes = await photo.readAsBytes();
              return MultipartFile.fromBytes(
                bytes,
                filename: photo.name,
              );
            } else {
              // Для мобильных платформ
              final file = File(photo.path);
              return await MultipartFile.fromFile(
                file.path,
                filename: photo.name,
              );
            }
          }),
        );

        // Загружаем фотографии отдельным запросом
        final flightWithPhotos = await _onTheWayService.uploadFlightPhotos(
          flightEntity.id,
          multipartFiles,
        );
        return right(OnTheWayMapper.toFlightEntity(flightWithPhotos));
      }

      return right(flightEntity);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
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
  }) async {
    try {
      final body = <String, dynamic>{};
      if (departureAirport != null) {
        body['departure_airport'] = departureAirport;
      }
      if (arrivalAirport != null) {
        body['arrival_airport'] = arrivalAirport;
      }
      if (departureDate != null) {
        body['departure_date'] = departureDate.toIso8601String();
      }
      if (availableSeats != null) {
        body['available_seats'] = availableSeats;
      }
      if (pricePerSeat != null) {
        // Округляем до целого числа и явно преобразуем в int, чтобы избежать проблем с типами в БД
        // ВАЖНО: В БД поле price_per_seat имеет тип INTEGER, поэтому отправляем только int
        final priceAsInt = pricePerSeat.round().toInt();
        // Явно преобразуем в int, чтобы Dio правильно сериализовал его как число, а не как строку
        body['price_per_seat'] = priceAsInt;
        print(
          '🔵 [UpdateFlight] pricePerSeat: $pricePerSeat -> priceAsInt: $priceAsInt (type: ${priceAsInt.runtimeType})',
        );
        print(
          '🔵 [UpdateFlight] body[price_per_seat] type: ${body['price_per_seat'].runtimeType}, value: ${body['price_per_seat']}',
        );
      }
      if (aircraftType != null) {
        body['aircraft_type'] = aircraftType;
      }
      if (description != null) {
        body['description'] = description;
      }
      if (status != null) {
        body['status'] = status;
      }
      if (waypoints != null) {
        body['waypoints'] = waypoints;
      }

      print('🔵 [UpdateFlight] Request body: $body');
      final response = await _onTheWayService.updateFlight(id, body);

      return right(OnTheWayMapper.toFlightEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FlightEntity>> deleteFlight(int id) async {
    try {
      final response = await _onTheWayService.deleteFlight(id);

      return right(OnTheWayMapper.toFlightEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookings() async {
    try {
      final response = await _onTheWayService.getBookings();
      
      print('🔵 [OnTheWayRepository] Получены бронирования с бэкенда: ${response.length} шт.');
      for (var booking in response) {
        print('   - Booking #${booking.id}:');
        print('     passengerFirstName: ${booking.passengerFirstName}');
        print('     passengerLastName: ${booking.passengerLastName}');
        print('     passengerAvatarUrl: ${booking.passengerAvatarUrl}');
        print('     passengerAverageRating: ${booking.passengerAverageRating}');
      }

      return right(OnTheWayMapper.toBookingEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookingsByFlightId(int flightId) async {
    try {
      final response = await _onTheWayService.getBookingsByFlightId(flightId);
      
      print('🔵 [OnTheWayRepository] Получены бронирования для полёта #$flightId: ${response.length} шт.');
      for (var booking in response) {
        print('   - Booking #${booking.id}:');
        print('     passengerFirstName: ${booking.passengerFirstName}');
        print('     passengerLastName: ${booking.passengerLastName}');
        print('     passengerAvatarUrl: ${booking.passengerAvatarUrl}');
        print('     passengerAverageRating: ${booking.passengerAverageRating}');
      }

      return right(OnTheWayMapper.toBookingEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> createBooking({required int flightId, required int seatsCount}) async {
    try {
      final request = CreateBookingRequestDto(flightId: flightId, seatsCount: seatsCount);
      final jsonData = request.toJson();
      print('🔵 [OnTheWayRepository] createBooking request: $jsonData');

      final response = await _onTheWayService.createBooking(jsonData);
      print('✅ [OnTheWayRepository] createBooking response received: ${response.toString()}');
      print('🔵 [OnTheWayRepository] createBooking response type: ${response.runtimeType}');
      print('🔵 [OnTheWayRepository] createBooking response JSON: ${response.toJson()}');

      return right(OnTheWayMapper.toBookingEntity(response));
    } on DioException catch (e) {
      print('❌ [OnTheWayRepository] createBooking DioException: ${e.message}');
      print('❌ [OnTheWayRepository] createBooking statusCode: ${e.response?.statusCode}');
      print('❌ [OnTheWayRepository] createBooking response data: ${e.response?.data}');
      String? errorMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          errorMessage = e.response!.data['error']?.toString();
        } else if (e.response!.data is String) {
          // Если ответ - строка JSON, пытаемся распарсить
          final jsonData = e.response!.data as String;
          print('🔵 [OnTheWayRepository] createBooking response string: $jsonData');
          if (jsonData.contains('error')) {
            final match = RegExp(r'"error"\s*:\s*"([^"]+)"').firstMatch(jsonData);
            if (match != null) {
              errorMessage = match.group(1);
              print('🔵 [OnTheWayRepository] createBooking extracted error: $errorMessage');
            }
          }
        }
      }

      // Формируем понятное сообщение для пользователя
      String userMessage = 'Не удалось создать бронирование';
      if (errorMessage != null) {
        if (errorMessage.contains('Not enough available seats') ||
            errorMessage.contains('недостаточно мест') ||
            errorMessage.contains('Not enough')) {
          userMessage =
              'Недостаточно свободных мест для бронирования. Возможно, места были забронированы другим пользователем.';
        } else if (errorMessage.contains('already booked') || errorMessage.contains('уже забронировано')) {
          userMessage = 'Места уже забронированы';
        } else {
          userMessage = errorMessage;
        }
      }

      return left(
        ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message, responseMessage: userMessage),
      );
    } catch (e, stackTrace) {
      print('❌ [OnTheWayRepository] createBooking unexpected error: $e');
      print('❌ [OnTheWayRepository] createBooking stackTrace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> confirmBooking(int id) async {
    try {
      final response = await _onTheWayService.confirmBooking(id);

      return right(OnTheWayMapper.toBookingEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> cancelBooking(int id) async {
    try {
      final response = await _onTheWayService.cancelBooking(id);

      return right(OnTheWayMapper.toBookingEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews(int userId) async {
    try {
      final response = await _onTheWayService.getReviews(userId);

      return right(OnTheWayMapper.toReviewEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviewsByFlightId(int flightId) async {
    try {
      final response = await _onTheWayService.getReviewsByFlightId(flightId);

      return right(OnTheWayMapper.toReviewEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> createReview({
    required int bookingId,
    required int reviewedId,
    int? rating,
    String? comment,
    int? replyToReviewId,
  }) async {
    try {
      final request = CreateReviewRequestDto(
        bookingId: bookingId,
        reviewedId: reviewedId,
        rating: rating,
        comment: comment,
        replyToReviewId: replyToReviewId,
      );
      final jsonData = request.toJson();

      final response = await _onTheWayService.createReview(jsonData);

      return right(OnTheWayMapper.toReviewEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> updateReview({
    required int reviewId,
    required int rating,
    String? comment,
  }) async {
    try {
      final body = {'rating': rating, 'comment': comment};
      final response = await _onTheWayService.updateReview(reviewId, body);

      return right(OnTheWayMapper.toReviewEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteReview(int reviewId) async {
    try {
      await _onTheWayService.deleteReview(reviewId);

      return right(null);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FlightEntity>> uploadFlightPhotos({
    required int flightId,
    required List<XFile> photos,
  }) async {
    try {
      // Конвертируем XFile в MultipartFile
      final multipartFiles = await Future.wait(
        photos.map((photo) async {
          if (kIsWeb) {
            // Для веб-платформы
            final bytes = await photo.readAsBytes();
            return MultipartFile.fromBytes(
              bytes,
              filename: photo.name,
            );
          } else {
            // Для мобильных платформ
            final file = File(photo.path);
            return await MultipartFile.fromFile(
              file.path,
              filename: photo.name,
            );
          }
        }),
      );

      final response = await _onTheWayService.uploadFlightPhotos(flightId, multipartFiles);
      return right(OnTheWayMapper.toFlightEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FlightEntity>> deleteFlightPhoto({
    required int flightId,
    required String photoUrl,
  }) async {
    try {
      final response = await _onTheWayService.deleteFlightPhoto(flightId, photoUrl);
      return right(OnTheWayMapper.toFlightEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  // ========== FLIGHT QUESTIONS ==========

  @override
  Future<Either<Failure, List<FlightQuestionEntity>>> getQuestionsByFlightId(int flightId) async {
    try {
      final response = await _onTheWayService.getQuestionsByFlightId(flightId);

      return right(OnTheWayMapper.toFlightQuestionEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FlightQuestionEntity>> createQuestion({
    required int flightId,
    required String questionText,
  }) async {
    try {
      final request = {'question_text': questionText};
      final response = await _onTheWayService.createQuestion(flightId, request);

      return right(OnTheWayMapper.toFlightQuestionEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FlightQuestionEntity>> updateQuestion({
    required int flightId,
    required int questionId,
    String? questionText,
    String? answerText,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (questionText != null) body['question_text'] = questionText;
      if (answerText != null) body['answer_text'] = answerText;

      final response = await _onTheWayService.updateQuestion(flightId, questionId, body);

      return right(OnTheWayMapper.toFlightQuestionEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteQuestion({
    required int flightId,
    required int questionId,
  }) async {
    try {
      await _onTheWayService.deleteQuestion(flightId, questionId);

      return right(null);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  // ========== AIRPORT REVIEWS ==========

  @override
  Future<Either<Failure, List<AirportReviewEntity>>> getAirportReviews(String airportCode) async {
    try {
      final response = await _onTheWayService.getAirportReviews(airportCode);
      return right(OnTheWayMapper.toAirportReviewEntities(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AirportReviewEntity>> createAirportReview({
    required String airportCode,
    required int reviewerId,
    required int rating,
    String? comment,
    int? replyToReviewId,
    List<XFile>? photos,
  }) async {
    try {
      // Создаём FormData для multipart запроса
      final formData = FormData();
      formData.fields.addAll([
        MapEntry('airport_code', airportCode),
        MapEntry('reviewer_id', reviewerId.toString()),
        MapEntry('rating', rating.toString()),
      ]);
      if (comment != null && comment.isNotEmpty) {
        formData.fields.add(MapEntry('comment', comment));
      }
      if (replyToReviewId != null) {
        formData.fields.add(MapEntry('reply_to_review_id', replyToReviewId.toString()));
      }

      // Добавляем фотографии, если они есть
      if (photos != null && photos.isNotEmpty) {
        final multipartFiles = await Future.wait(
          photos.map((photo) async {
            if (kIsWeb) {
              final bytes = await photo.readAsBytes();
              return MultipartFile.fromBytes(
                bytes,
                filename: photo.name,
              );
            } else {
              final file = File(photo.path);
              return await MultipartFile.fromFile(
                file.path,
                filename: photo.name,
              );
            }
          }),
        );
        formData.files.addAll(
          multipartFiles.map((file) => MapEntry('photos', file)),
        );
      }

      final response = await _onTheWayService.createAirportReview(formData);

      return right(OnTheWayMapper.toAirportReviewEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AirportReviewEntity>> updateAirportReview({
    required int reviewId,
    required int rating,
    String? comment,
  }) async {
    try {
      final body = {'rating': rating, 'comment': comment};
      final response = await _onTheWayService.updateAirportReview(reviewId, body);
      return right(OnTheWayMapper.toAirportReviewEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AirportReviewEntity>> addAirportReviewPhotos({
    required int reviewId,
    required List<XFile> photos,
  }) async {
    try {
      final multipartFiles = await Future.wait(
        photos.map((photo) async {
          if (kIsWeb) {
            final bytes = await photo.readAsBytes();
            return MultipartFile.fromBytes(
              bytes,
              filename: photo.name,
            );
          } else {
            final file = File(photo.path);
            return await MultipartFile.fromFile(
              file.path,
              filename: photo.name,
            );
          }
        }),
      );

      final response = await _onTheWayService.addAirportReviewPhotos(reviewId, multipartFiles);
      return right(OnTheWayMapper.toAirportReviewEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AirportReviewEntity>> deleteAirportReviewPhoto({
    required int reviewId,
    required String photoUrl,
  }) async {
    try {
      final response = await _onTheWayService.deleteAirportReviewPhoto(reviewId, photoUrl);
      return right(OnTheWayMapper.toAirportReviewEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteAirportReview(int reviewId) async {
    try {
      await _onTheWayService.deleteAirportReview(reviewId);
      return right(null);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }
}
