import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;
  final String? statusCode;
  final String? responseMessage;
  const Failure({this.message, this.statusCode, this.responseMessage});

  /// Создаёт Failure из исключения (DioException или любого другого).
  factory Failure.fromException(Object e, [StackTrace? _]) {
    if (e is DioException) {
      final data = e.response?.data;
      String? responseMessage;
      if (data is Map) {
        responseMessage = (data['message'] ?? data['detail'])?.toString();
      }
      return ServerFailure(
        statusCode: e.response?.statusCode?.toString(),
        message: e.message ?? e.toString(),
        responseMessage: responseMessage,
      );
    }
    return Failure(message: e.toString());
  }

  @override
  List<Object?> get props => [message, statusCode, responseMessage];
}

class ServerFailure extends Failure {
  @override
  final String? message;
  @override
  final String? statusCode;
  @override
  final String? responseMessage;
  const ServerFailure({this.responseMessage, this.message, this.statusCode});
}

class HasNotNextItems extends Failure {}
