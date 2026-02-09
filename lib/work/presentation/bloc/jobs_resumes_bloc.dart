import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobs_resumes_event.dart';
part 'jobs_resumes_state.dart';
part 'jobs_resumes_bloc.freezed.dart';

class JobsResumesBloc extends Bloc<JobsResumesEvent, JobsResumesState> {
  final JobsRepository repository;

  static const int _defaultLimit = 20;
  int _offset = 0;
  bool _hasMore = true;
  List<JobResumeEntity> _items = [];
  int? _userId;
  String? _search;
  String? _address;
  String? _license;
  String? _aircraftType;
  bool _onlyFavorites = false;

  JobsResumesBloc({required this.repository}) : super(const JobsResumesState.loading()) {
    on<_Get>(_onGet);
    on<_LoadMore>(_onLoadMore);
    on<_Refresh>(_onRefresh);
  }

  Future<void> _onGet(_Get event, Emitter<JobsResumesState> emit) async {
    _offset = 0;
    _hasMore = true;
    _userId = event.userId;
    _search = event.search;
    _address = event.address;
    _license = event.license;
    _aircraftType = event.aircraftType;
    _onlyFavorites = event.onlyFavorites;
    emit(const JobsResumesState.loading());

    final limit = event.limit ?? _defaultLimit;
    final result = _onlyFavorites
        ? await repository.getFavoriteResumes(limit: limit, offset: 0)
        : await repository.getResumes(
            userId: _userId,
            search: _search,
            address: _address,
            license: _license,
            aircraftType: _aircraftType,
            limit: limit,
            offset: 0,
          );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Что-то пошло не так!\nПопробуйте повторить запрос')),
      (items) {
        _items = items;
        _offset = items.length;
        _hasMore = items.length >= limit;
        emit(JobsResumesState.success(resumes: List.from(_items), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<JobsResumesState> emit) async {
    if (!_hasMore || _items.isEmpty) return;

    emit(JobsResumesState.loadingMore(resumes: List.from(_items)));

    final result = _onlyFavorites
        ? await repository.getFavoriteResumes(limit: _defaultLimit, offset: _offset)
        : await repository.getResumes(
            userId: _userId,
            search: _search,
            address: _address,
            license: _license,
            aircraftType: _aircraftType,
            limit: _defaultLimit,
            offset: _offset,
          );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Что-то пошло не так!\nПопробуйте повторить запрос')),
      (items) {
        _items = [..._items, ...items];
        _offset = _items.length;
        _hasMore = items.length >= _defaultLimit;
        emit(JobsResumesState.success(resumes: List.from(_items), hasMore: _hasMore));
      },
    );
  }

  Future<void> _onRefresh(_Refresh event, Emitter<JobsResumesState> emit) async {
    add(
      JobsResumesEvent.get(
        userId: _userId ?? event.userId,
        search: _search ?? event.search,
        address: _address ?? event.address,
        license: _license ?? event.license,
        aircraftType: _aircraftType ?? event.aircraftType,
        onlyFavorites: _onlyFavorites,
        limit: _defaultLimit,
      ),
    );
  }

  JobsResumesState _mapError(Failure failure, {required String defaultMessage}) {
    final errorForUser = defaultMessage;
    return JobsResumesState.error(
      errorFromApi: failure.message,
      errorForUser: errorForUser,
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
