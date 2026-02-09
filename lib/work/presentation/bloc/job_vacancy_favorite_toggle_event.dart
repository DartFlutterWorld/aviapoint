part of 'job_vacancy_favorite_toggle_bloc.dart';

abstract class JobVacancyFavoriteToggleEvent {
  const JobVacancyFavoriteToggleEvent();
}

class JobVacancyFavoriteToggleAdd extends JobVacancyFavoriteToggleEvent {
  final int vacancyId;
  const JobVacancyFavoriteToggleAdd({required this.vacancyId});
}

class JobVacancyFavoriteToggleRemove extends JobVacancyFavoriteToggleEvent {
  final int vacancyId;
  const JobVacancyFavoriteToggleRemove({required this.vacancyId});
}
