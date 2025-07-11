import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/profile_page/profile/data/datasources/profile_service.dart';
import 'package:aviapoint/profile_page/profile/data/mappers/profile_mapper.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';

import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl({required ProfileService profileService}) : _profileService = profileService;

  @override
  Future<Either<Failure, List<ProfileEntity>>> fetchProfiles() async {
    try {
      final response = await _profileService.fetchProfilesList();

      return right(
        ProfileMapper.toEntities(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final response = await _profileService.fetchProfile();

      return right(
        ProfileMapper.toEntity(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }
}
