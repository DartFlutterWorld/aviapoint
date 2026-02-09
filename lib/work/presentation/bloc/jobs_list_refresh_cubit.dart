import 'package:flutter_bloc/flutter_bloc.dart';

/// Сигнал об изменениях вакансий (create/update/delete/publish/unpublish).
class JobsVacanciesRefreshCubit extends Cubit<int> {
  JobsVacanciesRefreshCubit() : super(0);

  void notify() => emit(state + 1);
}

/// Сигнал об изменениях резюме (create/update/delete).
class JobsResumesRefreshCubit extends Cubit<int> {
  JobsResumesRefreshCubit() : super(0);

  void notify() => emit(state + 1);
}
