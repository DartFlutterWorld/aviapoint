class JobVacancyResponseEntity {
  final int id;
  final int vacancyId;
  final String? vacancyTitle;
  final int resumeId;
  final int candidateId;
  final String status;
  final String? coverLetter;
  final String? employerComment;
  final String? createdAt;
  final String? updatedAt;
  final String? candidateFirstName;
  final String? candidateLastName;
  final String? candidatePhotoUrl;
  final String? candidatePhone;
  final String? candidatePhoneAlt;
  final String? candidateTelegram;
  final String? candidateWhatsapp;
  final String? candidateMax;
  final String? candidateEmail;
  final String? employerCompanyName;
  final String? employerLogoUrl;
  final bool? employerContactIsPrivate;
  final String? employerFirstName;
  final String? employerLastName;

  JobVacancyResponseEntity({
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
    this.candidatePhotoUrl,
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
}
