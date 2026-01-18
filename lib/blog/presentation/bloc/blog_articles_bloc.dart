import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_articles_bloc.freezed.dart';

@freezed
class BlogArticlesEvent with _$BlogArticlesEvent {
  const BlogArticlesEvent._();

  const factory BlogArticlesEvent.get({
    int? categoryId,
    int? tagId,
    int? authorId,
    bool? featured,
    String? status,
    int? limit,
    int? offset,
    String? search,
    int? aircraftModelId,
  }) = GetBlogArticlesEvent;

  const factory BlogArticlesEvent.loadMore() = LoadMoreBlogArticlesEvent;

  const factory BlogArticlesEvent.create({
    int? categoryId,
    int? aircraftModelId,
    required String title,
    String? excerpt,
    required String content,
    String? coverImageUrl,
    @JsonKey(includeFromJson: false, includeToJson: false) File? coverImageFile,
    @JsonKey(includeFromJson: false, includeToJson: false) Uint8List? coverImageBytes,
    String? coverImageFileName,
    String? status,
    List<int>? tagIds,
  }) = CreateBlogArticleEvent;

  const factory BlogArticlesEvent.update({
    required int id,
    int? categoryId,
    int? aircraftModelId,
    String? title,
    String? excerpt,
    String? content,
    String? coverImageUrl,
    @JsonKey(includeFromJson: false, includeToJson: false) File? coverImageFile,
    @JsonKey(includeFromJson: false, includeToJson: false) Uint8List? coverImageBytes,
    String? coverImageFileName,
    String? status,
    List<int>? tagIds,
  }) = UpdateBlogArticleEvent;

  const factory BlogArticlesEvent.delete({required int id}) = DeleteBlogArticleEvent;
}

@freezed
class BlogArticlesState with _$BlogArticlesState {
  const BlogArticlesState._();

  const factory BlogArticlesState.loading() = LoadingBlogArticlesState;
  const factory BlogArticlesState.loadingMore({required List<BlogArticleEntity> articles}) =
      LoadingMoreBlogArticlesState;
  const factory BlogArticlesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorBlogArticlesState;
  const factory BlogArticlesState.success({required List<BlogArticleEntity> articles, required bool hasMore}) =
      SuccessBlogArticlesState;
  const factory BlogArticlesState.creating() = CreatingBlogArticleState;
  const factory BlogArticlesState.created({required BlogArticleEntity article}) = CreatedBlogArticleState;
  const factory BlogArticlesState.updating() = UpdatingBlogArticleState;
  const factory BlogArticlesState.updated({required BlogArticleEntity article}) = UpdatedBlogArticleState;
  const factory BlogArticlesState.deleting() = DeletingBlogArticleState;
  const factory BlogArticlesState.deleted() = DeletedBlogArticleState;
}

class BlogArticlesBloc extends Bloc<BlogArticlesEvent, BlogArticlesState> {
  final BlogRepository _blogRepository;
  static const int _defaultLimit = 20;
  int _currentOffset = 0;
  bool _hasMore = true;

  // Сохраняем последние фильтры для loadMore
  int? _lastCategoryId;
  int? _lastTagId;
  int? _lastAuthorId;
  bool? _lastFeatured;
  String? _lastStatus;
  String? _lastSearch;
  int? _lastAircraftModelId;

