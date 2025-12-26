import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preflight_inspection_check_list_bloc.freezed.dart';

@freezed
abstract class PreflightInspectionCheckListEvent with _$PreflightInspectionCheckListEvent {
  const PreflightInspectionCheckListEvent._();

  const factory PreflightInspectionCheckListEvent.get() = GetPreflightInspectionCheckListEvent;
  // const factory PreflightInspectionCheckListEvent.getById(int id) = GetByIdPreflightInspectionCheckListEvent;
}

@freezed
abstract class PreflightInspectionCheckListState with _$PreflightInspectionCheckListState {
  const PreflightInspectionCheckListState._();
  const factory PreflightInspectionCheckListState.loading() = LoadingPreflightInspectionCheckListState;
  const factory PreflightInspectionCheckListState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorPreflightInspectionCheckListState;
  const factory PreflightInspectionCheckListState.success({
    required List<PreflightInspectionCheckListEntity> preflightInspectionCheckList,
  }) = SuccessPreflightInspectionCheckListState;
  // const factory PreflightInspectionCheckListState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdPreflightInspectionCheckListState;
  // const factory PreflightInspectionCheckListState.done() = DonePreflightInspectionCheckListState;
}

class PreflightInspectionCheckListBloc
    extends Bloc<PreflightInspectionCheckListEvent, PreflightInspectionCheckListState> {
  final HandBookRepository _handBookRepository;
  List<PreflightInspectionCheckListEntity> preflightInspectionCheckList = [];
  PreflightInspectionCheckListBloc({required HandBookRepository handBookRepository})
    : _handBookRepository = handBookRepository,
      super(const LoadingPreflightInspectionCheckListState()) {
    on<PreflightInspectionCheckListEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetPreflightInspectionCheckListEvent event, Emitter<PreflightInspectionCheckListState> emit) async {
    emit(const LoadingPreflightInspectionCheckListState());

    final response = await _handBookRepository.fetchPreflightInspectionCheckList();
    response.fold(
      (l) {
        emit(
          ErrorPreflightInspectionCheckListState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        preflightInspectionCheckList = r;
        emit(SuccessPreflightInspectionCheckListState(preflightInspectionCheckList: r));
      },
    );
  }
}
