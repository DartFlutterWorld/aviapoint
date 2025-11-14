// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResult<T> implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ApiResult<$T>'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ApiResult<$T>()';
}


}

/// @nodoc
class $ApiResultCopyWith<T,$Res>  {
$ApiResultCopyWith(ApiResult<T> _, $Res Function(ApiResult<T>) __);
}


/// Adds pattern-matching-related methods to [ApiResult].
extension ApiResultPatterns<T> on ApiResult<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SuccessApiResult<T> value)?  success,TResult Function( FailuireApiResult<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SuccessApiResult() when success != null:
return success(_that);case FailuireApiResult() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SuccessApiResult<T> value)  success,required TResult Function( FailuireApiResult<T> value)  failure,}){
final _that = this;
switch (_that) {
case SuccessApiResult():
return success(_that);case FailuireApiResult():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SuccessApiResult<T> value)?  success,TResult? Function( FailuireApiResult<T> value)?  failure,}){
final _that = this;
switch (_that) {
case SuccessApiResult() when success != null:
return success(_that);case FailuireApiResult() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( ExceptionNetwork error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SuccessApiResult() when success != null:
return success(_that.data);case FailuireApiResult() when failure != null:
return failure(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( ExceptionNetwork error)  failure,}) {final _that = this;
switch (_that) {
case SuccessApiResult():
return success(_that.data);case FailuireApiResult():
return failure(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( ExceptionNetwork error)?  failure,}) {final _that = this;
switch (_that) {
case SuccessApiResult() when success != null:
return success(_that.data);case FailuireApiResult() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SuccessApiResult<T> with DiagnosticableTreeMixin implements ApiResult<T> {
  const SuccessApiResult({required this.data});
  

 final  T data;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessApiResultCopyWith<T, SuccessApiResult<T>> get copyWith => _$SuccessApiResultCopyWithImpl<T, SuccessApiResult<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ApiResult<$T>.success'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessApiResult<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ApiResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessApiResultCopyWith<T,$Res> implements $ApiResultCopyWith<T, $Res> {
  factory $SuccessApiResultCopyWith(SuccessApiResult<T> value, $Res Function(SuccessApiResult<T>) _then) = _$SuccessApiResultCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$SuccessApiResultCopyWithImpl<T,$Res>
    implements $SuccessApiResultCopyWith<T, $Res> {
  _$SuccessApiResultCopyWithImpl(this._self, this._then);

  final SuccessApiResult<T> _self;
  final $Res Function(SuccessApiResult<T>) _then;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(SuccessApiResult<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class FailuireApiResult<T> with DiagnosticableTreeMixin implements ApiResult<T> {
  const FailuireApiResult({required this.error});
  

 final  ExceptionNetwork error;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailuireApiResultCopyWith<T, FailuireApiResult<T>> get copyWith => _$FailuireApiResultCopyWithImpl<T, FailuireApiResult<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ApiResult<$T>.failure'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailuireApiResult<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ApiResult<$T>.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $FailuireApiResultCopyWith<T,$Res> implements $ApiResultCopyWith<T, $Res> {
  factory $FailuireApiResultCopyWith(FailuireApiResult<T> value, $Res Function(FailuireApiResult<T>) _then) = _$FailuireApiResultCopyWithImpl;
@useResult
$Res call({
 ExceptionNetwork error
});




}
/// @nodoc
class _$FailuireApiResultCopyWithImpl<T,$Res>
    implements $FailuireApiResultCopyWith<T, $Res> {
  _$FailuireApiResultCopyWithImpl(this._self, this._then);

  final FailuireApiResult<T> _self;
  final $Res Function(FailuireApiResult<T>) _then;

/// Create a copy of ApiResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FailuireApiResult<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ExceptionNetwork,
  ));
}


}

// dart format on
