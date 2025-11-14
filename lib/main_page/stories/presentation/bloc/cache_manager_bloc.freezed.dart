// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CacheManagerEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CacheManagerEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheManagerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CacheManagerEvent()';
}


}

/// @nodoc
class $CacheManagerEventCopyWith<$Res>  {
$CacheManagerEventCopyWith(CacheManagerEvent _, $Res Function(CacheManagerEvent) __);
}


/// Adds pattern-matching-related methods to [CacheManagerEvent].
extension CacheManagerEventPatterns on CacheManagerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetStoriesCacheManagerEvent value)?  getStories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetStoriesCacheManagerEvent() when getStories != null:
return getStories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetStoriesCacheManagerEvent value)  getStories,}){
final _that = this;
switch (_that) {
case GetStoriesCacheManagerEvent():
return getStories(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetStoriesCacheManagerEvent value)?  getStories,}){
final _that = this;
switch (_that) {
case GetStoriesCacheManagerEvent() when getStories != null:
return getStories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getStories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetStoriesCacheManagerEvent() when getStories != null:
return getStories();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getStories,}) {final _that = this;
switch (_that) {
case GetStoriesCacheManagerEvent():
return getStories();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getStories,}) {final _that = this;
switch (_that) {
case GetStoriesCacheManagerEvent() when getStories != null:
return getStories();case _:
  return null;

}
}

}

/// @nodoc


class GetStoriesCacheManagerEvent extends CacheManagerEvent with DiagnosticableTreeMixin {
  const GetStoriesCacheManagerEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CacheManagerEvent.getStories'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoriesCacheManagerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CacheManagerEvent.getStories()';
}


}




/// @nodoc
mixin _$CacheManagerState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CacheManagerState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheManagerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CacheManagerState()';
}


}

/// @nodoc
class $CacheManagerStateCopyWith<$Res>  {
$CacheManagerStateCopyWith(CacheManagerState _, $Res Function(CacheManagerState) __);
}


/// Adds pattern-matching-related methods to [CacheManagerState].
extension CacheManagerStatePatterns on CacheManagerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingCacheManagerState value)?  loading,TResult Function( ErrorCacheManagerState value)?  error,TResult Function( SuccessCacheManagerState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingCacheManagerState() when loading != null:
return loading(_that);case ErrorCacheManagerState() when error != null:
return error(_that);case SuccessCacheManagerState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingCacheManagerState value)  loading,required TResult Function( ErrorCacheManagerState value)  error,required TResult Function( SuccessCacheManagerState value)  success,}){
final _that = this;
switch (_that) {
case LoadingCacheManagerState():
return loading(_that);case ErrorCacheManagerState():
return error(_that);case SuccessCacheManagerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingCacheManagerState value)?  loading,TResult? Function( ErrorCacheManagerState value)?  error,TResult? Function( SuccessCacheManagerState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingCacheManagerState() when loading != null:
return loading(_that);case ErrorCacheManagerState() when error != null:
return error(_that);case SuccessCacheManagerState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<StoryEntity> story)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingCacheManagerState() when loading != null:
return loading();case ErrorCacheManagerState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCacheManagerState() when success != null:
return success(_that.story);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<StoryEntity> story)  success,}) {final _that = this;
switch (_that) {
case LoadingCacheManagerState():
return loading();case ErrorCacheManagerState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCacheManagerState():
return success(_that.story);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<StoryEntity> story)?  success,}) {final _that = this;
switch (_that) {
case LoadingCacheManagerState() when loading != null:
return loading();case ErrorCacheManagerState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCacheManagerState() when success != null:
return success(_that.story);case _:
  return null;

}
}

}

/// @nodoc


class LoadingCacheManagerState extends CacheManagerState with DiagnosticableTreeMixin {
  const LoadingCacheManagerState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CacheManagerState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCacheManagerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CacheManagerState.loading()';
}


}




/// @nodoc


class ErrorCacheManagerState extends CacheManagerState with DiagnosticableTreeMixin {
  const ErrorCacheManagerState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of CacheManagerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCacheManagerStateCopyWith<ErrorCacheManagerState> get copyWith => _$ErrorCacheManagerStateCopyWithImpl<ErrorCacheManagerState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CacheManagerState.error'))
    ..add(DiagnosticsProperty('errorFromApi', errorFromApi))..add(DiagnosticsProperty('errorForUser', errorForUser))..add(DiagnosticsProperty('statusCode', statusCode))..add(DiagnosticsProperty('stackTrace', stackTrace))..add(DiagnosticsProperty('responseMessage', responseMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCacheManagerState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CacheManagerState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorCacheManagerStateCopyWith<$Res> implements $CacheManagerStateCopyWith<$Res> {
  factory $ErrorCacheManagerStateCopyWith(ErrorCacheManagerState value, $Res Function(ErrorCacheManagerState) _then) = _$ErrorCacheManagerStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorCacheManagerStateCopyWithImpl<$Res>
    implements $ErrorCacheManagerStateCopyWith<$Res> {
  _$ErrorCacheManagerStateCopyWithImpl(this._self, this._then);

  final ErrorCacheManagerState _self;
  final $Res Function(ErrorCacheManagerState) _then;

/// Create a copy of CacheManagerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorCacheManagerState(
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


class SuccessCacheManagerState extends CacheManagerState with DiagnosticableTreeMixin {
  const SuccessCacheManagerState({required final  List<StoryEntity> story}): _story = story,super._();
  

 final  List<StoryEntity> _story;
 List<StoryEntity> get story {
  if (_story is EqualUnmodifiableListView) return _story;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_story);
}


/// Create a copy of CacheManagerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCacheManagerStateCopyWith<SuccessCacheManagerState> get copyWith => _$SuccessCacheManagerStateCopyWithImpl<SuccessCacheManagerState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CacheManagerState.success'))
    ..add(DiagnosticsProperty('story', story));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCacheManagerState&&const DeepCollectionEquality().equals(other._story, _story));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_story));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CacheManagerState.success(story: $story)';
}


}

/// @nodoc
abstract mixin class $SuccessCacheManagerStateCopyWith<$Res> implements $CacheManagerStateCopyWith<$Res> {
  factory $SuccessCacheManagerStateCopyWith(SuccessCacheManagerState value, $Res Function(SuccessCacheManagerState) _then) = _$SuccessCacheManagerStateCopyWithImpl;
@useResult
$Res call({
 List<StoryEntity> story
});




}
/// @nodoc
class _$SuccessCacheManagerStateCopyWithImpl<$Res>
    implements $SuccessCacheManagerStateCopyWith<$Res> {
  _$SuccessCacheManagerStateCopyWithImpl(this._self, this._then);

  final SuccessCacheManagerState _self;
  final $Res Function(SuccessCacheManagerState) _then;

/// Create a copy of CacheManagerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? story = null,}) {
  return _then(SuccessCacheManagerState(
story: null == story ? _self._story : story // ignore: cast_nullable_to_non_nullable
as List<StoryEntity>,
  ));
}


}

// dart format on
