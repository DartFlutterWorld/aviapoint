import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_correct_answer_dto.freezed.dart';
part 'type_correct_answer_dto.g.dart';

@freezed
abstract class TypeCorrectAnswerDto with _$TypeCorrectAnswerDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TypeCorrectAnswerDto({required int id, required String title}) = _TypeCorrectAnswerDto;

  // factory TypeCorrectAnswerDto.fromEntity(ProfileEntity profile) => TypeCorrectAnswerDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory TypeCorrectAnswerDto.fromJson(Map<String, dynamic> json) => _$TypeCorrectAnswerDtoFromJson(json);
}
