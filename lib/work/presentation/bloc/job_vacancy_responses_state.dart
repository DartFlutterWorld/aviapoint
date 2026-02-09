part of 'job_vacancy_responses_bloc.dart';

@freezed
class JobVacancyResponsesState with _$JobVacancyResponsesState {
  const factory JobVacancyResponsesState.loading() = _Loading;
  const factory JobVacancyResponsesState.success({required List<JobVacancyResponseEntity> responses}) = _Success;
  const factory JobVacancyResponsesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = _Error;
}
