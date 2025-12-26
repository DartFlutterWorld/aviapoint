import 'package:aviapoint/profile_page/profile/data/models/profile_dto.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';

class ProfileMapper {
  static ProfileEntity toEntity(ProfileDto model) {
    return ProfileEntity(
      id: model.id,
      phone: model.phone,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
    );
  }
}
