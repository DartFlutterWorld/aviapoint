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
  const factory MarketCategoriesEvent.getSubcategories({
    required String productType,
    int? parentId,
    int? mainCategoryId,
  }) = GetSubcategoriesEvent;
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

  MarketCategoriesBloc({required MarketRepository repository})
    : _repository = repository,
      super(const MarketCategoriesState.loading()) {
    on<GetMainMarketCategoriesEvent>(_onGetMainCategories);
    on<GetAllMarketCategoriesEvent>(_onGetAllCategories);
    on<GetSubcategoriesEvent>(_onGetSubcategories);
  }

  Future<void> _onGetMainCategories(GetMainMarketCategoriesEvent event, Emitter<MarketCategoriesState> emit) async {
    emit(const MarketCategoriesState.loading());
    // Для запчастей используем специальный метод
    final result = event.productType == 'parts'
        ? await _repository.getPartsMainCategories()
        : await _repository.getMainCategories(event.productType);
    result.fold(
      (failure) => emit(MarketCategoriesState.error(failure.message ?? 'Ошибка загрузки категорий')),
      (categories) => emit(MarketCategoriesState.success(categories)),
    );
  }

  Future<void> _onGetAllCategories(GetAllMarketCategoriesEvent event, Emitter<MarketCategoriesState> emit) async {
    emit(const MarketCategoriesState.loading());
    // Для запчастей используем специальный метод (получаем все категории через main + subcategories)
    final result = event.productType == 'parts'
        ? await _repository
              .getPartsMainCategories() // Для запчастей пока используем main categories
        : await _repository.getAllCategories(event.productType);
    result.fold(
      (failure) => emit(MarketCategoriesState.error(failure.message ?? 'Ошибка загрузки категорий')),
      (categories) => emit(MarketCategoriesState.success(categories)),
    );
  }

  Future<void> _onGetSubcategories(GetSubcategoriesEvent event, Emitter<MarketCategoriesState> emit) async {
    // Не эмитим loading, чтобы не скрывать главные категории
    // Для запчастей используем специальный метод
    print(
      '🔵 _onGetSubcategories: productType=${event.productType}, mainCategoryId=${event.mainCategoryId}, parentId=${event.parentId}',
    );
    final result = event.productType == 'parts'
        ? await _repository.getPartsSubcategories(parentId: event.parentId, mainCategoryId: event.mainCategoryId)
        : await _repository.getAllCategories(event.productType); // Для самолётов используем getAllCategories
    result.fold(
      (failure) {
        print('🔴 Ошибка загрузки подкатегорий: ${failure.message}');
        emit(MarketCategoriesState.error(failure.message ?? 'Ошибка загрузки подкатегорий'));
      },
      (categories) {
        print('🔵 Загружено подкатегорий: ${categories.length}');
        print(
          '🔵 Подкатегории: ${categories.map((c) => 'id=${c.id}, name=${c.name}, parentId=${c.parentId}, partsMainCategoryId=${c.partsMainCategoryId}').join(', ')}',
        );
        // Объединяем текущие категории с новыми подкатегориями
        final currentState = state;
        if (currentState is SuccessMarketCategoriesState) {
          // Главные категории: parentId == null && partsMainCategoryId == null
          final mainCategories = currentState.categories
              .where((c) => c.parentId == null && c.partsMainCategoryId == null)
              .toList();

          // Получаем ID новых категорий для проверки дубликатов
          final newCategoryIds = categories.map((c) => c.id).toSet();

          // Сохраняем все существующие подкатегории, которые не дублируются новыми
          // Это включает подкатегории для других главных категорий И подкатегории разных уровней для текущей главной категории
          final existingSubcategories = currentState.categories
              .where((c) => c.partsMainCategoryId != null && !newCategoryIds.contains(c.id))
              .toList();

          // Добавляем новые подкатегории
          final allCategories = [...mainCategories, ...existingSubcategories, ...categories];
          print(
            '🔵 Итого категорий после объединения: ${allCategories.length} (главных: ${mainCategories.length}, существующих подкатегорий: ${existingSubcategories.length}, новых подкатегорий: ${categories.length})',
          );
          print(
            '🔵 Все категории после объединения: ${allCategories.map((c) => 'id=${c.id}, name=${c.name}, parentId=${c.parentId}, partsMainCategoryId=${c.partsMainCategoryId}').join(', ')}',
          );
          emit(MarketCategoriesState.success(allCategories));
        } else {
          // Если нет текущего состояния, просто эмитим подкатегории
          print('🔵 Нет текущего состояния, эмитим только подкатегории');
          emit(MarketCategoriesState.success(categories));
        }
      },
    );
  }
}
