import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'parts_market_edit_bloc.freezed.dart';

@freezed
abstract class PartsMarketEditEvent with _$PartsMarketEditEvent {
  const factory PartsMarketEditEvent.getProduct(int productId) = GetPartsMarketEditEvent;
  const factory PartsMarketEditEvent.updateProduct({
    required int productId,
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
  }) = UpdatePartsMarketEditEvent;
  const factory PartsMarketEditEvent.deleteProduct(int productId) = DeletePartsMarketEditEvent;
  const factory PartsMarketEditEvent.publishProduct(int productId) = PublishPartsMarketEditEvent;
  const factory PartsMarketEditEvent.unpublishProduct(int productId) = UnpublishPartsMarketEditEvent;
  const factory PartsMarketEditEvent.reset() = ResetPartsMarketEditEvent;
}

@freezed
class PartsMarketEditState with _$PartsMarketEditState {
  const factory PartsMarketEditState.initial() = InitialPartsMarketEditState;
  const factory PartsMarketEditState.loading() = LoadingPartsMarketEditState;
  const factory PartsMarketEditState.loaded(PartsMarketEntity product) = LoadedPartsMarketEditState;
  const factory PartsMarketEditState.saving() = SavingPartsMarketEditState;
  const factory PartsMarketEditState.saved(PartsMarketEntity product) = SavedPartsMarketEditState;
  const factory PartsMarketEditState.deleting() = DeletingPartsMarketEditState;
  const factory PartsMarketEditState.deleted(int productId) = DeletedPartsMarketEditState;
  const factory PartsMarketEditState.publishing() = PublishingPartsMarketEditState;
  const factory PartsMarketEditState.published(PartsMarketEntity product) = PublishedPartsMarketEditState;
  const factory PartsMarketEditState.unpublishing() = UnpublishingPartsMarketEditState;
  const factory PartsMarketEditState.unpublished(PartsMarketEntity product) = UnpublishedPartsMarketEditState;
  const factory PartsMarketEditState.error(String message) = ErrorPartsMarketEditState;
}

class PartsMarketEditBloc extends Bloc<PartsMarketEditEvent, PartsMarketEditState> {
  final MarketRepository _repository;

  PartsMarketEditBloc({required MarketRepository repository})
    : _repository = repository,
      super(const PartsMarketEditState.initial()) {
    on<GetPartsMarketEditEvent>(_onGetProduct);
    on<UpdatePartsMarketEditEvent>(_onUpdateProduct);
    on<DeletePartsMarketEditEvent>(_onDeleteProduct);
    on<PublishPartsMarketEditEvent>(_onPublishProduct);
    on<UnpublishPartsMarketEditEvent>(_onUnpublishProduct);
    on<ResetPartsMarketEditEvent>(_onReset);
  }

  Future<void> _onGetProduct(GetPartsMarketEditEvent event, Emitter<PartsMarketEditState> emit) async {
    emit(const PartsMarketEditState.loading());
    final result = await _repository.getPartById(event.productId);
    result.fold(
      (failure) => emit(PartsMarketEditState.error(failure.message ?? 'Ошибка загрузки товара')),
      (product) => emit(PartsMarketEditState.loaded(product)),
    );
  }

  Future<void> _onUpdateProduct(UpdatePartsMarketEditEvent event, Emitter<PartsMarketEditState> emit) async {
    emit(const PartsMarketEditState.saving());
    final result = await _repository.updatePart(
      partId: event.productId,
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
      (failure) => emit(PartsMarketEditState.error(failure.message ?? 'Ошибка сохранения товара')),
      (product) => emit(PartsMarketEditState.saved(product)),
    );
  }

  Future<void> _onDeleteProduct(DeletePartsMarketEditEvent event, Emitter<PartsMarketEditState> emit) async {
    emit(const PartsMarketEditState.deleting());
    final result = await _repository.deletePart(event.productId);
    result.fold(
      (failure) => emit(PartsMarketEditState.error(failure.message ?? 'Ошибка удаления товара')),
      (_) => emit(PartsMarketEditState.deleted(event.productId)),
    );
  }

  Future<void> _onPublishProduct(PublishPartsMarketEditEvent event, Emitter<PartsMarketEditState> emit) async {
    emit(const PartsMarketEditState.publishing());
    final result = await _repository.publishPart(event.productId);
    result.fold(
      (failure) => emit(PartsMarketEditState.error(failure.message ?? 'Ошибка публикации')),
      (product) => emit(PartsMarketEditState.published(product)),
    );
  }

  Future<void> _onUnpublishProduct(UnpublishPartsMarketEditEvent event, Emitter<PartsMarketEditState> emit) async {
    emit(const PartsMarketEditState.unpublishing());
    final result = await _repository.unpublishPart(event.productId);
    result.fold(
      (failure) => emit(PartsMarketEditState.error(failure.message ?? 'Ошибка снятия с публикации')),
      (product) => emit(PartsMarketEditState.unpublished(product)),
    );
  }

  void _onReset(ResetPartsMarketEditEvent event, Emitter<PartsMarketEditState> emit) {
    emit(const PartsMarketEditState.initial());
  }
}
