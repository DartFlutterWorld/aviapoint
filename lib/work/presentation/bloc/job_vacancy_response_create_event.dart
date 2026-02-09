part of 'job_vacancy_response_create_bloc.dart';

@freezed
class JobVacancyResponseCreateEvent with _$JobVacancyResponseCreateEvent {
  const factory JobVacancyResponseCreateEvent.create({
    required int vacancyId,
    required int resumeId,
    String? coverLetter,
  }) = _Create;

  const factory JobVacancyResponseCreateEvent.reset() = _Reset;
}
