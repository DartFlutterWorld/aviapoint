import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_resume_edit_event.dart';
part 'job_resume_edit_state.dart';
part 'job_resume_edit_bloc.freezed.dart';

class JobResumeEditBloc extends Bloc<JobResumeEditEvent, JobResumeEditState> {
  final JobsRepository repository;

  JobResumeEditBloc({required this.repository}) : super(const JobResumeEditState.initial()) {
    on<_Create>(_onCreate);
    on<_Update>(_onUpdate);
    on<_Delete>(_onDelete);
  }

  Future<void> _onCreate(_Create event, Emitter<JobResumeEditState> emit) async {
    emit(const JobResumeEditState.creating());

    final result = await repository.createResume(
      title: event.title,
      about: event.about,
      desiredSalary: event.desiredSalary,
      currency: event.currency,
      employmentTypes: event.employmentTypes,
      schedules: event.schedules,
      readyToRelocate: event.readyToRelocate,
      readyForBusinessTrips: event.readyForBusinessTrips,
      address: event.address,
      dateOfBirth: event.dateOfBirth,
      citizenship: event.citizenship,
      workPermit: event.workPermit,
      photoUrl: event.photoUrl,
      additionalPhotoUrls: event.additionalPhotoUrls,
      contactProfileId: event.contactProfileId,
      currentPosition: event.currentPosition,
      currentCompany: event.currentCompany,
      totalExperienceMonths: event.totalExperienceMonths,
      flightHoursTotal: event.flightHoursTotal,
      flightHoursPic: event.flightHoursPic,
      licenses: event.licenses,
      typeRatings: event.typeRatings,
      medicalClass: event.medicalClass,
      isVisibleForEmployers: event.isVisibleForEmployers,
    );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось создать резюме')),
      (resume) => emit(JobResumeEditState.created(resume: resume)),
    );
  }

  Future<void> _onUpdate(_Update event, Emitter<JobResumeEditState> emit) async {
    emit(const JobResumeEditState.updating());

    final result = await repository.updateResume(
      id: event.id,
      title: event.title,
      about: event.about,
      status: event.status,
      isVisibleForEmployers: event.isVisibleForEmployers,
      desiredSalary: event.desiredSalary,
      currency: event.currency,
      employmentTypes: event.employmentTypes,
      schedules: event.schedules,
      readyToRelocate: event.readyToRelocate,
      readyForBusinessTrips: event.readyForBusinessTrips,
      address: event.address,
      dateOfBirth: event.dateOfBirth,
      citizenship: event.citizenship,
      workPermit: event.workPermit,
      photoUrl: event.photoUrl,
      additionalPhotoUrls: event.additionalPhotoUrls,
      contactProfileId: event.contactProfileId,
      clearContactProfileId: event.clearContactProfileId,
      currentPosition: event.currentPosition,
      currentCompany: event.currentCompany,
      totalExperienceMonths: event.totalExperienceMonths,
      flightHoursTotal: event.flightHoursTotal,
      flightHoursPic: event.flightHoursPic,
      licenses: event.licenses,
      typeRatings: event.typeRatings,
      medicalClass: event.medicalClass,
    );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось обновить резюме')),
      (resume) => emit(JobResumeEditState.updated(resume: resume)),
    );
  }

  Future<void> _onDelete(_Delete event, Emitter<JobResumeEditState> emit) async {
    emit(const JobResumeEditState.deleting());

    final result = await repository.deleteResume(event.id);

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось удалить резюме')),
      (_) => emit(JobResumeEditState.deleted(id: event.id)),
    );
  }

  JobResumeEditState _mapError(Failure failure, {required String defaultMessage}) {
    final errorForUser = defaultMessage;
    return JobResumeEditState.error(
      errorFromApi: failure.message,
      errorForUser: errorForUser,
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
