import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsCubitState> {
  NewsCubit() : super(const NewsCubitState());

  void setCategoryId(int categoryId) {
    emit(state.copyWith(
      categoryId: categoryId,
    ));
  }

  void setTitleCategory(String titleCategory) {
    emit(state.copyWith(
      titleCategory: titleCategory,
    ));
  }
}

@freezed
class NewsCubitState with _$NewsCubitState {
  const factory NewsCubitState({
    @Default(0) int categoryId,
    @Default('') String titleCategory,
  }) = _NewsCubitState;
}
