import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/domain/repositories/story_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_manager_bloc.freezed.dart';

@freezed
abstract class CacheManagerEvent with _$CacheManagerEvent {
  const CacheManagerEvent._();

  const factory CacheManagerEvent.getStories() = GetStoriesCacheManagerEvent;
}

@freezed
abstract class CacheManagerState with _$CacheManagerState {
  const CacheManagerState._();
  const factory CacheManagerState.loading() = LoadingCacheManagerState;
  const factory CacheManagerState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorCacheManagerState;
  const factory CacheManagerState.success({required List<StoryEntity> story}) = SuccessCacheManagerState;
}

class CacheManagerBloc extends Bloc<CacheManagerEvent, CacheManagerState> {
  final StoryRepository _storyRepository;
  // StoryEntity detailStory = StoryEntity(colorButton: '', id: 0, position: 0, image: '', textColor: '', miniStories: []);
  Set<int> allIdStories = {};
  final List<StoryEntity> stories = [];

  CacheManagerBloc({required StoryRepository storyRepository})
    : _storyRepository = storyRepository,
      super(const LoadingCacheManagerState()) {
    on<CacheManagerEvent>((event, emitter) => event.map(getStories: (event) => _getStories(event, emitter)));
  }

  Future<void> _getStories(GetStoriesCacheManagerEvent event, Emitter<CacheManagerState> emit) async {
    final List<StoryEntity> storiesData = [];
    emit(LoadingCacheManagerState());

    final response = await _storyRepository.getStories();

    // emit(
    //   apiResult.when(
    //     success: (data) {
    //       storiesData.addAll(data);
    //       storiesData.sort((a, b) => a.position.compareTo(b.position));
    //       for (var it in data) {
    //         allIdStories.add(it.id);

    //         _getMiniStories(it.id);
    //       }
    //       cacheStor(data);

    //       return event.success(story: storiesData);
    //     },
    //     failure: (ExceptionNetwork error) {
    //       logger.e(error.errorMessage, error);

    //       return event.error(error: error.errorMessage);
    //     },
    //   ),
    // );

    response.fold(
      (l) {
        emit(
          ErrorCacheManagerState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        storiesData.addAll(r);
        storiesData.sort((a, b) => a.position.compareTo(b.position));
        stories.clear();
        stories.addAll(storiesData);
        for (var it in r) {
          allIdStories.add(it.id);

          // _getStory(it.id);
        }
        // cacheStor(r);
        emit(SuccessCacheManagerState(story: storiesData));
      },
    );
  }

  Future<void> _getStory(int id) async {
    final response = await _storyRepository.getStory(id: id);

    // apiResult.when(
    //   success: (data) {
    //     data;
    //     cacheMiniStor(data);
    //   },
    //   failure: (ExceptionNetwork error) {
    //     logger.e(error.errorMessage, error);
    //   },
    // );

    response.fold(
      (l) {
        // logger.e('getDetailStory', l.responseMessage);
      },
      (r) {
        // cacheMiniStor(r);
      },
    );
  }

  void cacheStor(List<StoryEntity> data) async {
    final appState = getIt<AppState>();
    for (var it in data) {
      await getIt<DefaultCacheManager>().getSingleFile(getImageUrl(it.image));
      debugPrint('Фото сторик загружен ${it.image}');
    }
  }

  // void cacheMiniStor(StoryEntity data) async {
  //   for (var it in data.miniStories) {
  //     if (it.image != null) {
  //       await getIt<DefaultCacheManager>().getSingleFile('$backUrl${it.image}');
  //       debugPrint('Фото мини сторика загружен ${it.image}');
  //     }
  //     if (it.video != null) {
  //       await getIt<DefaultCacheManager>().getSingleFile('$backUrl${it.video}');
  //       debugPrint('Видео мини сторика загружен  ${it.video}');
  //     }
  //   }
  // }
}
