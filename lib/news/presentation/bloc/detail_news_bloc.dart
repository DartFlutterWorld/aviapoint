import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/domain/repositories/story_repository.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_news_bloc.freezed.dart';

@freezed
abstract class DetailNewsEvent with _$DetailNewsEvent {
  const DetailNewsEvent._();

  const factory DetailNewsEvent.get({required int id}) = GetDetailNewsEvent;
}

@freezed
abstract class DetailNewsState with _$DetailNewsState {
  const DetailNewsState._();
  const factory DetailNewsState.loading() = LoadingDetailNewsState;
  const factory DetailNewsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorDetailNewsState;
  const factory DetailNewsState.success({required NewsEntity news}) = SuccessDetailNewsState;
}

class DetailNewsBloc extends Bloc<DetailNewsEvent, DetailNewsState> {
  final NewsRepository _newsRepository;

  DetailNewsBloc({required NewsRepository newsRepository})
    : _newsRepository = newsRepository,
      super(const LoadingDetailNewsState()) {
    on<DetailNewsEvent>((event, emitter) => event.map(get: (event) => _get(event, emitter)));
  }

  Future<void> _get(GetDetailNewsEvent event, Emitter<DetailNewsState> emit) async {
    emit(LoadingDetailNewsState());

    final response = await _newsRepository.getNewsById(id: event.id);

    response.fold(
      (l) {
        emit(
          ErrorDetailNewsState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessDetailNewsState(news: r));
      },
    );
  }
}
