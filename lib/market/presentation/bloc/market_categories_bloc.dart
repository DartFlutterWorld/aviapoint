import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_categories_bloc.freezed.dart';

@freezed
abstract class MarketCategoriesEvent with _$MarketCategoriesEvent {
  const MarketCategoriesEvent._();

  const factory MarketCategoriesEvent.getMainCategories({required String productType}) = GetMainMarketCategoriesEvent;
  const factory MarketCategoriesEvent.getAllCategories({required String productType}) = GetAllMarketCategoriesEvent;
}

@freezed
class MarketCategoriesState with _$MarketCategoriesState {
  const MarketCategoriesState._();

  const factory MarketCategoriesState.loading() = LoadingMarketCategoriesState;
  const factory MarketCategoriesState.error(String message) = ErrorMarketCategoriesState;
  const factory MarketCategoriesState.success(List<MarketCategoryEntity> categories) = SuccessMarketCategoriesState;
}

class MarketCategoriesBloc extends Bloc<MarketCategoriesEvent, MarketCategoriesState> {
  final MarketRepository _repository;

  MarketCategoriesBloc({required MarketRepository repository}) : _repository = repository, super(const MarketCategoriesState.loading()) {
    on<GetMainMarketCategoriesEvent>(_onGetMainCategories);
    on<GetAllMarketCategoriesEvent>(_onGetAllCategories);
  }

  Future<void> _onGetMainCategories(GetMainMarketCategoriesEvent event, Emitter<MarketCategoriesState> emit) async {
    emit(const MarketCategoriesState.loading());
    final result = await _repository.getMainCategories(event.productType);
    result.fold((failure) => emit(MarketCategoriesState.error(failure.message ?? 'Ошибка загрузки категорий')), (categories) => emit(MarketCategoriesState.success(categories)));
  }

  Future<void> _onGetAllCategories(GetAllMarketCategoriesEvent event, Emitter<MarketCategoriesState> emit) async {
    emit(const MarketCategoriesState.loading());
    final result = await _repository.getAllCategories(event.productType);
    result.fold((failure) => emit(MarketCategoriesState.error(failure.message ?? 'Ошибка загрузки категорий')), (categories) => emit(MarketCategoriesState.success(categories)));
  }
}
