import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'aircraft_market_bloc.freezed.dart';

@freezed
class AircraftMarketEvent with _$AircraftMarketEvent {
  const factory AircraftMarketEvent.getProducts({
    int? aircraftSubcategoriesId,
    List<int>? aircraftSubcategoriesIds,
    int? sellerId,
    String? searchQuery,
    int? priceFrom,
    int? priceTo,
    String? brand,
    String? sortBy,
    @Default(false) bool includeInactive,
    @Default(20) int limit,
    @Default(0) int offset,
  }) = GetAircraftMarketEvent;

  const factory AircraftMarketEvent.addToFavorites(int productId) = AddToFavoritesEvent;

  const factory AircraftMarketEvent.removeFromFavorites(int productId) = RemoveFromFavoritesEvent;

  const factory AircraftMarketEvent.deleteProduct(int productId) = DeleteMarketProductEvent;

  const factory AircraftMarketEvent.createAirCraft({
    required String title,
    String? description,
    required int price,
    int? aircraftSubcategoriesId,
    String? brand,
    String? location,
    int? year,
    int? totalFlightHours,
    int? enginePower,
    int? engineVolume,
    int? seats,
    String? condition,
    bool? isShareSale,
    int? shareNumerator,
    int? shareDenominator,
    // Файлы изображений для загрузки
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
  }) = CreateAircraftMarketProductEvent;

  const factory AircraftMarketEvent.updateProduct({
    required int productId,
    String? title,
    String? description,
    int? price,
    int? aircraftSubcategoriesId,
    String? mainImageUrl,
    List<String>? additionalImageUrls,
    String? brand,
    String? location,
    int? year,
    int? totalFlightHours,
    int? enginePower,
    int? engineVolume,
    int? seats,
    String? condition,
    bool? isShareSale,
    int? shareNumerator,
    int? shareDenominator,
    // Файлы изображений для загрузки
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
  }) = UpdateMarketProductEvent;

  const factory AircraftMarketEvent.loadMore() = LoadMoreAircraftMarketEvent;

  const factory AircraftMarketEvent.refresh() = RefreshAircraftMarketEvent;
}

@freezed
class AircraftMarketState with _$AircraftMarketState {
  const factory AircraftMarketState.loading() = LoadingAircraftMarketState;
  const factory AircraftMarketState.loadingMore({required List<AircraftMarketEntity> products}) = LoadingMoreAircraftMarketState;
  const factory AircraftMarketState.error(String message) = ErrorAircraftMarketState;
  const factory AircraftMarketState.success({required List<AircraftMarketEntity> products, @Default(true) bool hasMore}) = SuccessAircraftMarketState;
  const factory AircraftMarketState.creatingAirCraft() = CreatingAircraftMarketProductState;
  const factory AircraftMarketState.createdAirCraft({required AircraftMarketEntity product}) = CreatedAircraftMarketProductState;
  const factory AircraftMarketState.updating() = UpdatingMarketProductState;
  const factory AircraftMarketState.updated({required AircraftMarketEntity product}) = UpdatedMarketProductState;
}

class AircraftMarketBloc extends Bloc<AircraftMarketEvent, AircraftMarketState> {
  final MarketRepository _repository;
  int _currentOffset = 0;
  bool _hasMore = true;
  List<AircraftMarketEntity> _currentProducts = [];

  // Сохраняем последние фильтры для loadMore
  int? _lastAircraftSubcategoriesId;
  List<int>? _lastAircraftSubcategoriesIds;
  int? _lastSellerId;
  String? _lastSearchQuery;
  int? _lastPriceFrom;
  int? _lastPriceTo;
  String? _lastBrand;
  String _lastSortBy = 'default';
  bool _lastIncludeInactive = false;
  static const int _defaultLimit = 20;

  AircraftMarketBloc({required MarketRepository repository}) : _repository = repository, super(const AircraftMarketState.loading()) {
    on<GetAircraftMarketEvent>(_onGetProducts);
    on<LoadMoreAircraftMarketEvent>(_onLoadMore);
    on<RefreshAircraftMarketEvent>(_onRefresh);
    on<AddToFavoritesEvent>(_onAddToFavorites);
    on<RemoveFromFavoritesEvent>(_onRemoveFromFavorites);
    on<DeleteMarketProductEvent>(_onDeleteProduct);
    on<CreateAircraftMarketProductEvent>(_onCreateAirCraft);
    on<UpdateMarketProductEvent>(_onUpdateProduct);
  }

