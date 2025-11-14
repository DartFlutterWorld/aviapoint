// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_sertificates_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TypeSertificatesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeSertificatesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeSertificatesEvent()';
}


}

/// @nodoc
class $TypeSertificatesEventCopyWith<$Res>  {
$TypeSertificatesEventCopyWith(TypeSertificatesEvent _, $Res Function(TypeSertificatesEvent) __);
}


/// Adds pattern-matching-related methods to [TypeSertificatesEvent].
extension TypeSertificatesEventPatterns on TypeSertificatesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetTypeSertificatesEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetTypeSertificatesEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetTypeSertificatesEvent value)  get,}){
final _that = this;
switch (_that) {
case GetTypeSertificatesEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetTypeSertificatesEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetTypeSertificatesEvent() when get != null:
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
case GetTypeSertificatesEvent() when get != null:
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
case GetTypeSertificatesEvent():
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
case GetTypeSertificatesEvent() when get != null:
return get();case _:
  return null;

}
}

}

/// @nodoc


class GetTypeSertificatesEvent extends TypeSertificatesEvent {
  const GetTypeSertificatesEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTypeSertificatesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeSertificatesEvent.get()';
}


}




/// @nodoc
mixin _$TypeSertificatesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeSertificatesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeSertificatesState()';
}


}

/// @nodoc
class $TypeSertificatesStateCopyWith<$Res>  {
$TypeSertificatesStateCopyWith(TypeSertificatesState _, $Res Function(TypeSertificatesState) __);
}


/// Adds pattern-matching-related methods to [TypeSertificatesState].
extension TypeSertificatesStatePatterns on TypeSertificatesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingTypeSertificatesState value)?  loading,TResult Function( ErrorTypeSertificatesState value)?  error,TResult Function( SuccessTypeSertificatesState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingTypeSertificatesState() when loading != null:
return loading(_that);case ErrorTypeSertificatesState() when error != null:
return error(_that);case SuccessTypeSertificatesState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingTypeSertificatesState value)  loading,required TResult Function( ErrorTypeSertificatesState value)  error,required TResult Function( SuccessTypeSertificatesState value)  success,}){
final _that = this;
switch (_that) {
case LoadingTypeSertificatesState():
return loading(_that);case ErrorTypeSertificatesState():
return error(_that);case SuccessTypeSertificatesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingTypeSertificatesState value)?  loading,TResult? Function( ErrorTypeSertificatesState value)?  error,TResult? Function( SuccessTypeSertificatesState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingTypeSertificatesState() when loading != null:
return loading(_that);case ErrorTypeSertificatesState() when error != null:
return error(_that);case SuccessTypeSertificatesState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<TypeSertificatesEntity> typeSertificates)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingTypeSertificatesState() when loading != null:
return loading();case ErrorTypeSertificatesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessTypeSertificatesState() when success != null:
return success(_that.typeSertificates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<TypeSertificatesEntity> typeSertificates)  success,}) {final _that = this;
switch (_that) {
case LoadingTypeSertificatesState():
return loading();case ErrorTypeSertificatesState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessTypeSertificatesState():
return success(_that.typeSertificates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<TypeSertificatesEntity> typeSertificates)?  success,}) {final _that = this;
switch (_that) {
case LoadingTypeSertificatesState() when loading != null:
return loading();case ErrorTypeSertificatesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessTypeSertificatesState() when success != null:
return success(_that.typeSertificates);case _:
  return null;

}
}

}

/// @nodoc


class LoadingTypeSertificatesState extends TypeSertificatesState {
  const LoadingTypeSertificatesState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingTypeSertificatesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypeSertificatesState.loading()';
}


}




/// @nodoc


class ErrorTypeSertificatesState extends TypeSertificatesState {
  const ErrorTypeSertificatesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of TypeSertificatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorTypeSertificatesStateCopyWith<ErrorTypeSertificatesState> get copyWith => _$ErrorTypeSertificatesStateCopyWithImpl<ErrorTypeSertificatesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorTypeSertificatesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'TypeSertificatesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorTypeSertificatesStateCopyWith<$Res> implements $TypeSertificatesStateCopyWith<$Res> {
  factory $ErrorTypeSertificatesStateCopyWith(ErrorTypeSertificatesState value, $Res Function(ErrorTypeSertificatesState) _then) = _$ErrorTypeSertificatesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorTypeSertificatesStateCopyWithImpl<$Res>
    implements $ErrorTypeSertificatesStateCopyWith<$Res> {
  _$ErrorTypeSertificatesStateCopyWithImpl(this._self, this._then);

  final ErrorTypeSertificatesState _self;
  final $Res Function(ErrorTypeSertificatesState) _then;

/// Create a copy of TypeSertificatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorTypeSertificatesState(
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


class SuccessTypeSertificatesState extends TypeSertificatesState {
  const SuccessTypeSertificatesState({required final  List<TypeSertificatesEntity> typeSertificates}): _typeSertificates = typeSertificates,super._();
  

 final  List<TypeSertificatesEntity> _typeSertificates;
 List<TypeSertificatesEntity> get typeSertificates {
  if (_typeSertificates is EqualUnmodifiableListView) return _typeSertificates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typeSertificates);
}


/// Create a copy of TypeSertificatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessTypeSertificatesStateCopyWith<SuccessTypeSertificatesState> get copyWith => _$SuccessTypeSertificatesStateCopyWithImpl<SuccessTypeSertificatesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessTypeSertificatesState&&const DeepCollectionEquality().equals(other._typeSertificates, _typeSertificates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_typeSertificates));

@override
String toString() {
  return 'TypeSertificatesState.success(typeSertificates: $typeSertificates)';
}


}

/// @nodoc
abstract mixin class $SuccessTypeSertificatesStateCopyWith<$Res> implements $TypeSertificatesStateCopyWith<$Res> {
  factory $SuccessTypeSertificatesStateCopyWith(SuccessTypeSertificatesState value, $Res Function(SuccessTypeSertificatesState) _then) = _$SuccessTypeSertificatesStateCopyWithImpl;
@useResult
$Res call({
 List<TypeSertificatesEntity> typeSertificates
});




}
/// @nodoc
class _$SuccessTypeSertificatesStateCopyWithImpl<$Res>
    implements $SuccessTypeSertificatesStateCopyWith<$Res> {
  _$SuccessTypeSertificatesStateCopyWithImpl(this._self, this._then);

  final SuccessTypeSertificatesState _self;
  final $Res Function(SuccessTypeSertificatesState) _then;

/// Create a copy of TypeSertificatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? typeSertificates = null,}) {
  return _then(SuccessTypeSertificatesState(
typeSertificates: null == typeSertificates ? _self._typeSertificates : typeSertificates // ignore: cast_nullable_to_non_nullable
as List<TypeSertificatesEntity>,
  ));
}


}

// dart format on
