import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Состояние последних вакансии и резюме для блока на главной.
class LatestJobsState {
  const LatestJobsState({
    this.loading = false,
    this.vacancy,
    this.resume,
    this.error,
  });

  final bool loading;
  final JobVacancyEntity? vacancy;
  final JobResumeEntity? resume;
  final String? error;
}

/// Кубит для загрузки по 1 последней вакансии и резюме (главная страница).
class LatestJobsCubit extends Cubit<LatestJobsState> {
  LatestJobsCubit(this._repository) : super(const LatestJobsState(loading: true));

  final JobsRepository _repository;

  Future<void> load() async {
    emit(const LatestJobsState(loading: true));

    final vacResult = await _repository.getVacancies(includeInactive: false, limit: 1, offset: 0);
    final resResult = await _repository.getResumes(limit: 1, offset: 0);

    final vacancy = vacResult.fold((_) => null, (list) => list.isNotEmpty ? list.first : null);
    final resume = resResult.fold((_) => null, (list) => list.isNotEmpty ? list.first : null);

    final bothFailed = vacResult.fold((_) => true, (_) => false) && resResult.fold((_) => true, (_) => false);
    if (bothFailed) {
      emit(LatestJobsState(error: 'Не удалось загрузить данные'));
      return;
    }

    emit(LatestJobsState(vacancy: vacancy, resume: resume));
  }
}
