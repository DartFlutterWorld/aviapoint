import 'dart:io';

import 'package:dio/dio.dart';
import 'package:aviapoint/core/domain/entities/exception_network.dart';

abstract class ExceptionNetworkModel implements ExceptionNetwork {
  static ExceptionNetwork defaultError({required String error}) => ExceptionDefaultError(error: error);

  static ExceptionNetwork fromError({required dynamic error}) {
    try {
      if (error is Exception) {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return ExceptionRequestCancelled();
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.connectionTimeout:
              return ExceptionRequestTimeout();
            case DioExceptionType.sendTimeout:
              return ExceptionSendTimeout();
            case DioExceptionType.unknown:
            case DioExceptionType.badCertificate:
            case DioExceptionType.connectionError:
              return ExceptionNoInternetConnection();
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  return ExceptionNotFound(error: error.response?.data);
                case 401:
                  return ExceptionUnauthorisedRequest(response: error.response?.data);
                case 403:
                  return ExceptionForbidden(error: error.response?.statusMessage);
                case 404:
                  return ExceptionNotFound(error: error.response?.data['detail']);
                case 408:
                  return ExceptionRequestTimeout();
                case 409:
                  return ExceptionConflict();
                case 429:
                  return ExceptionSendTimeout();
                case 500:
                  return ExceptionInternalServerError();
                case 502:
                  return ExceptionBadGatewayError();
                case 503:
                  return ExceptionServiceUnavailable();
                default:
                  return ExceptionDefaultError(error: "Received invalid status code: ${error.response?.statusCode}");
              }
          }
        } else if (error is SocketException) {
          return ExceptionNoInternetConnection();
        } else {
          return ExceptionUnexpectedError(error: error.toString());
        }
      }
    } on FormatException catch (_) {
      return ExceptionFormatException();
    } catch (err) {
      return ExceptionUnexpectedError(error: error.toString());
    }

    return error.toString().contains("is not subtype of")
        ? ExceptionUnableToProcess()
        : ExceptionUnexpectedError(error: error.toString());
  }
}
