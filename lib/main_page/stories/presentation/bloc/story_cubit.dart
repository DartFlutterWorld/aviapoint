import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_cubit.freezed.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryState());

  void setCurrentIndex(int currentIndex) {
    emit(state.copyWith(currentIndex: currentIndex));
  }

  // Добавляем id просмотренных сториков в лист
  void setShowStory({required int id}) {
    // Создаем новый Set из текущего состояния
    List<int> listStories = List.from(state.listStories);
    if (!listStories.contains(id)) {
      listStories.add(id);
    }

    emit(state.copyWith(listStories: listStories));
  }

  void clear() {
    emit(state.copyWith(currentIndex: 0));
    emit(state.copyWith(listStories: []));
  }
}

@freezed
abstract class StoryState with _$StoryState {
  const factory StoryState({@Default(0) int currentIndex, @Default([]) List<int> listStories}) = _StoryState;
}
