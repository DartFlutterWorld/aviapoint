import 'package:aviapoint/auth_page/data/models/auth_dto.dart';
import 'package:aviapoint/auth_page/domain/entities/auth_entity.dart';
import 'package:aviapoint/profile_page/profile/data/mappers/profile_mapper.dart';

class AuthMapper {
  static AuthEntity toEntity(AuthDto model) {
    return AuthEntity(
      token: model.token,
      refreshToken: model.refreshToken,
      profile: ProfileMapper.toEntity(model.profile),
    );
  }
}
