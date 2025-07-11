import 'dart:async';
import 'dart:convert';

import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';
import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final AuthRepository _authRepository;
  AppState({required AuthRepository authRepository}) : _authRepository = authRepository {
    checkAuthStatus();
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

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
      print('выход из за ошибки токена');
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
