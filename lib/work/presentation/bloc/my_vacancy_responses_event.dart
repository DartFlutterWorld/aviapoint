part of 'my_vacancy_responses_bloc.dart';

abstract class MyVacancyResponsesEvent {
  const MyVacancyResponsesEvent();
}

class MyVacancyResponsesGet extends MyVacancyResponsesEvent {
  const MyVacancyResponsesGet();
}

class MyVacancyResponsesRefresh extends MyVacancyResponsesEvent {
  const MyVacancyResponsesRefresh();
}

class MyVacancyResponsesDelete extends MyVacancyResponsesEvent {
  final int responseId;
  const MyVacancyResponsesDelete({required this.responseId});
}
