import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_resume_detail_bloc.freezed.dart';

@freezed
class JobResumeDetailEvent with _$JobResumeDetailEvent {
  const JobResumeDetailEvent._();

  const factory JobResumeDetailEvent.getById({required int id}) = GetJobResumeByIdEvent;
  const factory JobResumeDetailEvent.reset() = ResetJobResumeDetailEvent;
}

@freezed
class JobResumeDetailState with _$JobResumeDetailState {
  const JobResumeDetailState._();

  const factory JobResumeDetailState.loading() = LoadingJobResumeDetailState;

  const factory JobResumeDetailState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorJobResumeDetailState;

  const factory JobResumeDetailState.success({required JobResumeEntity resume}) = SuccessJobResumeDetailState;
}

class JobResumeDetailBloc extends Bloc<JobResumeDetailEvent, JobResumeDetailState> {
  final JobsRepository _repository;

  JobResumeDetailBloc({required JobsRepository repository})
    : _repository = repository,
      super(const LoadingJobResumeDetailState()) {
    on<JobResumeDetailEvent>(
      (event, emit) =>
          event.map(getById: (e) => _onGetById(e, emit), reset: (_) => emit(const LoadingJobResumeDetailState())),
    );
  }

  Future<void> _onGetById(GetJobResumeByIdEvent event, Emitter<JobResumeDetailState> emit) async {
    emit(const LoadingJobResumeDetailState());

    final result = await _repository.getResumeById(event.id);

    result.fold(
      (Failure failure) {
        emit(
          JobResumeDetailState.error(
            errorForUser: failure.message ?? 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: failure.message,
            statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
            responseMessage: failure.responseMessage,
            stackTrace: null,
          ),
        );
      },
      (resume) {
        emit(JobResumeDetailState.success(resume: resume));
      },
    );
  }
}
