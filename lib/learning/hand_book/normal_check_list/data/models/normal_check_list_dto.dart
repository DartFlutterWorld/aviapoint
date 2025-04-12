import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_check_list_dto.freezed.dart';
part 'normal_check_list_dto.g.dart';

@freezed
abstract class NormalCheckListDto with _$NormalCheckListDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NormalCheckListDto({
    required int id,
    required int normalCategoryId,
    required String title,
    required String doing,
    @Default('') String? picture,
    required String titleEng,
    required String doingEng,
    required bool checkList,
    String? subCategory,
    String? subCategoryEng,
  }) = _NormalCheckListDto;

  // factory NormalCheckListDto.fromEntity(ProfileEntity profile) => NormalCheckListDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory NormalCheckListDto.fromJson(Map<String, dynamic> json) => _$NormalCheckListDtoFromJson(json);
}
