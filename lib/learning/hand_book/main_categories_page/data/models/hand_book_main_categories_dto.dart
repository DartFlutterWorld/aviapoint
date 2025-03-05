import 'package:freezed_annotation/freezed_annotation.dart';

part 'hand_book_main_categories_dto.freezed.dart';
part 'hand_book_main_categories_dto.g.dart';

@freezed
abstract class HandBookMainCategoriesDto with _$HandBookMainCategoriesDto {
  const factory HandBookMainCategoriesDto({
    required int mainCategoryId,
    required String title,
    required String subTitle,
    required String picture,
  }) = _HandBookMainCategoriesDto;

  // factory HandBookMainCategoriesDto.fromEntity(ProfileEntity profile) => HandBookMainCategoriesDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory HandBookMainCategoriesDto.fromJson(Map<String, dynamic> json) => _$HandBookMainCategoriesDtoFromJson(json);
}
