part of 'job_vacancy_edit_bloc.dart';

@freezed
class JobVacancyEditEvent with _$JobVacancyEditEvent {
  const factory JobVacancyEditEvent.create({
    required String title,
    required int contactProfileId,
    String? description,
    String? responsibilities,
    String? requirements,
    String? conditions,
    int? salaryFrom,
    int? salaryTo,
    String? currency,
    bool? isGross,
    String? employmentType,
    String? schedule,
    String? experienceLevel,
    String? educationLevel,
    String? city,
    String? region,
    String? airportCode,
    String? employmentForm,
    String? workHours,
    bool? relocationAllowed,
    String? businessTrips,
    String? aircraftCategory,
    String? requiredLicense,
    int? minFlightHours,
    String? requiredTypeRating,
    List<String>? skills,
    @Default(true) bool isPublished,
  }) = _Create;

  const factory JobVacancyEditEvent.update({
    required int id,
    String? title,
    int? contactProfileId,
    String? description,
    String? responsibilities,
    String? requirements,
    String? conditions,
    int? salaryFrom,
    int? salaryTo,
    String? currency,
    bool? isGross,
    String? employmentType,
    String? schedule,
    String? experienceLevel,
    String? educationLevel,
    String? city,
    String? region,
    String? airportCode,
    String? employmentForm,
    String? workHours,
    bool? relocationAllowed,
    String? businessTrips,
    String? aircraftCategory,
    String? requiredLicense,
    int? minFlightHours,
    String? requiredTypeRating,
    List<String>? skills,
    bool? isPublished,
    bool? isActive,
    List<String>? additionalImageUrls,
  }) = _Update;

  const factory JobVacancyEditEvent.delete({required int id}) = _Delete;

  const factory JobVacancyEditEvent.publish({required int id}) = _Publish;

  const factory JobVacancyEditEvent.unpublish({required int id}) = _Unpublish;
}
