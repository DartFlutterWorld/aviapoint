// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_vacancy_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobVacancyResponseDto _$JobVacancyResponseDtoFromJson(
  Map<String, dynamic> json,
) => JobVacancyResponseDto(
  id: (json['id'] as num).toInt(),
  vacancyId: (json['vacancy_id'] as num).toInt(),
  vacancyTitle: json['vacancy_title'] as String?,
  resumeId: (json['resume_id'] as num).toInt(),
  candidateId: (json['candidate_id'] as num).toInt(),
  status: json['status'] as String,
  coverLetter: json['cover_letter'] as String?,
  employerComment: json['employer_comment'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  candidateFirstName: json['candidate_first_name'] as String?,
  candidateLastName: json['candidate_last_name'] as String?,
  candidatePhone: json['candidate_phone'] as String?,
  candidatePhoneAlt: json['candidate_phone_alt'] as String?,
  candidateTelegram: json['candidate_telegram'] as String?,
  candidateWhatsapp: json['candidate_whatsapp'] as String?,
  candidateMax: json['candidate_max'] as String?,
  candidateEmail: json['candidate_email'] as String?,
  employerCompanyName: json['employer_company_name'] as String?,
  employerLogoUrl: json['employer_logo_url'] as String?,
  employerContactIsPrivate: json['employer_contact_is_private'] as bool?,
  employerFirstName: json['employer_first_name'] as String?,
  employerLastName: json['employer_last_name'] as String?,
);

Map<String, dynamic> _$JobVacancyResponseDtoToJson(
  JobVacancyResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'vacancy_id': instance.vacancyId,
  'vacancy_title': ?instance.vacancyTitle,
  'resume_id': instance.resumeId,
  'candidate_id': instance.candidateId,
  'status': instance.status,
  'cover_letter': ?instance.coverLetter,
  'employer_comment': ?instance.employerComment,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'candidate_first_name': ?instance.candidateFirstName,
  'candidate_last_name': ?instance.candidateLastName,
  'candidate_phone': ?instance.candidatePhone,
  'candidate_phone_alt': ?instance.candidatePhoneAlt,
  'candidate_telegram': ?instance.candidateTelegram,
  'candidate_whatsapp': ?instance.candidateWhatsapp,
  'candidate_max': ?instance.candidateMax,
  'candidate_email': ?instance.candidateEmail,
  'employer_company_name': ?instance.employerCompanyName,
  'employer_logo_url': ?instance.employerLogoUrl,
  'employer_contact_is_private': ?instance.employerContactIsPrivate,
  'employer_first_name': ?instance.employerFirstName,
  'employer_last_name': ?instance.employerLastName,
};
