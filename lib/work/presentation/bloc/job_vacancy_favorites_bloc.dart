import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:bloc/bloc.dart';

part 'job_vacancy_favorites_event.dart';
part 'job_vacancy_favorites_state.dart';

class JobVacancyFavoritesBloc extends Bloc<JobVacancyFavoritesEvent, JobVacancyFavoritesState> {
  final JobsRepository repository;

  static const int _defaultLimit = 20;
  List<JobVacancyEntity> _items = [];

  JobVacancyFavoritesBloc({required this.repository}) : super(const LoadingJobVacancyFavoritesState()) {
    on<JobVacancyFavoritesGet>(_onGet);
    on<JobVacancyFavoritesRefresh>(_onRefresh);
    on<JobVacancyFavoritesRemoveItem>(_onRemoveItemFromList);
  }

  Future<void> _onGet(JobVacancyFavoritesGet event, Emitter<JobVacancyFavoritesState> emit) async {
    emit(const LoadingJobVacancyFavoritesState());
    final limit = event.limit ?? _defaultLimit;
    final offset = event.offset ?? 0;

    final result = await repository.getFavoriteVacancies(limit: limit, offset: offset);

    if (!isClosed) {
      result.fold((failure) => emit(_mapError(failure)), (items) {
        _items = items;
        emit(SuccessJobVacancyFavoritesState(vacancies: List.from(_items), hasMore: items.length >= limit));
      });
    }
  }

  Future<void> _onRefresh(JobVacancyFavoritesRefresh event, Emitter<JobVacancyFavoritesState> emit) async {
    add(const JobVacancyFavoritesGet());
  }

  void _onRemoveItemFromList(JobVacancyFavoritesRemoveItem event, Emitter<JobVacancyFavoritesState> emit) {
    final current = state;
    if (current is! SuccessJobVacancyFavoritesState) return;
    _items = current.vacancies.where((v) => v.id != event.vacancyId).toList();
    emit(SuccessJobVacancyFavoritesState(vacancies: List.from(_items), hasMore: false));
  }

  ErrorJobVacancyFavoritesState _mapError(Failure failure) {
    return ErrorJobVacancyFavoritesState(
      errorFromApi: failure.message,
      errorForUser: 'Не удалось загрузить избранное',
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
