import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employer_vacancy_responses_event.dart';
part 'employer_vacancy_responses_state.dart';

class EmployerVacancyResponsesBloc extends Bloc<EmployerVacancyResponsesEvent, EmployerVacancyResponsesState> {
  final JobsRepository repository;

  EmployerVacancyResponsesBloc({required this.repository})
      : super(const LoadingEmployerVacancyResponsesState()) {
    on<EmployerVacancyResponsesGet>(_onGet);
    on<EmployerVacancyResponsesRefresh>(_onRefresh);
    on<EmployerVacancyResponsesUpdateStatus>(_onUpdateStatus);
  }

  Future<void> _onGet(EmployerVacancyResponsesGet event, Emitter<EmployerVacancyResponsesState> emit) async {
    emit(const LoadingEmployerVacancyResponsesState());
    final result = await repository.getEmployerVacancyResponses();
    if (!isClosed) {
      result.fold(
        (failure) => emit(_mapError(failure)),
        (responses) => emit(SuccessEmployerVacancyResponsesState(responses: responses)),
      );
    }
  }

  Future<void> _onRefresh(EmployerVacancyResponsesRefresh event, Emitter<EmployerVacancyResponsesState> emit) async {
    add(const EmployerVacancyResponsesGet());
  }

  Future<void> _onUpdateStatus(
    EmployerVacancyResponsesUpdateStatus event,
    Emitter<EmployerVacancyResponsesState> emit,
  ) async {
    final current = state;
    final currentList = current is SuccessEmployerVacancyResponsesState ? current.responses : <JobVacancyResponseEntity>[];

    final result = await repository.updateVacancyResponseStatus(
      vacancyId: event.vacancyId,
      responseId: event.responseId,
      status: event.status,
      employerComment: event.employerComment,
    );
    if (!isClosed) {
      result.fold(
        (failure) => emit(_mapError(failure)),
        (updated) {
          if (currentList.isNotEmpty) {
            final newList = currentList
                .map((r) => r.id == event.responseId ? updated : r)
                .toList();
            emit(SuccessEmployerVacancyResponsesState(responses: newList));
          } else {
            add(const EmployerVacancyResponsesGet());
          }
        },
      );
    }
  }

  ErrorEmployerVacancyResponsesState _mapError(Failure failure) {
    return ErrorEmployerVacancyResponsesState(
      errorFromApi: failure.message,
      errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
