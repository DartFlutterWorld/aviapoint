import 'package:json_annotation/json_annotation.dart';

part 'upload_images_response_dto.g.dart';

@JsonSerializable()
class UploadImagesResponseDto {
  final List<String> urls;

  UploadImagesResponseDto({required this.urls});

  factory UploadImagesResponseDto.fromJson(Map<String, dynamic> json) => _$UploadImagesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImagesResponseDtoToJson(this);
}
