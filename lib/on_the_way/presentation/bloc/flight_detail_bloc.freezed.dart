// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightDetailState()';
}


}

/// @nodoc
class $FlightDetailStateCopyWith<$Res>  {
$FlightDetailStateCopyWith(FlightDetailState _, $Res Function(FlightDetailState) __);
}


/// Adds pattern-matching-related methods to [FlightDetailState].
extension FlightDetailStatePatterns on FlightDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingFlightDetailState value)?  loading,TResult Function( ErrorFlightDetailState value)?  error,TResult Function( SuccessFlightDetailState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingFlightDetailState() when loading != null:
return loading(_that);case ErrorFlightDetailState() when error != null:
return error(_that);case SuccessFlightDetailState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingFlightDetailState value)  loading,required TResult Function( ErrorFlightDetailState value)  error,required TResult Function( SuccessFlightDetailState value)  success,}){
final _that = this;
switch (_that) {
case LoadingFlightDetailState():
return loading(_that);case ErrorFlightDetailState():
return error(_that);case SuccessFlightDetailState():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingFlightDetailState value)?  loading,TResult? Function( ErrorFlightDetailState value)?  error,TResult? Function( SuccessFlightDetailState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingFlightDetailState() when loading != null:
return loading(_that);case ErrorFlightDetailState() when error != null:
return error(_that);case SuccessFlightDetailState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( FlightEntity flight)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingFlightDetailState() when loading != null:
return loading();case ErrorFlightDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessFlightDetailState() when success != null:
return success(_that.flight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( FlightEntity flight)  success,}) {final _that = this;
switch (_that) {
case LoadingFlightDetailState():
return loading();case ErrorFlightDetailState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessFlightDetailState():
return success(_that.flight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( FlightEntity flight)?  success,}) {final _that = this;
switch (_that) {
case LoadingFlightDetailState() when loading != null:
return loading();case ErrorFlightDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessFlightDetailState() when success != null:
return success(_that.flight);case _:
  return null;

}
}

}

/// @nodoc


class LoadingFlightDetailState extends FlightDetailState {
  const LoadingFlightDetailState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingFlightDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightDetailState.loading()';
}


}




/// @nodoc


class ErrorFlightDetailState extends FlightDetailState {
  const ErrorFlightDetailState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of FlightDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorFlightDetailStateCopyWith<ErrorFlightDetailState> get copyWith => _$ErrorFlightDetailStateCopyWithImpl<ErrorFlightDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorFlightDetailState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'FlightDetailState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorFlightDetailStateCopyWith<$Res> implements $FlightDetailStateCopyWith<$Res> {
  factory $ErrorFlightDetailStateCopyWith(ErrorFlightDetailState value, $Res Function(ErrorFlightDetailState) _then) = _$ErrorFlightDetailStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorFlightDetailStateCopyWithImpl<$Res>
    implements $ErrorFlightDetailStateCopyWith<$Res> {
  _$ErrorFlightDetailStateCopyWithImpl(this._self, this._then);

  final ErrorFlightDetailState _self;
  final $Res Function(ErrorFlightDetailState) _then;

/// Create a copy of FlightDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorFlightDetailState(
errorFromApi: freezed == errorFromApi ? _self.errorFromApi : errorFromApi // ignore: cast_nullable_to_non_nullable
as String?,errorForUser: null == errorForUser ? _self.errorForUser : errorForUser // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SuccessFlightDetailState extends FlightDetailState {
  const SuccessFlightDetailState({required this.flight}): super._();
  

 final  FlightEntity flight;

/// Create a copy of FlightDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessFlightDetailStateCopyWith<SuccessFlightDetailState> get copyWith => _$SuccessFlightDetailStateCopyWithImpl<SuccessFlightDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessFlightDetailState&&(identical(other.flight, flight) || other.flight == flight));
}


@override
int get hashCode => Object.hash(runtimeType,flight);

@override
String toString() {
  return 'FlightDetailState.success(flight: $flight)';
}


}

/// @nodoc
abstract mixin class $SuccessFlightDetailStateCopyWith<$Res> implements $FlightDetailStateCopyWith<$Res> {
  factory $SuccessFlightDetailStateCopyWith(SuccessFlightDetailState value, $Res Function(SuccessFlightDetailState) _then) = _$SuccessFlightDetailStateCopyWithImpl;
@useResult
$Res call({
 FlightEntity flight
});




}
/// @nodoc
class _$SuccessFlightDetailStateCopyWithImpl<$Res>
    implements $SuccessFlightDetailStateCopyWith<$Res> {
  _$SuccessFlightDetailStateCopyWithImpl(this._self, this._then);

  final SuccessFlightDetailState _self;
  final $Res Function(SuccessFlightDetailState) _then;

/// Create a copy of FlightDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flight = null,}) {
  return _then(SuccessFlightDetailState(
flight: null == flight ? _self.flight : flight // ignore: cast_nullable_to_non_nullable
as FlightEntity,
  ));
}


}

// dart format on
