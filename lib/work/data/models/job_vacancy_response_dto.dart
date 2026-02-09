import 'package:json_annotation/json_annotation.dart';

part 'job_vacancy_response_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class JobVacancyResponseDto {
  final int id;
  @JsonKey(name: 'vacancy_id')
  final int vacancyId;
  @JsonKey(name: 'vacancy_title')
  final String? vacancyTitle;
  @JsonKey(name: 'resume_id')
  final int resumeId;
  @JsonKey(name: 'candidate_id')
  final int candidateId;
  final String status;
  @JsonKey(name: 'cover_letter')
  final String? coverLetter;
  @JsonKey(name: 'employer_comment')
  final String? employerComment;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'candidate_first_name')
  final String? candidateFirstName;
  @JsonKey(name: 'candidate_last_name')
  final String? candidateLastName;
  @JsonKey(name: 'candidate_phone')
  final String? candidatePhone;
  @JsonKey(name: 'candidate_phone_alt')
  final String? candidatePhoneAlt;
  @JsonKey(name: 'candidate_telegram')
  final String? candidateTelegram;
  @JsonKey(name: 'candidate_whatsapp')
  final String? candidateWhatsapp;
  @JsonKey(name: 'candidate_max')
  final String? candidateMax;
  @JsonKey(name: 'candidate_email')
  final String? candidateEmail;
  @JsonKey(name: 'employer_company_name')
  final String? employerCompanyName;
  @JsonKey(name: 'employer_logo_url')
  final String? employerLogoUrl;
  @JsonKey(name: 'employer_contact_is_private')
  final bool? employerContactIsPrivate;
  @JsonKey(name: 'employer_first_name')
  final String? employerFirstName;
  @JsonKey(name: 'employer_last_name')
  final String? employerLastName;

  JobVacancyResponseDto({
    required this.id,
    required this.vacancyId,
    this.vacancyTitle,
    required this.resumeId,
    required this.candidateId,
    required this.status,
    this.coverLetter,
    this.employerComment,
    this.createdAt,
    this.updatedAt,
    this.candidateFirstName,
    this.candidateLastName,
    this.candidatePhone,
    this.candidatePhoneAlt,
    this.candidateTelegram,
    this.candidateWhatsapp,
    this.candidateMax,
    this.candidateEmail,
    this.employerCompanyName,
    this.employerLogoUrl,
    this.employerContactIsPrivate,
    this.employerFirstName,
    this.employerLastName,
  });

  factory JobVacancyResponseDto.fromJson(Map<String, dynamic> json) => _$JobVacancyResponseDtoFromJson(json);
}
