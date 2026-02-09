import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_bloc.freezed.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const NewsEvent._();

  const factory NewsEvent.get({int? authorId}) = GetNewsEvent;
  const factory NewsEvent.getNewsByCategory({required int categoryId, int? authorId}) = GetNewsByCategoryEvent;
  const factory NewsEvent.getUserNews({required int userId}) = GetUserNewsEvent;
  const factory NewsEvent.create({
    required String title,
    required String subTitle,
    required String source,
    required String body,
    String? content, // Quill Delta JSON
    String? pictureMini,
    String? pictureBig,
    File? pictureMiniFile,
    File? pictureBigFile,
    Uint8List? pictureMiniBytes,
    Uint8List? pictureBigBytes,
    String? pictureMiniFileName,
    String? pictureBigFileName,
    List<File>? additionalImageFiles,
    List<Uint8List>? additionalImageBytes,
    List<String>? additionalImageFileNames,
    required bool isBigNews,
    required int categoryId,
  }) = CreateNewsEvent;
  const factory NewsEvent.update({
    required int id,
    String? title,
    String? subTitle,
    String? source,
    String? body,
    String? content,
    String? pictureMini,
    String? pictureBig,
    File? pictureMiniFile,
    File? pictureBigFile,
    Uint8List? pictureMiniBytes,
    Uint8List? pictureBigBytes,
    String? pictureMiniFileName,
    String? pictureBigFileName,
    List<File>? additionalImageFiles,
    List<Uint8List>? additionalImageBytes,
    List<String>? additionalImageFileNames,
    bool? deletePictureBig,
    List<String>? imagesToDelete,
    bool? isBigNews,
    int? categoryId,
    bool? published,
  }) = UpdateNewsEvent;
  const factory NewsEvent.delete({required int id}) = DeleteNewsEvent;
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
  const factory NewsState.creating() = CreatingNewsState;
  const factory NewsState.created({required NewsEntity news}) = CreatedNewsState;
  const factory NewsState.updating() = UpdatingNewsState;
  const factory NewsState.updated({required NewsEntity news}) = UpdatedNewsState;
  const factory NewsState.deleting() = DeletingNewsState;
  const factory NewsState.deleted() = DeletedNewsState;
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
        create: (event) => _create(event, emitter),
        getUserNews: (event) => _getUserNews(event, emitter),
        update: (event) => _update(event, emitter),
        delete: (event) => _delete(event, emitter),
      ),
    );
  }

  Future<void> _get(GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingNewsState());

    // Если передан authorId, получаем все новости пользователя (published = null)
    // Иначе получаем только опубликованные (published = true)
    final response = await _newsRepository.getNews(
      published: event.authorId != null ? null : true,
      authorId: event.authorId,
    );

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

    // Если передан authorId, получаем все новости пользователя (published = null)
    // Иначе получаем только опубликованные (published = true)
    final response = await _newsRepository.getNewsByCategory(
      categoryId: event.categoryId,
      published: event.authorId != null ? null : true,
      authorId: event.authorId,
    );

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

  Future<void> _getUserNews(GetUserNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingNewsState());

    // Получаем все новости пользователя (и опубликованные, и неопубликованные)
    final response = await _newsRepository.getNews(published: null, authorId: event.userId);

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

  Future<void> _create(CreateNewsEvent event, Emitter<NewsState> emit) async {
    emit(const CreatingNewsState());

    final response = await _newsRepository.createNews(
      title: event.title,
      subTitle: event.subTitle,
      source: event.source,
      body: event.body,
      content: event.content,
      pictureMini: event.pictureMini,
      pictureBig: event.pictureBig,
      pictureMiniFile: event.pictureMiniFile,
      pictureBigFile: event.pictureBigFile,
      pictureMiniBytes: event.pictureMiniBytes,
      pictureBigBytes: event.pictureBigBytes,
      pictureMiniFileName: event.pictureMiniFileName,
      pictureBigFileName: event.pictureBigFileName,
      additionalImageFiles: event.additionalImageFiles,
      additionalImageBytes: event.additionalImageBytes,
      additionalImageFileNames: event.additionalImageFileNames,
      isBigNews: event.isBigNews,
      categoryId: event.categoryId,
    );

    response.fold(
      (l) {
        emit(
          ErrorNewsState(
            errorForUser: 'Не удалось предложить новость\nПопробуйте повторить',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(CreatedNewsState(news: r));
      },
    );
  }

  Future<void> _update(UpdateNewsEvent event, Emitter<NewsState> emit) async {
    emit(const UpdatingNewsState());

    final response = await _newsRepository.updateNews(
      id: event.id,
      title: event.title,
      subTitle: event.subTitle,
      source: event.source,
      body: event.body,
      content: event.content,
      pictureMini: event.pictureMini,
      pictureBig: event.pictureBig,
      pictureMiniFile: event.pictureMiniFile,
      pictureBigFile: event.pictureBigFile,
      pictureMiniBytes: event.pictureMiniBytes,
      pictureBigBytes: event.pictureBigBytes,
      pictureMiniFileName: event.pictureMiniFileName,
      pictureBigFileName: event.pictureBigFileName,
      additionalImageFiles: event.additionalImageFiles,
      additionalImageBytes: event.additionalImageBytes,
      additionalImageFileNames: event.additionalImageFileNames,
      deletePictureBig: event.deletePictureBig,
      imagesToDelete: event.imagesToDelete,
      isBigNews: event.isBigNews,
      categoryId: event.categoryId,
      published: event.published,
    );

    response.fold(
      (l) {
        emit(
          ErrorNewsState(
            errorForUser: 'Не удалось обновить новость\nПопробуйте повторить',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(UpdatedNewsState(news: r));
      },
    );
  }

  Future<void> _delete(DeleteNewsEvent event, Emitter<NewsState> emit) async {
    emit(const DeletingNewsState());

    final response = await _newsRepository.deleteNews(event.id);

    response.fold(
      (l) {
        emit(
          ErrorNewsState(
            errorForUser: 'Не удалось удалить новость\nПопробуйте повторить',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(const DeletedNewsState());
      },
    );
  }
}
