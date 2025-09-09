import 'package:aviapoint/auth_page/data/datasources/remote/auth_service.dart';
import 'package:aviapoint/auth_page/data/repositories/mappers/auth_mapper.dart';
import 'package:aviapoint/auth_page/data/repositories/mappers/sms_mapper.dart';
import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';
import 'package:aviapoint/auth_page/domain/entities/auth_entity.dart';
import 'package:aviapoint/auth_page/domain/entities/sms_entity.dart';
import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/core/failure/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// Реализация репозитория авторизации.
class AuthRepositoryImpl implements AuthRepository {
  final ApiDatasource _apiDatasource;
  final AuthService _authService;

  /// ApiDatasource - источник данных.
  AuthRepositoryImpl({
    required ApiDatasource apiDatasource,
    required AuthService authService,
  })  : _authService = authService,
        _apiDatasource = apiDatasource;

  @override
  Future<Either<Failure, SmsEntity>> getSms(String phone) async {
    try {
      final response = await _authService.getSms({'phone': phone});

      return right(
        SmsMapper.toEntity(response),
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
  Future<Either<Failure, AuthEntity>> auth({required String phone, required String sms}) async {
    try {
      final response = await _authService.auth({'phone': phone, 'sms': sms});
      // Обновляем токены в хранилище
      await TokenStorage.saveTokens(
        accessToken: response.token,
        refreshToken: response.refreshToken,
      );

      // Сохраняем оба токена
      _apiDatasource.setAuthTokens(
        accessToken: response.token,
        refreshToken: response.refreshToken,
        onRefresh: () => refreshToken(response.refreshToken),
        onLogout: () => _logout(),
      );

      return right(
        AuthMapper.toEntity(response),
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
  Future<String?> refreshToken(String? refreshTokenValue) async {
    if (refreshTokenValue == null) {
      _logout(); // Добавили await
      return null;
    }

    try {
      final response = await _authService.refreshToken({'refresh_token': refreshTokenValue});

      // Проверяем, что токены пришли
      if (response.token == null || response.refreshToken == null) {
        throw Exception('Invalid token response: tokens are null');
      }

      // Сохраняем токены (может выбросить исключение)
      await TokenStorage.saveTokens(
        accessToken: response.token,
        refreshToken: response.refreshToken,
      );

      // // Обновляем токены в API (может выбросить исключение)
      // _apiDatasource.updateTokens(
      //   accessToken: response.token,
      //   refreshToken: response.refreshToken,
      // );

      // Сохраняем оба токена
      _apiDatasource.setAuthTokens(
        accessToken: response.token,
        refreshToken: response.refreshToken,
        onRefresh: () => refreshToken(response.refreshToken),
        onLogout: () => _logout(),
      );

      return response.token;
    } catch (e, stack) {
      // Логируем ошибку, но НЕ выходим из системы автоматически
      logger.e("Refresh token failed (non-critical)", e, stack);
      return null; // Пусть вызывающий код решает, что делать
    }
  }

  void _logout() {
    // Очищаем токены
    _apiDatasource.delAuthHeader();
    print('Вышли из приложения');
    // Дополнительная логика выхода
  }
}
