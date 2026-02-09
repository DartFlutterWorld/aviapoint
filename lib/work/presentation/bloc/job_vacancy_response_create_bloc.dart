import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_vacancy_response_create_event.dart';
part 'job_vacancy_response_create_state.dart';
part 'job_vacancy_response_create_bloc.freezed.dart';

class JobVacancyResponseCreateBloc extends Bloc<JobVacancyResponseCreateEvent, JobVacancyResponseCreateState> {
  final JobsRepository repository;

  JobVacancyResponseCreateBloc({required this.repository}) : super(const JobVacancyResponseCreateState.initial()) {
    on<_Create>(_onCreate);
    on<_Reset>(_onReset);
  }

  Future<void> _onCreate(_Create event, Emitter<JobVacancyResponseCreateState> emit) async {
    emit(const JobVacancyResponseCreateState.creating());
    final result = await repository.createVacancyResponse(
      vacancyId: event.vacancyId,
      resumeId: event.resumeId,
      coverLetter: event.coverLetter,
    );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось отправить отклик')),
      (response) => emit(JobVacancyResponseCreateState.created(response: response)),
    );
  }

  void _onReset(_Reset event, Emitter<JobVacancyResponseCreateState> emit) {
    emit(const JobVacancyResponseCreateState.initial());
  }

  JobVacancyResponseCreateState _mapError(Failure failure, {required String defaultMessage}) {
    final errorForUser = defaultMessage;
    return JobVacancyResponseCreateState.error(
      errorFromApi: failure.message,
      errorForUser: errorForUser,
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
