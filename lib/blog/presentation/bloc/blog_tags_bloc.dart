import 'package:aviapoint/blog/domain/entities/blog_tag_entity.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_tags_bloc.freezed.dart';

@freezed
class BlogTagsEvent with _$BlogTagsEvent {
  const BlogTagsEvent._();

  const factory BlogTagsEvent.get() = GetBlogTagsEvent;
}

@freezed
class BlogTagsState with _$BlogTagsState {
  const BlogTagsState._();

  const factory BlogTagsState.loading() = LoadingBlogTagsState;
  const factory BlogTagsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorBlogTagsState;
  const factory BlogTagsState.success({required List<BlogTagEntity> tags}) = SuccessBlogTagsState;
}

class BlogTagsBloc extends Bloc<BlogTagsEvent, BlogTagsState> {
  final BlogRepository _blogRepository;

  BlogTagsBloc({required BlogRepository blogRepository})
      : _blogRepository = blogRepository,
        super(const LoadingBlogTagsState()) {
    on<BlogTagsEvent>((event, emitter) => event.map(get: (event) => _get(event, emitter)));
  }

  Future<void> _get(GetBlogTagsEvent event, Emitter<BlogTagsState> emit) async {
    emit(const LoadingBlogTagsState());

    final response = await _blogRepository.getTags();

    response.fold(
      (l) {
        emit(
          ErrorBlogTagsState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessBlogTagsState(tags: r));
      },
    );
  }
}