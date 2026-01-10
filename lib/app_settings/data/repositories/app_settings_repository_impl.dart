import 'package:aviapoint/app_settings/data/datasources/app_settings_service.dart';
import 'package:aviapoint/app_settings/data/models/app_settings_dto.dart';
import 'package:aviapoint/app_settings/domain/entities/app_settings_entity.dart';
import 'package:aviapoint/app_settings/domain/repositories/app_settings_repository.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AppSettingsRepositoryImpl extends AppSettingsRepository {
  final AppSettingsService _appSettingsService;

  AppSettingsRepositoryImpl({required AppSettingsService appSettingsService}) : _appSettingsService = appSettingsService;

  @override
  Future<Either<Failure, List<AppSettingsEntity>>> getAllSettings() async {
    try {
      final response = await _appSettingsService.getAllSettings();
      return right(_mapToEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, AppSettingsEntity?>> getSettingByKey(String key) async {
    try {
      final response = await _appSettingsService.getSettingByKey(key);
      return right(_mapToEntity(response));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return right(null);
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> getSettingValue(String key) async {
    try {
      final response = await _appSettingsService.getSettingValue(key);
      return right(response.value);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return right(false);
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  AppSettingsEntity _mapToEntity(AppSettingsDto dto) {
    return AppSettingsEntity(
      id: dto.id,
      key: dto.key,
      value: dto.value,
      description: dto.description,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  List<AppSettingsEntity> _mapToEntities(List<AppSettingsDto> dtos) {
    return dtos.map((dto) => _mapToEntity(dto)).toList();
  }
}
