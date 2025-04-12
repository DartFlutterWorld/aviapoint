import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_categories_dto.freezed.dart';
part 'normal_categories_dto.g.dart';

@freezed
abstract class NormalCategoriesDto with _$NormalCategoriesDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NormalCategoriesDto({
    required int id,
    required String title,
    required String subTitle,
    required int mainCategoryId,
    required String titleEng,
    required String picture,
  }) = _NormalCategoriesDto;

  // factory NormalCategoriesDto.fromEntity(ProfileEntity profile) => NormalCategoriesDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory NormalCategoriesDto.fromJson(Map<String, dynamic> json) => _$NormalCategoriesDtoFromJson(json);
}
