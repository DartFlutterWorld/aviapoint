import 'package:freezed_annotation/freezed_annotation.dart';

part 'preflight_inspection_categories_dto.freezed.dart';
part 'preflight_inspection_categories_dto.g.dart';

@freezed
abstract class PreflightInspectionCategoriesDto with _$PreflightInspectionCategoriesDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PreflightInspectionCategoriesDto({
    required int id,
    required String title,
    required String subTitle,
    required int mainCategoryId,
    required String titleEng,
    required String picture,
  }) = _PreflightInspectionCategoriesDto;

  // factory PreflightInspectionCategoriesDto.fromEntity(ProfileEntity profile) => PreflightInspectionCategoriesDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory PreflightInspectionCategoriesDto.fromJson(Map<String, dynamic> json) => _$PreflightInspectionCategoriesDtoFromJson(json);
}
