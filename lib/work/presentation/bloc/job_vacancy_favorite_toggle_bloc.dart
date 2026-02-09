import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:bloc/bloc.dart';

part 'job_vacancy_favorite_toggle_event.dart';
part 'job_vacancy_favorite_toggle_state.dart';

/// Отдельный BLoC только для действия «добавить/убрать вакансию из избранного».
/// Не держит списки, только выполняет API и эмитит success/error.
class JobVacancyFavoriteToggleBloc extends Bloc<JobVacancyFavoriteToggleEvent, JobVacancyFavoriteToggleState> {
  final JobsRepository repository;

  JobVacancyFavoriteToggleBloc({required this.repository}) : super(const JobVacancyFavoriteToggleIdle()) {
    on<JobVacancyFavoriteToggleAdd>(_onAdd);
    on<JobVacancyFavoriteToggleRemove>(_onRemove);
  }

  Future<void> _onAdd(JobVacancyFavoriteToggleAdd event, Emitter<JobVacancyFavoriteToggleState> emit) async {
    emit(JobVacancyFavoriteToggleLoading(vacancyId: event.vacancyId));
    final result = await repository.addVacancyToFavorites(event.vacancyId);
    if (!isClosed) {
      result.fold(
        (_) => emit(const JobVacancyFavoriteToggleError(errorForUser: 'Не удалось добавить в избранное')),
        (_) => emit(JobVacancyFavoriteToggleSuccess(vacancyId: event.vacancyId, isFavorite: true)),
      );
    }
  }

  Future<void> _onRemove(JobVacancyFavoriteToggleRemove event, Emitter<JobVacancyFavoriteToggleState> emit) async {
    emit(JobVacancyFavoriteToggleLoading(vacancyId: event.vacancyId));
    final result = await repository.removeVacancyFromFavorites(event.vacancyId);
    if (!isClosed) {
      result.fold(
        (_) => emit(const JobVacancyFavoriteToggleError(errorForUser: 'Не удалось убрать из избранного')),
        (_) => emit(JobVacancyFavoriteToggleSuccess(vacancyId: event.vacancyId, isFavorite: false)),
      );
    }
  }
}
