// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_resume_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobResumeDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobResumeDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeDetailEvent()';
}


}

/// @nodoc
class $JobResumeDetailEventCopyWith<$Res>  {
$JobResumeDetailEventCopyWith(JobResumeDetailEvent _, $Res Function(JobResumeDetailEvent) __);
}


/// Adds pattern-matching-related methods to [JobResumeDetailEvent].
extension JobResumeDetailEventPatterns on JobResumeDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetJobResumeByIdEvent value)?  getById,TResult Function( ResetJobResumeDetailEvent value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetJobResumeByIdEvent() when getById != null:
return getById(_that);case ResetJobResumeDetailEvent() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetJobResumeByIdEvent value)  getById,required TResult Function( ResetJobResumeDetailEvent value)  reset,}){
final _that = this;
switch (_that) {
case GetJobResumeByIdEvent():
return getById(_that);case ResetJobResumeDetailEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetJobResumeByIdEvent value)?  getById,TResult? Function( ResetJobResumeDetailEvent value)?  reset,}){
final _that = this;
switch (_that) {
case GetJobResumeByIdEvent() when getById != null:
return getById(_that);case ResetJobResumeDetailEvent() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  getById,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetJobResumeByIdEvent() when getById != null:
return getById(_that.id);case ResetJobResumeDetailEvent() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  getById,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case GetJobResumeByIdEvent():
return getById(_that.id);case ResetJobResumeDetailEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  getById,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case GetJobResumeByIdEvent() when getById != null:
return getById(_that.id);case ResetJobResumeDetailEvent() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class GetJobResumeByIdEvent extends JobResumeDetailEvent {
  const GetJobResumeByIdEvent({required this.id}): super._();
  

 final  int id;

/// Create a copy of JobResumeDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetJobResumeByIdEventCopyWith<GetJobResumeByIdEvent> get copyWith => _$GetJobResumeByIdEventCopyWithImpl<GetJobResumeByIdEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetJobResumeByIdEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'JobResumeDetailEvent.getById(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetJobResumeByIdEventCopyWith<$Res> implements $JobResumeDetailEventCopyWith<$Res> {
  factory $GetJobResumeByIdEventCopyWith(GetJobResumeByIdEvent value, $Res Function(GetJobResumeByIdEvent) _then) = _$GetJobResumeByIdEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetJobResumeByIdEventCopyWithImpl<$Res>
    implements $GetJobResumeByIdEventCopyWith<$Res> {
  _$GetJobResumeByIdEventCopyWithImpl(this._self, this._then);

  final GetJobResumeByIdEvent _self;
  final $Res Function(GetJobResumeByIdEvent) _then;

/// Create a copy of JobResumeDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetJobResumeByIdEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ResetJobResumeDetailEvent extends JobResumeDetailEvent {
  const ResetJobResumeDetailEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetJobResumeDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeDetailEvent.reset()';
}


}




/// @nodoc
mixin _$JobResumeDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobResumeDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeDetailState()';
}


}

/// @nodoc
class $JobResumeDetailStateCopyWith<$Res>  {
$JobResumeDetailStateCopyWith(JobResumeDetailState _, $Res Function(JobResumeDetailState) __);
}


