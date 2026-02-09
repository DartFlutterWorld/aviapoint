part of 'job_vacancy_favorite_toggle_bloc.dart';

abstract class JobVacancyFavoriteToggleState {
  const JobVacancyFavoriteToggleState();
}

class JobVacancyFavoriteToggleIdle extends JobVacancyFavoriteToggleState {
  const JobVacancyFavoriteToggleIdle();
}

class JobVacancyFavoriteToggleLoading extends JobVacancyFavoriteToggleState {
  final int vacancyId;
  const JobVacancyFavoriteToggleLoading({required this.vacancyId});
}

class JobVacancyFavoriteToggleSuccess extends JobVacancyFavoriteToggleState {
  final int vacancyId;
  final bool isFavorite;
  const JobVacancyFavoriteToggleSuccess({required this.vacancyId, required this.isFavorite});
}

class JobVacancyFavoriteToggleError extends JobVacancyFavoriteToggleState {
  final String errorForUser;
  const JobVacancyFavoriteToggleError({required this.errorForUser});
}
