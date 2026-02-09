import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_vacancy_responses_event.dart';
part 'my_vacancy_responses_state.dart';

class MyVacancyResponsesBloc extends Bloc<MyVacancyResponsesEvent, MyVacancyResponsesState> {
  final JobsRepository repository;

  MyVacancyResponsesBloc({required this.repository}) : super(const LoadingMyVacancyResponsesState()) {
    on<MyVacancyResponsesGet>(_onGet);
    on<MyVacancyResponsesRefresh>(_onRefresh);
    on<MyVacancyResponsesDelete>(_onDelete);
  }

  Future<void> _onGet(MyVacancyResponsesGet event, Emitter<MyVacancyResponsesState> emit) async {
    emit(const LoadingMyVacancyResponsesState());

    final result = await repository.getMyVacancyResponses();

    if (!isClosed) {
      result.fold(
        (failure) => emit(_mapError(failure)),
        (responses) => emit(SuccessMyVacancyResponsesState(responses: responses)),
      );
    }
  }

  Future<void> _onRefresh(MyVacancyResponsesRefresh event, Emitter<MyVacancyResponsesState> emit) async {
    add(const MyVacancyResponsesGet());
  }

  Future<void> _onDelete(MyVacancyResponsesDelete event, Emitter<MyVacancyResponsesState> emit) async {
    final result = await repository.deleteMyVacancyResponse(event.responseId);
    if (!isClosed) {
      result.fold(
        (failure) => emit(_mapError(failure)),
        (_) {
          final current = state;
          if (current is SuccessMyVacancyResponsesState) {
            final newList = current.responses.where((r) => r.id != event.responseId).toList();
            emit(SuccessMyVacancyResponsesState(responses: newList));
          } else {
            add(const MyVacancyResponsesGet());
          }
        },
      );
    }
  }

  ErrorMyVacancyResponsesState _mapError(Failure failure) {
    return ErrorMyVacancyResponsesState(
      errorFromApi: failure.message,
      errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
