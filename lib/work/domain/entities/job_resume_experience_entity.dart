class JobResumeExperienceEntity {
  final int id;
  final int resumeId;
  final String companyName;
  final String? startDate;
  final String? endDate;
  final bool? isCurrent;
  final String? responsibilitiesAndAchievements;

  JobResumeExperienceEntity({
    required this.id,
    required this.resumeId,
    required this.companyName,
    this.startDate,
    this.endDate,
    this.isCurrent,
    this.responsibilitiesAndAchievements,
  });
}
