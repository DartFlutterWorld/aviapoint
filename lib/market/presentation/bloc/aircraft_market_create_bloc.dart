import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'aircraft_market_create_bloc.freezed.dart';

@freezed
abstract class AircraftMarketCreateEvent with _$AircraftMarketCreateEvent {
  const factory AircraftMarketCreateEvent.createAirCraft({
    required String title,
    String? description,
    required int price,
    @Default('RUB') String currency,
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
    bool? isLeasing,
    String? leasingConditions,
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
    @Default(true) bool isPublished,
  }) = CreateAircraftMarketCreateEvent;
  const factory AircraftMarketCreateEvent.reset() = ResetAircraftMarketCreateEvent;
}

@freezed
class AircraftMarketCreateState with _$AircraftMarketCreateState {
  const factory AircraftMarketCreateState.initial() = InitialAircraftMarketCreateState;
  const factory AircraftMarketCreateState.creating() = CreatingAircraftMarketCreateState;
  const factory AircraftMarketCreateState.created(AircraftMarketEntity product) = CreatedAircraftMarketCreateState;
  const factory AircraftMarketCreateState.error(String message) = ErrorAircraftMarketCreateState;
}

class AircraftMarketCreateBloc extends Bloc<AircraftMarketCreateEvent, AircraftMarketCreateState> {
  final MarketRepository _repository;

  AircraftMarketCreateBloc({required MarketRepository repository})
      : _repository = repository,
        super(const AircraftMarketCreateState.initial()) {
    on<CreateAircraftMarketCreateEvent>(_onCreateAirCraft);
    on<ResetAircraftMarketCreateEvent>(_onReset);
  }

  Future<void> _onCreateAirCraft(CreateAircraftMarketCreateEvent event, Emitter<AircraftMarketCreateState> emit) async {
    emit(const AircraftMarketCreateState.creating());
    final result = await _repository.createAirCraft(
      title: event.title,
      description: event.description,
      price: event.price,
      currency: event.currency,
      aircraftSubcategoriesId: event.aircraftSubcategoriesId,
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
      isPublished: event.isPublished,
    );
    result.fold(
      (failure) => emit(AircraftMarketCreateState.error(failure.message ?? 'Ошибка создания товара')),
      (product) => emit(AircraftMarketCreateState.created(product)),
    );
  }

  void _onReset(ResetAircraftMarketCreateEvent event, Emitter<AircraftMarketCreateState> emit) {
    emit(const AircraftMarketCreateState.initial());
  }
}
