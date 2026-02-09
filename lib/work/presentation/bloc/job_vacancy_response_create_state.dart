part of 'job_vacancy_response_create_bloc.dart';

@freezed
class JobVacancyResponseCreateState with _$JobVacancyResponseCreateState {
  const factory JobVacancyResponseCreateState.initial() = _Initial;
  const factory JobVacancyResponseCreateState.creating() = _Creating;
  const factory JobVacancyResponseCreateState.created({required JobVacancyResponseEntity response}) = _Created;
  const factory JobVacancyResponseCreateState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = _Error;
}
