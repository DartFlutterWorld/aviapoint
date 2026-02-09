import 'package:aviapoint/blog/data/models/upload_image_response_dto.dart';
import 'package:aviapoint/market/data/models/upload_images_response_dto.dart';
import 'package:aviapoint/work/data/models/job_resume_dto.dart';
import 'package:aviapoint/work/data/models/job_resume_experience_dto.dart';
import 'package:aviapoint/work/data/models/job_resume_education_dto.dart';
import 'package:aviapoint/work/data/models/job_contact_profile_dto.dart';
import 'package:aviapoint/work/data/models/job_vacancy_dto.dart';
import 'package:aviapoint/work/data/models/job_vacancy_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'jobs_service.g.dart';

@RestApi()
abstract class JobsService {
  factory JobsService(Dio dio) = _JobsService;

  // Вакансии
  @GET('/api/jobs/vacancies')
  Future<List<JobVacancyDto>> getVacancies({
    @Query('employer_id') int? employerId,
    @Query('search') String? search,
    @Query('city') String? city,
    @Query('experience_level') String? experienceLevel,
    @Query('employment_type') String? employmentType,
    @Query('schedule') String? schedule,
    @Query('salary_from') int? salaryFrom,
    @Query('salary_to') int? salaryTo,
    @Query('include_inactive') bool? includeInactive,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('/api/jobs/vacancies/{id}')
  Future<JobVacancyDto> getVacancyById(@Path('id') int id);

  @POST('/api/jobs/vacancies')
  Future<JobVacancyDto> createVacancy(@Body() Map<String, dynamic> body);

  @PUT('/api/jobs/vacancies/{id}')
  Future<JobVacancyDto> updateVacancy(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/api/jobs/vacancies/{id}')
  Future<void> deleteVacancy(@Path('id') int id);

  @POST('/api/jobs/vacancies/{id}/publish')
  Future<JobVacancyDto> publishVacancy(@Path('id') int id);

  @POST('/api/jobs/vacancies/{id}/unpublish')
  Future<JobVacancyDto> unpublishVacancy(@Path('id') int id);

  @POST('/api/jobs/vacancies/{id}/responses')
  Future<JobVacancyResponseDto> createVacancyResponse(@Path('id') int vacancyId, @Body() Map<String, dynamic> body);

  @PUT('/api/jobs/vacancies/{id}/responses/{responseId}')
  Future<JobVacancyResponseDto> updateVacancyResponse(
    @Path('id') int vacancyId,
    @Path('responseId') int responseId,
    @Body() Map<String, dynamic> body,
  );

  @GET('/api/jobs/vacancies/{id}/responses')
  Future<List<JobVacancyResponseDto>> getVacancyResponses(@Path('id') int vacancyId);

  @GET('/api/jobs/my-vacancy-responses')
  Future<List<JobVacancyResponseDto>> getMyVacancyResponses();

  @GET('/api/jobs/employer-vacancy-responses')
  Future<List<JobVacancyResponseDto>> getEmployerVacancyResponses();

  @DELETE('/api/jobs/my-vacancy-responses/{responseId}')
  Future<void> deleteMyVacancyResponse(@Path('responseId') int responseId);

  @GET('/api/jobs/vacancies/favorites')
  Future<List<JobVacancyDto>> getFavoriteVacancies({@Query('limit') int? limit, @Query('offset') int? offset});

  @POST('/api/jobs/vacancies/{id}/favorite')
  Future<void> addVacancyToFavorites(@Path('id') int id);

  @DELETE('/api/jobs/vacancies/{id}/favorite')
  Future<void> removeVacancyFromFavorites(@Path('id') int id);

  // Профили контактов для вакансий
  @GET('/api/jobs/contact-profiles')
  Future<List<JobContactProfileDto>> getContactProfiles();

  @POST('/api/jobs/contact-profiles')
  Future<JobContactProfileDto> createContactProfile(@Body() Map<String, dynamic> body);

  @PUT('/api/jobs/contact-profiles/{id}')
  Future<JobContactProfileDto> updateContactProfile(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/api/jobs/contact-profiles/{id}')
  Future<void> deleteContactProfile(@Path('id') int id);

  @POST('/api/jobs/contact-profiles/{id}/logo')
  @MultiPart()
  Future<UploadImageResponseDto> uploadContactProfileLogo(
    @Path('id') int id,
    @Part(name: 'image') MultipartFile image,
  );

  @POST('/api/jobs/contact-profiles/{id}/additional-images')
  @MultiPart()
  Future<UploadImagesResponseDto> uploadContactProfileAdditionalImages(
    @Path('id') int id,
    @Part(name: 'images') List<MultipartFile> images,
  );

  // Резюме
  @GET('/api/jobs/resumes')
  Future<List<JobResumeDto>> getResumes({
    @Query('user_id') int? userId,
    @Query('search') String? search,
    @Query('address') String? address,
    @Query('license') String? license,
    @Query('aircraft_type') String? aircraftType,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('/api/jobs/resumes/{id}')
  Future<JobResumeDto> getResumeById(@Path('id') int id);

  @POST('/api/jobs/resumes')
  Future<JobResumeDto> createResume(@Body() Map<String, dynamic> body);

  @PUT('/api/jobs/resumes/{id}')
  Future<JobResumeDto> updateResume(@Path('id') int id, @Body() Map<String, dynamic> body);

  @POST('/api/jobs/resumes/{id}/photo')
  @MultiPart()
  Future<UploadImageResponseDto> uploadResumePhoto(
    @Path('id') int id,
    @Part(name: 'image') MultipartFile image,
  );

  @POST('/api/jobs/resumes/{id}/additional-photos')
  @MultiPart()
  Future<UploadImagesResponseDto> uploadResumeAdditionalPhotos(
    @Path('id') int id,
    @Part(name: 'images') List<MultipartFile> images,
  );

  @DELETE('/api/jobs/resumes/{id}')
  Future<void> deleteResume(@Path('id') int id);

  @GET('/api/jobs/resumes/{id}/experiences')
  Future<List<JobResumeExperienceDto>> getResumeExperiences(@Path('id') int resumeId);

  @POST('/api/jobs/resumes/{id}/experiences')
  Future<JobResumeExperienceDto> createResumeExperience(
    @Path('id') int resumeId,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/api/jobs/resumes/{id}/experiences/{experienceId}')
  Future<JobResumeExperienceDto> updateResumeExperience(
    @Path('id') int resumeId,
    @Path('experienceId') int experienceId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/api/jobs/resumes/{id}/experiences/{experienceId}')
  Future<void> deleteResumeExperience(
    @Path('id') int resumeId,
    @Path('experienceId') int experienceId,
  );

  @GET('/api/jobs/resumes/{id}/educations')
  Future<List<JobResumeEducationDto>> getResumeEducations(@Path('id') int resumeId);

  @POST('/api/jobs/resumes/{id}/educations')
  Future<JobResumeEducationDto> createResumeEducation(
    @Path('id') int resumeId,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/api/jobs/resumes/{id}/educations/{educationId}')
  Future<JobResumeEducationDto> updateResumeEducation(
    @Path('id') int resumeId,
    @Path('educationId') int educationId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/api/jobs/resumes/{id}/educations/{educationId}')
  Future<void> deleteResumeEducation(
    @Path('id') int resumeId,
    @Path('educationId') int educationId,
  );

  @GET('/api/jobs/resumes/favorites')
  Future<List<JobResumeDto>> getFavoriteResumes({@Query('limit') int? limit, @Query('offset') int? offset});

  @POST('/api/jobs/resumes/{id}/favorite')
  Future<void> addResumeToFavorites(@Path('id') int id);

  @DELETE('/api/jobs/resumes/{id}/favorite')
  Future<void> removeResumeFromFavorites(@Path('id') int id);
}
