import 'package:json_annotation/json_annotation.dart';

part 'job_resume_experience_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class JobResumeExperienceDto {
  final int id;
  @JsonKey(name: 'resume_id')
  final int resumeId;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'is_current')
  final bool? isCurrent;
  @JsonKey(name: 'responsibilities_and_achievements')
  final String? responsibilitiesAndAchievements;

  JobResumeExperienceDto({
    required this.id,
    required this.resumeId,
    required this.companyName,
    this.startDate,
    this.endDate,
    this.isCurrent,
    this.responsibilitiesAndAchievements,
  });

  factory JobResumeExperienceDto.fromJson(Map<String, dynamic> json) =>
      _$JobResumeExperienceDtoFromJson(json);
}
