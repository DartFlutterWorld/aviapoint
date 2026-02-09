part of 'job_resume_edit_bloc.dart';

@freezed
class JobResumeEditEvent with _$JobResumeEditEvent {
  const factory JobResumeEditEvent.create({
    required String title,
    String? about,
    int? desiredSalary,
    String? currency,
    String? employmentTypes,
    String? schedules,
    bool? readyToRelocate,
    bool? readyForBusinessTrips,
    String? address,
    String? dateOfBirth,
    List<String>? citizenship,
    bool? workPermit,
    String? photoUrl,
    List<String>? additionalPhotoUrls,
    int? contactProfileId,
    String? currentPosition,
    String? currentCompany,
    int? totalExperienceMonths,
    int? flightHoursTotal,
    int? flightHoursPic,
    String? licenses,
    String? typeRatings,
    String? medicalClass,
  }) = _Create;

  const factory JobResumeEditEvent.update({
    required int id,
    String? title,
    String? about,
    String? status,
    bool? isVisibleForEmployers,
    int? desiredSalary,
    String? currency,
    String? employmentTypes,
    String? schedules,
    bool? readyToRelocate,
    bool? readyForBusinessTrips,
    String? address,
    String? dateOfBirth,
    List<String>? citizenship,
    bool? workPermit,
    String? photoUrl,
    List<String>? additionalPhotoUrls,
    int? contactProfileId,
    bool? clearContactProfileId,
    String? currentPosition,
    String? currentCompany,
    int? totalExperienceMonths,
    int? flightHoursTotal,
    int? flightHoursPic,
    String? licenses,
    String? typeRatings,
    String? medicalClass,
  }) = _Update;

  const factory JobResumeEditEvent.delete({required int id}) = _Delete;
}
