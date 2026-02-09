import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_vacancy_detail_bloc.freezed.dart';

@freezed
class JobVacancyDetailEvent with _$JobVacancyDetailEvent {
  const JobVacancyDetailEvent._();

  const factory JobVacancyDetailEvent.getById({required int id}) = GetJobVacancyByIdEvent;
  const factory JobVacancyDetailEvent.reset() = ResetJobVacancyDetailEvent;
}

@freezed
class JobVacancyDetailState with _$JobVacancyDetailState {
  const JobVacancyDetailState._();

  const factory JobVacancyDetailState.loading() = LoadingJobVacancyDetailState;

  const factory JobVacancyDetailState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorJobVacancyDetailState;

  const factory JobVacancyDetailState.success({required JobVacancyEntity vacancy}) = SuccessJobVacancyDetailState;
}

class JobVacancyDetailBloc extends Bloc<JobVacancyDetailEvent, JobVacancyDetailState> {
  final JobsRepository _repository;

  JobVacancyDetailBloc({required JobsRepository repository})
    : _repository = repository,
      super(const LoadingJobVacancyDetailState()) {
    on<JobVacancyDetailEvent>(
      (event, emit) =>
          event.map(getById: (e) => _onGetById(e, emit), reset: (_) => emit(const LoadingJobVacancyDetailState())),
    );
  }

  Future<void> _onGetById(GetJobVacancyByIdEvent event, Emitter<JobVacancyDetailState> emit) async {
    emit(const LoadingJobVacancyDetailState());

    final result = await _repository.getVacancyById(event.id);

    result.fold(
      (Failure failure) {
        emit(
          JobVacancyDetailState.error(
            errorForUser: failure.message ?? 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
            stackTrace: null,
          ),
        );
      },
      (vacancy) {
        emit(JobVacancyDetailState.success(vacancy: vacancy));
      },
    );
  }
}
