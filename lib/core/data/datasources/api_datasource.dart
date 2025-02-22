import 'package:dio/dio.dart';

/// Интерфейс поставщика данных API.
abstract class ApiDatasource {
  /// Del auth information.
  void delAuthHeader();

  /// add auth information
  /// onRefresh - вызывается при получении 401 или 403
  /// onLogout - вызывается если не прошел вызов onRefresh
  void setAuthHeader(
    String token, {
    Future<String?> Function()? onRefresh,
    void Function()? onLogout,
  });

  /// GET request to API
  /// [uri] - additional url string to [baseUrl]
  /// [queryParameters] - additional query parameters to request
  Future<T?> get<T>(String uri, {Map<String, dynamic>? queryParameters});

  /// POST request to API
  /// [uri] - additional url string to [baseUrl]
  /// [data] - data for post body
  /// [queryParameters] - additional query parameters to request
  Future<T?> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options options,
    Function(int, int)? onSendProgress,
  });

  /// PUT request to API
  /// [uri] - additional url string to [baseUrl]
  /// [data] - data for put body
  /// [queryParameters] - additional query parameters to request
  Future<T?> patch<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<T?> delete<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<T?> put<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
