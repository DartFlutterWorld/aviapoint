// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_resume_experience_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResumeExperienceDto _$JobResumeExperienceDtoFromJson(
  Map<String, dynamic> json,
) => JobResumeExperienceDto(
  id: (json['id'] as num).toInt(),
  resumeId: (json['resume_id'] as num).toInt(),
  companyName: json['company_name'] as String,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  isCurrent: json['is_current'] as bool?,
  responsibilitiesAndAchievements:
      json['responsibilities_and_achievements'] as String?,
);
