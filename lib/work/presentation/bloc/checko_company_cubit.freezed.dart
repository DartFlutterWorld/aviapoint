// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checko_company_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoCompanyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoCompanyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoCompanyState()';
}


}

/// @nodoc
class $CheckoCompanyStateCopyWith<$Res>  {
$CheckoCompanyStateCopyWith(CheckoCompanyState _, $Res Function(CheckoCompanyState) __);
}


/// Adds pattern-matching-related methods to [CheckoCompanyState].
extension CheckoCompanyStatePatterns on CheckoCompanyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialCheckoCompanyState value)?  initial,TResult Function( LoadingCheckoCompanyState value)?  loading,TResult Function( ErrorCheckoCompanyState value)?  error,TResult Function( SuccessCheckoCompanyState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialCheckoCompanyState() when initial != null:
return initial(_that);case LoadingCheckoCompanyState() when loading != null:
return loading(_that);case ErrorCheckoCompanyState() when error != null:
return error(_that);case SuccessCheckoCompanyState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialCheckoCompanyState value)  initial,required TResult Function( LoadingCheckoCompanyState value)  loading,required TResult Function( ErrorCheckoCompanyState value)  error,required TResult Function( SuccessCheckoCompanyState value)  success,}){
final _that = this;
switch (_that) {
case InitialCheckoCompanyState():
return initial(_that);case LoadingCheckoCompanyState():
return loading(_that);case ErrorCheckoCompanyState():
return error(_that);case SuccessCheckoCompanyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialCheckoCompanyState value)?  initial,TResult? Function( LoadingCheckoCompanyState value)?  loading,TResult? Function( ErrorCheckoCompanyState value)?  error,TResult? Function( SuccessCheckoCompanyState value)?  success,}){
final _that = this;
switch (_that) {
case InitialCheckoCompanyState() when initial != null:
return initial(_that);case LoadingCheckoCompanyState() when loading != null:
return loading(_that);case ErrorCheckoCompanyState() when error != null:
return error(_that);case SuccessCheckoCompanyState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( CompanyShortInfo info)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialCheckoCompanyState() when initial != null:
return initial();case LoadingCheckoCompanyState() when loading != null:
return loading();case ErrorCheckoCompanyState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCheckoCompanyState() when success != null:
return success(_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( CompanyShortInfo info)  success,}) {final _that = this;
switch (_that) {
case InitialCheckoCompanyState():
return initial();case LoadingCheckoCompanyState():
return loading();case ErrorCheckoCompanyState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCheckoCompanyState():
return success(_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( CompanyShortInfo info)?  success,}) {final _that = this;
switch (_that) {
case InitialCheckoCompanyState() when initial != null:
return initial();case LoadingCheckoCompanyState() when loading != null:
return loading();case ErrorCheckoCompanyState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCheckoCompanyState() when success != null:
return success(_that.info);case _:
  return null;

}
}

}

/// @nodoc


class InitialCheckoCompanyState implements CheckoCompanyState {
  const InitialCheckoCompanyState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialCheckoCompanyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoCompanyState.initial()';
}


}




/// @nodoc


class LoadingCheckoCompanyState implements CheckoCompanyState {
  const LoadingCheckoCompanyState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCheckoCompanyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoCompanyState.loading()';
}


}




/// @nodoc


class ErrorCheckoCompanyState implements CheckoCompanyState {
  const ErrorCheckoCompanyState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of CheckoCompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCheckoCompanyStateCopyWith<ErrorCheckoCompanyState> get copyWith => _$ErrorCheckoCompanyStateCopyWithImpl<ErrorCheckoCompanyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCheckoCompanyState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'CheckoCompanyState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorCheckoCompanyStateCopyWith<$Res> implements $CheckoCompanyStateCopyWith<$Res> {
  factory $ErrorCheckoCompanyStateCopyWith(ErrorCheckoCompanyState value, $Res Function(ErrorCheckoCompanyState) _then) = _$ErrorCheckoCompanyStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorCheckoCompanyStateCopyWithImpl<$Res>
    implements $ErrorCheckoCompanyStateCopyWith<$Res> {
  _$ErrorCheckoCompanyStateCopyWithImpl(this._self, this._then);

  final ErrorCheckoCompanyState _self;
  final $Res Function(ErrorCheckoCompanyState) _then;

/// Create a copy of CheckoCompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorCheckoCompanyState(
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


class SuccessCheckoCompanyState implements CheckoCompanyState {
  const SuccessCheckoCompanyState({required this.info});
  

 final  CompanyShortInfo info;

/// Create a copy of CheckoCompanyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCheckoCompanyStateCopyWith<SuccessCheckoCompanyState> get copyWith => _$SuccessCheckoCompanyStateCopyWithImpl<SuccessCheckoCompanyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCheckoCompanyState&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'CheckoCompanyState.success(info: $info)';
}


}

/// @nodoc
abstract mixin class $SuccessCheckoCompanyStateCopyWith<$Res> implements $CheckoCompanyStateCopyWith<$Res> {
  factory $SuccessCheckoCompanyStateCopyWith(SuccessCheckoCompanyState value, $Res Function(SuccessCheckoCompanyState) _then) = _$SuccessCheckoCompanyStateCopyWithImpl;
@useResult
$Res call({
 CompanyShortInfo info
});




}
/// @nodoc
class _$SuccessCheckoCompanyStateCopyWithImpl<$Res>
    implements $SuccessCheckoCompanyStateCopyWith<$Res> {
  _$SuccessCheckoCompanyStateCopyWithImpl(this._self, this._then);

  final SuccessCheckoCompanyState _self;
  final $Res Function(SuccessCheckoCompanyState) _then;

/// Create a copy of CheckoCompanyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(SuccessCheckoCompanyState(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as CompanyShortInfo,
  ));
}


}

// dart format on
