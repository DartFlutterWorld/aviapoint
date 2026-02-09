part of 'employer_vacancy_responses_bloc.dart';

abstract class EmployerVacancyResponsesEvent {
  const EmployerVacancyResponsesEvent();
}

class EmployerVacancyResponsesGet extends EmployerVacancyResponsesEvent {
  const EmployerVacancyResponsesGet();
}

class EmployerVacancyResponsesRefresh extends EmployerVacancyResponsesEvent {
  const EmployerVacancyResponsesRefresh();
}

class EmployerVacancyResponsesUpdateStatus extends EmployerVacancyResponsesEvent {
  final int vacancyId;
  final int responseId;
  final String status;
  final String? employerComment;
  const EmployerVacancyResponsesUpdateStatus({
    required this.vacancyId,
    required this.responseId,
    required this.status,
    this.employerComment,
  });
}
