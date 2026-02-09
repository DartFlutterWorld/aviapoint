import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'job_vacancy_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class JobVacancyDto {
  final int id;
  @JsonKey(name: 'employer_id')
  final int employerId;
  @JsonKey(name: 'contact_profile_id')
  final int? contactProfileId;
  final String title;
  final String? inn;
  @JsonKey(name: 'company_name')
  final String? companyName;
  final String? description;
  final String? responsibilities;
  final String? requirements;
  final String? conditions;
  @JsonKey(name: 'salary_from')
  final int? salaryFrom;
  @JsonKey(name: 'salary_to')
  final int? salaryTo;
  final String? currency;
  @JsonKey(name: 'is_gross')
  final bool? isGross;
  @JsonKey(name: 'employment_type')
  final String? employmentType;
  final String? schedule;
  @JsonKey(name: 'experience_level')
  final String? experienceLevel;
  @JsonKey(name: 'education_level')
  final String? educationLevel;
  final String? city;
  final String? region;
  @JsonKey(name: 'airport_code')
  final String? airportCode;
  final String? address;
  @JsonKey(name: 'employment_form')
  final String? employmentForm;
  @JsonKey(name: 'work_hours')
  final String? workHours;
  @JsonKey(name: 'relocation_allowed')
  final bool? relocationAllowed;
  @JsonKey(name: 'business_trips')
  final String? businessTrips;
  @JsonKey(name: 'aircraft_category')
  final String? aircraftCategory;
  @JsonKey(name: 'required_license')
  final String? requiredLicense;
  @JsonKey(name: 'min_flight_hours')
  final int? minFlightHours;
  @JsonKey(name: 'required_type_rating')
  final String? requiredTypeRating;
  final List<String>? skills;
  @JsonKey(name: 'is_published')
  final bool isPublished;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final String? status;
  @JsonKey(name: 'published_until')
  final String? publishedUntil;
  @JsonKey(name: 'views_count')
  final int viewsCount;
  @JsonKey(name: 'responses_count')
  final int responsesCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'employer_first_name')
  final String? employerFirstName;
  @JsonKey(name: 'employer_last_name')
  final String? employerLastName;
  @JsonKey(name: 'employer_phone')
  final String? employerPhone;
  @JsonKey(name: 'employer_telegram')
  final String? employerTelegram;
  @JsonKey(name: 'employer_max')
  final String? employerMax;
  @JsonKey(name: 'is_private')
  final bool? isPrivate;
  final String? contactName;
  @JsonKey(name: 'contact_position')
  final String? contactPosition;
  final String? contactPhone;
  final String? contactPhoneAlt;
  final String? contactTelegram;
  final String? contactWhatsapp;
  final String? contactMax;
  final String? contactEmail;
  final String? contactSite;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @JsonKey(name: 'user_has_responded')
  final bool? userHasResponded;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @JsonKey(name: 'additional_image_urls', fromJson: _imageUrlsFromJson)
  final List<String> additionalImageUrls;

  static List<String> _imageUrlsFromJson(dynamic value) {
    if (value == null) return [];
    if (value is List) return value.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
    if (value is String && value.isNotEmpty) {
      try {
        final decoded = jsonDecode(value);
        if (decoded is List) return decoded.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
      } catch (_) {}
    }
    return [];
  }

  JobVacancyDto({
    required this.id,
    required this.employerId,
    this.contactProfileId,
    required this.title,
    this.inn,
    this.companyName,
    this.description,
    this.responsibilities,
    this.requirements,
    this.conditions,
    this.salaryFrom,
    this.salaryTo,
    this.currency,
    this.isGross,
    this.employmentType,
    this.schedule,
    this.experienceLevel,
    this.educationLevel,
    this.city,
    this.region,
    this.airportCode,
    this.address,
    this.employmentForm,
    this.workHours,
    this.relocationAllowed,
    this.businessTrips,
    this.aircraftCategory,
    this.requiredLicense,
    this.minFlightHours,
    this.requiredTypeRating,
    this.skills,
    required this.isPublished,
    required this.isActive,
    this.status,
    this.publishedUntil,
    required this.viewsCount,
    required this.responsesCount,
    this.createdAt,
    this.updatedAt,
    this.employerFirstName,
    this.employerLastName,
    this.employerPhone,
    this.employerTelegram,
    this.employerMax,
    this.isPrivate,
    this.contactName,
    this.contactPosition,
    this.contactPhone,
    this.contactPhoneAlt,
    this.contactTelegram,
    this.contactWhatsapp,
    this.contactMax,
    this.contactEmail,
    this.contactSite,
    this.isFavorite,
    this.userHasResponded,
    this.logoUrl,
    this.additionalImageUrls = const [],
  });

  factory JobVacancyDto.fromJson(Map<String, dynamic> json) => _$JobVacancyDtoFromJson(json);
}
