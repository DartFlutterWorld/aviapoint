import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepository {
  /// Получение профилей пользователей.
  Future<Either<Failure, List<ProfileEntity>>> fetchProfiles();
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, ProfileEntity>> updateProfile({String? email, String? firstName, String? lastName, String? telegram, String? max});
  Future<Either<Failure, ProfileEntity>> uploadProfilePhoto(XFile photo);
}
