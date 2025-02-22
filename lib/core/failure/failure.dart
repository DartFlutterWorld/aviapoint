import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;
  final String? statusCode;
  final String? responseMessage;
  const Failure({this.message, this.statusCode, this.responseMessage});
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
