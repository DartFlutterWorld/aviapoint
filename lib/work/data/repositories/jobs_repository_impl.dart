import 'dart:io';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/data/datasources/jobs_service.dart';
import 'package:aviapoint/work/data/models/job_contact_profile_dto.dart';
import 'package:aviapoint/work/data/models/job_resume_dto.dart';
import 'package:aviapoint/work/data/models/job_resume_experience_dto.dart';
import 'package:aviapoint/work/data/models/job_resume_education_dto.dart';
import 'package:aviapoint/work/data/models/job_vacancy_dto.dart';
import 'package:aviapoint/work/data/models/job_vacancy_response_dto.dart';
import 'package:aviapoint/work/domain/entities/job_contact_profile_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_experience_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_education_entity.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class JobsRepositoryImpl implements JobsRepository {
  final JobsService jobsService;

  JobsRepositoryImpl({required this.jobsService});

  @override
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
  }) async {
    try {
      final dtos = await jobsService.getVacancies(
        employerId: employerId,
        search: search,
        city: city,
        experienceLevel: experienceLevel,
        employmentType: employmentType,
        schedule: schedule,
        salaryFrom: salaryFrom,
        salaryTo: salaryTo,
        includeInactive: includeInactive,
        limit: limit,
        offset: offset,
      );
      final entities = dtos.map(_mapVacancy).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobVacancyEntity>> getVacancyById(int id) async {
    try {
      final dto = await jobsService.getVacancyById(id);
      return Right(_mapVacancy(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
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
  }) async {
    try {
      final body = <String, dynamic>{
        'title': title,
        'contact_profile_id': contactProfileId,
        'is_published': isPublished,
        if (description != null) 'description': description,
        if (responsibilities != null) 'responsibilities': responsibilities,
        if (requirements != null) 'requirements': requirements,
        if (conditions != null) 'conditions': conditions,
        if (salaryFrom != null) 'salary_from': salaryFrom,
        if (salaryTo != null) 'salary_to': salaryTo,
        if (currency != null) 'currency': currency,
        if (isGross != null) 'is_gross': isGross,
        if (employmentType != null) 'employment_type': employmentType,
        if (schedule != null) 'schedule': schedule,
        if (experienceLevel != null) 'experience_level': experienceLevel,
        if (educationLevel != null) 'education_level': educationLevel,
        if (city != null) 'city': city,
        if (region != null) 'region': region,
        if (airportCode != null) 'airport_code': airportCode,
        if (employmentForm != null) 'employment_form': employmentForm,
        if (workHours != null) 'work_hours': workHours,
        if (relocationAllowed != null) 'relocation_allowed': relocationAllowed,
        if (businessTrips != null) 'business_trips': businessTrips,
        if (aircraftCategory != null) 'aircraft_category': aircraftCategory,
        if (requiredLicense != null) 'required_license': requiredLicense,
        if (minFlightHours != null) 'min_flight_hours': minFlightHours,
        if (requiredTypeRating != null) 'required_type_rating': requiredTypeRating,
        if (skills != null) 'skills': skills,
      };

      final dto = await jobsService.createVacancy(body);
      return Right(_mapVacancy(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
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
  }) async {
    try {
      final body = <String, dynamic>{
        if (title != null) 'title': title,
        if (contactProfileId != null) 'contact_profile_id': contactProfileId,
        if (additionalImageUrls != null) 'additional_image_urls': additionalImageUrls,
        if (description != null) 'description': description,
        if (responsibilities != null) 'responsibilities': responsibilities,
        if (requirements != null) 'requirements': requirements,
        if (conditions != null) 'conditions': conditions,
        if (salaryFrom != null) 'salary_from': salaryFrom,
        if (salaryTo != null) 'salary_to': salaryTo,
        if (currency != null) 'currency': currency,
        if (isGross != null) 'is_gross': isGross,
        if (employmentType != null) 'employment_type': employmentType,
        if (schedule != null) 'schedule': schedule,
        if (experienceLevel != null) 'experience_level': experienceLevel,
        if (educationLevel != null) 'education_level': educationLevel,
        if (city != null) 'city': city,
        if (region != null) 'region': region,
        if (airportCode != null) 'airport_code': airportCode,
        if (employmentForm != null) 'employment_form': employmentForm,
        if (workHours != null) 'work_hours': workHours,
        if (relocationAllowed != null) 'relocation_allowed': relocationAllowed,
        if (businessTrips != null) 'business_trips': businessTrips,
        if (aircraftCategory != null) 'aircraft_category': aircraftCategory,
        if (requiredLicense != null) 'required_license': requiredLicense,
        if (minFlightHours != null) 'min_flight_hours': minFlightHours,
        if (requiredTypeRating != null) 'required_type_rating': requiredTypeRating,
        if (isPublished != null) 'is_published': isPublished,
        if (isActive != null) 'is_active': isActive,
        if (skills != null) 'skills': skills,
      };

      final dto = await jobsService.updateVacancy(id, body);
      return Right(_mapVacancy(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteVacancy(int id) async {
    try {
      await jobsService.deleteVacancy(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobVacancyEntity>> publishVacancy(int id) async {
    try {
      final dto = await jobsService.publishVacancy(id);
      return Right(_mapVacancy(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobVacancyEntity>> unpublishVacancy(int id) async {
    try {
      final dto = await jobsService.unpublishVacancy(id);
      return Right(_mapVacancy(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobResumeEntity>>> getResumes({
    int? userId,
    String? search,
    String? address,
    String? license,
    String? aircraftType,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final dtos = await jobsService.getResumes(
        userId: userId,
        search: search,
        address: address,
        license: license,
        aircraftType: aircraftType,
        limit: limit,
        offset: offset,
      );
      final entities = dtos.map(_mapResume).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobResumeEntity>> getResumeById(int id) async {
    try {
      final dto = await jobsService.getResumeById(id);
      return Right(_mapResume(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobVacancyResponseEntity>> createVacancyResponse({
    required int vacancyId,
    required int resumeId,
    String? coverLetter,
  }) async {
    try {
      final body = <String, dynamic>{
        'resume_id': resumeId,
        if (coverLetter != null && coverLetter.isNotEmpty) 'cover_letter': coverLetter,
      };
      final dto = await jobsService.createVacancyResponse(vacancyId, body);
      return Right(_mapVacancyResponse(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobVacancyResponseEntity>>> getVacancyResponses(int vacancyId) async {
    try {
      final dtos = await jobsService.getVacancyResponses(vacancyId);
      final entities = dtos.map(_mapVacancyResponse).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobVacancyResponseEntity>>> getMyVacancyResponses() async {
    try {
      final dtos = await jobsService.getMyVacancyResponses();
      final entities = dtos.map(_mapVacancyResponse).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobVacancyResponseEntity>>> getEmployerVacancyResponses() async {
    try {
      final dtos = await jobsService.getEmployerVacancyResponses();
      final entities = dtos.map(_mapVacancyResponse).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMyVacancyResponse(int responseId) async {
    try {
      await jobsService.deleteMyVacancyResponse(responseId);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobVacancyResponseEntity>> updateVacancyResponseStatus({
    required int vacancyId,
    required int responseId,
    required String status,
    String? employerComment,
  }) async {
    try {
      final body = <String, dynamic>{'status': status};
      if (employerComment != null && employerComment.trim().isNotEmpty) {
        body['employer_comment'] = employerComment.trim();
      }
      final dto = await jobsService.updateVacancyResponse(vacancyId, responseId, body);
      return Right(_mapVacancyResponse(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobVacancyEntity>>> getFavoriteVacancies({int limit = 20, int offset = 0}) async {
    try {
      final dtos = await jobsService.getFavoriteVacancies(limit: limit, offset: offset);
      final entities = dtos.map(_mapVacancy).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> addVacancyToFavorites(int id) async {
    try {
      await jobsService.addVacancyToFavorites(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> removeVacancyFromFavorites(int id) async {
    try {
      await jobsService.removeVacancyFromFavorites(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobContactProfileEntity>>> getContactProfiles() async {
    try {
      final dtos = await jobsService.getContactProfiles();
      final entities = dtos.map(_mapContactProfile).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
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
  }) async {
    try {
      final body = <String, dynamic>{
        'is_private': isPrivate,
        if (companyName != null) 'company_name': companyName,
        if (inn != null) 'inn': inn,
        if (address != null) 'address': address,
        if (logoUrl != null) 'logo_url': logoUrl,
        if (additionalImageUrls != null) 'additional_image_urls': additionalImageUrls,
        'contact_name': contactName,
        'contact_position': contactPosition,
        'contact_phone': contactPhone,
        if (contactPhoneAlt != null) 'contact_phone_alt': contactPhoneAlt,
        if (contactTelegram != null) 'contact_telegram': contactTelegram,
        if (contactWhatsapp != null) 'contact_whatsapp': contactWhatsapp,
        if (contactMax != null) 'contact_max': contactMax,
        if (contactEmail != null) 'contact_email': contactEmail,
        if (contactSite != null) 'contact_site': contactSite,
      };
      final dto = await jobsService.createContactProfile(body);
      return Right(_mapContactProfile(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
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
  }) async {
    try {
      final body = <String, dynamic>{
        if (isPrivate != null) 'is_private': isPrivate,
        if (companyName != null) 'company_name': companyName,
        if (inn != null) 'inn': inn,
        if (address != null) 'address': address,
        if (logoUrl != null) 'logo_url': logoUrl,
        if (additionalImageUrls != null) 'additional_image_urls': additionalImageUrls,
        if (contactName != null) 'contact_name': contactName,
        if (contactPosition != null) 'contact_position': contactPosition,
        if (contactPhone != null) 'contact_phone': contactPhone,
        if (contactPhoneAlt != null) 'contact_phone_alt': contactPhoneAlt,
        if (contactTelegram != null) 'contact_telegram': contactTelegram,
        if (contactWhatsapp != null) 'contact_whatsapp': contactWhatsapp,
        if (contactMax != null) 'contact_max': contactMax,
        if (contactEmail != null) 'contact_email': contactEmail,
        if (contactSite != null) 'contact_site': contactSite,
      };
      final dto = await jobsService.updateContactProfile(id, body);
      return Right(_mapContactProfile(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteContactProfile(int id) async {
    try {
      await jobsService.deleteContactProfile(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> uploadContactProfileLogo(int id, XFile imageFile) async {
    try {
      MultipartFile multipartFile;
      if (kIsWeb) {
        final bytes = await imageFile.readAsBytes();
        multipartFile = MultipartFile.fromBytes(bytes, filename: imageFile.name);
      } else {
        final file = File(imageFile.path);
        multipartFile = await MultipartFile.fromFile(file.path, filename: imageFile.name);
      }

      final response = await jobsService.uploadContactProfileLogo(id, multipartFile);
      if (response.url.isEmpty) {
        return Left(ServerFailure(statusCode: null, message: 'Не удалось получить URL логотипа'));
      }
      return Right(response.url);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return Left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(statusCode: null, message: 'Ошибка при загрузке логотипа: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadContactProfileAdditionalImages(int id, List<XFile> imageFiles) async {
    try {
      final multipartFiles = await Future.wait(
        imageFiles.map((imageFile) async {
          final filename = imageFile.name.isNotEmpty ? imageFile.name : 'file.jpg';
          final contentType = _contentTypeForFile(filename);
          if (kIsWeb) {
            final bytes = await imageFile.readAsBytes();
            return MultipartFile.fromBytes(bytes, filename: filename, contentType: contentType);
          } else {
            final file = File(imageFile.path);
            return await MultipartFile.fromFile(file.path, filename: filename, contentType: contentType);
          }
        }),
      );

      final response = await jobsService.uploadContactProfileAdditionalImages(id, multipartFiles);
      if (response.urls.isEmpty) {
        return Left(ServerFailure(statusCode: null, message: 'Не удалось получить URL дополнительных фото'));
      }
      return Right(response.urls);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return Left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(statusCode: null, message: 'Ошибка при загрузке фото: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadVacancyAdditionalImages(int id, List<XFile> imageFiles) async {
    try {
      final multipartFiles = await Future.wait(
        imageFiles.map((imageFile) async {
          final filename = imageFile.name.isNotEmpty ? imageFile.name : 'file.jpg';
          final contentType = _contentTypeForFile(filename);
          if (kIsWeb) {
            final bytes = await imageFile.readAsBytes();
            return MultipartFile.fromBytes(bytes, filename: filename, contentType: contentType);
          } else {
            final file = File(imageFile.path);
            return await MultipartFile.fromFile(file.path, filename: filename, contentType: contentType);
          }
        }),
      );

      final response = await jobsService.uploadVacancyAdditionalImages(id, multipartFiles);
      if (response.urls.isEmpty) {
        return Left(ServerFailure(statusCode: null, message: 'Не удалось получить URL файлов'));
      }
      return Right(response.urls);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return Left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(statusCode: null, message: 'Ошибка при загрузке файлов: ${e.toString()}'));
    }
  }

  @override
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
  }) async {
    try {
      final body = <String, dynamic>{
        'title': title,
        'is_visible_for_employers': isVisibleForEmployers,
        if (about != null) 'about': about,
        if (desiredSalary != null) 'desired_salary': desiredSalary,
        if (currency != null) 'currency': currency,
        if (employmentTypes != null) 'employment_types': employmentTypes,
        if (schedules != null) 'schedules': schedules,
        if (readyToRelocate != null) 'ready_to_relocate': readyToRelocate,
        if (readyForBusinessTrips != null) 'ready_for_business_trips': readyForBusinessTrips,
        if (address != null) 'address': address,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (citizenship != null) 'citizenship': citizenship,
        if (workPermit != null) 'work_permit': workPermit,
        if (photoUrl != null) 'photo_url': photoUrl,
        if (additionalPhotoUrls != null) 'additional_photo_urls': additionalPhotoUrls,
        if (contactProfileId != null) 'contact_profile_id': contactProfileId,
        if (currentPosition != null) 'current_position': currentPosition,
        if (currentCompany != null) 'current_company': currentCompany,
        if (totalExperienceMonths != null) 'total_experience_months': totalExperienceMonths,
        if (flightHoursTotal != null) 'flight_hours_total': flightHoursTotal,
        if (flightHoursPic != null) 'flight_hours_pic': flightHoursPic,
        if (licenses != null) 'licenses': licenses,
        if (typeRatings != null) 'type_ratings': typeRatings,
        if (medicalClass != null) 'medical_class': medicalClass,
      };

      final dto = await jobsService.createResume(body);
      return Right(_mapResume(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
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
  }) async {
    try {
      final body = <String, dynamic>{
        if (title != null) 'title': title,
        if (about != null) 'about': about,
        if (status != null) 'status': status,
        if (isVisibleForEmployers != null) 'is_visible_for_employers': isVisibleForEmployers,
        if (desiredSalary != null) 'desired_salary': desiredSalary,
        if (currency != null) 'currency': currency,
        if (employmentTypes != null) 'employment_types': employmentTypes,
        if (schedules != null) 'schedules': schedules,
        if (readyToRelocate != null) 'ready_to_relocate': readyToRelocate,
        if (readyForBusinessTrips != null) 'ready_for_business_trips': readyForBusinessTrips,
        if (address != null) 'address': address,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (citizenship != null) 'citizenship': citizenship,
        if (workPermit != null) 'work_permit': workPermit,
        if (photoUrl != null) 'photo_url': photoUrl,
        if (additionalPhotoUrls != null) 'additional_photo_urls': additionalPhotoUrls,
        if (clearContactProfileId == true || contactProfileId != null)
          'contact_profile_id': clearContactProfileId == true ? null : contactProfileId,
        if (currentPosition != null) 'current_position': currentPosition,
        if (currentCompany != null) 'current_company': currentCompany,
        if (totalExperienceMonths != null) 'total_experience_months': totalExperienceMonths,
        if (flightHoursTotal != null) 'flight_hours_total': flightHoursTotal,
        if (flightHoursPic != null) 'flight_hours_pic': flightHoursPic,
        if (licenses != null) 'licenses': licenses,
        if (typeRatings != null) 'type_ratings': typeRatings,
        if (medicalClass != null) 'medical_class': medicalClass,
      };

      final dto = await jobsService.updateResume(id, body);
      return Right(_mapResume(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteResume(int id) async {
    try {
      await jobsService.deleteResume(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> uploadResumePhoto(int resumeId, XFile imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final filename = imageFile.name.isNotEmpty ? imageFile.name : 'photo.jpg';
      final multipartFile = MultipartFile.fromBytes(bytes, filename: filename);

      final response = await jobsService.uploadResumePhoto(resumeId, multipartFile);
      if (response.url.isEmpty) {
        return Left(ServerFailure(statusCode: null, message: 'Не удалось получить URL фото'));
      }
      return Right(response.url);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return Left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(statusCode: null, message: 'Ошибка при загрузке фото: ${e.toString()}'));
    }
  }

  static MediaType? _contentTypeForFile(String filename) {
    final ext = filename.toLowerCase().split('.').last;
    switch (ext) {
      case 'pdf':
        return MediaType('application', 'pdf');
      case 'doc':
        return MediaType('application', 'msword');
      case 'docx':
        return MediaType('application', 'vnd.openxmlformats-officedocument.wordprocessingml.document');
      case 'xls':
        return MediaType('application', 'vnd.ms-excel');
      case 'xlsx':
        return MediaType('application', 'vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      case 'jpg':
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'png':
        return MediaType('image', 'png');
      case 'gif':
        return MediaType('image', 'gif');
      case 'webp':
        return MediaType('image', 'webp');
      default:
        return null;
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadResumeAdditionalPhotos(int resumeId, List<XFile> imageFiles) async {
    try {
      final multipartFiles = await Future.wait(
        imageFiles.map((imageFile) async {
          final bytes = await imageFile.readAsBytes();
          final filename = imageFile.name.isNotEmpty ? imageFile.name : 'photo.jpg';
          final contentType = _contentTypeForFile(filename);
          return MultipartFile.fromBytes(bytes, filename: filename, contentType: contentType);
        }),
      );

      final response = await jobsService.uploadResumeAdditionalPhotos(resumeId, multipartFiles);
      if (response.urls.isEmpty) {
        return Left(ServerFailure(statusCode: null, message: 'Не удалось получить URL дополнительных фото'));
      }
      return Right(response.urls);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return Left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(statusCode: null, message: 'Ошибка при загрузке фото: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<JobResumeExperienceEntity>>> getResumeExperiences(int resumeId) async {
    try {
      final dtos = await jobsService.getResumeExperiences(resumeId);
      return Right(dtos.map(_mapResumeExperience).toList());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobResumeExperienceEntity>> createResumeExperience({
    required int resumeId,
    required String companyName,
    String? startDate,
    String? endDate,
    bool? isCurrent,
    String? responsibilitiesAndAchievements,
  }) async {
    try {
      final body = <String, dynamic>{
        'company_name': companyName,
        if (startDate != null) 'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        if (isCurrent != null) 'is_current': isCurrent,
        if (responsibilitiesAndAchievements != null)
          'responsibilities_and_achievements': responsibilitiesAndAchievements,
      };
      final dto = await jobsService.createResumeExperience(resumeId, body);
      return Right(_mapResumeExperience(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobResumeExperienceEntity>> updateResumeExperience({
    required int resumeId,
    required int experienceId,
    String? companyName,
    String? startDate,
    String? endDate,
    bool? isCurrent,
    String? responsibilitiesAndAchievements,
  }) async {
    try {
      final body = <String, dynamic>{
        if (companyName != null) 'company_name': companyName,
        if (startDate != null) 'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        if (isCurrent != null) 'is_current': isCurrent,
        if (responsibilitiesAndAchievements != null)
          'responsibilities_and_achievements': responsibilitiesAndAchievements,
      };
      final dto = await jobsService.updateResumeExperience(resumeId, experienceId, body);
      return Right(_mapResumeExperience(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteResumeExperience({required int resumeId, required int experienceId}) async {
    try {
      await jobsService.deleteResumeExperience(resumeId, experienceId);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobResumeEducationEntity>>> getResumeEducations(int resumeId) async {
    try {
      final dtos = await jobsService.getResumeEducations(resumeId);
      return Right(dtos.map(_mapResumeEducation).toList());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobResumeEducationEntity>> createResumeEducation({
    required int resumeId,
    required String institution,
    String? speciality,
    int? yearStart,
    int? yearEnd,
    bool? isCurrent,
  }) async {
    try {
      final body = <String, dynamic>{
        'institution': institution,
        if (speciality != null) 'speciality': speciality,
        if (yearStart != null) 'year_start': yearStart,
        if (yearEnd != null) 'year_end': yearEnd,
        if (isCurrent != null) 'is_current': isCurrent,
      };
      final dto = await jobsService.createResumeEducation(resumeId, body);
      return Right(_mapResumeEducation(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, JobResumeEducationEntity>> updateResumeEducation({
    required int resumeId,
    required int educationId,
    String? institution,
    String? speciality,
    int? yearStart,
    int? yearEnd,
    bool? isCurrent,
  }) async {
    try {
      final body = <String, dynamic>{
        if (institution != null) 'institution': institution,
        if (speciality != null) 'speciality': speciality,
        if (yearStart != null) 'year_start': yearStart,
        if (yearEnd != null) 'year_end': yearEnd,
        if (isCurrent != null) 'is_current': isCurrent,
      };
      final dto = await jobsService.updateResumeEducation(resumeId, educationId, body);
      return Right(_mapResumeEducation(dto));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteResumeEducation({required int resumeId, required int educationId}) async {
    try {
      await jobsService.deleteResumeEducation(resumeId, educationId);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<JobResumeEntity>>> getFavoriteResumes({int limit = 20, int offset = 0}) async {
    try {
      final dtos = await jobsService.getFavoriteResumes(limit: limit, offset: offset);
      final entities = dtos.map(_mapResume).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> addResumeToFavorites(int id) async {
    try {
      await jobsService.addResumeToFavorites(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> removeResumeFromFavorites(int id) async {
    try {
      await jobsService.removeResumeFromFavorites(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  JobVacancyEntity _mapVacancy(JobVacancyDto dto) {
    return JobVacancyEntity(
      id: dto.id,
      employerId: dto.employerId,
      contactProfileId: dto.contactProfileId,
      title: dto.title,
      inn: dto.inn,
      companyName: dto.companyName,
      description: dto.description,
      responsibilities: dto.responsibilities,
      requirements: dto.requirements,
      conditions: dto.conditions,
      salaryFrom: dto.salaryFrom,
      salaryTo: dto.salaryTo,
      currency: dto.currency,
      isGross: dto.isGross,
      employmentType: dto.employmentType,
      schedule: dto.schedule,
      experienceLevel: dto.experienceLevel,
      educationLevel: dto.educationLevel,
      city: dto.city,
      region: dto.region,
      airportCode: dto.airportCode,
      address: dto.address,
      employmentForm: dto.employmentForm,
      workHours: dto.workHours,
      relocationAllowed: dto.relocationAllowed,
      businessTrips: dto.businessTrips,
      aircraftCategory: dto.aircraftCategory,
      requiredLicense: dto.requiredLicense,
      minFlightHours: dto.minFlightHours,
      requiredTypeRating: dto.requiredTypeRating,
      skills: dto.skills,
      isPublished: dto.isPublished,
      isActive: dto.isActive,
      status: dto.status,
      publishedUntil: dto.publishedUntil,
      viewsCount: dto.viewsCount,
      responsesCount: dto.responsesCount,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      employerFirstName: dto.employerFirstName,
      employerLastName: dto.employerLastName,
      employerPhone: dto.employerPhone,
      employerTelegram: dto.employerTelegram,
      employerMax: dto.employerMax,
      isPrivate: dto.isPrivate,
      contactName: dto.contactName,
      contactPosition: dto.contactPosition,
      contactPhone: dto.contactPhone,
      contactPhoneAlt: dto.contactPhoneAlt,
      contactTelegram: dto.contactTelegram,
      contactWhatsapp: dto.contactWhatsapp,
      contactMax: dto.contactMax,
      contactEmail: dto.contactEmail,
      contactSite: dto.contactSite,
      isFavorite: dto.isFavorite,
      userHasResponded: dto.userHasResponded,
      logoUrl: dto.logoUrl,
      additionalImageUrls: dto.additionalImageUrls,
    );
  }

  JobResumeEntity _mapResume(JobResumeDto dto) {
    return JobResumeEntity(
      id: dto.id,
      userId: dto.userId,
      title: dto.title,
      about: dto.about,
      status: dto.status,
      isVisibleForEmployers: dto.isVisibleForEmployers,
      desiredSalary: dto.desiredSalary,
      currency: dto.currency,
      employmentTypes: dto.employmentTypes,
      schedules: dto.schedules,
      readyToRelocate: dto.readyToRelocate,
      readyForBusinessTrips: dto.readyForBusinessTrips,
      address: dto.address,
      dateOfBirth: dto.dateOfBirth,
      citizenship: dto.citizenship,
      workPermit: dto.workPermit,
      photoUrl: dto.photoUrl,
      additionalPhotoUrls: dto.additionalPhotoUrls,
      contactProfileId: dto.contactProfileId,
      currentPosition: dto.currentPosition,
      currentCompany: dto.currentCompany,
      totalExperienceMonths: dto.totalExperienceMonths,
      flightHoursTotal: dto.flightHoursTotal,
      flightHoursPic: dto.flightHoursPic,
      licenses: dto.licenses,
      typeRatings: dto.typeRatings,
      medicalClass: dto.medicalClass,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      lastActiveAt: dto.lastActiveAt,
      contactName: dto.contactName,
      contactPhone: dto.contactPhone,
      contactPhoneAlt: dto.contactPhoneAlt,
      contactTelegram: dto.contactTelegram,
      contactWhatsapp: dto.contactWhatsapp,
      contactMax: dto.contactMax,
      contactEmail: dto.contactEmail,
      contactSite: dto.contactSite,
    );
  }

  JobResumeExperienceEntity _mapResumeExperience(JobResumeExperienceDto dto) {
    return JobResumeExperienceEntity(
      id: dto.id,
      resumeId: dto.resumeId,
      companyName: dto.companyName,
      startDate: dto.startDate,
      endDate: dto.endDate,
      isCurrent: dto.isCurrent,
      responsibilitiesAndAchievements: dto.responsibilitiesAndAchievements,
    );
  }

  JobResumeEducationEntity _mapResumeEducation(JobResumeEducationDto dto) {
    return JobResumeEducationEntity(
      id: dto.id,
      resumeId: dto.resumeId,
      institution: dto.institution,
      speciality: dto.speciality,
      yearStart: dto.yearStart,
      yearEnd: dto.yearEnd,
      isCurrent: dto.isCurrent,
    );
  }

  JobVacancyResponseEntity _mapVacancyResponse(JobVacancyResponseDto dto) {
    return JobVacancyResponseEntity(
      id: dto.id,
      vacancyId: dto.vacancyId,
      vacancyTitle: dto.vacancyTitle,
      resumeId: dto.resumeId,
      candidateId: dto.candidateId,
      status: dto.status,
      coverLetter: dto.coverLetter,
      employerComment: dto.employerComment,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      candidateFirstName: dto.candidateFirstName,
      candidateLastName: dto.candidateLastName,
      candidatePhone: dto.candidatePhone,
      candidatePhoneAlt: dto.candidatePhoneAlt,
      candidateTelegram: dto.candidateTelegram,
      candidateWhatsapp: dto.candidateWhatsapp,
      candidateMax: dto.candidateMax,
      candidateEmail: dto.candidateEmail,
      employerCompanyName: dto.employerCompanyName,
      employerLogoUrl: dto.employerLogoUrl,
      employerContactIsPrivate: dto.employerContactIsPrivate,
      employerFirstName: dto.employerFirstName,
      employerLastName: dto.employerLastName,
    );
  }

  JobContactProfileEntity _mapContactProfile(JobContactProfileDto dto) {
    return JobContactProfileEntity(
      id: dto.id,
      ownerId: dto.ownerId,
      isPrivate: dto.isPrivate,
      companyName: dto.companyName,
      inn: dto.inn,
      address: dto.address,
      logoUrl: dto.logoUrl,
      additionalImageUrls: dto.additionalImageUrls,
      contactName: dto.contactName,
      contactPosition: dto.contactPosition,
      contactPhone: dto.contactPhone,
      contactPhoneAlt: dto.contactPhoneAlt,
      contactTelegram: dto.contactTelegram,
      contactWhatsapp: dto.contactWhatsapp,
      contactMax: dto.contactMax,
      contactEmail: dto.contactEmail,
      contactSite: dto.contactSite,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