/// Adds pattern-matching-related methods to [JobResumeDetailState].
extension JobResumeDetailStatePatterns on JobResumeDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingJobResumeDetailState value)?  loading,TResult Function( ErrorJobResumeDetailState value)?  error,TResult Function( SuccessJobResumeDetailState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingJobResumeDetailState() when loading != null:
return loading(_that);case ErrorJobResumeDetailState() when error != null:
return error(_that);case SuccessJobResumeDetailState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingJobResumeDetailState value)  loading,required TResult Function( ErrorJobResumeDetailState value)  error,required TResult Function( SuccessJobResumeDetailState value)  success,}){
final _that = this;
switch (_that) {
case LoadingJobResumeDetailState():
return loading(_that);case ErrorJobResumeDetailState():
return error(_that);case SuccessJobResumeDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingJobResumeDetailState value)?  loading,TResult? Function( ErrorJobResumeDetailState value)?  error,TResult? Function( SuccessJobResumeDetailState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingJobResumeDetailState() when loading != null:
return loading(_that);case ErrorJobResumeDetailState() when error != null:
return error(_that);case SuccessJobResumeDetailState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( JobResumeEntity resume)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingJobResumeDetailState() when loading != null:
return loading();case ErrorJobResumeDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessJobResumeDetailState() when success != null:
return success(_that.resume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( JobResumeEntity resume)  success,}) {final _that = this;
switch (_that) {
case LoadingJobResumeDetailState():
return loading();case ErrorJobResumeDetailState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessJobResumeDetailState():
return success(_that.resume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( JobResumeEntity resume)?  success,}) {final _that = this;
switch (_that) {
case LoadingJobResumeDetailState() when loading != null:
return loading();case ErrorJobResumeDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessJobResumeDetailState() when success != null:
return success(_that.resume);case _:
  return null;

}
}

}

/// @nodoc


class LoadingJobResumeDetailState extends JobResumeDetailState {
  const LoadingJobResumeDetailState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingJobResumeDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeDetailState.loading()';
}


}




/// @nodoc


class ErrorJobResumeDetailState extends JobResumeDetailState {
  const ErrorJobResumeDetailState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobResumeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorJobResumeDetailStateCopyWith<ErrorJobResumeDetailState> get copyWith => _$ErrorJobResumeDetailStateCopyWithImpl<ErrorJobResumeDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorJobResumeDetailState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'JobResumeDetailState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorJobResumeDetailStateCopyWith<$Res> implements $JobResumeDetailStateCopyWith<$Res> {
  factory $ErrorJobResumeDetailStateCopyWith(ErrorJobResumeDetailState value, $Res Function(ErrorJobResumeDetailState) _then) = _$ErrorJobResumeDetailStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorJobResumeDetailStateCopyWithImpl<$Res>
    implements $ErrorJobResumeDetailStateCopyWith<$Res> {
  _$ErrorJobResumeDetailStateCopyWithImpl(this._self, this._then);

  final ErrorJobResumeDetailState _self;
  final $Res Function(ErrorJobResumeDetailState) _then;

/// Create a copy of JobResumeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorJobResumeDetailState(
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


class SuccessJobResumeDetailState extends JobResumeDetailState {
  const SuccessJobResumeDetailState({required this.resume}): super._();
  

 final  JobResumeEntity resume;

/// Create a copy of JobResumeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessJobResumeDetailStateCopyWith<SuccessJobResumeDetailState> get copyWith => _$SuccessJobResumeDetailStateCopyWithImpl<SuccessJobResumeDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessJobResumeDetailState&&(identical(other.resume, resume) || other.resume == resume));
}


@override
int get hashCode => Object.hash(runtimeType,resume);

@override
String toString() {
  return 'JobResumeDetailState.success(resume: $resume)';
}


}

/// @nodoc
abstract mixin class $SuccessJobResumeDetailStateCopyWith<$Res> implements $JobResumeDetailStateCopyWith<$Res> {
  factory $SuccessJobResumeDetailStateCopyWith(SuccessJobResumeDetailState value, $Res Function(SuccessJobResumeDetailState) _then) = _$SuccessJobResumeDetailStateCopyWithImpl;
@useResult
$Res call({
 JobResumeEntity resume
});




}
/// @nodoc
class _$SuccessJobResumeDetailStateCopyWithImpl<$Res>
    implements $SuccessJobResumeDetailStateCopyWith<$Res> {
  _$SuccessJobResumeDetailStateCopyWithImpl(this._self, this._then);

  final SuccessJobResumeDetailState _self;
  final $Res Function(SuccessJobResumeDetailState) _then;

/// Create a copy of JobResumeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resume = null,}) {
  return _then(SuccessJobResumeDetailState(
resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as JobResumeEntity,
  ));
}


}

// dart format on
