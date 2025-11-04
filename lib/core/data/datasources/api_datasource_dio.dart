import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'dart:io';

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
      ..receiveTimeout = const Duration(seconds: 10);

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    if (interceptors?.isNotEmpty == true) {
      _dio.interceptors.addAll(interceptors!);
    }

    if (kDebugMode) {
      final adapter = _dio.httpClientAdapter as dynamic;
      adapter?.onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  /// Метод для переключения базового URL
  void switchBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  // Метод для установки обоих токенов
  @override
  void setAuthTokens({required String accessToken, required String refreshToken, Future<String?> Function()? onRefresh, void Function()? onLogout}) {
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
  Future<T?> get<T>(String uri, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await _dio.get<T>(uri, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);

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
  Future<T?> delete<T>(String uri, {dynamic data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.delete<T>(uri, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);

      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
