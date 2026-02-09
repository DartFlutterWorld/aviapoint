// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_vacancy_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobVacancyDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyDetailEvent()';
}


}

/// @nodoc
class $JobVacancyDetailEventCopyWith<$Res>  {
$JobVacancyDetailEventCopyWith(JobVacancyDetailEvent _, $Res Function(JobVacancyDetailEvent) __);
}


/// Adds pattern-matching-related methods to [JobVacancyDetailEvent].
extension JobVacancyDetailEventPatterns on JobVacancyDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetJobVacancyByIdEvent value)?  getById,TResult Function( ResetJobVacancyDetailEvent value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetJobVacancyByIdEvent() when getById != null:
return getById(_that);case ResetJobVacancyDetailEvent() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetJobVacancyByIdEvent value)  getById,required TResult Function( ResetJobVacancyDetailEvent value)  reset,}){
final _that = this;
switch (_that) {
case GetJobVacancyByIdEvent():
return getById(_that);case ResetJobVacancyDetailEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetJobVacancyByIdEvent value)?  getById,TResult? Function( ResetJobVacancyDetailEvent value)?  reset,}){
final _that = this;
switch (_that) {
case GetJobVacancyByIdEvent() when getById != null:
return getById(_that);case ResetJobVacancyDetailEvent() when reset != null:
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
case GetJobVacancyByIdEvent() when getById != null:
return getById(_that.id);case ResetJobVacancyDetailEvent() when reset != null:
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
case GetJobVacancyByIdEvent():
return getById(_that.id);case ResetJobVacancyDetailEvent():
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
case GetJobVacancyByIdEvent() when getById != null:
return getById(_that.id);case ResetJobVacancyDetailEvent() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class GetJobVacancyByIdEvent extends JobVacancyDetailEvent {
  const GetJobVacancyByIdEvent({required this.id}): super._();
  

 final  int id;

/// Create a copy of JobVacancyDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetJobVacancyByIdEventCopyWith<GetJobVacancyByIdEvent> get copyWith => _$GetJobVacancyByIdEventCopyWithImpl<GetJobVacancyByIdEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetJobVacancyByIdEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'JobVacancyDetailEvent.getById(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetJobVacancyByIdEventCopyWith<$Res> implements $JobVacancyDetailEventCopyWith<$Res> {
  factory $GetJobVacancyByIdEventCopyWith(GetJobVacancyByIdEvent value, $Res Function(GetJobVacancyByIdEvent) _then) = _$GetJobVacancyByIdEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetJobVacancyByIdEventCopyWithImpl<$Res>
    implements $GetJobVacancyByIdEventCopyWith<$Res> {
  _$GetJobVacancyByIdEventCopyWithImpl(this._self, this._then);

  final GetJobVacancyByIdEvent _self;
  final $Res Function(GetJobVacancyByIdEvent) _then;

/// Create a copy of JobVacancyDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetJobVacancyByIdEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ResetJobVacancyDetailEvent extends JobVacancyDetailEvent {
  const ResetJobVacancyDetailEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetJobVacancyDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyDetailEvent.reset()';
}


}




/// @nodoc
mixin _$JobVacancyDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyDetailState()';
}


}

/// @nodoc
class $JobVacancyDetailStateCopyWith<$Res>  {
$JobVacancyDetailStateCopyWith(JobVacancyDetailState _, $Res Function(JobVacancyDetailState) __);
}


