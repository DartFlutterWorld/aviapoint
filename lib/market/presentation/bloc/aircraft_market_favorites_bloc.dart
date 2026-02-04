import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aircraft_market_favorites_bloc.freezed.dart';

@freezed
abstract class AircraftMarketFavoritesEvent with _$AircraftMarketFavoritesEvent {
  const factory AircraftMarketFavoritesEvent.addToFavorites(int productId) = AddToFavoritesFavoritesEvent;
  const factory AircraftMarketFavoritesEvent.removeFromFavorites(int productId) = RemoveFromFavoritesFavoritesEvent;
}

@freezed
class AircraftMarketFavoritesState with _$AircraftMarketFavoritesState {
  const factory AircraftMarketFavoritesState.initial() = InitialAircraftMarketFavoritesState;
  const factory AircraftMarketFavoritesState.adding() = AddingAircraftMarketFavoritesState;
  const factory AircraftMarketFavoritesState.added(AircraftMarketEntity product) = AddedAircraftMarketFavoritesState;
  const factory AircraftMarketFavoritesState.removing() = RemovingAircraftMarketFavoritesState;
  const factory AircraftMarketFavoritesState.removed(AircraftMarketEntity product) = RemovedAircraftMarketFavoritesState;
  const factory AircraftMarketFavoritesState.error(String message) = ErrorAircraftMarketFavoritesState;
}

class AircraftMarketFavoritesBloc extends Bloc<AircraftMarketFavoritesEvent, AircraftMarketFavoritesState> {
  final MarketRepository _repository;

  AircraftMarketFavoritesBloc({required MarketRepository repository})
      : _repository = repository,
        super(const AircraftMarketFavoritesState.initial()) {
    on<AddToFavoritesFavoritesEvent>(_onAddToFavorites);
    on<RemoveFromFavoritesFavoritesEvent>(_onRemoveFromFavorites);
  }

  Future<void> _onAddToFavorites(AddToFavoritesFavoritesEvent event, Emitter<AircraftMarketFavoritesState> emit) async {
    emit(const AircraftMarketFavoritesState.adding());
    final result = await _repository.addToFavorites(event.productId);
    result.fold(
      (failure) => emit(AircraftMarketFavoritesState.error(failure.message ?? 'Ошибка добавления в избранное')),
      (_) async {
        // Получаем обновленный продукт для обновления состояния
        final productResult = await _repository.getProductById(event.productId);
        productResult.fold(
          (failure) => emit(AircraftMarketFavoritesState.error(failure.message ?? 'Ошибка загрузки товара')),
          (product) => emit(AircraftMarketFavoritesState.added(product)),
        );
      },
    );
  }

  Future<void> _onRemoveFromFavorites(RemoveFromFavoritesFavoritesEvent event, Emitter<AircraftMarketFavoritesState> emit) async {
    emit(const AircraftMarketFavoritesState.removing());
    final result = await _repository.removeFromFavorites(event.productId);
    result.fold(
      (failure) => emit(AircraftMarketFavoritesState.error(failure.message ?? 'Ошибка удаления из избранного')),
      (_) async {
        // Получаем обновленный продукт для обновления состояния
        final productResult = await _repository.getProductById(event.productId);
        productResult.fold(
          (failure) => emit(AircraftMarketFavoritesState.error(failure.message ?? 'Ошибка загрузки товара')),
          (product) => emit(AircraftMarketFavoritesState.removed(product)),
        );
      },
    );
  }
}