  BlogArticlesBloc({required BlogRepository blogRepository})
    : _blogRepository = blogRepository,
      super(const LoadingBlogArticlesState()) {
    on<BlogArticlesEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        loadMore: (event) => _loadMore(event, emitter),
        create: (event) => _create(event, emitter),
        update: (event) => _update(event, emitter),
        delete: (event) => _delete(event, emitter),
      ),
    );
  }

  Future<void> _get(GetBlogArticlesEvent event, Emitter<BlogArticlesState> emit) async {
    emit(const LoadingBlogArticlesState());
    _currentOffset = 0;
    _hasMore = true;

    // Сохраняем фильтры для loadMore
    _lastCategoryId = event.categoryId;
    _lastTagId = event.tagId;
    _lastAuthorId = event.authorId;
    _lastFeatured = event.featured;
    _lastStatus = event.status;
    _lastSearch = event.search;
    _lastAircraftModelId = event.aircraftModelId;

    final response = await _blogRepository.getArticles(
      categoryId: event.categoryId,
      tagId: event.tagId,
      authorId: event.authorId,
      featured: event.featured,
      status: event.status, // Передаем null если нужно показать все статусы (для "моих статей")
      limit: event.limit ?? _defaultLimit,
      offset: event.offset ?? 0,
      search: event.search,
      aircraftModelId: event.aircraftModelId,
    );

    response.fold(
      (l) {
        emit(
          ErrorBlogArticlesState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        _currentOffset = r.length;
        _hasMore = r.length >= (event.limit ?? _defaultLimit);
        emit(SuccessBlogArticlesState(articles: r, hasMore: _hasMore));
      },
    );
  }

  Future<void> _loadMore(LoadMoreBlogArticlesEvent event, Emitter<BlogArticlesState> emit) async {
    if (!_hasMore) return;

    final currentArticles = state.maybeWhen(
      success: (articles, hasMore) => articles,
      loadingMore: (articles) => articles,
      orElse: () => <BlogArticleEntity>[],
    );

    if (currentArticles.isEmpty) return;

    emit(LoadingMoreBlogArticlesState(articles: currentArticles));

    // Используем те же фильтры, что и в последнем запросе
    final response = await _blogRepository.getArticles(
      categoryId: _lastCategoryId,
      tagId: _lastTagId,
      authorId: _lastAuthorId,
      featured: _lastFeatured,
      status: _lastStatus, // Передаем null если нужно показать все статусы
      limit: _defaultLimit,
      offset: _currentOffset,
      search: _lastSearch,
      aircraftModelId: _lastAircraftModelId,
    );

    response.fold(
      (l) {
        emit(
          ErrorBlogArticlesState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        final updatedArticles = [...currentArticles, ...r];
        _currentOffset = updatedArticles.length;
        _hasMore = r.length >= _defaultLimit;
        emit(SuccessBlogArticlesState(articles: updatedArticles, hasMore: _hasMore));
      },
    );
  }

  Future<void> _create(CreateBlogArticleEvent event, Emitter<BlogArticlesState> emit) async {
    emit(const CreatingBlogArticleState());

    final response = await _blogRepository.createArticle(
      categoryId: event.categoryId,
      aircraftModelId: event.aircraftModelId,
      title: event.title,
      excerpt: event.excerpt,
      content: event.content,
      coverImageUrl: event.coverImageUrl,
      coverImageFile: event.coverImageFile,
      coverImageBytes: event.coverImageBytes,
      coverImageFileName: event.coverImageFileName,
      status: event.status ?? 'draft',
      tagIds: event.tagIds,
    );

    response.fold(
      (l) {
        emit(
          ErrorBlogArticlesState(
            errorForUser: 'Не удалось создать статью\nПопробуйте повторить',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(CreatedBlogArticleState(article: r));
      },
    );
  }

  Future<void> _update(UpdateBlogArticleEvent event, Emitter<BlogArticlesState> emit) async {
    emit(const UpdatingBlogArticleState());

    final response = await _blogRepository.updateArticle(
      id: event.id,
      categoryId: event.categoryId,
      aircraftModelId: event.aircraftModelId,
      title: event.title,
      excerpt: event.excerpt,
      content: event.content,
      coverImageUrl: event.coverImageUrl,
      coverImageFile: event.coverImageFile,
      coverImageBytes: event.coverImageBytes,
      coverImageFileName: event.coverImageFileName,
      status: event.status,
      tagIds: event.tagIds,
    );

    response.fold(
      (l) {
        emit(
          ErrorBlogArticlesState(
            errorForUser: 'Не удалось обновить статью\nПопробуйте повторить',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(UpdatedBlogArticleState(article: r));
      },
    );
  }

  Future<void> _delete(DeleteBlogArticleEvent event, Emitter<BlogArticlesState> emit) async {
    emit(const DeletingBlogArticleState());

    final response = await _blogRepository.deleteArticle(event.id);

    response.fold(
      (l) {
        emit(
          ErrorBlogArticlesState(
            errorForUser: 'Не удалось удалить статью\nПопробуйте повторить',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(const DeletedBlogArticleState());
      },
    );
  }
}
