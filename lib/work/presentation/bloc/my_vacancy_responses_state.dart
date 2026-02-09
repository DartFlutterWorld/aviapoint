part of 'my_vacancy_responses_bloc.dart';

abstract class MyVacancyResponsesState {
  const MyVacancyResponsesState();
}

class LoadingMyVacancyResponsesState extends MyVacancyResponsesState {
  const LoadingMyVacancyResponsesState();
}

class SuccessMyVacancyResponsesState extends MyVacancyResponsesState {
  final List<JobVacancyResponseEntity> responses;
  const SuccessMyVacancyResponsesState({required this.responses});
}

class ErrorMyVacancyResponsesState extends MyVacancyResponsesState {
  final String? errorFromApi;
  final String errorForUser;
  final String? statusCode;
  final StackTrace? stackTrace;
  final String? responseMessage;
  const ErrorMyVacancyResponsesState({
    this.errorFromApi,
    required this.errorForUser,
    this.statusCode,
    this.stackTrace,
    this.responseMessage,
  });
}
