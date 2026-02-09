// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_vacancy_response_create_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobVacancyResponseCreateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyResponseCreateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyResponseCreateEvent()';
}


}

/// @nodoc
class $JobVacancyResponseCreateEventCopyWith<$Res>  {
$JobVacancyResponseCreateEventCopyWith(JobVacancyResponseCreateEvent _, $Res Function(JobVacancyResponseCreateEvent) __);
}


/// Adds pattern-matching-related methods to [JobVacancyResponseCreateEvent].
extension JobVacancyResponseCreateEventPatterns on JobVacancyResponseCreateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Create value)?  create,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Create value)  create,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Create():
return create(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Create value)?  create,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int vacancyId,  int resumeId,  String? coverLetter)?  create,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.vacancyId,_that.resumeId,_that.coverLetter);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int vacancyId,  int resumeId,  String? coverLetter)  create,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Create():
return create(_that.vacancyId,_that.resumeId,_that.coverLetter);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int vacancyId,  int resumeId,  String? coverLetter)?  create,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.vacancyId,_that.resumeId,_that.coverLetter);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Create implements JobVacancyResponseCreateEvent {
  const _Create({required this.vacancyId, required this.resumeId, this.coverLetter});
  

 final  int vacancyId;
 final  int resumeId;
 final  String? coverLetter;

/// Create a copy of JobVacancyResponseCreateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId)&&(identical(other.resumeId, resumeId) || other.resumeId == resumeId)&&(identical(other.coverLetter, coverLetter) || other.coverLetter == coverLetter));
}


@override
int get hashCode => Object.hash(runtimeType,vacancyId,resumeId,coverLetter);

@override
String toString() {
  return 'JobVacancyResponseCreateEvent.create(vacancyId: $vacancyId, resumeId: $resumeId, coverLetter: $coverLetter)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $JobVacancyResponseCreateEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 int vacancyId, int resumeId, String? coverLetter
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of JobVacancyResponseCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancyId = null,Object? resumeId = null,Object? coverLetter = freezed,}) {
  return _then(_Create(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as int,resumeId: null == resumeId ? _self.resumeId : resumeId // ignore: cast_nullable_to_non_nullable
as int,coverLetter: freezed == coverLetter ? _self.coverLetter : coverLetter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Reset implements JobVacancyResponseCreateEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyResponseCreateEvent.reset()';
}


}




/// @nodoc
mixin _$JobVacancyResponseCreateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyResponseCreateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyResponseCreateState()';
}


}

/// @nodoc
class $JobVacancyResponseCreateStateCopyWith<$Res>  {
$JobVacancyResponseCreateStateCopyWith(JobVacancyResponseCreateState _, $Res Function(JobVacancyResponseCreateState) __);
}


/// Adds pattern-matching-related methods to [JobVacancyResponseCreateState].
extension JobVacancyResponseCreateStatePatterns on JobVacancyResponseCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Creating value)?  creating,TResult Function( _Created value)?  created,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Creating() when creating != null:
return creating(_that);case _Created() when created != null:
return created(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Creating value)  creating,required TResult Function( _Created value)  created,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Creating():
return creating(_that);case _Created():
return created(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Creating value)?  creating,TResult? Function( _Created value)?  created,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Creating() when creating != null:
return creating(_that);case _Created() when created != null:
return created(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  creating,TResult Function( JobVacancyResponseEntity response)?  created,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Creating() when creating != null:
return creating();case _Created() when created != null:
return created(_that.response);case _Error() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  creating,required TResult Function( JobVacancyResponseEntity response)  created,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Creating():
return creating();case _Created():
return created(_that.response);case _Error():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  creating,TResult? Function( JobVacancyResponseEntity response)?  created,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Creating() when creating != null:
return creating();case _Created() when created != null:
return created(_that.response);case _Error() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements JobVacancyResponseCreateState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyResponseCreateState.initial()';
}


}




/// @nodoc


class _Creating implements JobVacancyResponseCreateState {
  const _Creating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Creating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyResponseCreateState.creating()';
}


}




/// @nodoc


class _Created implements JobVacancyResponseCreateState {
  const _Created({required this.response});
  

 final  JobVacancyResponseEntity response;

/// Create a copy of JobVacancyResponseCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'JobVacancyResponseCreateState.created(response: $response)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $JobVacancyResponseCreateStateCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 JobVacancyResponseEntity response
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of JobVacancyResponseCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_Created(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as JobVacancyResponseEntity,
  ));
}


}

/// @nodoc


class _Error implements JobVacancyResponseCreateState {
  const _Error({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobVacancyResponseCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'JobVacancyResponseCreateState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $JobVacancyResponseCreateStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of JobVacancyResponseCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(_Error(
errorFromApi: freezed == errorFromApi ? _self.errorFromApi : errorFromApi // ignore: cast_nullable_to_non_nullable
as String?,errorForUser: null == errorForUser ? _self.errorForUser : errorForUser // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
