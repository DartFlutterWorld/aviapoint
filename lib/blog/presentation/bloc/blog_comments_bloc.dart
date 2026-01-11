import 'package:aviapoint/blog/domain/entities/blog_comment_entity.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_comments_bloc.freezed.dart';

// События
abstract class BlogCommentsEvent {}

class GetCommentsByArticleIdEvent extends BlogCommentsEvent {
  final int articleId;

  GetCommentsByArticleIdEvent({required this.articleId});
}

class CreateCommentEvent extends BlogCommentsEvent {
  final int articleId;
  final String? parentCommentId;
  final String content;

  CreateCommentEvent({required this.articleId, this.parentCommentId, required this.content});
}

class UpdateCommentEvent extends BlogCommentsEvent {
  final int articleId;
  final int commentId;
  final String content;

  UpdateCommentEvent({required this.articleId, required this.commentId, required this.content});
}

class DeleteCommentEvent extends BlogCommentsEvent {
  final int articleId;
  final int commentId;

  DeleteCommentEvent({required this.articleId, required this.commentId});
}

@freezed
class BlogCommentsState with _$BlogCommentsState {
  const BlogCommentsState._();

  const factory BlogCommentsState.initial() = InitialBlogCommentsState;
  const factory BlogCommentsState.loading() = LoadingBlogCommentsState;
  const factory BlogCommentsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorBlogCommentsState;
  const factory BlogCommentsState.success({required List<BlogCommentEntity> comments}) = SuccessBlogCommentsState;
  const factory BlogCommentsState.commentCreated({required BlogCommentEntity comment}) = CommentCreatedState;
  const factory BlogCommentsState.commentUpdated({required BlogCommentEntity comment}) = CommentUpdatedState;
  const factory BlogCommentsState.commentDeleted() = CommentDeletedState;
}

class BlogCommentsBloc extends Bloc<BlogCommentsEvent, BlogCommentsState> {
  final BlogRepository _blogRepository;

  BlogCommentsBloc({required BlogRepository blogRepository})
      : _blogRepository = blogRepository,
        super(const BlogCommentsState.initial()) {
    on<GetCommentsByArticleIdEvent>(_handleGetCommentsByArticleId);
    on<CreateCommentEvent>(_handleCreateComment);
    on<UpdateCommentEvent>(_handleUpdateComment);
    on<DeleteCommentEvent>(_handleDeleteComment);
  }

  Future<void> _handleGetCommentsByArticleId(GetCommentsByArticleIdEvent event, Emitter<BlogCommentsState> emit) async {
    emit(BlogCommentsState.loading());

    final response = await _blogRepository.getCommentsByArticleId(event.articleId);

    response.fold(
      (l) {
        emit(
          BlogCommentsState.error(
            errorForUser: 'Не удалось загрузить комментарии',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(BlogCommentsState.success(comments: r));
      },
    );
  }

  Future<void> _handleCreateComment(CreateCommentEvent event, Emitter<BlogCommentsState> emit) async {
    emit(BlogCommentsState.loading());

    final response = await _blogRepository.createComment(
      articleId: event.articleId,
      parentCommentId: event.parentCommentId,
      content: event.content,
    );

    response.fold(
      (l) {
        emit(
          BlogCommentsState.error(
            errorForUser: 'Не удалось создать комментарий',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(BlogCommentsState.commentCreated(comment: r));
        // После создания комментария перезагружаем список
        add(GetCommentsByArticleIdEvent(articleId: event.articleId));
      },
    );
  }

  Future<void> _handleUpdateComment(UpdateCommentEvent event, Emitter<BlogCommentsState> emit) async {
    emit(BlogCommentsState.loading());

    final response = await _blogRepository.updateComment(
      commentId: event.commentId,
      articleId: event.articleId,
      content: event.content,
    );

    response.fold(
      (l) {
        emit(
          BlogCommentsState.error(
            errorForUser: 'Не удалось обновить комментарий',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(BlogCommentsState.commentUpdated(comment: r));
        // После обновления комментария перезагружаем список
        add(GetCommentsByArticleIdEvent(articleId: event.articleId));
      },
    );
  }

  Future<void> _handleDeleteComment(DeleteCommentEvent event, Emitter<BlogCommentsState> emit) async {
    emit(BlogCommentsState.loading());

    final response = await _blogRepository.deleteComment(
      commentId: event.commentId,
      articleId: event.articleId,
    );

    response.fold(
      (l) {
        emit(
          BlogCommentsState.error(
            errorForUser: 'Не удалось удалить комментарий',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(BlogCommentsState.commentDeleted());
        // После удаления комментария перезагружаем список
        add(GetCommentsByArticleIdEvent(articleId: event.articleId));
      },
    );
  }
}
