import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aviapoint/core/domain/entities/exception_network.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = SuccessApiResult<T>;
  const factory ApiResult.failure({required ExceptionNetwork error}) = FailuireApiResult<T>;
}
