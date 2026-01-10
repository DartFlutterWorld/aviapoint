import 'package:aviapoint/app_settings/domain/entities/app_settings_entity.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AppSettingsRepository {
  /// Получить все настройки приложения
  Future<Either<Failure, List<AppSettingsEntity>>> getAllSettings();

  /// Получить настройку по ключу
  Future<Either<Failure, AppSettingsEntity?>> getSettingByKey(String key);

  /// Получить значение настройки по ключу (возвращает false, если настройка не найдена)
  Future<Either<Failure, bool>> getSettingValue(String key);
}
