import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';

class AuthEntity {
  final String token;
  final String refreshToken;
  final ProfileEntity profile;

  /// token - авторизационный токен
  /// profile - профиль авторизованного пользователя
  const AuthEntity({required this.token, required this.refreshToken, required this.profile});
}
