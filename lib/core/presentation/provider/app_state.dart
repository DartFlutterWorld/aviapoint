import 'dart:async';

import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';
import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:aviapoint/core/utils/const/app.dart';

class AppState with ChangeNotifier {
  final AuthRepository _authRepository;
  AppState({required AuthRepository authRepository}) : _authRepository = authRepository {
    checkAuthStatus();
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  bool _useLocalServer = true;

  bool get useLocalServer => _useLocalServer;

  void setUseLocalServer(bool value) {
    _useLocalServer = value;

    // Переключаем URL в API datasource
    final dataSource = getIt.get<ApiDatasource>() as ApiDatasourceDio;
    final newUrl = value ? localServerUrl : remoteServerUrl;
    dataSource.switchBaseUrl(newUrl);

    notifyListeners();
  }

  String get currentServerUrl {
    if (_useLocalServer) {
      return localServerUrl;
    }
    return remoteServerUrl;
  }

  // Разобраться постоянно логаут
  Future<bool> checkAuthStatus() async {
    try {
      final tokens = await TokenStorage.getTokens();
      bool isValid = await TokenStorage.isAccessTokenValid();

      // Если токен не валиден, но есть refresh token, пробуем обновить
      if (!isValid && tokens['refreshToken'] != null) {
        final newTokens = await _authRepository.refreshToken(tokens['refreshToken']!);

        if (newTokens != null) {
          isValid = true;
        }
      }

      if (isValid && tokens['accessToken'] != null) {
        _isAuthenticated = true;
        getIt<ApiDatasource>().setAuthTokens(
          accessToken: tokens['accessToken']!,
          refreshToken: tokens['refreshToken']!,
          onRefresh: () => _authRepository.refreshToken(tokens['refreshToken']!),
          onLogout: _logout,
        );
      } else {
        await _logout();
      }
    } catch (e) {
      // В случае любой ошибки выходим из системы
      await _logout();
    }

    notifyListeners();
    return _isAuthenticated;
  }

  Future<void> _logout() async {
    _isAuthenticated = false;
    await TokenStorage.clearTokens();
    getIt<ApiDatasource>().delAuthHeader();
    notifyListeners();
  }
}
