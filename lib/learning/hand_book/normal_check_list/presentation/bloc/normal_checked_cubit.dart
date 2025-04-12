import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_checked_cubit.freezed.dart';

class NormalCheckedCubit extends Cubit<NormalCheckedState> {
  NormalCheckedCubit() : super(const NormalCheckedState());

  void setCheck({required int idCategory, required int idCheck}) {
    // Создаем новый Set из текущего состояния
    Set<CheckProgress> checkProgress = Set.from(state.checkProgress);

    // Ищем существующий CheckProgress для данной категории
    final CheckProgress? checkProgressByIdCategory = checkProgress.firstWhereOrNull((e) => e.idCategory == idCategory);

    if (checkProgressByIdCategory != null) {
      // Если CheckProgress найден, создаем новый объект с обновленным checkedIds
      // Удаляем старый объект, без этой штуки не обновляется состояние, кубит не видит изменений
      checkProgress.remove(checkProgressByIdCategory);
      checkProgress.add(
        checkProgressByIdCategory.copyWith(
          checkedIds: Set.from(checkProgressByIdCategory.checkedIds)..add(idCheck),
        ),
      );
    } else {
      // Если CheckProgress не найден, добавляем новый объект с начальным idCheck
      checkProgress.add(CheckProgress(idCategory: idCategory, checkedIds: {idCheck}));
    }
    print(checkProgress);

    emit(state.copyWith(checkProgress: checkProgress));
  }

  void clearCategory({required int idCategory}) {
    Set<CheckProgress> checkProgress = Set.from(state.checkProgress);

    checkProgress.removeWhere((e) => e.idCategory == idCategory);

    emit(state.copyWith(checkProgress: checkProgress));
  }

  void clearAllCategory() {
    Set<CheckProgress> checkProgress = Set.from(state.checkProgress);

    checkProgress.clear();

    emit(state.copyWith(checkProgress: checkProgress));
  }
}

@freezed
class NormalCheckedState with _$NormalCheckedState {
  const factory NormalCheckedState({
    @Default({}) Set<CheckProgress> checkProgress,
  }) = _NormalCheckedState;
}

class CheckProgress extends Equatable {
  final int idCategory;
  final Set<int> checkedIds;

  const CheckProgress({required this.idCategory, required this.checkedIds});

  // Метод copyWith для создания нового объекта с обновленными данными
  CheckProgress copyWith({int? idCategory, Set<int>? checkedIds}) {
    return CheckProgress(
      idCategory: idCategory ?? this.idCategory,
      checkedIds: checkedIds ?? this.checkedIds,
    );
  }

  @override
  List<Object?> get props => [idCategory, checkedIds];
}
