import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

part 'parts_market_bloc.freezed.dart';

@freezed
abstract class PartsMarketEvent with _$PartsMarketEvent {
  const factory PartsMarketEvent.getParts({
    int? mainCategoryId,
    int? subcategoryId,
    int? sellerId,
    int? manufacturerId,
    String? searchQuery,
    String? condition,
    int? priceFrom,
    int? priceTo,
    String? sortBy,
    @Default(false) bool includeInactive,
    @Default(20) int limit,
    @Default(0) int offset,
  }) = GetPartsMarketEvent;

  const factory PartsMarketEvent.addToFavorites(int partId) = AddPartToFavoritesEvent;

  const factory PartsMarketEvent.removeFromFavorites(int partId) = RemovePartFromFavoritesEvent;

  const factory PartsMarketEvent.deletePart(int partId) = DeletePartsMarketEvent;

  const factory PartsMarketEvent.createPart({
    required String title,
    String? description,
    required int price,
    @Default('RUB') String currency,
    int? partsMainCategoryId,
    int? partsSubcategoryId,
    int? manufacturerId,
    String? manufacturerName,
    String? partNumber,
    String? oemNumber,
    String? condition,
    @Default(1) int quantity,
    String? location,
    double? weightKg,
    double? dimensionsLengthCm,
    double? dimensionsWidthCm,
    double? dimensionsHeightCm,
    String? compatibleAircraftModelsText,
    List<int>? compatibleAircraftModelIds,
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
    @Default(true) bool isPublished,
  }) = CreatePartsMarketEvent;

  const factory PartsMarketEvent.updatePart({
    required int partId,
    String? title,
    String? description,
    int? price,
    String? currency,
    int? partsMainCategoryId,
    int? partsSubcategoryId,
    int? manufacturerId,
    String? manufacturerName,
    String? partNumber,
    String? oemNumber,
    String? condition,
    int? quantity,
    String? location,
    double? weightKg,
    double? dimensionsLengthCm,
    double? dimensionsWidthCm,
    double? dimensionsHeightCm,
    String? compatibleAircraftModelsText,
    List<int>? compatibleAircraftModelIds,
    String? mainImageUrl,
    List<String>? additionalImageUrls,
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
  }) = UpdatePartsMarketEvent;

  const factory PartsMarketEvent.loadMore() = LoadMorePartsMarketEvent;

  const factory PartsMarketEvent.refresh() = RefreshPartsMarketEvent;

  const factory PartsMarketEvent.publishPart(int partId) = PublishPartsMarketEvent;

  const factory PartsMarketEvent.unpublishPart(int partId) = UnpublishPartsMarketEvent;
}

@freezed
abstract class PartsMarketState with _$PartsMarketState {
  const factory PartsMarketState.loading() = LoadingPartsMarketState;
  const factory PartsMarketState.loadingMore({required List<PartsMarketEntity> parts}) = LoadingMorePartsMarketState;
  const factory PartsMarketState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorPartsMarketState;
  const factory PartsMarketState.success({required List<PartsMarketEntity> parts, @Default(true) bool hasMore}) =
      SuccessPartsMarketState;
  const factory PartsMarketState.creatingPart() = CreatingPartsMarketState;
  const factory PartsMarketState.createdPart({required PartsMarketEntity part}) = CreatedPartsMarketState;
  const factory PartsMarketState.updating() = UpdatingPartsMarketState;
  const factory PartsMarketState.updated({required PartsMarketEntity part}) = UpdatedPartsMarketState;
}

class PartsMarketBloc extends Bloc<PartsMarketEvent, PartsMarketState> {
  final MarketRepository _repository;
  int _currentOffset = 0;
  bool _hasMore = true;
  List<PartsMarketEntity> _currentParts = [];

  // Сохраняем последние фильтры для loadMore
  int? _lastMainCategoryId;
  int? _lastSubcategoryId;
  int? _lastSellerId;
  int? _lastManufacturerId;
  String? _lastSearchQuery;
  String? _lastCondition;
  int? _lastPriceFrom;
  int? _lastPriceTo;
  String _lastSortBy = 'default';
  bool _lastIncludeInactive = false;
  static const int _defaultLimit = 20;

