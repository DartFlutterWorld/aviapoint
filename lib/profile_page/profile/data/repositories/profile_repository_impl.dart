import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/profile_page/profile/data/datasources/profile_service.dart';
import 'package:aviapoint/profile_page/profile/data/mappers/profile_mapper.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl({required ProfileService profileService}) : _profileService = profileService;

  @override
  Future<Either<Failure, List<ProfileEntity>>> fetchProfiles() async {
    try {
      final response = await _profileService.fetchProfilesList();

      return right(ProfileMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final response = await _profileService.fetchProfile();

      return right(ProfileMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile({String? email, String? firstName, String? lastName, String? telegram, String? max}) async {
    try {
      final body = <String, dynamic>{};
      if (email != null) {
        body['email'] = email;
      }
      if (firstName != null) {
        body['first_name'] = firstName;
      }
      if (lastName != null) {
        body['last_name'] = lastName;
      }
      if (telegram != null) {
        body['telegram'] = telegram;
      }
      if (max != null) {
        body['max'] = max;
      }

      final response = await _profileService.updateProfile(body);

      return right(ProfileMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> uploadProfilePhoto(XFile photo) async {
    try {
      // Читаем байты из файла
      final bytes = await photo.readAsBytes();

      // Создаем MultipartFile из байтов
      final multipartFile = MultipartFile.fromBytes(bytes, filename: photo.name);

      final response = await _profileService.uploadProfilePhoto(multipartFile);

      return right(ProfileMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }
}
