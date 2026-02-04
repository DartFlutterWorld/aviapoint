import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  const factory AircraftMarketEvent.loadMore() = LoadMoreAircraftMarketEvent;

  const factory AircraftMarketEvent.refresh() = RefreshAircraftMarketEvent;
}

@freezed
class AircraftMarketState with _$AircraftMarketState {
  const factory AircraftMarketState.loading() = LoadingAircraftMarketState;
  const factory AircraftMarketState.loadingMore({required List<AircraftMarketEntity> products}) = LoadingMoreAircraftMarketState;
  const factory AircraftMarketState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorAircraftMarketState;
  const factory AircraftMarketState.success({required List<AircraftMarketEntity> products, @Default(true) bool hasMore}) = SuccessAircraftMarketState;
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

    result.fold((failure) {
      emit(
        AircraftMarketState.error(
          errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
          errorFromApi: failure.message,
          statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
          responseMessage: failure.responseMessage,
        ),
      );
    }, (products) {
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
        emit(
          AircraftMarketState.error(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
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
}
