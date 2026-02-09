// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_vacancy_responses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobVacancyResponsesEvent {

 int get vacancyId;
/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobVacancyResponsesEventCopyWith<JobVacancyResponsesEvent> get copyWith => _$JobVacancyResponsesEventCopyWithImpl<JobVacancyResponsesEvent>(this as JobVacancyResponsesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyResponsesEvent&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId));
}


@override
int get hashCode => Object.hash(runtimeType,vacancyId);

@override
String toString() {
  return 'JobVacancyResponsesEvent(vacancyId: $vacancyId)';
}


}

/// @nodoc
abstract mixin class $JobVacancyResponsesEventCopyWith<$Res>  {
  factory $JobVacancyResponsesEventCopyWith(JobVacancyResponsesEvent value, $Res Function(JobVacancyResponsesEvent) _then) = _$JobVacancyResponsesEventCopyWithImpl;
@useResult
$Res call({
 int vacancyId
});




}
/// @nodoc
class _$JobVacancyResponsesEventCopyWithImpl<$Res>
    implements $JobVacancyResponsesEventCopyWith<$Res> {
  _$JobVacancyResponsesEventCopyWithImpl(this._self, this._then);

  final JobVacancyResponsesEvent _self;
  final $Res Function(JobVacancyResponsesEvent) _then;

/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vacancyId = null,}) {
  return _then(_self.copyWith(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [JobVacancyResponsesEvent].
extension JobVacancyResponsesEventPatterns on JobVacancyResponsesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Refresh value)?  refresh,TResult Function( _UpdateStatus value)?  updateStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Refresh() when refresh != null:
return refresh(_that);case _UpdateStatus() when updateStatus != null:
return updateStatus(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Refresh value)  refresh,required TResult Function( _UpdateStatus value)  updateStatus,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Refresh():
return refresh(_that);case _UpdateStatus():
return updateStatus(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Refresh value)?  refresh,TResult? Function( _UpdateStatus value)?  updateStatus,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Refresh() when refresh != null:
return refresh(_that);case _UpdateStatus() when updateStatus != null:
return updateStatus(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int vacancyId)?  get,TResult Function( int vacancyId)?  refresh,TResult Function( int vacancyId,  int responseId,  String status,  String? employerComment)?  updateStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.vacancyId);case _Refresh() when refresh != null:
return refresh(_that.vacancyId);case _UpdateStatus() when updateStatus != null:
return updateStatus(_that.vacancyId,_that.responseId,_that.status,_that.employerComment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int vacancyId)  get,required TResult Function( int vacancyId)  refresh,required TResult Function( int vacancyId,  int responseId,  String status,  String? employerComment)  updateStatus,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.vacancyId);case _Refresh():
return refresh(_that.vacancyId);case _UpdateStatus():
return updateStatus(_that.vacancyId,_that.responseId,_that.status,_that.employerComment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int vacancyId)?  get,TResult? Function( int vacancyId)?  refresh,TResult? Function( int vacancyId,  int responseId,  String status,  String? employerComment)?  updateStatus,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.vacancyId);case _Refresh() when refresh != null:
return refresh(_that.vacancyId);case _UpdateStatus() when updateStatus != null:
return updateStatus(_that.vacancyId,_that.responseId,_that.status,_that.employerComment);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements JobVacancyResponsesEvent {
  const _Get({required this.vacancyId});
  

@override final  int vacancyId;

/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId));
}


@override
int get hashCode => Object.hash(runtimeType,vacancyId);

@override
String toString() {
  return 'JobVacancyResponsesEvent.get(vacancyId: $vacancyId)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $JobVacancyResponsesEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@override @useResult
$Res call({
 int vacancyId
});




}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vacancyId = null,}) {
  return _then(_Get(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Refresh implements JobVacancyResponsesEvent {
  const _Refresh({required this.vacancyId});
  

@override final  int vacancyId;

/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshCopyWith<_Refresh> get copyWith => __$RefreshCopyWithImpl<_Refresh>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId));
}


@override
int get hashCode => Object.hash(runtimeType,vacancyId);

@override
String toString() {
  return 'JobVacancyResponsesEvent.refresh(vacancyId: $vacancyId)';
}


}

