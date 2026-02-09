part of 'jobs_vacancies_bloc.dart';

@freezed
abstract class JobsVacanciesEvent with _$JobsVacanciesEvent {
  const factory JobsVacanciesEvent.get({
    int? employerId,
    String? search,
    String? city,
    String? experienceLevel,
    String? employmentType,
    String? schedule,
    int? salaryFrom,
    int? salaryTo,
    @Default(false) bool includeInactive,
    int? limit,
  }) = _Get;

  const factory JobsVacanciesEvent.loadMore({
    int? employerId,
    String? search,
    String? city,
    String? experienceLevel,
    String? employmentType,
    String? schedule,
    int? salaryFrom,
    int? salaryTo,
    @Default(false) bool includeInactive,
  }) = _LoadMore;

  const factory JobsVacanciesEvent.refresh({
    int? employerId,
    String? search,
    String? city,
    String? experienceLevel,
    String? employmentType,
    String? schedule,
    int? salaryFrom,
    int? salaryTo,
    @Default(false) bool includeInactive,
    @Default(false) bool resetToMainList,
  }) = _Refresh;

  /// Обновить только флаг isFavorite у одной вакансии в списке (без API).
  const factory JobsVacanciesEvent.updateFavoriteState({required int vacancyId, required bool isFavorite}) =
      _UpdateFavoriteState;
}
