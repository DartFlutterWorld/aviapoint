import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'aircraft_market_edit_bloc.freezed.dart';

@freezed
abstract class AircraftMarketEditEvent with _$AircraftMarketEditEvent {
  const factory AircraftMarketEditEvent.getProduct(int productId) = GetAircraftMarketEditEvent;
  const factory AircraftMarketEditEvent.updateProduct({
    required int productId,
    String? title,
    String? description,
    int? price,
    String? currency,
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
    bool? isLeasing,
    String? leasingConditions,
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
  }) = UpdateAircraftMarketEditEvent;
  const factory AircraftMarketEditEvent.deleteProduct(int productId) = DeleteAircraftMarketEditEvent;
  const factory AircraftMarketEditEvent.publishProduct(int productId) = PublishAircraftMarketEditEvent;
  const factory AircraftMarketEditEvent.unpublishProduct(int productId) = UnpublishAircraftMarketEditEvent;
  const factory AircraftMarketEditEvent.reset() = ResetAircraftMarketEditEvent;
}

@freezed
class AircraftMarketEditState with _$AircraftMarketEditState {
  const factory AircraftMarketEditState.initial() = InitialAircraftMarketEditState;
  const factory AircraftMarketEditState.loading() = LoadingAircraftMarketEditState;
  const factory AircraftMarketEditState.loaded(AircraftMarketEntity product) = LoadedAircraftMarketEditState;
  const factory AircraftMarketEditState.saving() = SavingAircraftMarketEditState;
  const factory AircraftMarketEditState.saved(AircraftMarketEntity product) = SavedAircraftMarketEditState;
  const factory AircraftMarketEditState.deleting() = DeletingAircraftMarketEditState;
  const factory AircraftMarketEditState.deleted(int productId) = DeletedAircraftMarketEditState;
  const factory AircraftMarketEditState.publishing() = PublishingAircraftMarketEditState;
  const factory AircraftMarketEditState.published(AircraftMarketEntity product) = PublishedAircraftMarketEditState;
  const factory AircraftMarketEditState.unpublishing() = UnpublishingAircraftMarketEditState;
  const factory AircraftMarketEditState.unpublished(AircraftMarketEntity product) = UnpublishedAircraftMarketEditState;
  const factory AircraftMarketEditState.error(String message) = ErrorAircraftMarketEditState;
}

class AircraftMarketEditBloc extends Bloc<AircraftMarketEditEvent, AircraftMarketEditState> {
  final MarketRepository _repository;

  AircraftMarketEditBloc({required MarketRepository repository})
    : _repository = repository,
      super(const AircraftMarketEditState.initial()) {
    on<GetAircraftMarketEditEvent>(_onGetProduct);
    on<UpdateAircraftMarketEditEvent>(_onUpdateProduct);
    on<DeleteAircraftMarketEditEvent>(_onDeleteProduct);
    on<PublishAircraftMarketEditEvent>(_onPublishProduct);
    on<UnpublishAircraftMarketEditEvent>(_onUnpublishProduct);
    on<ResetAircraftMarketEditEvent>(_onReset);
  }

  Future<void> _onGetProduct(GetAircraftMarketEditEvent event, Emitter<AircraftMarketEditState> emit) async {
    emit(const AircraftMarketEditState.loading());
    final result = await _repository.getProductById(event.productId);
    result.fold(
      (failure) => emit(AircraftMarketEditState.error(failure.message ?? 'Ошибка загрузки товара')),
      (product) => emit(AircraftMarketEditState.loaded(product)),
    );
  }

  Future<void> _onUpdateProduct(UpdateAircraftMarketEditEvent event, Emitter<AircraftMarketEditState> emit) async {
    emit(const AircraftMarketEditState.saving());
    final result = await _repository.updateProduct(
      productId: event.productId,
      title: event.title,
      description: event.description,
      price: event.price,
      currency: event.currency,
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
      isLeasing: event.isLeasing,
      leasingConditions: event.leasingConditions,
      mainImageFile: event.mainImageFile,
      additionalImageFiles: event.additionalImageFiles,
    );
    result.fold(
      (failure) => emit(AircraftMarketEditState.error(failure.message ?? 'Ошибка сохранения товара')),
      (product) => emit(AircraftMarketEditState.saved(product)),
    );
  }

  Future<void> _onDeleteProduct(DeleteAircraftMarketEditEvent event, Emitter<AircraftMarketEditState> emit) async {
    emit(const AircraftMarketEditState.deleting());
    final result = await _repository.deleteProduct(event.productId);
    result.fold(
      (failure) => emit(AircraftMarketEditState.error(failure.message ?? 'Ошибка удаления товара')),
      (_) => emit(AircraftMarketEditState.deleted(event.productId)),
    );
  }

  Future<void> _onPublishProduct(PublishAircraftMarketEditEvent event, Emitter<AircraftMarketEditState> emit) async {
    emit(const AircraftMarketEditState.publishing());
    final result = await _repository.publishProduct(event.productId);
    result.fold(
      (failure) => emit(AircraftMarketEditState.error(failure.message ?? 'Ошибка публикации')),
      (product) => emit(AircraftMarketEditState.published(product)),
    );
  }

  Future<void> _onUnpublishProduct(
    UnpublishAircraftMarketEditEvent event,
    Emitter<AircraftMarketEditState> emit,
  ) async {
    emit(const AircraftMarketEditState.unpublishing());
    final result = await _repository.unpublishProduct(event.productId);
    result.fold(
      (failure) => emit(AircraftMarketEditState.error(failure.message ?? 'Ошибка снятия с публикации')),
      (product) => emit(AircraftMarketEditState.unpublished(product)),
    );
  }

  void _onReset(ResetAircraftMarketEditEvent event, Emitter<AircraftMarketEditState> emit) {
    emit(const AircraftMarketEditState.initial());
  }
}
