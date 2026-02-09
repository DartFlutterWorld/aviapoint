import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobs_vacancies_event.dart';
part 'jobs_vacancies_state.dart';
part 'jobs_vacancies_bloc.freezed.dart';

class JobsVacanciesBloc extends Bloc<JobsVacanciesEvent, JobsVacanciesState> {
  final JobsRepository repository;

  static const int _defaultLimit = 20;
  int _offset = 0;
  bool _hasMore = true;
  List<JobVacancyEntity> _items = [];
  int? _employerId;
  String? _search;
  String? _city;
  String? _experienceLevel;
  String? _employmentType;
  String? _schedule;
  int? _salaryFrom;
  int? _salaryTo;
  bool _includeInactive = false;

  JobsVacanciesBloc({required this.repository}) : super(const JobsVacanciesState.loading()) {
    on<_Get>(_onGet);
    on<_LoadMore>(_onLoadMore);
    on<_Refresh>(_onRefresh);
    on<_UpdateFavoriteState>(_onUpdateFavoriteState);
  }

  Future<void> _onGet(_Get event, Emitter<JobsVacanciesState> emit) async {
    _offset = 0;
    _hasMore = true;
    _employerId = event.employerId;
    _search = event.search;
    _city = event.city;
    _experienceLevel = event.experienceLevel;
    _employmentType = event.employmentType;
    _schedule = event.schedule;
    _salaryFrom = event.salaryFrom;
    _salaryTo = event.salaryTo;
    _includeInactive = event.includeInactive;
    emit(const JobsVacanciesState.loading());

    final limit = event.limit ?? _defaultLimit;
    final result = await repository.getVacancies(
      employerId: _employerId,
      search: _search,
      city: _city,
      experienceLevel: _experienceLevel,
      employmentType: _employmentType,
      schedule: _schedule,
      salaryFrom: _salaryFrom,
      salaryTo: _salaryTo,
      includeInactive: _includeInactive,
      limit: limit,
      offset: 0,
    );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Что-то пошло не так!\nПопробуйте повторить запрос')),
      (items) {
        _items = items;
        _offset = items.length;
        _hasMore = items.length >= limit;
        emit(JobsVacanciesState.success(vacancies: List.from(_items), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<JobsVacanciesState> emit) async {
    if (!_hasMore || _items.isEmpty) return;

    emit(JobsVacanciesState.loadingMore(vacancies: List.from(_items)));

    final result = await repository.getVacancies(
      employerId: _employerId,
      search: _search,
      city: _city,
      experienceLevel: _experienceLevel,
      employmentType: _employmentType,
      schedule: _schedule,
      salaryFrom: _salaryFrom,
      salaryTo: _salaryTo,
      includeInactive: _includeInactive,
      limit: _defaultLimit,
      offset: _offset,
    );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Что-то пошло не так!\nПопробуйте повторить запрос')),
      (items) {
        _items = [..._items, ...items];
        _offset = _items.length;
        _hasMore = items.length >= _defaultLimit;
        emit(JobsVacanciesState.success(vacancies: List.from(_items), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onRefresh(_Refresh event, Emitter<JobsVacanciesState> emit) async {
    add(
      JobsVacanciesEvent.get(
        employerId: event.resetToMainList ? null : (_employerId ?? event.employerId),
        search: _search ?? event.search,
        city: _city ?? event.city,
        experienceLevel: _experienceLevel ?? event.experienceLevel,
        employmentType: _employmentType ?? event.employmentType,
        schedule: _schedule ?? event.schedule,
        salaryFrom: _salaryFrom ?? event.salaryFrom,
        salaryTo: _salaryTo ?? event.salaryTo,
        includeInactive: event.resetToMainList ? false : event.includeInactive,
        limit: _defaultLimit,
      ),
    );
  }

  void _onUpdateFavoriteState(_UpdateFavoriteState event, Emitter<JobsVacanciesState> emit) {
    final current = state;
    if (current is! SuccessJobsVacanciesState) return;
    _items = current.vacancies
        .map((v) => v.id == event.vacancyId ? v.copyWith(isFavorite: event.isFavorite) : v)
        .toList();
    emit(JobsVacanciesState.success(vacancies: List.from(_items), hasMore: current.hasMore));
  }

  JobsVacanciesState _mapError(Failure failure, {required String defaultMessage}) {
    final errorForUser = defaultMessage;
    return JobsVacanciesState.error(
      errorFromApi: failure.message,
      errorForUser: errorForUser,
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
