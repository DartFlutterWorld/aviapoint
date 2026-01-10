import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'flights_bloc.freezed.dart';

// События без freezed, чтобы избежать проблем с одинаковыми полями
abstract class FlightsEvent {
  final String? airport;
  final String? departureAirport;
  final String? arrivalAirport;
  final DateTime? dateFrom;
  final DateTime? dateTo;

  const FlightsEvent({this.airport, this.departureAirport, this.arrivalAirport, this.dateFrom, this.dateTo});
}

class GetFlightsEvent extends FlightsEvent {
  final bool isRefresh;

  const GetFlightsEvent({
    super.airport,
    super.departureAirport,
    super.arrivalAirport,
    super.dateFrom,
    super.dateTo,
    this.isRefresh = false,
  });
}

class GetMyFlightsEvent extends FlightsEvent {
  final bool isRefresh;

  const GetMyFlightsEvent({this.isRefresh = false}) : super();
}

class CreateFlightEvent extends FlightsEvent {
  final String departureAirport;
  final String arrivalAirport;
  final DateTime departureDate;
  final int availableSeats;
  final double pricePerSeat;
  final String? aircraftType;
  final String? description;
  final List<Map<String, dynamic>>? waypoints;
  final List<XFile>? photos;

  const CreateFlightEvent({
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureDate,
    required this.availableSeats,
    required this.pricePerSeat,
    this.aircraftType,
    this.description,
    this.waypoints,
    this.photos,
  });
}

class UpdateFlightEvent extends FlightsEvent {
  final int flightId;
  final String? departureAirport;
  final String? arrivalAirport;
  final DateTime? departureDate;
  final int? availableSeats;
  final double? pricePerSeat;
  final String? aircraftType;
  final String? description;
  final String? status;
  final List<Map<String, dynamic>>? waypoints;

  const UpdateFlightEvent({
    required this.flightId,
    this.departureAirport,
    this.arrivalAirport,
    this.departureDate,
    this.availableSeats,
    this.pricePerSeat,
    this.aircraftType,
    this.description,
    this.status,
    this.waypoints,
  });
}

class DeleteFlightEvent extends FlightsEvent {
  final int flightId;

  const DeleteFlightEvent({required this.flightId}) : super();
}

class ClearFlightsEvent extends FlightsEvent {
  const ClearFlightsEvent() : super();
}

@freezed
class FlightsState with _$FlightsState {
  const FlightsState._();

  const factory FlightsState.loading() = LoadingFlightsState;
  const factory FlightsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorFlightsState;
  const factory FlightsState.success({
    required List<FlightEntity> flights,
    String? airport,
    String? departureAirport,
    String? arrivalAirport,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) = SuccessFlightsState;
  const factory FlightsState.flightCreated({required FlightEntity flight}) = FlightCreatedState;
}

class FlightsBloc extends Bloc<FlightsEvent, FlightsState> {
  final OnTheWayRepository _onTheWayRepository;

  FlightsBloc({required OnTheWayRepository onTheWayRepository})
    : _onTheWayRepository = onTheWayRepository,
      super(
        const SuccessFlightsState(
          flights: [],
          airport: null,
          departureAirport: null,
          arrivalAirport: null,
          dateFrom: null,
          dateTo: null,
        ),
      ) {
    on<GetFlightsEvent>(_handleGetFlights);
    on<GetMyFlightsEvent>(_handleGetMyFlights);
    on<CreateFlightEvent>(_handleCreateFlight);
    on<UpdateFlightEvent>(_handleUpdateFlight);
    on<DeleteFlightEvent>(_handleDeleteFlight);
    on<ClearFlightsEvent>(_handleClearFlights);
  }

