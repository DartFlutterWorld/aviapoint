// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_profiles_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactProfilesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactProfilesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactProfilesState()';
}


}

/// @nodoc
class $ContactProfilesStateCopyWith<$Res>  {
$ContactProfilesStateCopyWith(ContactProfilesState _, $Res Function(ContactProfilesState) __);
}


/// Adds pattern-matching-related methods to [ContactProfilesState].
extension ContactProfilesStatePatterns on ContactProfilesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialContactProfilesState value)?  initial,TResult Function( LoadingContactProfilesState value)?  loading,TResult Function( SuccessContactProfilesState value)?  success,TResult Function( ErrorContactProfilesState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialContactProfilesState() when initial != null:
return initial(_that);case LoadingContactProfilesState() when loading != null:
return loading(_that);case SuccessContactProfilesState() when success != null:
return success(_that);case ErrorContactProfilesState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialContactProfilesState value)  initial,required TResult Function( LoadingContactProfilesState value)  loading,required TResult Function( SuccessContactProfilesState value)  success,required TResult Function( ErrorContactProfilesState value)  error,}){
final _that = this;
switch (_that) {
case InitialContactProfilesState():
return initial(_that);case LoadingContactProfilesState():
return loading(_that);case SuccessContactProfilesState():
return success(_that);case ErrorContactProfilesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialContactProfilesState value)?  initial,TResult? Function( LoadingContactProfilesState value)?  loading,TResult? Function( SuccessContactProfilesState value)?  success,TResult? Function( ErrorContactProfilesState value)?  error,}){
final _that = this;
switch (_that) {
case InitialContactProfilesState() when initial != null:
return initial(_that);case LoadingContactProfilesState() when loading != null:
return loading(_that);case SuccessContactProfilesState() when success != null:
return success(_that);case ErrorContactProfilesState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<JobContactProfileEntity> profiles)?  success,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialContactProfilesState() when initial != null:
return initial();case LoadingContactProfilesState() when loading != null:
return loading();case SuccessContactProfilesState() when success != null:
return success(_that.profiles);case ErrorContactProfilesState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<JobContactProfileEntity> profiles)  success,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,}) {final _that = this;
switch (_that) {
case InitialContactProfilesState():
return initial();case LoadingContactProfilesState():
return loading();case SuccessContactProfilesState():
return success(_that.profiles);case ErrorContactProfilesState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<JobContactProfileEntity> profiles)?  success,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,}) {final _that = this;
switch (_that) {
case InitialContactProfilesState() when initial != null:
return initial();case LoadingContactProfilesState() when loading != null:
return loading();case SuccessContactProfilesState() when success != null:
return success(_that.profiles);case ErrorContactProfilesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc


class InitialContactProfilesState implements ContactProfilesState {
  const InitialContactProfilesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialContactProfilesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactProfilesState.initial()';
}


}




/// @nodoc


class LoadingContactProfilesState implements ContactProfilesState {
  const LoadingContactProfilesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingContactProfilesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactProfilesState.loading()';
}


}




/// @nodoc


class SuccessContactProfilesState implements ContactProfilesState {
  const SuccessContactProfilesState({required final  List<JobContactProfileEntity> profiles}): _profiles = profiles;
  

 final  List<JobContactProfileEntity> _profiles;
 List<JobContactProfileEntity> get profiles {
  if (_profiles is EqualUnmodifiableListView) return _profiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profiles);
}


/// Create a copy of ContactProfilesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessContactProfilesStateCopyWith<SuccessContactProfilesState> get copyWith => _$SuccessContactProfilesStateCopyWithImpl<SuccessContactProfilesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessContactProfilesState&&const DeepCollectionEquality().equals(other._profiles, _profiles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_profiles));

@override
String toString() {
  return 'ContactProfilesState.success(profiles: $profiles)';
}


}

/// @nodoc
abstract mixin class $SuccessContactProfilesStateCopyWith<$Res> implements $ContactProfilesStateCopyWith<$Res> {
  factory $SuccessContactProfilesStateCopyWith(SuccessContactProfilesState value, $Res Function(SuccessContactProfilesState) _then) = _$SuccessContactProfilesStateCopyWithImpl;
@useResult
$Res call({
 List<JobContactProfileEntity> profiles
});




}
/// @nodoc
class _$SuccessContactProfilesStateCopyWithImpl<$Res>
    implements $SuccessContactProfilesStateCopyWith<$Res> {
  _$SuccessContactProfilesStateCopyWithImpl(this._self, this._then);

  final SuccessContactProfilesState _self;
  final $Res Function(SuccessContactProfilesState) _then;

/// Create a copy of ContactProfilesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profiles = null,}) {
  return _then(SuccessContactProfilesState(
profiles: null == profiles ? _self._profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<JobContactProfileEntity>,
  ));
}


}

/// @nodoc


class ErrorContactProfilesState implements ContactProfilesState {
  const ErrorContactProfilesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of ContactProfilesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorContactProfilesStateCopyWith<ErrorContactProfilesState> get copyWith => _$ErrorContactProfilesStateCopyWithImpl<ErrorContactProfilesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorContactProfilesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'ContactProfilesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorContactProfilesStateCopyWith<$Res> implements $ContactProfilesStateCopyWith<$Res> {
  factory $ErrorContactProfilesStateCopyWith(ErrorContactProfilesState value, $Res Function(ErrorContactProfilesState) _then) = _$ErrorContactProfilesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorContactProfilesStateCopyWithImpl<$Res>
    implements $ErrorContactProfilesStateCopyWith<$Res> {
  _$ErrorContactProfilesStateCopyWithImpl(this._self, this._then);

  final ErrorContactProfilesState _self;
  final $Res Function(ErrorContactProfilesState) _then;

/// Create a copy of ContactProfilesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorContactProfilesState(
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
