import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';

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

  String? _accessToken;
  String? _refreshToken;

  /// baseUrl - базовая ссылка на API
  /// dio - экземпляр [Dio]
  /// interceptors - интерсепторы для [Dio]
  ApiDatasourceDio({required this.baseUrl, Dio? dio, this.interceptors}) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(milliseconds: _defaultConnectTimeout)
      ..options.receiveTimeout = const Duration(milliseconds: _defaultRecieveTimeout)
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

  // Метод для установки обоих токенов
  @override
  void setAuthTokens({required String accessToken, required String refreshToken, Future<String?> Function()? onRefresh, void Function()? onLogout}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _onRefresh = onRefresh;
    _onLogout = onLogout;
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  // Метод для обновления токенов
  @override
  void updateTokens({String? accessToken, String? refreshToken}) {
    if (accessToken != null) {
      _accessToken = accessToken;
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
    }
    if (refreshToken != null) {
      _refreshToken = refreshToken;
    }
  }

  void _addloggerInterseptor() {
    _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: false, responseHeader: true, error: false, compact: true, maxWidth: 90));
  }

  Dio get dio => _dio;

  void _addRefreshInterseptor() {
    _dio.interceptors.clear();
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final onRefresh = _onRefresh;
            final onLogout = _onLogout;
            final refreshToken = _refreshToken;

            // Проверяем, что это не запрос на обновление токена
            if (error.requestOptions.path.contains('/refresh')) {
              onLogout?.call();
              return handler.reject(error);
            }

            // Блокируем другие запросы пока обновляем токен
            _onRefresh = null;
            try {
              if (onRefresh != null && refreshToken != null) {
                // Проверяем, не пытаемся ли мы уже обновить токен
                if (updateTokenTime == null || (updateTokenTime != null && DateTime.now().difference(updateTokenTime!).inMinutes > 1)) {
                  updatedToken = await onRefresh();
                }

                if (updatedToken != null) {
                  updateTokenTime = DateTime.now();
                  error.requestOptions.headers["Authorization"] = _dio.options.headers['Authorization'] = 'Bearer $updatedToken';

                  // Повторяем оригинальный запрос с новым токеном
                  final cloneReq = await _dio.request<dynamic>(
                    error.requestOptions.path,
                    options: Options(method: error.requestOptions.method, headers: error.requestOptions.headers),
                    data: error.requestOptions.data,
                    queryParameters: error.requestOptions.queryParameters,
                  );

                  _onRefresh = onRefresh; // Восстанавливаем callback
                  return handler.resolve(cloneReq);
                }
              }
              onLogout?.call();
              return handler.reject(error);
            } catch (exc, stack) {
              // logger.e("Error refresh token", exc, stack);
              onLogout?.call();
              return handler.reject(error);
            } finally {
              _onRefresh = onRefresh; // Всегда восстанавливаем callback
            }
          }
          return handler.reject(error);
        },
      ),
    );
  }

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
