import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aircraft_market_detail_bloc.freezed.dart';

@freezed
abstract class AircraftMarketDetailEvent with _$AircraftMarketDetailEvent {
  const factory AircraftMarketDetailEvent.getProduct(int productId) = GetAircraftMarketDetailEvent;
}

@freezed
class AircraftMarketDetailState with _$AircraftMarketDetailState {
  const factory AircraftMarketDetailState.initial() = InitialAircraftMarketDetailState;
  const factory AircraftMarketDetailState.loading() = LoadingAircraftMarketDetailState;
  const factory AircraftMarketDetailState.error(String message) = ErrorAircraftMarketDetailState;
  const factory AircraftMarketDetailState.success(AircraftMarketEntity product) = SuccessAircraftMarketDetailState;
}

class AircraftMarketDetailBloc extends Bloc<AircraftMarketDetailEvent, AircraftMarketDetailState> {
  final MarketRepository _repository;

  AircraftMarketDetailBloc({required MarketRepository repository})
    : _repository = repository,
      super(const AircraftMarketDetailState.initial()) {
    on<GetAircraftMarketDetailEvent>(_onGetProduct);
  }

  Future<void> _onGetProduct(GetAircraftMarketDetailEvent event, Emitter<AircraftMarketDetailState> emit) async {
    emit(const AircraftMarketDetailState.loading());

    final result = await _repository.getProductById(event.productId);

    result.fold(
      (failure) => emit(AircraftMarketDetailState.error(failure.message ?? 'Ошибка загрузки товара')),
      (product) => emit(AircraftMarketDetailState.success(product)),
    );
  }
}
