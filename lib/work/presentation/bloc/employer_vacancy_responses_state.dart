part of 'employer_vacancy_responses_bloc.dart';

abstract class EmployerVacancyResponsesState {
  const EmployerVacancyResponsesState();
}

class LoadingEmployerVacancyResponsesState extends EmployerVacancyResponsesState {
  const LoadingEmployerVacancyResponsesState();
}

class SuccessEmployerVacancyResponsesState extends EmployerVacancyResponsesState {
  final List<JobVacancyResponseEntity> responses;
  const SuccessEmployerVacancyResponsesState({required this.responses});
}

class ErrorEmployerVacancyResponsesState extends EmployerVacancyResponsesState {
  final String? errorFromApi;
  final String errorForUser;
  final String? statusCode;
  final StackTrace? stackTrace;
  final String? responseMessage;
  const ErrorEmployerVacancyResponsesState({
    this.errorFromApi,
    required this.errorForUser,
    this.statusCode,
    this.stackTrace,
    this.responseMessage,
  });
}
