import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookings_bloc.freezed.dart';

// События без freezed
abstract class BookingsEvent {}

class GetBookingsEvent extends BookingsEvent {
  GetBookingsEvent();
}

class GetBookingsByFlightIdEvent extends BookingsEvent {
  final int flightId;

  GetBookingsByFlightIdEvent({required this.flightId});
}

class CreateBookingEvent extends BookingsEvent {
  final int flightId;
  final int seatsCount;

  CreateBookingEvent({required this.flightId, required this.seatsCount});
}

class ConfirmBookingEvent extends BookingsEvent {
  final int bookingId;

  ConfirmBookingEvent({required this.bookingId});
}

class CancelBookingEvent extends BookingsEvent {
  final int bookingId;

  CancelBookingEvent({required this.bookingId});
}

class ClearBookingsEvent extends BookingsEvent {
  ClearBookingsEvent();
}

@freezed
class BookingsState with _$BookingsState {
  const BookingsState._();

  const factory BookingsState.loading() = LoadingBookingsState;
  const factory BookingsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorBookingsState;
  const factory BookingsState.success({required List<BookingEntity> bookings}) = SuccessBookingsState;
  const factory BookingsState.bookingCreated({required BookingEntity booking}) = BookingCreatedState;
  const factory BookingsState.bookingConfirmed({required BookingEntity booking}) = BookingConfirmedState;
  const factory BookingsState.bookingCancelled({required BookingEntity booking}) = BookingCancelledState;
}

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final OnTheWayRepository _onTheWayRepository;

  BookingsBloc({required OnTheWayRepository onTheWayRepository})
    : _onTheWayRepository = onTheWayRepository,
      super(const SuccessBookingsState(bookings: [])) {
    on<GetBookingsEvent>(_handleGetBookings);
    on<GetBookingsByFlightIdEvent>(_handleGetBookingsByFlightId);
    on<CreateBookingEvent>(_handleCreateBooking);
    on<ConfirmBookingEvent>(_handleConfirmBooking);
    on<CancelBookingEvent>(_handleCancelBooking);
    on<ClearBookingsEvent>(_handleClearBookings);
  }

  Future<void> _handleClearBookings(ClearBookingsEvent event, Emitter<BookingsState> emit) async {
    // Очищаем состояние - сбрасываем на начальное состояние с пустым списком
    emit(const SuccessBookingsState(bookings: []));
  }

  Future<void> _handleGetBookings(GetBookingsEvent event, Emitter<BookingsState> emit) async {
    emit(const LoadingBookingsState());

    final response = await _onTheWayRepository.getBookings();

    response.fold(
      (l) {
        emit(
          ErrorBookingsState(
            errorForUser: 'Не удалось загрузить бронирования',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessBookingsState(bookings: r));
      },
    );
  }

  Future<void> _handleGetBookingsByFlightId(GetBookingsByFlightIdEvent event, Emitter<BookingsState> emit) async {
    emit(const LoadingBookingsState());

    final response = await _onTheWayRepository.getBookingsByFlightId(event.flightId);

    response.fold(
      (l) {
        emit(
          ErrorBookingsState(
            errorForUser: 'Не удалось загрузить бронирования',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessBookingsState(bookings: r));
      },
    );
  }

  Future<void> _handleCreateBooking(CreateBookingEvent event, Emitter<BookingsState> emit) async {
    emit(const LoadingBookingsState());

    final response = await _onTheWayRepository.createBooking(flightId: event.flightId, seatsCount: event.seatsCount);

    response.fold(
      (l) {
        emit(
          ErrorBookingsState(
            errorForUser: 'Не удалось создать бронирование',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(BookingCreatedState(booking: r));
      },
    );
  }

  Future<void> _handleConfirmBooking(ConfirmBookingEvent event, Emitter<BookingsState> emit) async {
    final previousState = state;
    
    if (previousState is SuccessBookingsState) {
      emit(SuccessBookingsState(bookings: previousState.bookings));
    } else {
      emit(const LoadingBookingsState());
    }

    final response = await _onTheWayRepository.confirmBooking(event.bookingId);

    response.fold(
      (l) {
        emit(
          ErrorBookingsState(
            errorForUser: 'Не удалось подтвердить бронирование',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(BookingConfirmedState(booking: r));
        // Перезагружаем список бронирований
        // Проверяем, был ли предыдущий запрос по flightId
        final flightId = r.flightId;
        if (previousState is SuccessBookingsState && previousState.bookings.isNotEmpty) {
          // Если в предыдущем состоянии были бронирования, проверяем, все ли они одного полета
          final previousFlightIds = previousState.bookings.map((b) => b.flightId).toSet();
          if (previousFlightIds.length == 1 && previousFlightIds.first == flightId) {
            // Если все бронирования были для одного полета, перезагружаем по flightId
            add(GetBookingsByFlightIdEvent(flightId: flightId));
          } else {
            // Если были бронирования разных полетов, перезагружаем все
            add(GetBookingsEvent());
          }
        } else {
          // Если предыдущего состояния не было или список был пуст, перезагружаем по flightId
          // (так как мы на странице деталей полета)
          add(GetBookingsByFlightIdEvent(flightId: flightId));
        }
      },
    );
  }

  Future<void> _handleCancelBooking(CancelBookingEvent event, Emitter<BookingsState> emit) async {
    final currentState = state;
    if (currentState is SuccessBookingsState) {
      emit(SuccessBookingsState(bookings: currentState.bookings));
    } else {
      emit(const LoadingBookingsState());
    }

    final response = await _onTheWayRepository.cancelBooking(event.bookingId);

    response.fold(
      (l) {
        emit(
          ErrorBookingsState(
            errorForUser: 'Не удалось отменить бронирование',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(BookingCancelledState(booking: r));
        // Перезагружаем список бронирований
        add(GetBookingsEvent());
      },
    );
  }
}
