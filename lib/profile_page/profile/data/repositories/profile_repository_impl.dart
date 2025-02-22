import 'dart:convert';

import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/models/api_result.dart';
import 'package:aviapoint/core/data/models/exception_network_model.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/core/utils/logger.dart';
import 'package:aviapoint/generated/l10n.dart';
import 'package:aviapoint/profile_page/profile/data/datasources/profile_service.dart';
import 'package:aviapoint/profile_page/profile/data/mappers/profile_mapper.dart';
import 'package:aviapoint/profile_page/profile/data/models/profile_dto.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';

import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl({required ProfileService profileService}) : _profileService = profileService;

  @override
  Future<Either<Failure, List<ProfileEntity>>> fetchProfiles() async {
    // try {
    //   final response = await _apiDatasource.get<List<dynamic>>('/user');

    //   return response != null
    //       ? ApiResult.success(
    //           data: ProfileModel.fromJson(response.first),
    //         )
    //       : ApiResult.failure(
    //           error: ExceptionNetworkModel.defaultError(
    //               error: S.current.error_descr),
    //         );
    // } catch (exc) {
    //   logger.e('Error GET fetchProfile', exc);

    //   return ApiResult.failure(
    //       error: ExceptionNetworkModel.fromError(error: exc));
    // }

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
}
