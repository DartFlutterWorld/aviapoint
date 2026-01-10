import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_article_detail_bloc.freezed.dart';

@freezed
class BlogArticleDetailEvent with _$BlogArticleDetailEvent {
  const BlogArticleDetailEvent._();

  const factory BlogArticleDetailEvent.getById({required int id}) = GetBlogArticleByIdEvent;

  // Пустое событие для корректной генерации freezed
  const factory BlogArticleDetailEvent.reset() = ResetBlogArticleDetailEvent;
}

@freezed
class BlogArticleDetailState with _$BlogArticleDetailState {
  const BlogArticleDetailState._();

  const factory BlogArticleDetailState.loading() = LoadingBlogArticleDetailState;
  const factory BlogArticleDetailState.error({String? errorFromApi, required String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage}) = ErrorBlogArticleDetailState;
  const factory BlogArticleDetailState.success({required BlogArticleEntity article}) = SuccessBlogArticleDetailState;
}

class BlogArticleDetailBloc extends Bloc<BlogArticleDetailEvent, BlogArticleDetailState> {
  final BlogRepository _blogRepository;

  BlogArticleDetailBloc({required BlogRepository blogRepository}) : _blogRepository = blogRepository, super(const LoadingBlogArticleDetailState()) {
    on<BlogArticleDetailEvent>((event, emit) => event.map(getById: (event) => _getById(event, emit), reset: (_) => emit(const LoadingBlogArticleDetailState())));
  }

  Future<void> _getById(GetBlogArticleByIdEvent event, Emitter<BlogArticleDetailState> emit) async {
    emit(const LoadingBlogArticleDetailState());

    final response = await _blogRepository.getArticleById(event.id);

    response.fold(
      (l) {
        emit(
          ErrorBlogArticleDetailState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessBlogArticleDetailState(article: r));
      },
    );
  }
}
