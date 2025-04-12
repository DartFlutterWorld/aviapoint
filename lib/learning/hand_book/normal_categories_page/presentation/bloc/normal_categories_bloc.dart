import 'package:aviapoint/learning/hand_book/normal_categories_page/domain/entities/normal_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_categories_bloc.freezed.dart';

@freezed
abstract class NormalCategoriesEvent with _$NormalCategoriesEvent {
  const NormalCategoriesEvent._();

  const factory NormalCategoriesEvent.get() = GetNormalCategoriesEvent;
  // const factory NormalCategoriesEvent.getById(int id) = GetByIdNormalCategoriesEvent;
}

@freezed
abstract class NormalCategoriesState with _$NormalCategoriesState {
  const NormalCategoriesState._();
  const factory NormalCategoriesState.loading() = LoadingNormalCategoriesState;
  const factory NormalCategoriesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorNormalCategoriesState;
  const factory NormalCategoriesState.success({required List<NormalCategoriesEntity> normalCategories}) = SuccessNormalCategoriesState;
  // const factory NormalCategoriesState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdNormalCategoriesState;
  // const factory NormalCategoriesState.done() = DoneNormalCategoriesState;
}

class NormalCategoriesBloc extends Bloc<NormalCategoriesEvent, NormalCategoriesState> {
  final HandBookRepository _handBookRepository;

  NormalCategoriesBloc({required HandBookRepository handBookRepository})
      : _handBookRepository = handBookRepository,
        super(const LoadingNormalCategoriesState()) {
    on<NormalCategoriesEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetNormalCategoriesEvent event, Emitter<NormalCategoriesState> emit) async {
    emit(const LoadingNormalCategoriesState());

    final response = await _handBookRepository.fetchNormalCategories();
    response.fold(
      (l) {
        emit(
          ErrorNormalCategoriesState(
            errorForUser: 'Что-то пошло не так! Попробуйте позже..',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessNormalCategoriesState(normalCategories: r),
        );
      },
    );
  }
}
