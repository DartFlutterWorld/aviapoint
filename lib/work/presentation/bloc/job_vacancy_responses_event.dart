part of 'job_vacancy_responses_bloc.dart';

@freezed
abstract class JobVacancyResponsesEvent with _$JobVacancyResponsesEvent {
  const factory JobVacancyResponsesEvent.get({required int vacancyId}) = _Get;
  const factory JobVacancyResponsesEvent.refresh({required int vacancyId}) = _Refresh;
  const factory JobVacancyResponsesEvent.updateStatus({
    required int vacancyId,
    required int responseId,
    required String status,
    String? employerComment,
  }) = _UpdateStatus;
}
