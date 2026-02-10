// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_resume_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResumeDto _$JobResumeDtoFromJson(Map<String, dynamic> json) => JobResumeDto(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  title: json['title'] as String,
  about: json['about'] as String?,
  status: json['status'] as String,
  isVisibleForEmployers: json['is_visible_for_employers'] as bool,
  desiredSalary: (json['desired_salary'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  employmentTypes: json['employment_types'] as String?,
  schedules: json['schedules'] as String?,
  readyToRelocate: json['ready_to_relocate'] as bool?,
  readyForBusinessTrips: json['ready_for_business_trips'] as bool?,
  address: json['address'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  citizenship: (json['citizenship'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workPermit: json['work_permit'] as bool?,
  photoUrl: json['photo_url'] as String?,
  additionalPhotoUrls: (json['additional_photo_urls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  contactProfileId: (json['contact_profile_id'] as num?)?.toInt(),
  currentPosition: json['current_position'] as String?,
  currentCompany: json['current_company'] as String?,
  totalExperienceMonths: (json['total_experience_months'] as num?)?.toInt(),
  flightHoursTotal: (json['flight_hours_total'] as num?)?.toInt(),
  flightHoursPic: (json['flight_hours_pic'] as num?)?.toInt(),
  licenses: json['licenses'] as String?,
  typeRatings: json['type_ratings'] as String?,
  medicalClass: json['medical_class'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  lastActiveAt: json['last_active_at'] as String?,
  contactName: json['contact_name'] as String?,
  contactPhone: json['contact_phone'] as String?,
  contactPhoneAlt: json['contact_phone_alt'] as String?,
  contactTelegram: json['contact_telegram'] as String?,
  contactWhatsapp: json['contact_whatsapp'] as String?,
  contactMax: json['contact_max'] as String?,
  contactEmail: json['contact_email'] as String?,
  contactSite: json['contact_site'] as String?,
);
