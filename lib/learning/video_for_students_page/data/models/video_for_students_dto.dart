import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_for_students_dto.freezed.dart';
part 'video_for_students_dto.g.dart';

@freezed
abstract class VideoForStudentsDto with _$VideoForStudentsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VideoForStudentsDto({
    required int id,
    required String title,
    required String fileName,
    required String url,
  }) = _VideoForStudentsDto;

  // factory VideoForStudentsDto.fromEntity(ProfileEntity profile) => VideoForStudentsDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory VideoForStudentsDto.fromJson(Map<String, dynamic> json) => _$VideoForStudentsDtoFromJson(json);
}
