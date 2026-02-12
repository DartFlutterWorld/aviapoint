import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_vacancy_edit_event.dart';
part 'job_vacancy_edit_state.dart';
part 'job_vacancy_edit_bloc.freezed.dart';

class JobVacancyEditBloc extends Bloc<JobVacancyEditEvent, JobVacancyEditState> {
  final JobsRepository repository;

  JobVacancyEditBloc({required this.repository}) : super(const JobVacancyEditState.initial()) {
    on<_Create>(_onCreate);
    on<_Update>(_onUpdate);
    on<_Delete>(_onDelete);
    on<_Publish>(_onPublish);
    on<_Unpublish>(_onUnpublish);
  }

  Future<void> _onCreate(_Create event, Emitter<JobVacancyEditState> emit) async {
    emit(const JobVacancyEditState.creating());

    final result = await repository.createVacancy(
      title: event.title,
      contactProfileId: event.contactProfileId,
      description: event.description,
      responsibilities: event.responsibilities,
      requirements: event.requirements,
      conditions: event.conditions,
      salaryFrom: event.salaryFrom,
      salaryTo: event.salaryTo,
      currency: event.currency,
      isGross: event.isGross,
      employmentType: event.employmentType,
      schedule: event.schedule,
      experienceLevel: event.experienceLevel,
      educationLevel: event.educationLevel,
      city: event.city,
      region: event.region,
      airportCode: event.airportCode,
      employmentForm: event.employmentForm,
      workHours: event.workHours,
      relocationAllowed: event.relocationAllowed,
      businessTrips: event.businessTrips,
      aircraftCategory: event.aircraftCategory,
      requiredLicense: event.requiredLicense,
      minFlightHours: event.minFlightHours,
      requiredTypeRating: event.requiredTypeRating,
      skills: event.skills,
      isPublished: event.isPublished,
    );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось создать вакансию')),
      (vacancy) => emit(JobVacancyEditState.created(vacancy: vacancy)),
    );
  }

  Future<void> _onUpdate(_Update event, Emitter<JobVacancyEditState> emit) async {
    emit(const JobVacancyEditState.updating());

    final result = await repository.updateVacancy(
      id: event.id,
      title: event.title,
      contactProfileId: event.contactProfileId,
      description: event.description,
      responsibilities: event.responsibilities,
      requirements: event.requirements,
      conditions: event.conditions,
      salaryFrom: event.salaryFrom,
      salaryTo: event.salaryTo,
      currency: event.currency,
      isGross: event.isGross,
      employmentType: event.employmentType,
      schedule: event.schedule,
      experienceLevel: event.experienceLevel,
      educationLevel: event.educationLevel,
      city: event.city,
      region: event.region,
      airportCode: event.airportCode,
      employmentForm: event.employmentForm,
      workHours: event.workHours,
      relocationAllowed: event.relocationAllowed,
      businessTrips: event.businessTrips,
      aircraftCategory: event.aircraftCategory,
      requiredLicense: event.requiredLicense,
      minFlightHours: event.minFlightHours,
      requiredTypeRating: event.requiredTypeRating,
      skills: event.skills,
      isPublished: event.isPublished,
      isActive: event.isActive,
      additionalImageUrls: event.additionalImageUrls,
    );

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось обновить вакансию')),
      (vacancy) => emit(JobVacancyEditState.updated(vacancy: vacancy)),
    );
  }

  Future<void> _onDelete(_Delete event, Emitter<JobVacancyEditState> emit) async {
    emit(const JobVacancyEditState.deleting());

    final result = await repository.deleteVacancy(event.id);

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось удалить вакансию')),
      (_) => emit(JobVacancyEditState.deleted(id: event.id)),
    );
  }

  Future<void> _onPublish(_Publish event, Emitter<JobVacancyEditState> emit) async {
    emit(const JobVacancyEditState.publishing());

    final result = await repository.publishVacancy(event.id);

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось опубликовать вакансию')),
      (vacancy) => emit(JobVacancyEditState.published(vacancy: vacancy)),
    );
  }

  Future<void> _onUnpublish(_Unpublish event, Emitter<JobVacancyEditState> emit) async {
    emit(const JobVacancyEditState.unpublishing());

    final result = await repository.unpublishVacancy(event.id);

    result.fold(
      (failure) => emit(_mapError(failure, defaultMessage: 'Не удалось снять вакансию с публикации')),
      (vacancy) => emit(JobVacancyEditState.unpublished(vacancy: vacancy)),
    );
  }

  JobVacancyEditState _mapError(Failure failure, {required String defaultMessage}) {
    final errorForUser = defaultMessage;
    return JobVacancyEditState.error(
      errorFromApi: failure.message,
      errorForUser: errorForUser,
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
