import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_categories_dto.freezed.dart';
part 'emergency_categories_dto.g.dart';

@freezed
abstract class EmergencyCategoriesDto with _$EmergencyCategoriesDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EmergencyCategoriesDto({
    required int id,
    required String title,
    required String subTitle,
    required String subTitleEng,
    required int mainCategoryId,
    required String titleEng,
    required String picture,
  }) = _EmergencyCategoriesDto;

  // factory EmergencyCategoriesDto.fromEntity(ProfileEntity profile) => EmergencyCategoriesDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory EmergencyCategoriesDto.fromJson(Map<String, dynamic> json) => _$EmergencyCategoriesDtoFromJson(json);
}
