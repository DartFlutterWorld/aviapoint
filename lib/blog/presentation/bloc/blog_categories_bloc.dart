import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_categories_bloc.freezed.dart';

@freezed
class BlogCategoriesEvent with _$BlogCategoriesEvent {
  const BlogCategoriesEvent._();

  const factory BlogCategoriesEvent.get() = GetBlogCategoriesEvent;
}

@freezed
class BlogCategoriesState with _$BlogCategoriesState {
  const BlogCategoriesState._();

  const factory BlogCategoriesState.loading() = LoadingBlogCategoriesState;
  const factory BlogCategoriesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorBlogCategoriesState;
  const factory BlogCategoriesState.success({required List<BlogCategoryEntity> categories}) =
      SuccessBlogCategoriesState;
}

class BlogCategoriesBloc extends Bloc<BlogCategoriesEvent, BlogCategoriesState> {
  final BlogRepository _blogRepository;

  BlogCategoriesBloc({required BlogRepository blogRepository})
    : _blogRepository = blogRepository,
      super(const LoadingBlogCategoriesState()) {
    on<BlogCategoriesEvent>((event, emitter) => event.map(get: (event) => _get(event, emitter)));
  }

  Future<void> _get(GetBlogCategoriesEvent event, Emitter<BlogCategoriesState> emit) async {
    emit(const LoadingBlogCategoriesState());

    final response = await _blogRepository.getCategories();

    response.fold(
      (l) {
        emit(
          ErrorBlogCategoriesState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessBlogCategoriesState(categories: r));
      },
    );
  }
}
