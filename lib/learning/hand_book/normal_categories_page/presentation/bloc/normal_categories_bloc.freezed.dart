// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NormalCategoriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NormalCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCategoriesEvent()';
}


}

/// @nodoc
class $NormalCategoriesEventCopyWith<$Res>  {
$NormalCategoriesEventCopyWith(NormalCategoriesEvent _, $Res Function(NormalCategoriesEvent) __);
}


/// Adds pattern-matching-related methods to [NormalCategoriesEvent].
extension NormalCategoriesEventPatterns on NormalCategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetNormalCategoriesEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetNormalCategoriesEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetNormalCategoriesEvent value)  get,}){
final _that = this;
switch (_that) {
case GetNormalCategoriesEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetNormalCategoriesEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetNormalCategoriesEvent() when get != null:
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
case GetNormalCategoriesEvent() when get != null:
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
case GetNormalCategoriesEvent():
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
case GetNormalCategoriesEvent() when get != null:
return get();case _:
  return null;

}
}

}

/// @nodoc


class GetNormalCategoriesEvent extends NormalCategoriesEvent {
  const GetNormalCategoriesEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNormalCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCategoriesEvent.get()';
}


}




/// @nodoc
mixin _$NormalCategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NormalCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCategoriesState()';
}


}

/// @nodoc
class $NormalCategoriesStateCopyWith<$Res>  {
$NormalCategoriesStateCopyWith(NormalCategoriesState _, $Res Function(NormalCategoriesState) __);
}


/// Adds pattern-matching-related methods to [NormalCategoriesState].
extension NormalCategoriesStatePatterns on NormalCategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingNormalCategoriesState value)?  loading,TResult Function( ErrorNormalCategoriesState value)?  error,TResult Function( SuccessNormalCategoriesState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingNormalCategoriesState() when loading != null:
return loading(_that);case ErrorNormalCategoriesState() when error != null:
return error(_that);case SuccessNormalCategoriesState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingNormalCategoriesState value)  loading,required TResult Function( ErrorNormalCategoriesState value)  error,required TResult Function( SuccessNormalCategoriesState value)  success,}){
final _that = this;
switch (_that) {
case LoadingNormalCategoriesState():
return loading(_that);case ErrorNormalCategoriesState():
return error(_that);case SuccessNormalCategoriesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingNormalCategoriesState value)?  loading,TResult? Function( ErrorNormalCategoriesState value)?  error,TResult? Function( SuccessNormalCategoriesState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingNormalCategoriesState() when loading != null:
return loading(_that);case ErrorNormalCategoriesState() when error != null:
return error(_that);case SuccessNormalCategoriesState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<NormalCategoriesEntity> normalCategories)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingNormalCategoriesState() when loading != null:
return loading();case ErrorNormalCategoriesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNormalCategoriesState() when success != null:
return success(_that.normalCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<NormalCategoriesEntity> normalCategories)  success,}) {final _that = this;
switch (_that) {
case LoadingNormalCategoriesState():
return loading();case ErrorNormalCategoriesState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNormalCategoriesState():
return success(_that.normalCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<NormalCategoriesEntity> normalCategories)?  success,}) {final _that = this;
switch (_that) {
case LoadingNormalCategoriesState() when loading != null:
return loading();case ErrorNormalCategoriesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNormalCategoriesState() when success != null:
return success(_that.normalCategories);case _:
  return null;

}
}

}

/// @nodoc


class LoadingNormalCategoriesState extends NormalCategoriesState {
  const LoadingNormalCategoriesState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingNormalCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCategoriesState.loading()';
}


}




/// @nodoc


class ErrorNormalCategoriesState extends NormalCategoriesState {
  const ErrorNormalCategoriesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of NormalCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorNormalCategoriesStateCopyWith<ErrorNormalCategoriesState> get copyWith => _$ErrorNormalCategoriesStateCopyWithImpl<ErrorNormalCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorNormalCategoriesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'NormalCategoriesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorNormalCategoriesStateCopyWith<$Res> implements $NormalCategoriesStateCopyWith<$Res> {
  factory $ErrorNormalCategoriesStateCopyWith(ErrorNormalCategoriesState value, $Res Function(ErrorNormalCategoriesState) _then) = _$ErrorNormalCategoriesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorNormalCategoriesStateCopyWithImpl<$Res>
    implements $ErrorNormalCategoriesStateCopyWith<$Res> {
  _$ErrorNormalCategoriesStateCopyWithImpl(this._self, this._then);

  final ErrorNormalCategoriesState _self;
  final $Res Function(ErrorNormalCategoriesState) _then;

/// Create a copy of NormalCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorNormalCategoriesState(
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


class SuccessNormalCategoriesState extends NormalCategoriesState {
  const SuccessNormalCategoriesState({required final  List<NormalCategoriesEntity> normalCategories}): _normalCategories = normalCategories,super._();
  

 final  List<NormalCategoriesEntity> _normalCategories;
 List<NormalCategoriesEntity> get normalCategories {
  if (_normalCategories is EqualUnmodifiableListView) return _normalCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_normalCategories);
}


/// Create a copy of NormalCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessNormalCategoriesStateCopyWith<SuccessNormalCategoriesState> get copyWith => _$SuccessNormalCategoriesStateCopyWithImpl<SuccessNormalCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessNormalCategoriesState&&const DeepCollectionEquality().equals(other._normalCategories, _normalCategories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_normalCategories));

@override
String toString() {
  return 'NormalCategoriesState.success(normalCategories: $normalCategories)';
}


}

/// @nodoc
abstract mixin class $SuccessNormalCategoriesStateCopyWith<$Res> implements $NormalCategoriesStateCopyWith<$Res> {
  factory $SuccessNormalCategoriesStateCopyWith(SuccessNormalCategoriesState value, $Res Function(SuccessNormalCategoriesState) _then) = _$SuccessNormalCategoriesStateCopyWithImpl;
@useResult
$Res call({
 List<NormalCategoriesEntity> normalCategories
});




}
/// @nodoc
class _$SuccessNormalCategoriesStateCopyWithImpl<$Res>
    implements $SuccessNormalCategoriesStateCopyWith<$Res> {
  _$SuccessNormalCategoriesStateCopyWithImpl(this._self, this._then);

  final SuccessNormalCategoriesState _self;
  final $Res Function(SuccessNormalCategoriesState) _then;

/// Create a copy of NormalCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? normalCategories = null,}) {
  return _then(SuccessNormalCategoriesState(
normalCategories: null == normalCategories ? _self._normalCategories : normalCategories // ignore: cast_nullable_to_non_nullable
as List<NormalCategoriesEntity>,
  ));
}


}

// dart format on