  Future<void> _onGetProducts(GetAircraftMarketEvent event, Emitter<AircraftMarketState> emit) async {
    _currentOffset = 0;
    _hasMore = true;

    // Сохраняем фильтры для loadMore
    _lastAircraftSubcategoriesId = event.aircraftSubcategoriesId;
    _lastAircraftSubcategoriesIds = event.aircraftSubcategoriesIds;
    _lastSellerId = event.sellerId;
    _lastSearchQuery = event.searchQuery;
    _lastPriceFrom = event.priceFrom;
    _lastPriceTo = event.priceTo;
    _lastBrand = event.brand;
    _lastSortBy = event.sortBy ?? 'default';
    _lastIncludeInactive = event.includeInactive;

    emit(const AircraftMarketState.loading());

    final result = await _repository.getProducts(
      aircraftSubcategoriesId: event.aircraftSubcategoriesId,
      aircraftSubcategoriesIds: event.aircraftSubcategoriesIds,
      sellerId: event.sellerId,
      searchQuery: event.searchQuery,
      priceFrom: event.priceFrom,
      priceTo: event.priceTo,
      brand: event.brand,
      sortBy: event.sortBy ?? 'default',
      includeInactive: event.includeInactive,
      limit: event.limit,
      offset: event.offset,
    );

    result.fold((failure) => emit(AircraftMarketState.error(failure.message ?? 'Ошибка загрузки продуктов')), (products) {
      _currentProducts = products;
      _currentOffset = products.length;
      _hasMore = products.length >= event.limit;
      emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: _hasMore));
    });
  }

  Future<void> _onLoadMore(LoadMoreAircraftMarketEvent event, Emitter<AircraftMarketState> emit) async {
    if (!_hasMore) return;

    final currentProducts = state.maybeWhen(success: (products, hasMore) => products, loadingMore: (products) => products, orElse: () => <AircraftMarketEntity>[]);

    if (currentProducts.isEmpty) return;

    emit(AircraftMarketState.loadingMore(products: currentProducts));

    final result = await _repository.getProducts(
      aircraftSubcategoriesId: _lastAircraftSubcategoriesId,
      aircraftSubcategoriesIds: _lastAircraftSubcategoriesIds,
      sellerId: _lastSellerId,
      searchQuery: _lastSearchQuery,
      priceFrom: _lastPriceFrom,
      priceTo: _lastPriceTo,
      brand: _lastBrand,
      sortBy: _lastSortBy,
      includeInactive: _lastIncludeInactive,
      limit: _defaultLimit,
      offset: _currentOffset,
    );

    result.fold(
      (failure) {
        emit(AircraftMarketState.error(failure.message ?? 'Ошибка загрузки продуктов'));
      },
      (products) {
        final updatedProducts = [...currentProducts, ...products];
        _currentProducts = updatedProducts;
        _currentOffset = updatedProducts.length;
        _hasMore = products.length >= _defaultLimit;
        emit(AircraftMarketState.success(products: updatedProducts, hasMore: _hasMore));
      },
    );
  }

  Future<void> _onRefresh(RefreshAircraftMarketEvent event, Emitter<AircraftMarketState> emit) async {
    _currentProducts = [];
    _currentOffset = 0;
    _hasMore = true;
    add(
      GetAircraftMarketEvent(
        aircraftSubcategoriesId: _lastAircraftSubcategoriesId,
        aircraftSubcategoriesIds: _lastAircraftSubcategoriesIds,
        sellerId: _lastSellerId,
        searchQuery: _lastSearchQuery,
        priceFrom: _lastPriceFrom,
        priceTo: _lastPriceTo,
        brand: _lastBrand,
        sortBy: _lastSortBy,
        includeInactive: _lastIncludeInactive,
        offset: 0,
        limit: _defaultLimit,
      ),
    );
  }

  Future<void> _onAddToFavorites(AddToFavoritesEvent event, Emitter<AircraftMarketState> emit) async {
    final result = await _repository.addToFavorites(event.productId);
    result.fold(
      (failure) {
        // Обновляем состояние ошибкой, но не меняем список продуктов
        emit(AircraftMarketState.error(failure.message ?? 'Ошибка добавления в избранное'));
        // Возвращаем успешное состояние с продуктами
        if (_currentProducts.isNotEmpty) {
          emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: true));
        }
      },
      (_) {
        // Обновляем флаг isFavorite в списке продуктов
        final index = _currentProducts.indexWhere((p) => p.id == event.productId);
        if (index != -1) {
          final product = _currentProducts[index];
          _currentProducts[index] = AircraftMarketEntity(
            id: product.id,
            title: product.title,
            description: product.description,
            price: product.price,
            aircraftSubcategoriesId: product.aircraftSubcategoriesId,
            sellerId: product.sellerId,
            mainImageUrl: product.mainImageUrl,
            additionalImageUrls: product.additionalImageUrls,
            brand: product.brand,
            location: product.location,
            isActive: product.isActive,
            viewsCount: product.viewsCount,
            isFavorite: true,
            year: product.year,
            totalFlightHours: product.totalFlightHours,
            enginePower: product.enginePower,
            engineVolume: product.engineVolume,
            seats: product.seats,
            condition: product.condition,
            isShareSale: product.isShareSale,
            shareNumerator: product.shareNumerator,
            shareDenominator: product.shareDenominator,
            sellerFirstName: product.sellerFirstName,
            sellerLastName: product.sellerLastName,
            sellerPhone: product.sellerPhone,
            sellerTelegram: product.sellerTelegram,
            sellerMax: product.sellerMax,
            createdAt: product.createdAt,
            updatedAt: product.updatedAt,
            publishedUntil: product.publishedUntil,
          );
          emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: true));
        }
      },
    );
  }

  Future<void> _onRemoveFromFavorites(RemoveFromFavoritesEvent event, Emitter<AircraftMarketState> emit) async {
    final result = await _repository.removeFromFavorites(event.productId);
    result.fold(
      (failure) {
        emit(AircraftMarketState.error(failure.message ?? 'Ошибка удаления из избранного'));
        if (_currentProducts.isNotEmpty) {
          emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: true));
        }
      },
      (_) {
        // Обновляем флаг isFavorite в списке продуктов
        final index = _currentProducts.indexWhere((p) => p.id == event.productId);
        if (index != -1) {
          final product = _currentProducts[index];
          _currentProducts[index] = AircraftMarketEntity(
            id: product.id,
            title: product.title,
            description: product.description,
            price: product.price,
            aircraftSubcategoriesId: product.aircraftSubcategoriesId,
            sellerId: product.sellerId,
            mainImageUrl: product.mainImageUrl,
            additionalImageUrls: product.additionalImageUrls,
            brand: product.brand,
            location: product.location,
            isActive: product.isActive,
            viewsCount: product.viewsCount,
            isFavorite: false,
            year: product.year,
            totalFlightHours: product.totalFlightHours,
            enginePower: product.enginePower,
            engineVolume: product.engineVolume,
            seats: product.seats,
            condition: product.condition,
            isShareSale: product.isShareSale,
            shareNumerator: product.shareNumerator,
            shareDenominator: product.shareDenominator,
            sellerFirstName: product.sellerFirstName,
            sellerLastName: product.sellerLastName,
            sellerPhone: product.sellerPhone,
            sellerTelegram: product.sellerTelegram,
            sellerMax: product.sellerMax,
            createdAt: product.createdAt,
            updatedAt: product.updatedAt,
            publishedUntil: product.publishedUntil,
          );
          emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: true));
        }
      },
    );
  }

  Future<void> _onDeleteProduct(DeleteMarketProductEvent event, Emitter<AircraftMarketState> emit) async {
    final result = await _repository.deleteProduct(event.productId);
    result.fold(
      (failure) {
        emit(AircraftMarketState.error(failure.message ?? 'Ошибка удаления товара'));
        if (_currentProducts.isNotEmpty) {
          emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: _hasMore));
        }
      },
      (_) {
        // Удаляем товар из списка
        _currentProducts.removeWhere((p) => p.id == event.productId);
        emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onCreateAirCraft(CreateAircraftMarketProductEvent event, Emitter<AircraftMarketState> emit) async {
    emit(const AircraftMarketState.creatingAirCraft());

    final result = await _repository.createAirCraft(
      title: event.title,
      description: event.description,
      price: event.price,
      aircraftSubcategoriesId: event.aircraftSubcategoriesId,
      brand: event.brand,
      location: event.location,
      year: event.year,
      totalFlightHours: event.totalFlightHours,
      enginePower: event.enginePower,
      engineVolume: event.engineVolume,
      seats: event.seats,
      condition: event.condition,
      mainImageFile: event.mainImageFile,
      additionalImageFiles: event.additionalImageFiles,
    );

    result.fold(
      (failure) {
        emit(AircraftMarketState.error(failure.message ?? 'Ошибка создания товара'));
      },
      (product) {
        emit(AircraftMarketState.createdAirCraft(product: product));
      },
    );
  }

  Future<void> _onUpdateProduct(UpdateMarketProductEvent event, Emitter<AircraftMarketState> emit) async {
    emit(const AircraftMarketState.updating());

    final result = await _repository.updateProduct(
      productId: event.productId,
      title: event.title,
      description: event.description,
      price: event.price,
      aircraftSubcategoriesId: event.aircraftSubcategoriesId,
      mainImageUrl: event.mainImageUrl,
      additionalImageUrls: event.additionalImageUrls,
      brand: event.brand,
      location: event.location,
      year: event.year,
      totalFlightHours: event.totalFlightHours,
      enginePower: event.enginePower,
      engineVolume: event.engineVolume,
      seats: event.seats,
      condition: event.condition,
      isShareSale: event.isShareSale,
      shareNumerator: event.shareNumerator,
      shareDenominator: event.shareDenominator,
      mainImageFile: event.mainImageFile,
      additionalImageFiles: event.additionalImageFiles,
    );

    result.fold(
      (failure) {
        emit(AircraftMarketState.error(failure.message ?? 'Ошибка обновления товара'));
        if (_currentProducts.isNotEmpty) {
          emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: _hasMore));
        }
      },
      (product) {
        // Обновляем товар в списке
        final index = _currentProducts.indexWhere((p) => p.id == event.productId);
        if (index != -1) {
          _currentProducts[index] = product;
        }
        emit(AircraftMarketState.updated(product: product));
        // Возвращаемся к успешному состоянию со списком
        emit(AircraftMarketState.success(products: List.from(_currentProducts), hasMore: _hasMore));
      },
    );
  }
}
