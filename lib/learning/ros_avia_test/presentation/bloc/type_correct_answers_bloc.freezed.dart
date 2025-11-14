// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_correct_answers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TypeCorrectAnswersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeCorrectAnswersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeCorrectAnswersEvent()';
}


}

/// @nodoc
class $TypeCorrectAnswersEventCopyWith<$Res>  {
$TypeCorrectAnswersEventCopyWith(TypeCorrectAnswersEvent _, $Res Function(TypeCorrectAnswersEvent) __);
}


/// Adds pattern-matching-related methods to [TypeCorrectAnswersEvent].
extension TypeCorrectAnswersEventPatterns on TypeCorrectAnswersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetTypeCorrectAnswersEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetTypeCorrectAnswersEvent() when get != null:
return get(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetTypeCorrectAnswersEvent value)  get,}){
final _that = this;
switch (_that) {
case GetTypeCorrectAnswersEvent():
return get(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetTypeCorrectAnswersEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetTypeCorrectAnswersEvent() when get != null:
return get(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  get,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetTypeCorrectAnswersEvent() when get != null:
return get();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  get,}) {final _that = this;
switch (_that) {
case GetTypeCorrectAnswersEvent():
return get();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  get,}) {final _that = this;
switch (_that) {
case GetTypeCorrectAnswersEvent() when get != null:
return get();case _:
  return null;

}
}

}

/// @nodoc


class GetTypeCorrectAnswersEvent extends TypeCorrectAnswersEvent {
  const GetTypeCorrectAnswersEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTypeCorrectAnswersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeCorrectAnswersEvent.get()';
}


}




/// @nodoc
mixin _$TypeCorrectAnswersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeCorrectAnswersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeCorrectAnswersState()';
}


}

/// @nodoc
class $TypeCorrectAnswersStateCopyWith<$Res>  {
$TypeCorrectAnswersStateCopyWith(TypeCorrectAnswersState _, $Res Function(TypeCorrectAnswersState) __);
}


/// Adds pattern-matching-related methods to [TypeCorrectAnswersState].
extension TypeCorrectAnswersStatePatterns on TypeCorrectAnswersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingTypeCorrectAnswersState value)?  loading,TResult Function( ErrorTypeCorrectAnswersState value)?  error,TResult Function( SuccessTypeCorrectAnswersState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingTypeCorrectAnswersState() when loading != null:
return loading(_that);case ErrorTypeCorrectAnswersState() when error != null:
return error(_that);case SuccessTypeCorrectAnswersState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingTypeCorrectAnswersState value)  loading,required TResult Function( ErrorTypeCorrectAnswersState value)  error,required TResult Function( SuccessTypeCorrectAnswersState value)  success,}){
final _that = this;
switch (_that) {
case LoadingTypeCorrectAnswersState():
return loading(_that);case ErrorTypeCorrectAnswersState():
return error(_that);case SuccessTypeCorrectAnswersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingTypeCorrectAnswersState value)?  loading,TResult? Function( ErrorTypeCorrectAnswersState value)?  error,TResult? Function( SuccessTypeCorrectAnswersState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingTypeCorrectAnswersState() when loading != null:
return loading(_that);case ErrorTypeCorrectAnswersState() when error != null:
return error(_that);case SuccessTypeCorrectAnswersState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<TypeCorrectAnswerEntity> typeCorrectAnswer)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingTypeCorrectAnswersState() when loading != null:
return loading();case ErrorTypeCorrectAnswersState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessTypeCorrectAnswersState() when success != null:
return success(_that.typeCorrectAnswer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<TypeCorrectAnswerEntity> typeCorrectAnswer)  success,}) {final _that = this;
switch (_that) {
case LoadingTypeCorrectAnswersState():
return loading();case ErrorTypeCorrectAnswersState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessTypeCorrectAnswersState():
return success(_that.typeCorrectAnswer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<TypeCorrectAnswerEntity> typeCorrectAnswer)?  success,}) {final _that = this;
switch (_that) {
case LoadingTypeCorrectAnswersState() when loading != null:
return loading();case ErrorTypeCorrectAnswersState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessTypeCorrectAnswersState() when success != null:
return success(_that.typeCorrectAnswer);case _:
  return null;

}
}

}

