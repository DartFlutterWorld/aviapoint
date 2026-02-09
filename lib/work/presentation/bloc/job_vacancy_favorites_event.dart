part of 'job_vacancy_favorites_bloc.dart';

abstract class JobVacancyFavoritesEvent {
  const JobVacancyFavoritesEvent();
}

class JobVacancyFavoritesGet extends JobVacancyFavoritesEvent {
  final int? limit;
  final int? offset;
  const JobVacancyFavoritesGet({this.limit, this.offset});
}

class JobVacancyFavoritesRefresh extends JobVacancyFavoritesEvent {
  const JobVacancyFavoritesRefresh();
}

/// Убрать вакансию из списка на UI (без API). Вызывать после успеха JobVacancyFavoriteToggleBloc.remove.
class JobVacancyFavoritesRemoveItem extends JobVacancyFavoritesEvent {
  final int vacancyId;
  const JobVacancyFavoritesRemoveItem({required this.vacancyId});
}
