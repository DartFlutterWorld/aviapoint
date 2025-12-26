import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preflight_inspection_categories_bloc.freezed.dart';

@freezed
abstract class PreflightInspectionCategoriesEvent with _$PreflightInspectionCategoriesEvent {
  const PreflightInspectionCategoriesEvent._();

  const factory PreflightInspectionCategoriesEvent.get() = GetPreflightInspectionCategoriesEvent;
  // const factory PreflightInspectionCategoriesEvent.getById(int id) = GetByIdPreflightInspectionCategoriesEvent;
}

@freezed
abstract class PreflightInspectionCategoriesState with _$PreflightInspectionCategoriesState {
  const PreflightInspectionCategoriesState._();
  const factory PreflightInspectionCategoriesState.loading() = LoadingPreflightInspectionCategoriesState;
  const factory PreflightInspectionCategoriesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorPreflightInspectionCategoriesState;
  const factory PreflightInspectionCategoriesState.success({
    required List<PreflightInspectionCategoriesEntity> preflightInspectionCategories,
  }) = SuccessPreflightInspectionCategoriesState;
  // const factory PreflightInspectionCategoriesState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdPreflightInspectionCategoriesState;
  // const factory PreflightInspectionCategoriesState.done() = DonePreflightInspectionCategoriesState;
}

class PreflightInspectionCategoriesBloc
    extends Bloc<PreflightInspectionCategoriesEvent, PreflightInspectionCategoriesState> {
  final HandBookRepository _handBookRepository;

  PreflightInspectionCategoriesBloc({required HandBookRepository handBookRepository})
    : _handBookRepository = handBookRepository,
      super(const LoadingPreflightInspectionCategoriesState()) {
    on<PreflightInspectionCategoriesEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(
    GetPreflightInspectionCategoriesEvent event,
    Emitter<PreflightInspectionCategoriesState> emit,
  ) async {
    emit(const LoadingPreflightInspectionCategoriesState());

    final response = await _handBookRepository.fetchPreflightInspectionCategories();
    response.fold(
      (l) {
        emit(
          ErrorPreflightInspectionCategoriesState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessPreflightInspectionCategoriesState(preflightInspectionCategories: r));
      },
    );
  }
}
