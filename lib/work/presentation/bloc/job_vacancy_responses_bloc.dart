import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_vacancy_responses_event.dart';
part 'job_vacancy_responses_state.dart';
part 'job_vacancy_responses_bloc.freezed.dart';

class JobVacancyResponsesBloc extends Bloc<JobVacancyResponsesEvent, JobVacancyResponsesState> {
  final JobsRepository repository;

  JobVacancyResponsesBloc({required this.repository}) : super(const JobVacancyResponsesState.loading()) {
    on<_Get>(_onGet);
    on<_Refresh>(_onRefresh);
    on<_UpdateStatus>(_onUpdateStatus);
  }

  Future<void> _onGet(_Get event, Emitter<JobVacancyResponsesState> emit) async {
    emit(const JobVacancyResponsesState.loading());

    final result = await repository.getVacancyResponses(event.vacancyId);

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Что-то пошло не так!\nПопробуйте повторить запрос')),
      (responses) => emit(JobVacancyResponsesState.success(responses: responses)),
    );
  }

  Future<void> _onRefresh(_Refresh event, Emitter<JobVacancyResponsesState> emit) async {
    add(JobVacancyResponsesEvent.get(vacancyId: event.vacancyId));
  }

  Future<void> _onUpdateStatus(_UpdateStatus event, Emitter<JobVacancyResponsesState> emit) async {
    final currentList = state.maybeWhen(
      success: (responses) => responses,
      orElse: () => <JobVacancyResponseEntity>[],
    );

    final result = await repository.updateVacancyResponseStatus(
      vacancyId: event.vacancyId,
      responseId: event.responseId,
      status: event.status,
      employerComment: event.employerComment,
    );
    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось изменить статус отклика')),
      (updated) {
        if (currentList.isNotEmpty) {
          final newList = currentList
              .map((r) => r.id == event.responseId ? updated : r)
              .toList();
          emit(JobVacancyResponsesState.success(responses: newList));
        } else {
          add(JobVacancyResponsesEvent.get(vacancyId: event.vacancyId));
        }
      },
    );
  }

  JobVacancyResponsesState _mapError(Failure failure, {required String defaultMessage}) {
    final errorForUser = defaultMessage;
    return JobVacancyResponsesState.error(
      errorFromApi: failure.message,
      errorForUser: errorForUser,
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
