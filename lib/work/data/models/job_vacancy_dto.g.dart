// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_vacancy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobVacancyDto _$JobVacancyDtoFromJson(Map<String, dynamic> json) =>
    JobVacancyDto(
      id: (json['id'] as num).toInt(),
      employerId: (json['employer_id'] as num).toInt(),
      contactProfileId: (json['contact_profile_id'] as num?)?.toInt(),
      title: json['title'] as String,
      inn: json['inn'] as String?,
      companyName: json['company_name'] as String?,
      description: json['description'] as String?,
      responsibilities: json['responsibilities'] as String?,
      requirements: json['requirements'] as String?,
      conditions: json['conditions'] as String?,
      salaryFrom: (json['salary_from'] as num?)?.toInt(),
      salaryTo: (json['salary_to'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      isGross: json['is_gross'] as bool?,
      employmentType: json['employment_type'] as String?,
      schedule: json['schedule'] as String?,
      experienceLevel: json['experience_level'] as String?,
      educationLevel: json['education_level'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      airportCode: json['airport_code'] as String?,
      address: json['address'] as String?,
      employmentForm: json['employment_form'] as String?,
      workHours: json['work_hours'] as String?,
      relocationAllowed: json['relocation_allowed'] as bool?,
      businessTrips: json['business_trips'] as String?,
      aircraftCategory: json['aircraft_category'] as String?,
      requiredLicense: json['required_license'] as String?,
      minFlightHours: (json['min_flight_hours'] as num?)?.toInt(),
      requiredTypeRating: json['required_type_rating'] as String?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isPublished: json['is_published'] as bool,
      isActive: json['is_active'] as bool,
      status: json['status'] as String?,
      publishedUntil: json['published_until'] as String?,
      viewsCount: (json['views_count'] as num).toInt(),
      responsesCount: (json['responses_count'] as num).toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      employerFirstName: json['employer_first_name'] as String?,
      employerLastName: json['employer_last_name'] as String?,
      employerPhone: json['employer_phone'] as String?,
      employerTelegram: json['employer_telegram'] as String?,
      employerMax: json['employer_max'] as String?,
      isPrivate: json['is_private'] as bool?,
      contactName: json['contact_name'] as String?,
      contactPosition: json['contact_position'] as String?,
      contactPhone: json['contact_phone'] as String?,
      contactPhoneAlt: json['contact_phone_alt'] as String?,
      contactTelegram: json['contact_telegram'] as String?,
      contactWhatsapp: json['contact_whatsapp'] as String?,
      contactMax: json['contact_max'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactSite: json['contact_site'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      userHasResponded: json['user_has_responded'] as bool?,
      logoUrl: json['logo_url'] as String?,
      additionalImageUrls: json['additional_image_urls'] == null
          ? const []
          : JobVacancyDto._imageUrlsFromJson(json['additional_image_urls']),
    );
