// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_resume_education_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResumeEducationDto _$JobResumeEducationDtoFromJson(
  Map<String, dynamic> json,
) => JobResumeEducationDto(
  id: (json['id'] as num).toInt(),
  resumeId: (json['resume_id'] as num).toInt(),
  institution: json['institution'] as String,
  speciality: json['speciality'] as String?,
  yearStart: (json['year_start'] as num?)?.toInt(),
  yearEnd: (json['year_end'] as num?)?.toInt(),
  isCurrent: json['is_current'] as bool?,
);
