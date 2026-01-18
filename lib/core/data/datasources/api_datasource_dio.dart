import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';

/// [Dio] реализация поставщика данных API.
class ApiDatasourceDio extends ApiDatasource {
  final String baseUrl;
  final List<Interceptor>? interceptors;
  Future<String?> Function()? _onRefresh;
  void Function()? _onLogout;
  DateTime? updateTokenTime;
  String? updatedToken;

  String? _refreshToken;

  /// Dio client
  late final Dio _dio;

  /// baseUrl - базовая ссылка на API
  /// dio - already configured Dio instance
  /// interceptors - list of interceptors
  ApiDatasourceDio({required this.baseUrl, Dio? dio, this.interceptors}) {
    _dio = dio ?? Dio();
    _dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      // Устанавливаем Accept: application/json для всех API запросов
      // Это позволяет nginx различать API запросы от браузерных запросов
      ..headers['Accept'] = 'application/json';

    // Добавляем interceptor для автоматического обновления токена
    _dio.interceptors.add(_TokenRefreshInterceptor(this));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    if (interceptors?.isNotEmpty == true) {
      _dio.interceptors.addAll(interceptors!);
    }

    // onHttpClientCreate доступен только на мобильных платформах (IOHttpClientAdapter),
    // но не на веб-платформе (BrowserHttpClientAdapter)
    if (kDebugMode && !kIsWeb) {
      try {
        final adapter = _dio.httpClientAdapter as dynamic;
        // Используем dynamic для типов, так как dart:io недоступен на веб-платформе
        adapter?.onHttpClientCreate = (dynamic client) {
          client.badCertificateCallback = (dynamic cert, String host, int port) => true;
          return client;
        };
      } catch (e) {
        // Игнорируем ошибки на платформах, где это не поддерживается (например, веб)
      }
    }
  }

  /// Метод для переключения базового URL
  void switchBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  // Метод для установки обоих токенов
  @override
  void setAuthTokens({
    required String accessToken,
    required String refreshToken,
    Future<String?> Function()? onRefresh,
    void Function()? onLogout,
  }) {
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';
    _refreshToken = refreshToken;
    _onRefresh = onRefresh;
    _onLogout = onLogout;
  }

  // Метод для обновления токенов
  @override
  void updateTokens({String? accessToken, String? refreshToken}) {
    if (accessToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
    }
    if (refreshToken != null) {
      _refreshToken = refreshToken;
    }
  }

  Dio get dio => _dio;

  @override
  void delAuthHeader() {
    _dio.options.headers.remove('Authorization');
  }

  @override
  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<T>(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to proccess the data");
    } catch (exc) {
      rethrow;
    }
  }

  @override
  Future<T?> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (exc) {
      rethrow;
    }
  }

  @override
  Future<T?> put<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (exc) {
      rethrow;
    }
  }

  @override
  Future<T?> patch<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (exc) {
      rethrow;
    }
  }

  @override
  Future<T?> delete<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

/// Interceptor для автоматического обновления токена при получении 401 или TOKEN_EXPIRED
class _TokenRefreshInterceptor extends Interceptor {
  final ApiDatasourceDio _datasource;
  bool _isRefreshing = false;
  final List<_PendingRequest> _pendingRequests = [];

  _TokenRefreshInterceptor(this._datasource);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Пропускаем запросы на обновление токена, чтобы избежать бесконечного цикла
    if (err.requestOptions.path.contains('/auth/refresh') || err.requestOptions.path.contains('/refresh-token')) {
      handler.next(err);
      return;
    }

    // Проверяем, является ли это ошибкой авторизации
    final isAuthError = err.response?.statusCode == 401 || _isTokenExpiredError(err.response?.data);

    if (isAuthError && _datasource._refreshToken != null && _datasource._onRefresh != null) {
      // Если уже идет обновление токена, добавляем запрос в очередь
      if (_isRefreshing) {
        final completer = Completer<Response<dynamic>>();
        _pendingRequests.add(_PendingRequest(err.requestOptions, completer));
        try {
          final response = await completer.future;
          handler.resolve(response);
        } catch (e) {
          handler.reject(err);
        }
        return;
      }

      // Начинаем обновление токена
      _isRefreshing = true;

      try {
        // Обновляем токен
        final newAccessToken = await _datasource._onRefresh!();

        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          // Обновляем токен в заголовках
          _datasource._dio.options.headers['Authorization'] = 'Bearer $newAccessToken';

          // Обновляем refreshToken в datasource из хранилища
          // (refreshToken уже обновлен в TokenStorage через auth_repository_impl.refreshToken)
          final tokens = await TokenStorage.getTokens();
          if (tokens['refreshToken'] != null) {
            _datasource._refreshToken = tokens['refreshToken'];
          }

          // Повторяем оригинальный запрос с новым токеном
          final opts = Options(method: err.requestOptions.method, headers: err.requestOptions.headers);
          opts.headers!['Authorization'] = 'Bearer $newAccessToken';

          final response = await _datasource._dio.request<dynamic>(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
            cancelToken: err.requestOptions.cancelToken,
            onSendProgress: err.requestOptions.onSendProgress,
            onReceiveProgress: err.requestOptions.onReceiveProgress,
          );

          // Обрабатываем все ожидающие запросы
          for (final pending in _pendingRequests) {
            try {
              final pendingResponse = await _datasource._dio.request<dynamic>(
                pending.requestOptions.path,
                options: Options(
                  method: pending.requestOptions.method,
                  headers: pending.requestOptions.headers..['Authorization'] = 'Bearer $newAccessToken',
                ),
                data: pending.requestOptions.data,
                queryParameters: pending.requestOptions.queryParameters,
                cancelToken: pending.requestOptions.cancelToken,
                onSendProgress: pending.requestOptions.onSendProgress,
                onReceiveProgress: pending.requestOptions.onReceiveProgress,
              );
              pending.completer.complete(pendingResponse);
            } catch (e) {
              pending.completer.completeError(DioException(requestOptions: pending.requestOptions, error: e));
            }
          }
          _pendingRequests.clear();

          handler.resolve(response);
        } else {
          // Если обновление токена не удалось, выходим из системы
          _datasource._onLogout?.call();
          handler.reject(err);
        }
      } catch (e) {
        // Если обновление токена не удалось, выходим из системы
        _datasource._onLogout?.call();
        handler.reject(err);
      } finally {
        _isRefreshing = false;
      }
    } else {
      // Если это не ошибка авторизации или нет refresh token, просто пробрасываем ошибку
      handler.next(err);
    }
  }

  /// Проверяет, является ли ошибка связанной с истечением токена
  bool _isTokenExpiredError(dynamic responseData) {
    if (responseData == null) return false;

    try {
      if (responseData is Map<String, dynamic>) {
        final error = responseData['error']?.toString().toLowerCase() ?? '';
        final message = responseData['message']?.toString().toLowerCase() ?? '';
        return error.contains('token_expired') ||
            error.contains('token expired') ||
            message.contains('token_expired') ||
            message.contains('token expired') ||
            error.contains('unauthorized') ||
            message.contains('unauthorized');
      } else if (responseData is String) {
        final lowerData = responseData.toLowerCase();
        return lowerData.contains('token_expired') ||
            lowerData.contains('token expired') ||
            lowerData.contains('unauthorized');
      }
    } catch (e) {
      // Игнорируем ошибки парсинга
    }

    return false;
  }
}

/// Класс для хранения ожидающих запросов во время обновления токена
class _PendingRequest {
  final RequestOptions requestOptions;
  final Completer<Response<dynamic>> completer;

  _PendingRequest(this.requestOptions, this.completer);
}
