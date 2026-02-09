part of 'jobs_resumes_bloc.dart';

@freezed
abstract class JobsResumesEvent with _$JobsResumesEvent {
  const factory JobsResumesEvent.get({
    int? userId,
    String? search,
    String? address,
    String? license,
    String? aircraftType,
    @Default(false) bool onlyFavorites,
    int? limit,
  }) = _Get;

  const factory JobsResumesEvent.loadMore({
    int? userId,
    String? search,
    String? address,
    String? license,
    String? aircraftType,
    @Default(false) bool onlyFavorites,
  }) = _LoadMore;

  const factory JobsResumesEvent.refresh({
    int? userId,
    String? search,
    String? address,
    String? license,
    String? aircraftType,
    @Default(false) bool onlyFavorites,
  }) = _Refresh;
}
