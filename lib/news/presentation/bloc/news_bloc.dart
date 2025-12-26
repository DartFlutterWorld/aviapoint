import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_bloc.freezed.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const NewsEvent._();

  const factory NewsEvent.get() = GetNewsEvent;
  const factory NewsEvent.getNewsByCategory({required int categoryId}) = GetNewsByCategoryEvent;
}

@freezed
class NewsState with _$NewsState {
  const NewsState._();
  const factory NewsState.loading() = LoadingNewsState;
  const factory NewsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorNewsState;
  const factory NewsState.success({required List<NewsEntity> news}) = SuccessNewsState;
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  NewsBloc({required NewsRepository newsRepository})
    : _newsRepository = newsRepository,
      super(const LoadingNewsState()) {
    on<NewsEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        getNewsByCategory: (event) => _getNewsByCategory(event, emitter),
      ),
    );
  }

  Future<void> _get(GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingNewsState());

    final response = await _newsRepository.getNews();

    response.fold(
      (l) {
        emit(
          ErrorNewsState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessNewsState(news: r));
      },
    );
  }

  Future<void> _getNewsByCategory(GetNewsByCategoryEvent event, Emitter<NewsState> emit) async {
    emit(LoadingNewsState());

    final response = await _newsRepository.getNewsByCategory(categoryId: event.categoryId);

    response.fold(
      (l) {
        emit(
          ErrorNewsState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessNewsState(news: r));
      },
    );
  }
}
