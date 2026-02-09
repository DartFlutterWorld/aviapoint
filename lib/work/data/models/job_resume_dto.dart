import 'package:json_annotation/json_annotation.dart';

part 'job_resume_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class JobResumeDto {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String title;
  final String? about;
  final String status;
  @JsonKey(name: 'is_visible_for_employers')
  final bool isVisibleForEmployers;
  @JsonKey(name: 'desired_salary')
  final int? desiredSalary;
  final String? currency;
  @JsonKey(name: 'employment_types')
  final String? employmentTypes;
  final String? schedules;
  @JsonKey(name: 'ready_to_relocate')
  final bool? readyToRelocate;
  @JsonKey(name: 'ready_for_business_trips')
  final bool? readyForBusinessTrips;
  final String? address;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  final List<String>? citizenship;
  @JsonKey(name: 'work_permit')
  final bool? workPermit;
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @JsonKey(name: 'additional_photo_urls')
  final List<String>? additionalPhotoUrls;
  @JsonKey(name: 'contact_profile_id')
  final int? contactProfileId;
  @JsonKey(name: 'current_position')
  final String? currentPosition;
  @JsonKey(name: 'current_company')
  final String? currentCompany;
  @JsonKey(name: 'total_experience_months')
  final int? totalExperienceMonths;
  @JsonKey(name: 'flight_hours_total')
  final int? flightHoursTotal;
  @JsonKey(name: 'flight_hours_pic')
  final int? flightHoursPic;
  final String? licenses;
  @JsonKey(name: 'type_ratings')
  final String? typeRatings;
  @JsonKey(name: 'medical_class')
  final String? medicalClass;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'last_active_at')
  final String? lastActiveAt;
  @JsonKey(name: 'contact_name')
  final String? contactName;
  @JsonKey(name: 'contact_phone')
  final String? contactPhone;
  @JsonKey(name: 'contact_telegram')
  final String? contactTelegram;

  JobResumeDto({
    required this.id,
    required this.userId,
    required this.title,
    this.about,
    required this.status,
    required this.isVisibleForEmployers,
    this.desiredSalary,
    this.currency,
    this.employmentTypes,
    this.schedules,
    this.readyToRelocate,
    this.readyForBusinessTrips,
    this.address,
    this.dateOfBirth,
    this.citizenship,
    this.workPermit,
    this.photoUrl,
    this.additionalPhotoUrls,
    this.contactProfileId,
    this.currentPosition,
    this.currentCompany,
    this.totalExperienceMonths,
    this.flightHoursTotal,
    this.flightHoursPic,
    this.licenses,
    this.typeRatings,
    this.medicalClass,
    this.createdAt,
    this.updatedAt,
    this.lastActiveAt,
    this.contactName,
    this.contactPhone,
    this.contactTelegram,
  });

  factory JobResumeDto.fromJson(Map<String, dynamic> json) => _$JobResumeDtoFromJson(json);
}
