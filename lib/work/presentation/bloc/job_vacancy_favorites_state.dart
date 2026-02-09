part of 'job_vacancy_favorites_bloc.dart';

abstract class JobVacancyFavoritesState {
  const JobVacancyFavoritesState();
}

class LoadingJobVacancyFavoritesState extends JobVacancyFavoritesState {
  const LoadingJobVacancyFavoritesState();
}

class SuccessJobVacancyFavoritesState extends JobVacancyFavoritesState {
  final List<JobVacancyEntity> vacancies;
  final bool hasMore;
  const SuccessJobVacancyFavoritesState({required this.vacancies, this.hasMore = false});
}

class ErrorJobVacancyFavoritesState extends JobVacancyFavoritesState {
  final String? errorFromApi;
  final String errorForUser;
  final String? statusCode;
  final StackTrace? stackTrace;
  final String? responseMessage;
  const ErrorJobVacancyFavoritesState({
    this.errorFromApi,
    required this.errorForUser,
    this.statusCode,
    this.stackTrace,
    this.responseMessage,
  });
}
