import 'package:json_annotation/json_annotation.dart';

part 'job_resume_education_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class JobResumeEducationDto {
  final int id;
  @JsonKey(name: 'resume_id')
  final int resumeId;
  final String institution;
  final String? speciality;
  @JsonKey(name: 'year_start')
  final int? yearStart;
  @JsonKey(name: 'year_end')
  final int? yearEnd;
  @JsonKey(name: 'is_current')
  final bool? isCurrent;

  JobResumeEducationDto({
    required this.id,
    required this.resumeId,
    required this.institution,
    this.speciality,
    this.yearStart,
    this.yearEnd,
    this.isCurrent,
  });

  factory JobResumeEducationDto.fromJson(Map<String, dynamic> json) =>
      _$JobResumeEducationDtoFromJson(json);
}