/// @nodoc
abstract mixin class _$RefreshCopyWith<$Res> implements $JobVacancyResponsesEventCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) _then) = __$RefreshCopyWithImpl;
@override @useResult
$Res call({
 int vacancyId
});




}
/// @nodoc
class __$RefreshCopyWithImpl<$Res>
    implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(this._self, this._then);

  final _Refresh _self;
  final $Res Function(_Refresh) _then;

/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vacancyId = null,}) {
  return _then(_Refresh(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateStatus implements JobVacancyResponsesEvent {
  const _UpdateStatus({required this.vacancyId, required this.responseId, required this.status, this.employerComment});
  

@override final  int vacancyId;
 final  int responseId;
 final  String status;
 final  String? employerComment;

/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateStatusCopyWith<_UpdateStatus> get copyWith => __$UpdateStatusCopyWithImpl<_UpdateStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateStatus&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId)&&(identical(other.responseId, responseId) || other.responseId == responseId)&&(identical(other.status, status) || other.status == status)&&(identical(other.employerComment, employerComment) || other.employerComment == employerComment));
}


@override
int get hashCode => Object.hash(runtimeType,vacancyId,responseId,status,employerComment);

@override
String toString() {
  return 'JobVacancyResponsesEvent.updateStatus(vacancyId: $vacancyId, responseId: $responseId, status: $status, employerComment: $employerComment)';
}


}

/// @nodoc
abstract mixin class _$UpdateStatusCopyWith<$Res> implements $JobVacancyResponsesEventCopyWith<$Res> {
  factory _$UpdateStatusCopyWith(_UpdateStatus value, $Res Function(_UpdateStatus) _then) = __$UpdateStatusCopyWithImpl;
@override @useResult
$Res call({
 int vacancyId, int responseId, String status, String? employerComment
});




}
/// @nodoc
class __$UpdateStatusCopyWithImpl<$Res>
    implements _$UpdateStatusCopyWith<$Res> {
  __$UpdateStatusCopyWithImpl(this._self, this._then);

  final _UpdateStatus _self;
  final $Res Function(_UpdateStatus) _then;

/// Create a copy of JobVacancyResponsesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vacancyId = null,Object? responseId = null,Object? status = null,Object? employerComment = freezed,}) {
  return _then(_UpdateStatus(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as int,responseId: null == responseId ? _self.responseId : responseId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,employerComment: freezed == employerComment ? _self.employerComment : employerComment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$JobVacancyResponsesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyResponsesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyResponsesState()';
}


}

/// @nodoc
class $JobVacancyResponsesStateCopyWith<$Res>  {
$JobVacancyResponsesStateCopyWith(JobVacancyResponsesState _, $Res Function(JobVacancyResponsesState) __);
}


/// Adds pattern-matching-related methods to [JobVacancyResponsesState].
extension JobVacancyResponsesStatePatterns on JobVacancyResponsesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<JobVacancyResponseEntity> responses)?  success,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.responses);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<JobVacancyResponseEntity> responses)  success,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Success():
return success(_that.responses);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<JobVacancyResponseEntity> responses)?  success,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.responses);case _Error() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements JobVacancyResponsesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyResponsesState.loading()';
}


}




/// @nodoc


class _Success implements JobVacancyResponsesState {
  const _Success({required final  List<JobVacancyResponseEntity> responses}): _responses = responses;
  

 final  List<JobVacancyResponseEntity> _responses;
 List<JobVacancyResponseEntity> get responses {
  if (_responses is EqualUnmodifiableListView) return _responses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responses);
}


/// Create a copy of JobVacancyResponsesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._responses, _responses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_responses));

@override
String toString() {
  return 'JobVacancyResponsesState.success(responses: $responses)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $JobVacancyResponsesStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<JobVacancyResponseEntity> responses
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of JobVacancyResponsesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? responses = null,}) {
  return _then(_Success(
responses: null == responses ? _self._responses : responses // ignore: cast_nullable_to_non_nullable
as List<JobVacancyResponseEntity>,
  ));
}


}

/// @nodoc


class _Error implements JobVacancyResponsesState {
  const _Error({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobVacancyResponsesState
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
  return 'JobVacancyResponsesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $JobVacancyResponsesStateCopyWith<$Res> {
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

/// Create a copy of JobVacancyResponsesState
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