/// @nodoc


class LoadingTypeCorrectAnswersState extends TypeCorrectAnswersState {
  const LoadingTypeCorrectAnswersState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingTypeCorrectAnswersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeCorrectAnswersState.loading()';
}


}




/// @nodoc


class ErrorTypeCorrectAnswersState extends TypeCorrectAnswersState {
  const ErrorTypeCorrectAnswersState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of TypeCorrectAnswersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorTypeCorrectAnswersStateCopyWith<ErrorTypeCorrectAnswersState> get copyWith => _$ErrorTypeCorrectAnswersStateCopyWithImpl<ErrorTypeCorrectAnswersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorTypeCorrectAnswersState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'TypeCorrectAnswersState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorTypeCorrectAnswersStateCopyWith<$Res> implements $TypeCorrectAnswersStateCopyWith<$Res> {
  factory $ErrorTypeCorrectAnswersStateCopyWith(ErrorTypeCorrectAnswersState value, $Res Function(ErrorTypeCorrectAnswersState) _then) = _$ErrorTypeCorrectAnswersStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorTypeCorrectAnswersStateCopyWithImpl<$Res>
    implements $ErrorTypeCorrectAnswersStateCopyWith<$Res> {
  _$ErrorTypeCorrectAnswersStateCopyWithImpl(this._self, this._then);

  final ErrorTypeCorrectAnswersState _self;
  final $Res Function(ErrorTypeCorrectAnswersState) _then;

/// Create a copy of TypeCorrectAnswersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorTypeCorrectAnswersState(
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


class SuccessTypeCorrectAnswersState extends TypeCorrectAnswersState {
  const SuccessTypeCorrectAnswersState({required final  List<TypeCorrectAnswerEntity> typeCorrectAnswer}): _typeCorrectAnswer = typeCorrectAnswer,super._();
  

 final  List<TypeCorrectAnswerEntity> _typeCorrectAnswer;
 List<TypeCorrectAnswerEntity> get typeCorrectAnswer {
  if (_typeCorrectAnswer is EqualUnmodifiableListView) return _typeCorrectAnswer;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typeCorrectAnswer);
}


/// Create a copy of TypeCorrectAnswersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessTypeCorrectAnswersStateCopyWith<SuccessTypeCorrectAnswersState> get copyWith => _$SuccessTypeCorrectAnswersStateCopyWithImpl<SuccessTypeCorrectAnswersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessTypeCorrectAnswersState&&const DeepCollectionEquality().equals(other._typeCorrectAnswer, _typeCorrectAnswer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_typeCorrectAnswer));

@override
String toString() {
  return 'TypeCorrectAnswersState.success(typeCorrectAnswer: $typeCorrectAnswer)';
}


}

/// @nodoc
abstract mixin class $SuccessTypeCorrectAnswersStateCopyWith<$Res> implements $TypeCorrectAnswersStateCopyWith<$Res> {
  factory $SuccessTypeCorrectAnswersStateCopyWith(SuccessTypeCorrectAnswersState value, $Res Function(SuccessTypeCorrectAnswersState) _then) = _$SuccessTypeCorrectAnswersStateCopyWithImpl;
@useResult
$Res call({
 List<TypeCorrectAnswerEntity> typeCorrectAnswer
});




}
/// @nodoc
class _$SuccessTypeCorrectAnswersStateCopyWithImpl<$Res>
    implements $SuccessTypeCorrectAnswersStateCopyWith<$Res> {
  _$SuccessTypeCorrectAnswersStateCopyWithImpl(this._self, this._then);

  final SuccessTypeCorrectAnswersState _self;
  final $Res Function(SuccessTypeCorrectAnswersState) _then;

/// Create a copy of TypeCorrectAnswersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? typeCorrectAnswer = null,}) {
  return _then(SuccessTypeCorrectAnswersState(
typeCorrectAnswer: null == typeCorrectAnswer ? _self._typeCorrectAnswer : typeCorrectAnswer // ignore: cast_nullable_to_non_nullable
as List<TypeCorrectAnswerEntity>,
  ));
}


}

// dart format on