/// Adds pattern-matching-related methods to [JobVacancyDetailState].
extension JobVacancyDetailStatePatterns on JobVacancyDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingJobVacancyDetailState value)?  loading,TResult Function( ErrorJobVacancyDetailState value)?  error,TResult Function( SuccessJobVacancyDetailState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingJobVacancyDetailState() when loading != null:
return loading(_that);case ErrorJobVacancyDetailState() when error != null:
return error(_that);case SuccessJobVacancyDetailState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingJobVacancyDetailState value)  loading,required TResult Function( ErrorJobVacancyDetailState value)  error,required TResult Function( SuccessJobVacancyDetailState value)  success,}){
final _that = this;
switch (_that) {
case LoadingJobVacancyDetailState():
return loading(_that);case ErrorJobVacancyDetailState():
return error(_that);case SuccessJobVacancyDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingJobVacancyDetailState value)?  loading,TResult? Function( ErrorJobVacancyDetailState value)?  error,TResult? Function( SuccessJobVacancyDetailState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingJobVacancyDetailState() when loading != null:
return loading(_that);case ErrorJobVacancyDetailState() when error != null:
return error(_that);case SuccessJobVacancyDetailState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( JobVacancyEntity vacancy)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingJobVacancyDetailState() when loading != null:
return loading();case ErrorJobVacancyDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessJobVacancyDetailState() when success != null:
return success(_that.vacancy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( JobVacancyEntity vacancy)  success,}) {final _that = this;
switch (_that) {
case LoadingJobVacancyDetailState():
return loading();case ErrorJobVacancyDetailState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessJobVacancyDetailState():
return success(_that.vacancy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( JobVacancyEntity vacancy)?  success,}) {final _that = this;
switch (_that) {
case LoadingJobVacancyDetailState() when loading != null:
return loading();case ErrorJobVacancyDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessJobVacancyDetailState() when success != null:
return success(_that.vacancy);case _:
  return null;

}
}

}

/// @nodoc


class LoadingJobVacancyDetailState extends JobVacancyDetailState {
  const LoadingJobVacancyDetailState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingJobVacancyDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyDetailState.loading()';
}


}




/// @nodoc


class ErrorJobVacancyDetailState extends JobVacancyDetailState {
  const ErrorJobVacancyDetailState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobVacancyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorJobVacancyDetailStateCopyWith<ErrorJobVacancyDetailState> get copyWith => _$ErrorJobVacancyDetailStateCopyWithImpl<ErrorJobVacancyDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorJobVacancyDetailState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'JobVacancyDetailState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorJobVacancyDetailStateCopyWith<$Res> implements $JobVacancyDetailStateCopyWith<$Res> {
  factory $ErrorJobVacancyDetailStateCopyWith(ErrorJobVacancyDetailState value, $Res Function(ErrorJobVacancyDetailState) _then) = _$ErrorJobVacancyDetailStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorJobVacancyDetailStateCopyWithImpl<$Res>
    implements $ErrorJobVacancyDetailStateCopyWith<$Res> {
  _$ErrorJobVacancyDetailStateCopyWithImpl(this._self, this._then);

  final ErrorJobVacancyDetailState _self;
  final $Res Function(ErrorJobVacancyDetailState) _then;

/// Create a copy of JobVacancyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorJobVacancyDetailState(
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


class SuccessJobVacancyDetailState extends JobVacancyDetailState {
  const SuccessJobVacancyDetailState({required this.vacancy}): super._();
  

 final  JobVacancyEntity vacancy;

/// Create a copy of JobVacancyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessJobVacancyDetailStateCopyWith<SuccessJobVacancyDetailState> get copyWith => _$SuccessJobVacancyDetailStateCopyWithImpl<SuccessJobVacancyDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessJobVacancyDetailState&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy));
}


@override
int get hashCode => Object.hash(runtimeType,vacancy);

@override
String toString() {
  return 'JobVacancyDetailState.success(vacancy: $vacancy)';
}


}

/// @nodoc
abstract mixin class $SuccessJobVacancyDetailStateCopyWith<$Res> implements $JobVacancyDetailStateCopyWith<$Res> {
  factory $SuccessJobVacancyDetailStateCopyWith(SuccessJobVacancyDetailState value, $Res Function(SuccessJobVacancyDetailState) _then) = _$SuccessJobVacancyDetailStateCopyWithImpl;
@useResult
$Res call({
 JobVacancyEntity vacancy
});




}
/// @nodoc
class _$SuccessJobVacancyDetailStateCopyWithImpl<$Res>
    implements $SuccessJobVacancyDetailStateCopyWith<$Res> {
  _$SuccessJobVacancyDetailStateCopyWithImpl(this._self, this._then);

  final SuccessJobVacancyDetailState _self;
  final $Res Function(SuccessJobVacancyDetailState) _then;

/// Create a copy of JobVacancyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancy = null,}) {
  return _then(SuccessJobVacancyDetailState(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as JobVacancyEntity,
  ));
}


}

// dart format on
