import 'package:freezed_annotation/freezed_annotation.dart';

part 'preflight_inspection_check_list_dto.freezed.dart';
part 'preflight_inspection_check_list_dto.g.dart';

@freezed
abstract class PreflightInspectionCheckListDto with _$PreflightInspectionCheckListDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PreflightInspectionCheckListDto({
    required int id,
    required int preflightInspectionCategoryId,
    required String title,
    required String doing,
    @Default('') String? picture,
    required String titleEng,
    required String doingEng,
  }) = _PreflightInspectionCheckListDto;

  // factory PreflightInspectionCheckListDto.fromEntity(ProfileEntity profile) => PreflightInspectionCheckListDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory PreflightInspectionCheckListDto.fromJson(Map<String, dynamic> json) => _$PreflightInspectionCheckListDtoFromJson(json);
}