  Future<void> _handleGetFlights(GetFlightsEvent event, Emitter<FlightsState> emit) async {
    // Если это refresh, сохраняем текущее состояние
    if (event.isRefresh) {
      final currentState = state;
      if (currentState is SuccessFlightsState) {
        emit(
          SuccessFlightsState(
            flights: currentState.flights,
            airport: event.airport ?? currentState.airport,
            departureAirport: event.departureAirport ?? currentState.departureAirport,
            arrivalAirport: event.arrivalAirport ?? currentState.arrivalAirport,
            dateFrom: event.dateFrom ?? currentState.dateFrom,
            dateTo: event.dateTo ?? currentState.dateTo,
          ),
        );
      }
    } else {
      emit(const LoadingFlightsState());
    }

    print(
      '🔵 [FlightsBloc] _handleGetFlights: airport = ${event.airport}, dateFrom = ${event.dateFrom}, dateTo = ${event.dateTo}',
    );
    final response = await _onTheWayRepository.getFlights(
      airport: event.airport,
      departureAirport: event.departureAirport,
      arrivalAirport: event.arrivalAirport,
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
    );

    response.fold(
      (l) {
        emit(
          ErrorFlightsState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        print('🔵 [FlightsBloc] _handleGetFlights: received ${r.length} flights');
        final cancelledFlights = r.where((f) => f.status == 'cancelled').toList();
        print('🔵 [FlightsBloc] _handleGetFlights: cancelled flights count = ${cancelledFlights.length}');
        if (cancelledFlights.isNotEmpty) {
          print(
            '🔵 [FlightsBloc] _handleGetFlights: cancelled flight IDs: ${cancelledFlights.map((f) => f.id).toList()}',
          );
        }
        emit(
          SuccessFlightsState(
            flights: r,
            airport: event.airport,
            departureAirport: event.departureAirport,
            arrivalAirport: event.arrivalAirport,
            dateFrom: event.dateFrom,
            dateTo: event.dateTo,
          ),
        );
      },
    );
  }

  Future<void> _handleGetMyFlights(GetMyFlightsEvent event, Emitter<FlightsState> emit) async {
    if (!event.isRefresh) {
      emit(const LoadingFlightsState());
    }

    final response = await _onTheWayRepository.getMyFlights();

    response.fold(
      (l) {
        emit(
          ErrorFlightsState(
            errorForUser: 'Не удалось загрузить ваши полеты',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessFlightsState(
            flights: r,
            airport: null,
            departureAirport: null,
            arrivalAirport: null,
            dateFrom: null,
            dateTo: null,
          ),
        );
      },
    );
  }

  Future<void> _handleCreateFlight(CreateFlightEvent event, Emitter<FlightsState> emit) async {
    emit(const LoadingFlightsState());

    final response = await _onTheWayRepository.createFlight(
      departureAirport: event.departureAirport,
      arrivalAirport: event.arrivalAirport,
      departureDate: event.departureDate,
      availableSeats: event.availableSeats,
      pricePerSeat: event.pricePerSeat,
      aircraftType: event.aircraftType,
      description: event.description,
      waypoints: event.waypoints,
      photos: event.photos,
    );

    response.fold(
      (l) {
        emit(
          ErrorFlightsState(
            errorForUser: 'Не удалось создать полет',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        // После успешного создания возвращаем отдельное состояние для создания
        emit(FlightsState.flightCreated(flight: r));
      },
    );
  }

  Future<void> _handleUpdateFlight(UpdateFlightEvent event, Emitter<FlightsState> emit) async {
    emit(const LoadingFlightsState());

    final response = await _onTheWayRepository.updateFlight(
      id: event.flightId,
      departureAirport: event.departureAirport,
      arrivalAirport: event.arrivalAirport,
      departureDate: event.departureDate,
      availableSeats: event.availableSeats,
      pricePerSeat: event.pricePerSeat,
      aircraftType: event.aircraftType,
      description: event.description,
      status: event.status,
      waypoints: event.waypoints,
    );

    response.fold(
      (l) {
        emit(
          ErrorFlightsState(
            errorForUser: 'Не удалось обновить полет',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        // После успешного обновления перезагружаем список полетов
        add(const GetFlightsEvent(isRefresh: false));
        add(const GetMyFlightsEvent(isRefresh: false));
      },
    );
  }

  Future<void> _handleClearFlights(ClearFlightsEvent event, Emitter<FlightsState> emit) async {
    // Очищаем состояние - сбрасываем на начальное состояние с пустым списком
    emit(
      const SuccessFlightsState(
        flights: [],
        airport: null,
        departureAirport: null,
        arrivalAirport: null,
        dateFrom: null,
        dateTo: null,
      ),
    );
  }

  Future<void> _handleDeleteFlight(DeleteFlightEvent event, Emitter<FlightsState> emit) async {
    emit(const LoadingFlightsState());

    final response = await _onTheWayRepository.deleteFlight(event.flightId);

    response.fold(
      (l) {
        emit(
          ErrorFlightsState(
            errorForUser: 'Не удалось отменить полет',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        // После успешной отмены перезагружаем список полетов
        add(const GetFlightsEvent(isRefresh: false));
        add(const GetMyFlightsEvent(isRefresh: false));
      },
    );
  }
}
