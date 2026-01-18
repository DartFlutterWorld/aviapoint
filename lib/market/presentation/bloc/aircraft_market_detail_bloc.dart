import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aircraft_market_detail_bloc.freezed.dart';

@freezed
abstract class AircraftMarketDetailEvent with _$AircraftMarketDetailEvent {
  const factory AircraftMarketDetailEvent.getProduct(int productId) = GetAircraftMarketDetailEvent;
  const factory AircraftMarketDetailEvent.deleteProduct(int productId) = DeleteAircraftMarketDetailEvent;
  const factory AircraftMarketDetailEvent.addToFavorites(int productId) = AddToFavoritesDetailEvent;
  const factory AircraftMarketDetailEvent.removeFromFavorites(int productId) = RemoveFromFavoritesDetailEvent;
}

@freezed
class AircraftMarketDetailState with _$AircraftMarketDetailState {
  const factory AircraftMarketDetailState.initial() = InitialAircraftMarketDetailState;
  const factory AircraftMarketDetailState.loading() = LoadingAircraftMarketDetailState;
  const factory AircraftMarketDetailState.error(String message) = ErrorAircraftMarketDetailState;
  const factory AircraftMarketDetailState.success(AircraftMarketEntity product) = SuccessAircraftMarketDetailState;
  const factory AircraftMarketDetailState.deleted() = DeletedAircraftMarketDetailState;
}

class AircraftMarketDetailBloc extends Bloc<AircraftMarketDetailEvent, AircraftMarketDetailState> {
  final MarketRepository _repository;

  AircraftMarketDetailBloc({required MarketRepository repository}) : _repository = repository, super(const AircraftMarketDetailState.initial()) {
    on<GetAircraftMarketDetailEvent>(_onGetProduct);
    on<DeleteAircraftMarketDetailEvent>(_onDeleteProduct);
    on<AddToFavoritesDetailEvent>(_onAddToFavorites);
    on<RemoveFromFavoritesDetailEvent>(_onRemoveFromFavorites);
  }

  Future<void> _onGetProduct(GetAircraftMarketDetailEvent event, Emitter<AircraftMarketDetailState> emit) async {
    emit(const AircraftMarketDetailState.loading());

    final result = await _repository.getProductById(event.productId);

    result.fold((failure) => emit(AircraftMarketDetailState.error(failure.message ?? 'Ошибка загрузки товара')), (product) => emit(AircraftMarketDetailState.success(product)));
  }

  Future<void> _onDeleteProduct(DeleteAircraftMarketDetailEvent event, Emitter<AircraftMarketDetailState> emit) async {
    final result = await _repository.deleteProduct(event.productId);

    result.fold((failure) => emit(AircraftMarketDetailState.error(failure.message ?? 'Ошибка удаления товара')), (_) => emit(const AircraftMarketDetailState.deleted()));
  }

  Future<void> _onAddToFavorites(AddToFavoritesDetailEvent event, Emitter<AircraftMarketDetailState> emit) async {
    // Сохраняем текущий продукт перед обновлением
    AircraftMarketEntity? currentProduct;
    if (state is SuccessAircraftMarketDetailState) {
      currentProduct = (state as SuccessAircraftMarketDetailState).product;
    }

    final result = await _repository.addToFavorites(event.productId);

    result.fold((failure) => emit(AircraftMarketDetailState.error(failure.message ?? 'Ошибка добавления в избранное')), (_) {
      // Обновляем состояние товара, устанавливая isFavorite = true
      if (currentProduct != null) {
        final updatedProduct = AircraftMarketEntity(
          id: currentProduct.id,
          title: currentProduct.title,
          description: currentProduct.description,
          price: currentProduct.price,
          aircraftSubcategoriesId: currentProduct.aircraftSubcategoriesId,
          sellerId: currentProduct.sellerId,
          mainImageUrl: currentProduct.mainImageUrl,
          additionalImageUrls: currentProduct.additionalImageUrls,
          brand: currentProduct.brand,
          location: currentProduct.location,
          isActive: currentProduct.isActive,
          viewsCount: currentProduct.viewsCount,
          isFavorite: true,
          year: currentProduct.year,
          totalFlightHours: currentProduct.totalFlightHours,
          enginePower: currentProduct.enginePower,
          engineVolume: currentProduct.engineVolume,
          seats: currentProduct.seats,
          condition: currentProduct.condition,
          isShareSale: currentProduct.isShareSale,
          shareNumerator: currentProduct.shareNumerator,
          shareDenominator: currentProduct.shareDenominator,
          sellerFirstName: currentProduct.sellerFirstName,
          sellerLastName: currentProduct.sellerLastName,
          sellerPhone: currentProduct.sellerPhone,
          sellerTelegram: currentProduct.sellerTelegram,
          sellerMax: currentProduct.sellerMax,
          createdAt: currentProduct.createdAt,
          updatedAt: currentProduct.updatedAt,
        );
        emit(AircraftMarketDetailState.success(updatedProduct));
      }
    });
  }

  Future<void> _onRemoveFromFavorites(RemoveFromFavoritesDetailEvent event, Emitter<AircraftMarketDetailState> emit) async {
    // Сохраняем текущий продукт перед обновлением
    AircraftMarketEntity? currentProduct;
    if (state is SuccessAircraftMarketDetailState) {
      currentProduct = (state as SuccessAircraftMarketDetailState).product;
    }

    final result = await _repository.removeFromFavorites(event.productId);

    result.fold((failure) => emit(AircraftMarketDetailState.error(failure.message ?? 'Ошибка удаления из избранного')), (_) {
      // Обновляем состояние товара, устанавливая isFavorite = false
      if (currentProduct != null) {
        final updatedProduct = AircraftMarketEntity(
          id: currentProduct.id,
          title: currentProduct.title,
          description: currentProduct.description,
          price: currentProduct.price,
          aircraftSubcategoriesId: currentProduct.aircraftSubcategoriesId,
          sellerId: currentProduct.sellerId,
          mainImageUrl: currentProduct.mainImageUrl,
          additionalImageUrls: currentProduct.additionalImageUrls,
          brand: currentProduct.brand,
          location: currentProduct.location,
          isActive: currentProduct.isActive,
          viewsCount: currentProduct.viewsCount,
          isFavorite: false,
          year: currentProduct.year,
          totalFlightHours: currentProduct.totalFlightHours,
          enginePower: currentProduct.enginePower,
          engineVolume: currentProduct.engineVolume,
          seats: currentProduct.seats,
          condition: currentProduct.condition,
          isShareSale: currentProduct.isShareSale,
          shareNumerator: currentProduct.shareNumerator,
          shareDenominator: currentProduct.shareDenominator,
          sellerFirstName: currentProduct.sellerFirstName,
          sellerLastName: currentProduct.sellerLastName,
          sellerPhone: currentProduct.sellerPhone,
          sellerTelegram: currentProduct.sellerTelegram,
          sellerMax: currentProduct.sellerMax,
          createdAt: currentProduct.createdAt,
          updatedAt: currentProduct.updatedAt,
        );
        emit(AircraftMarketDetailState.success(updatedProduct));
      }
    });
  }
}
