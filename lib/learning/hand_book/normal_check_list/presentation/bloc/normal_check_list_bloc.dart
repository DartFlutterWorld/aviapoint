import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_check_list_bloc.freezed.dart';

@freezed
abstract class NormalCheckListEvent with _$NormalCheckListEvent {
  const NormalCheckListEvent._();

  const factory NormalCheckListEvent.get() = GetNormalCheckListEvent;
  // const factory NormalCheckListEvent.getById(int id) = GetByIdNormalCheckListEvent;
}

@freezed
abstract class NormalCheckListState with _$NormalCheckListState {
  const NormalCheckListState._();
  const factory NormalCheckListState.loading() = LoadingNormalCheckListState;
  const factory NormalCheckListState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorNormalCheckListState;
  const factory NormalCheckListState.success({required List<NormalCheckListEntity> normalCheckList}) =
      SuccessNormalCheckListState;
  // const factory NormalCheckListState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdNormalCheckListState;
  // const factory NormalCheckListState.done() = DoneNormalCheckListState;
}

class NormalCheckListBloc extends Bloc<NormalCheckListEvent, NormalCheckListState> {
  final HandBookRepository _handBookRepository;
  List<NormalCheckListEntity> normalCheckList = [];
  NormalCheckListBloc({required HandBookRepository handBookRepository})
    : _handBookRepository = handBookRepository,
      super(const LoadingNormalCheckListState()) {
    on<NormalCheckListEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetNormalCheckListEvent event, Emitter<NormalCheckListState> emit) async {
    emit(const LoadingNormalCheckListState());

    final response = await _handBookRepository.fetchNormalCheckList();
    response.fold(
      (l) {
        emit(
          ErrorNormalCheckListState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        normalCheckList = r;
        emit(SuccessNormalCheckListState(normalCheckList: r));
      },
    );
  }
}