  PartsMarketBloc({required MarketRepository repository})
    : _repository = repository,
      super(const PartsMarketState.loading()) {
    on<GetPartsMarketEvent>(_onGetParts);
    on<LoadMorePartsMarketEvent>(_onLoadMore);
    on<RefreshPartsMarketEvent>(_onRefresh);
    on<AddPartToFavoritesEvent>(_onAddToFavorites);
    on<RemovePartFromFavoritesEvent>(_onRemoveFromFavorites);
    on<DeletePartsMarketEvent>(_onDeletePart);
    on<CreatePartsMarketEvent>(_onCreatePart);
    on<UpdatePartsMarketEvent>(_onUpdatePart);
    on<PublishPartsMarketEvent>(_onPublishPart);
    on<UnpublishPartsMarketEvent>(_onUnpublishPart);
  }

  Future<void> _onGetParts(GetPartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    _currentOffset = 0;
    _hasMore = true;

    // Сохраняем фильтры для loadMore
    _lastMainCategoryId = event.mainCategoryId;
    _lastSubcategoryId = event.subcategoryId;
    _lastSellerId = event.sellerId;
    _lastManufacturerId = event.manufacturerId;
    _lastSearchQuery = event.searchQuery;
    _lastCondition = event.condition;
    _lastPriceFrom = event.priceFrom;
    _lastPriceTo = event.priceTo;
    _lastSortBy = event.sortBy ?? 'default';
    _lastIncludeInactive = event.includeInactive;

    emit(const PartsMarketState.loading());

    final result = await _repository.getParts(
      mainCategoryId: event.mainCategoryId,
      subcategoryId: event.subcategoryId,
      sellerId: event.sellerId,
      manufacturerId: event.manufacturerId,
      searchQuery: event.searchQuery,
      condition: event.condition,
      priceFrom: event.priceFrom,
      priceTo: event.priceTo,
      sortBy: event.sortBy ?? 'default',
      includeInactive: event.includeInactive,
      limit: event.limit,
      offset: event.offset,
    );

    result.fold(
      (failure) {
        debugPrint('❌ [PartsMarketBloc] Ошибка загрузки запчастей: ${failure.message}');
        emit(
          PartsMarketState.error(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
      },
      (parts) {
        debugPrint('✅ [PartsMarketBloc] Загружено запчастей: ${parts.length}');
        _currentParts = parts;
        _currentOffset = parts.length;
        _hasMore = parts.length >= event.limit;
        emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onLoadMore(LoadMorePartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    if (!_hasMore) return;

    final currentParts = state.maybeWhen(
      success: (parts, hasMore) => parts,
      loadingMore: (parts) => parts,
      orElse: () => <PartsMarketEntity>[],
    );

    if (currentParts.isEmpty) return;

    emit(PartsMarketState.loadingMore(parts: currentParts));

    final result = await _repository.getParts(
      mainCategoryId: _lastMainCategoryId,
      subcategoryId: _lastSubcategoryId,
      sellerId: _lastSellerId,
      manufacturerId: _lastManufacturerId,
      searchQuery: _lastSearchQuery,
      condition: _lastCondition,
      priceFrom: _lastPriceFrom,
      priceTo: _lastPriceTo,
      sortBy: _lastSortBy,
      includeInactive: _lastIncludeInactive,
      limit: _defaultLimit,
      offset: _currentOffset,
    );

    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
      },
      (parts) {
        final updatedParts = [...currentParts, ...parts];
        _currentParts = updatedParts;
        _currentOffset = updatedParts.length;
        _hasMore = parts.length >= _defaultLimit;
        emit(PartsMarketState.success(parts: updatedParts, hasMore: _hasMore));
      },
    );
  }

  Future<void> _onRefresh(RefreshPartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    _currentParts = [];
    _currentOffset = 0;
    _hasMore = true;

    // Если фильтры не были установлены (первая загрузка), загружаем все объявления
    if (_lastMainCategoryId == null && _lastSubcategoryId == null && _lastSearchQuery == null) {
      add(const GetPartsMarketEvent());
    } else {
      add(
        GetPartsMarketEvent(
          mainCategoryId: _lastMainCategoryId,
          subcategoryId: _lastSubcategoryId,
          sellerId: _lastSellerId,
          manufacturerId: _lastManufacturerId,
          searchQuery: _lastSearchQuery,
          condition: _lastCondition,
          priceFrom: _lastPriceFrom,
          priceTo: _lastPriceTo,
          sortBy: _lastSortBy,
          includeInactive: _lastIncludeInactive,
          offset: 0,
          limit: _defaultLimit,
        ),
      );
    }
  }

  Future<void> _onAddToFavorites(AddPartToFavoritesEvent event, Emitter<PartsMarketState> emit) async {
    final result = await _repository.addPartToFavorites(event.partId);
    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Ошибка добавления в избранное',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
        if (_currentParts.isNotEmpty) {
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
      (_) {
        // Обновляем флаг isFavorite в списке
        final index = _currentParts.indexWhere((p) => p.id == event.partId);
        if (index != -1) {
          final part = _currentParts[index];
          _currentParts[index] = PartsMarketEntity(
            id: part.id,
            title: part.title,
            description: part.description,
            price: part.price,
            partsSubcategoryId: part.partsSubcategoryId,
            partsMainCategoryId: part.partsMainCategoryId,
            sellerId: part.sellerId,
            manufacturerId: part.manufacturerId,
            manufacturerName: part.manufacturerName,
            location: part.location,
            mainImageUrl: part.mainImageUrl,
            additionalImageUrls: part.additionalImageUrls,
            partNumber: part.partNumber,
            oemNumber: part.oemNumber,
            condition: part.condition,
            quantity: part.quantity,
            currency: part.currency,
            weightKg: part.weightKg,
            dimensionsLengthCm: part.dimensionsLengthCm,
            dimensionsWidthCm: part.dimensionsWidthCm,
            dimensionsHeightCm: part.dimensionsHeightCm,
            compatibleAircraftModelsText: part.compatibleAircraftModelsText,
            isPublished: part.isPublished,
            isActive: part.isActive,
            publishedUntil: part.publishedUntil,
            viewsCount: part.viewsCount,
            favoritesCount: part.favoritesCount,
            isFavorite: true,
            sellerFirstName: part.sellerFirstName,
            sellerLastName: part.sellerLastName,
            sellerPhone: part.sellerPhone,
            sellerTelegram: part.sellerTelegram,
            sellerMax: part.sellerMax,
            mainCategoryName: part.mainCategoryName,
            subcategoryName: part.subcategoryName,
            manufacturerNameDisplay: part.manufacturerNameDisplay,
            createdAt: part.createdAt,
            updatedAt: part.updatedAt,
            soldAt: part.soldAt,
          );
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
    );
  }

  Future<void> _onRemoveFromFavorites(RemovePartFromFavoritesEvent event, Emitter<PartsMarketState> emit) async {
    final result = await _repository.removePartFromFavorites(event.partId);
    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Ошибка удаления из избранного',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
        if (_currentParts.isNotEmpty) {
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
      (_) {
        // Обновляем флаг isFavorite в списке
        final index = _currentParts.indexWhere((p) => p.id == event.partId);
        if (index != -1) {
          final part = _currentParts[index];
          _currentParts[index] = PartsMarketEntity(
            id: part.id,
            title: part.title,
            description: part.description,
            price: part.price,
            partsSubcategoryId: part.partsSubcategoryId,
            partsMainCategoryId: part.partsMainCategoryId,
            sellerId: part.sellerId,
            manufacturerId: part.manufacturerId,
            manufacturerName: part.manufacturerName,
            location: part.location,
            mainImageUrl: part.mainImageUrl,
            additionalImageUrls: part.additionalImageUrls,
            partNumber: part.partNumber,
            oemNumber: part.oemNumber,
            condition: part.condition,
            quantity: part.quantity,
            currency: part.currency,
            weightKg: part.weightKg,
            dimensionsLengthCm: part.dimensionsLengthCm,
            dimensionsWidthCm: part.dimensionsWidthCm,
            dimensionsHeightCm: part.dimensionsHeightCm,
            compatibleAircraftModelsText: part.compatibleAircraftModelsText,
            isPublished: part.isPublished,
            isActive: part.isActive,
            publishedUntil: part.publishedUntil,
            viewsCount: part.viewsCount,
            favoritesCount: part.favoritesCount,
            isFavorite: false,
            sellerFirstName: part.sellerFirstName,
            sellerLastName: part.sellerLastName,
            sellerPhone: part.sellerPhone,
            sellerTelegram: part.sellerTelegram,
            sellerMax: part.sellerMax,
            mainCategoryName: part.mainCategoryName,
            subcategoryName: part.subcategoryName,
            manufacturerNameDisplay: part.manufacturerNameDisplay,
            createdAt: part.createdAt,
            updatedAt: part.updatedAt,
            soldAt: part.soldAt,
          );
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
    );
  }

  Future<void> _onDeletePart(DeletePartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    final result = await _repository.deletePart(event.partId);
    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Ошибка удаления запчасти',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
        if (_currentParts.isNotEmpty) {
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
      (_) {
        // Удаляем запчасть из списка
        _currentParts.removeWhere((p) => p.id == event.partId);
        emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onCreatePart(CreatePartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    emit(const PartsMarketState.creatingPart());

    final result = await _repository.createPart(
      title: event.title,
      description: event.description,
      price: event.price,
      currency: event.currency,
      partsMainCategoryId: event.partsMainCategoryId,
      partsSubcategoryId: event.partsSubcategoryId,
      manufacturerId: event.manufacturerId,
      manufacturerName: event.manufacturerName,
      partNumber: event.partNumber,
      oemNumber: event.oemNumber,
      condition: event.condition,
      quantity: event.quantity,
      location: event.location,
      weightKg: event.weightKg,
      dimensionsLengthCm: event.dimensionsLengthCm,
      dimensionsWidthCm: event.dimensionsWidthCm,
      dimensionsHeightCm: event.dimensionsHeightCm,
      compatibleAircraftModelsText: event.compatibleAircraftModelsText,
      compatibleAircraftModelIds: event.compatibleAircraftModelIds,
      mainImageFile: event.mainImageFile,
      additionalImageFiles: event.additionalImageFiles,
      isPublished: event.isPublished,
    );

    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Ошибка создания запчасти',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
        // Восстанавливаем предыдущее состояние при ошибке
        if (_currentParts.isNotEmpty) {
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
      (part) async {
        // Если объявление должно быть опубликовано, но не опубликовано, публикуем его
        if (event.isPublished && !part.isPublished) {
          final publishResult = await _repository.publishPart(part.id);
          publishResult.fold(
            (failure) {
              debugPrint('⚠️ [PartsMarketBloc] Не удалось опубликовать объявление ${part.id}: ${failure.message}');
              // Даже если публикация не удалась, показываем созданное объявление
              emit(PartsMarketState.createdPart(part: part));
            },
            (publishedPart) {
              debugPrint('✅ [PartsMarketBloc] Объявление ${part.id} успешно опубликовано');
              emit(PartsMarketState.createdPart(part: publishedPart));
            },
          );
        } else {
          // Если объявление уже опубликовано или не должно быть опубликовано, просто показываем его
          emit(PartsMarketState.createdPart(part: part));
        }
      },
    );
  }

  Future<void> _onUpdatePart(UpdatePartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    emit(const PartsMarketState.updating());

    final result = await _repository.updatePart(
      partId: event.partId,
      title: event.title,
      description: event.description,
      price: event.price,
      currency: event.currency,
      partsMainCategoryId: event.partsMainCategoryId,
      partsSubcategoryId: event.partsSubcategoryId,
      manufacturerId: event.manufacturerId,
      manufacturerName: event.manufacturerName,
      partNumber: event.partNumber,
      oemNumber: event.oemNumber,
      condition: event.condition,
      quantity: event.quantity,
      location: event.location,
      weightKg: event.weightKg,
      dimensionsLengthCm: event.dimensionsLengthCm,
      dimensionsWidthCm: event.dimensionsWidthCm,
      dimensionsHeightCm: event.dimensionsHeightCm,
      compatibleAircraftModelsText: event.compatibleAircraftModelsText,
      compatibleAircraftModelIds: event.compatibleAircraftModelIds,
      mainImageUrl: event.mainImageUrl,
      additionalImageUrls: event.additionalImageUrls,
      mainImageFile: event.mainImageFile,
      additionalImageFiles: event.additionalImageFiles,
    );

    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Ошибка обновления запчасти',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
        if (_currentParts.isNotEmpty) {
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
      (part) {
        // Обновляем запчасть в списке
        final index = _currentParts.indexWhere((p) => p.id == event.partId);
        if (index != -1) {
          _currentParts[index] = part;
        }
        emit(PartsMarketState.updated(part: part));
        // Возвращаемся к успешному состоянию со списком
        emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onPublishPart(PublishPartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    final result = await _repository.publishPart(event.partId);
    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Ошибка публикации запчасти',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
        if (_currentParts.isNotEmpty) {
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
      (part) {
        // Обновляем запчасть в списке
        final index = _currentParts.indexWhere((p) => p.id == event.partId);
        if (index != -1) {
          _currentParts[index] = part;
        }
        emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onUnpublishPart(UnpublishPartsMarketEvent event, Emitter<PartsMarketState> emit) async {
    final result = await _repository.unpublishPart(event.partId);
    result.fold(
      (failure) {
        emit(
          PartsMarketState.error(
            errorForUser: 'Ошибка снятия с публикации',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
          ),
        );
        if (_currentParts.isNotEmpty) {
          emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
        }
      },
      (part) {
        // Обновляем запчасть в списке
        final index = _currentParts.indexWhere((p) => p.id == event.partId);
        if (index != -1) {
          _currentParts[index] = part;
        }
        emit(PartsMarketState.success(parts: List.from(_currentParts), hasMore: _hasMore));
      },
    );
  }
}
