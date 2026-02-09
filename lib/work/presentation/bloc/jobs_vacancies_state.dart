part of 'jobs_vacancies_bloc.dart';

@freezed
class JobsVacanciesState with _$JobsVacanciesState {
  const factory JobsVacanciesState.loading() = LoadingJobsVacanciesState;

  const factory JobsVacanciesState.loadingMore({required List<JobVacancyEntity> vacancies}) =
      LoadingMoreJobsVacanciesState;

  const factory JobsVacanciesState.success({required List<JobVacancyEntity> vacancies, @Default(true) bool hasMore}) =
      SuccessJobsVacanciesState;

  const factory JobsVacanciesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorJobsVacanciesState;
}
