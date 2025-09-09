import 'package:freezed_annotation/freezed_annotation.dart';

part 'privat_pilot_plane_category_dto.freezed.dart';
part 'privat_pilot_plane_category_dto.g.dart';

@freezed
abstract class PrivatPilotPlaneCategoryDto with _$PrivatPilotPlaneCategoryDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PrivatPilotPlaneCategoryDto({
    required int id,
    required String title,
    required String image,
    required int typeCertificatesId,
  }) = _PrivatPilotPlaneCategoryDto;

  // factory PrivatPilotPlaneCategoryDto.fromEntity(ProfileEntity profile) => PrivatPilotPlaneCategoryDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory PrivatPilotPlaneCategoryDto.fromJson(Map<String, dynamic> json) => _$PrivatPilotPlaneCategoryDtoFromJson(json);
}
