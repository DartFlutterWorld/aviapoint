import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_contact_profile_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_experience_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_education_entity.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

abstract class JobsRepository {
  // Вакансии
  Future<Either<Failure, List<JobVacancyEntity>>> getVacancies({
    int? employerId,
    String? search,
    String? city,
    String? experienceLevel,
    String? employmentType,
    String? schedule,
    int? salaryFrom,
    int? salaryTo,
    bool includeInactive = false,
    int limit = 20,
    int offset = 0,
  });

  Future<Either<Failure, JobVacancyEntity>> getVacancyById(int id);

  Future<Either<Failure, JobVacancyEntity>> createVacancy({
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
    bool isPublished = true,
  });

  Future<Either<Failure, JobVacancyEntity>> updateVacancy({
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
  });

  Future<Either<Failure, void>> deleteVacancy(int id);

  Future<Either<Failure, JobVacancyEntity>> publishVacancy(int id);

  Future<Either<Failure, JobVacancyEntity>> unpublishVacancy(int id);

  Future<Either<Failure, JobVacancyResponseEntity>> createVacancyResponse({
    required int vacancyId,
    required int resumeId,
    String? coverLetter,
  });

  Future<Either<Failure, List<JobVacancyResponseEntity>>> getVacancyResponses(int vacancyId);

  Future<Either<Failure, List<JobVacancyResponseEntity>>> getMyVacancyResponses();

  Future<Either<Failure, List<JobVacancyResponseEntity>>> getEmployerVacancyResponses();

  Future<Either<Failure, void>> deleteMyVacancyResponse(int responseId);

  Future<Either<Failure, JobVacancyResponseEntity>> updateVacancyResponseStatus({
    required int vacancyId,
    required int responseId,
    required String status,
    String? employerComment,
  });

  Future<Either<Failure, List<JobVacancyEntity>>> getFavoriteVacancies({int limit = 20, int offset = 0});

  Future<Either<Failure, void>> addVacancyToFavorites(int id);
  Future<Either<Failure, void>> removeVacancyFromFavorites(int id);

  // Профили контактов
  Future<Either<Failure, List<JobContactProfileEntity>>> getContactProfiles();

  Future<Either<Failure, JobContactProfileEntity>> createContactProfile({
    required bool isPrivate,
    String? companyName,
    String? inn,
    String? address,
    String? logoUrl,
    List<String>? additionalImageUrls,
    required String contactName,
    required String contactPosition,
    required String contactPhone,
    String? contactPhoneAlt,
    String? contactTelegram,
    String? contactWhatsapp,
    String? contactMax,
    String? contactEmail,
    String? contactSite,
  });

  Future<Either<Failure, JobContactProfileEntity>> updateContactProfile({
    required int id,
    bool? isPrivate,
    String? companyName,
    String? inn,
    String? address,
    String? logoUrl,
    List<String>? additionalImageUrls,
    String? contactName,
    String? contactPosition,
    String? contactPhone,
    String? contactPhoneAlt,
    String? contactTelegram,
    String? contactWhatsapp,
    String? contactMax,
    String? contactEmail,
    String? contactSite,
  });

  Future<Either<Failure, void>> deleteContactProfile(int id);

  Future<Either<Failure, String>> uploadContactProfileLogo(int id, XFile imageFile);

  Future<Either<Failure, List<String>>> uploadContactProfileAdditionalImages(int id, List<XFile> imageFiles);

  Future<Either<Failure, List<String>>> uploadVacancyAdditionalImages(int id, List<XFile> imageFiles);

  // Резюме
  Future<Either<Failure, List<JobResumeEntity>>> getResumes({
    int? userId,
    String? search,
    String? address,
    String? license,
    String? aircraftType,
    int limit = 20,
    int offset = 0,
  });

  Future<Either<Failure, JobResumeEntity>> getResumeById(int id);

  Future<Either<Failure, JobResumeEntity>> createResume({
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
    bool isVisibleForEmployers = true,
  });

  Future<Either<Failure, JobResumeEntity>> updateResume({
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
  });

  Future<Either<Failure, void>> deleteResume(int id);

  Future<Either<Failure, String>> uploadResumePhoto(int resumeId, XFile imageFile);

  Future<Either<Failure, List<String>>> uploadResumeAdditionalPhotos(int resumeId, List<XFile> imageFiles);

  Future<Either<Failure, List<JobResumeExperienceEntity>>> getResumeExperiences(int resumeId);

  Future<Either<Failure, JobResumeExperienceEntity>> createResumeExperience({
    required int resumeId,
    required String companyName,
    String? startDate,
    String? endDate,
    bool? isCurrent,
    String? responsibilitiesAndAchievements,
  });

  Future<Either<Failure, JobResumeExperienceEntity>> updateResumeExperience({
    required int resumeId,
    required int experienceId,
    String? companyName,
    String? startDate,
    String? endDate,
    bool? isCurrent,
    String? responsibilitiesAndAchievements,
  });

  Future<Either<Failure, void>> deleteResumeExperience({required int resumeId, required int experienceId});

  Future<Either<Failure, List<JobResumeEducationEntity>>> getResumeEducations(int resumeId);

  Future<Either<Failure, JobResumeEducationEntity>> createResumeEducation({
    required int resumeId,
    required String institution,
    String? speciality,
    int? yearStart,
    int? yearEnd,
    bool? isCurrent,
  });

  Future<Either<Failure, JobResumeEducationEntity>> updateResumeEducation({
    required int resumeId,
    required int educationId,
    String? institution,
    String? speciality,
    int? yearStart,
    int? yearEnd,
    bool? isCurrent,
  });

  Future<Either<Failure, void>> deleteResumeEducation({required int resumeId, required int educationId});

  Future<Either<Failure, List<JobResumeEntity>>> getFavoriteResumes({int limit = 20, int offset = 0});

  Future<Either<Failure, void>> addResumeToFavorites(int id);
  Future<Either<Failure, void>> removeResumeFromFavorites(int id);
}
