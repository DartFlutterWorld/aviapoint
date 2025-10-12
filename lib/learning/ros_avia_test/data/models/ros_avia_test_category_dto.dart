import 'package:freezed_annotation/freezed_annotation.dart';

part 'ros_avia_test_category_dto.freezed.dart';
part 'ros_avia_test_category_dto.g.dart';

@freezed
abstract class RosAviaTestCategoryDto with _$RosAviaTestCategoryDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RosAviaTestCategoryDto({
    required int id,
    required String title,
    required String image,
  }) = _RosAviaTestCategoryDto;

  // factory RosAviaTestCategoryDto.fromEntity(ProfileEntity profile) => RosAviaTestCategoryDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory RosAviaTestCategoryDto.fromJson(Map<String, dynamic> json) => _$RosAviaTestCategoryDtoFromJson(json);
}
