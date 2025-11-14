import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/domain/repositories/story_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_story_bloc.freezed.dart';

@freezed
abstract class DetailStoryEvent with _$DetailStoryEvent {
  const DetailStoryEvent._();

  const factory DetailStoryEvent.get({required int id}) = GetDetailStoryEvent;
}

@freezed
abstract class DetailStoryState with _$DetailStoryState {
  const DetailStoryState._();
  const factory DetailStoryState.loading() = LoadingDetailStoryState;
  const factory DetailStoryState.error({String? errorFromApi, required String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage}) = ErrorDetailStoryState;
  const factory DetailStoryState.success({required StoryEntity detailstory}) = SuccessDetailStoryState;
}

class DetailStoryBloc extends Bloc<DetailStoryEvent, DetailStoryState> {
  final StoryRepository _storyRepository;

  DetailStoryBloc({required StoryRepository storyRepository}) : _storyRepository = storyRepository, super(const LoadingDetailStoryState()) {
    on<DetailStoryEvent>((event, emitter) => event.map(get: (event) => _get(event, emitter)));
  }

  Future<void> _get(GetDetailStoryEvent event, Emitter<DetailStoryState> emit) async {
    emit(LoadingDetailStoryState());

    final response = await _storyRepository.getStory(id: event.id);

    response.fold(
      (l) {
        emit(
          ErrorDetailStoryState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessDetailStoryState(detailstory: r));
      },
    );
  }
}
