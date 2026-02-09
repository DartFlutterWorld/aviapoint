part of 'job_vacancy_edit_bloc.dart';

@freezed
class JobVacancyEditState with _$JobVacancyEditState {
  const factory JobVacancyEditState.initial() = _Initial;

  const factory JobVacancyEditState.creating() = _Creating;
  const factory JobVacancyEditState.updating() = _Updating;
  const factory JobVacancyEditState.deleting() = _Deleting;
  const factory JobVacancyEditState.publishing() = _Publishing;
  const factory JobVacancyEditState.unpublishing() = _Unpublishing;

  const factory JobVacancyEditState.created({required JobVacancyEntity vacancy}) = _Created;
  const factory JobVacancyEditState.updated({required JobVacancyEntity vacancy}) = _Updated;
  const factory JobVacancyEditState.deleted({required int id}) = _Deleted;
  const factory JobVacancyEditState.published({required JobVacancyEntity vacancy}) = _Published;
  const factory JobVacancyEditState.unpublished({required JobVacancyEntity vacancy}) = _Unpublished;

  const factory JobVacancyEditState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = _Error;
}
