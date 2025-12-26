import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_detail_bloc.freezed.dart';

@freezed
class FlightDetailState with _$FlightDetailState {
  const FlightDetailState._();

  const factory FlightDetailState.loading() = LoadingFlightDetailState;
  const factory FlightDetailState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorFlightDetailState;
  const factory FlightDetailState.success({required FlightEntity flight}) = SuccessFlightDetailState;
}

class FlightDetailBloc extends Bloc<int, FlightDetailState> {
  final OnTheWayRepository _onTheWayRepository;

  FlightDetailBloc({required OnTheWayRepository onTheWayRepository})
    : _onTheWayRepository = onTheWayRepository,
      super(const LoadingFlightDetailState()) {
    on<int>(_getFlight);
  }

  Future<void> _getFlight(int flightId, Emitter<FlightDetailState> emit) async {
    print('🔵 [FlightDetailBloc] Запрос данных о полете: $flightId');
    emit(const LoadingFlightDetailState());

    final response = await _onTheWayRepository.getFlight(flightId);

    response.fold(
      (l) {
        print('❌ [FlightDetailBloc] Ошибка загрузки полета: ${l.message}');
        emit(
          ErrorFlightDetailState(
            errorForUser: 'Не удалось загрузить детали полета',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        print('✅ [FlightDetailBloc] Получены данные о полете: id=${r.id}, availableSeats=${r.availableSeats}');
        emit(SuccessFlightDetailState(flight: r));
      },
    );
  }
}
