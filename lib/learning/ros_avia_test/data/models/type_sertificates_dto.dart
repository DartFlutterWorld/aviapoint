import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_sertificates_dto.freezed.dart';
part 'type_sertificates_dto.g.dart';

@freezed
abstract class TypeSertificatesDto with _$TypeSertificatesDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TypeSertificatesDto({required int id, required String title, required String image}) =
      _TypeSertificatesDto;

  // factory TypeSertificatesDto.fromEntity(ProfileEntity profile) => TypeSertificatesDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory TypeSertificatesDto.fromJson(Map<String, dynamic> json) => _$TypeSertificatesDtoFromJson(json);
}
