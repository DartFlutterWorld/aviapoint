import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response_dto.g.dart';

@JsonSerializable()
class UploadImageResponseDto {
  final String url;

  UploadImageResponseDto({required this.url});

  factory UploadImageResponseDto.fromJson(Map<String, dynamic> json) => _$UploadImageResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseDtoToJson(this);
}
