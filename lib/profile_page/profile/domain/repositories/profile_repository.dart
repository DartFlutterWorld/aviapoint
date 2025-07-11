import 'package:aviapoint/core/failure/failure.dart';

import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  /// Получение профилей пользователей.
  Future<Either<Failure, List<ProfileEntity>>> fetchProfiles();
  Future<Either<Failure, ProfileEntity>> getProfile();
}
