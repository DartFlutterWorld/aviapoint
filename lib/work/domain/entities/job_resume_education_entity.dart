class JobResumeEducationEntity {
  final int id;
  final int resumeId;
  final String institution;
  final String? speciality;
  final int? yearStart;
  final int? yearEnd;
  final bool? isCurrent;

  JobResumeEducationEntity({
    required this.id,
    required this.resumeId,
    required this.institution,
    this.speciality,
    this.yearStart,
    this.yearEnd,
    this.isCurrent,
  });
}
