// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) => _AuthDto(
  token: json['token'] as String,
  refreshToken: json['refresh_token'] as String,
  profile: ProfileDto.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthDtoToJson(_AuthDto instance) => <String, dynamic>{
  'token': instance.token,
  'refresh_token': instance.refreshToken,
  'profile': instance.profile,
};
