import 'package:aviapoint/news/domain/entities/category_news_entity.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_news_bloc.freezed.dart';

@freezed
class CategoryNewsEvent with _$CategoryNewsEvent {
  const CategoryNewsEvent._();

  const factory CategoryNewsEvent.get() = GetCategoryNewsEvent;
}

@freezed
class CategoryNewsState with _$CategoryNewsState {
  const CategoryNewsState._();
  const factory CategoryNewsState.loading() = LoadingCategoryNewsState;
  const factory CategoryNewsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorCategoryNewsState;
  const factory CategoryNewsState.success({required List<CategoryNewsEntity> categoryNews}) = SuccessCategoryNewsState;
}

class CategoryNewsBloc extends Bloc<CategoryNewsEvent, CategoryNewsState> {
  final NewsRepository _newsRepository;

  List<CategoryNewsEntity> allCategory = [];

  CategoryNewsBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(const LoadingCategoryNewsState()) {
    on<CategoryNewsEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
      ),
    );
  }

  Future<void> _get(GetCategoryNewsEvent event, Emitter<CategoryNewsState> emit) async {
    emit(LoadingCategoryNewsState());

    final response = await _newsRepository.getCategoryNews();

    response.fold(
      (l) {
        emit(
          ErrorCategoryNewsState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        allCategory = r;
        emit(SuccessCategoryNewsState(categoryNews: r));
      },
    );
  }
}
