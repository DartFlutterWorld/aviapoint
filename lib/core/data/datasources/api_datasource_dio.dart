import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/failure/logger.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultRecieveTimeout = Duration.millisecondsPerMinute;

/// [Dio] реализация поставщика данных API.
class ApiDatasourceDio extends ApiDatasource {
  late Dio _dio;
  final String baseUrl;
  final List<Interceptor>? interceptors;
  Future<String?> Function()? _onRefresh;
  void Function()? _onLogout;
  DateTime? updateTokenTime;
  String? updatedToken;

  /// baseUrl - базовая ссылка на API
  /// dio - экземпляр [Dio]
  /// interceptors - интерсепторы для [Dio]
  ApiDatasourceDio({
    required this.baseUrl,
    Dio? dio,
    this.interceptors,
  }) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(
        milliseconds: _defaultConnectTimeout,
      )
      ..options.receiveTimeout = const Duration(
        milliseconds: _defaultRecieveTimeout,
      )
      ..httpClientAdapter
      ..options.headers = {'Content-type': 'application/json; charset=UTF-8'};

    // if (Platform.isAndroid) {
    //   (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //     client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    //     return client;
    //   };
    // }

    _addRefreshInterseptor();
    // Отключение показа ответов сервера на запрос в консоли
    _addloggerInterseptor();
  }

  void _addloggerInterseptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: false,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Dio get dio => _dio;

  /// Добавляет интерсептор для обновления RefreshToken.
  void _addRefreshInterseptor() {
    _dio.interceptors.clear();
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (error, handler) async {
          //if (error.response?.statusCode == 401 && (error.response?.data == null || error.response?.data['code'] == null || error.response?.data['code'] != 'user_not_found')) {
          if (error.response?.statusCode == 401) {
            // Сохраняем колбэки.
            final onRefresh = _onRefresh;
            final onLogout = _onLogout;
            // Очищаем старый колбек чтобы он не вызывался сам на себя.
            _onRefresh = null;
            try {
              // Если задан коллбек для восстановления токена.
              if (onRefresh != null) {
                if (updateTokenTime == null || updateTokenTime == null || (updateTokenTime != null && updateTokenTime!.difference(DateTime.now()).inMinutes > 1)) {
                  updatedToken = await onRefresh();
                }

                if (updatedToken != null) {
                  updateTokenTime = DateTime.now();
                  // Если коллбек вернул новый токен.
                  error.requestOptions.headers["Authorization"] = _dio.options.headers['Authorization'] = 'Bearer $updatedToken';
                  // Повторим предыдущий запрос.
                  final opts = Options(method: error.requestOptions.method, headers: error.requestOptions.headers);
                  final cloneReq = await _dio.request<dynamic>(
                    error.requestOptions.path,
                    options: opts,
                    data: error.requestOptions.data,
                    queryParameters: error.requestOptions.queryParameters,
                  );
                  // Восстановим старый колбэк.
                  _onRefresh = onRefresh;

                  return handler.resolve(cloneReq);
                }
              }
              if (onLogout != null) {
                // При неудаче вызовим коллбек разлогинивания.
                onLogout();
              }

              return handler.reject(error);
            } catch (exc, stack) {
              logger.e("Error refresh token", exc, stack);
              if (onLogout != null) {
                // При неудаче вызовим коллбек разлогинивания.
                onLogout();
              }

              return handler.reject(error);
            }
          } else {
            //if (_onLogout != null) _onLogout!();
            return handler.reject(error);
          }
        },
      ),
    );
  }

  @override
  void delAuthHeader() {
    _dio.options.headers.remove('Authorization');
  }

  @override
  void setAuthHeader(String token, {Future<String?> Function()? onRefresh, void Function()? onLogout}) {
    _onRefresh = onRefresh;
    _onLogout = onLogout;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    if (kDebugMode) {
      print('token - $token');
    }
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
