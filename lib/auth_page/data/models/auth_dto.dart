import 'package:aviapoint/profile_page/profile/data/models/profile_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
abstract class AuthDto with _$AuthDto {
  /// token - авторизационный токен
  /// profile - профиль авторизованного пользователя
  const factory AuthDto({required String token, @JsonKey(name: 'refresh_token') required String refreshToken, required ProfileDto profile}) = _AuthDto;

  // factory AuthDto.fromEntity(AuthEntity auth) => AuthDto(
  //       token: auth.token,
  //       refreshToken: auth.refreshToken,
  //       profile: ProfileDto.fromEntity(auth.profile),
  //     );

  factory AuthDto.fromJson(Map<String, dynamic> json) => _$AuthDtoFromJson(json);
}
