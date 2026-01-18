// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_images_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImagesResponseDto _$UploadImagesResponseDtoFromJson(
  Map<String, dynamic> json,
) => UploadImagesResponseDto(
  urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$UploadImagesResponseDtoToJson(
  UploadImagesResponseDto instance,
) => <String, dynamic>{'urls': instance.urls};
