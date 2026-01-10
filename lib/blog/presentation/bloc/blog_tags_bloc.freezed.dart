// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_tags_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlogTagsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogTagsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogTagsEvent()';
}


}

/// @nodoc
class $BlogTagsEventCopyWith<$Res>  {
$BlogTagsEventCopyWith(BlogTagsEvent _, $Res Function(BlogTagsEvent) __);
}


/// Adds pattern-matching-related methods to [BlogTagsEvent].
extension BlogTagsEventPatterns on BlogTagsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetBlogTagsEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetBlogTagsEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetBlogTagsEvent value)  get,}){
final _that = this;
switch (_that) {
case GetBlogTagsEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetBlogTagsEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetBlogTagsEvent() when get != null:
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
case GetBlogTagsEvent() when get != null:
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
case GetBlogTagsEvent():
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
case GetBlogTagsEvent() when get != null:
return get();case _:
  return null;

}
}

}

/// @nodoc


class GetBlogTagsEvent extends BlogTagsEvent {
  const GetBlogTagsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBlogTagsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogTagsEvent.get()';
}


}




/// @nodoc
mixin _$BlogTagsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogTagsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogTagsState()';
}


}

/// @nodoc
class $BlogTagsStateCopyWith<$Res>  {
$BlogTagsStateCopyWith(BlogTagsState _, $Res Function(BlogTagsState) __);
}


/// Adds pattern-matching-related methods to [BlogTagsState].
extension BlogTagsStatePatterns on BlogTagsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingBlogTagsState value)?  loading,TResult Function( ErrorBlogTagsState value)?  error,TResult Function( SuccessBlogTagsState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingBlogTagsState() when loading != null:
return loading(_that);case ErrorBlogTagsState() when error != null:
return error(_that);case SuccessBlogTagsState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingBlogTagsState value)  loading,required TResult Function( ErrorBlogTagsState value)  error,required TResult Function( SuccessBlogTagsState value)  success,}){
final _that = this;
switch (_that) {
case LoadingBlogTagsState():
return loading(_that);case ErrorBlogTagsState():
return error(_that);case SuccessBlogTagsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingBlogTagsState value)?  loading,TResult? Function( ErrorBlogTagsState value)?  error,TResult? Function( SuccessBlogTagsState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingBlogTagsState() when loading != null:
return loading(_that);case ErrorBlogTagsState() when error != null:
return error(_that);case SuccessBlogTagsState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<BlogTagEntity> tags)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingBlogTagsState() when loading != null:
return loading();case ErrorBlogTagsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogTagsState() when success != null:
return success(_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<BlogTagEntity> tags)  success,}) {final _that = this;
switch (_that) {
case LoadingBlogTagsState():
return loading();case ErrorBlogTagsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogTagsState():
return success(_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<BlogTagEntity> tags)?  success,}) {final _that = this;
switch (_that) {
case LoadingBlogTagsState() when loading != null:
return loading();case ErrorBlogTagsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogTagsState() when success != null:
return success(_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class LoadingBlogTagsState extends BlogTagsState {
  const LoadingBlogTagsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBlogTagsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogTagsState.loading()';
}


}




/// @nodoc


class ErrorBlogTagsState extends BlogTagsState {
  const ErrorBlogTagsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of BlogTagsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBlogTagsStateCopyWith<ErrorBlogTagsState> get copyWith => _$ErrorBlogTagsStateCopyWithImpl<ErrorBlogTagsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBlogTagsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'BlogTagsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorBlogTagsStateCopyWith<$Res> implements $BlogTagsStateCopyWith<$Res> {
  factory $ErrorBlogTagsStateCopyWith(ErrorBlogTagsState value, $Res Function(ErrorBlogTagsState) _then) = _$ErrorBlogTagsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorBlogTagsStateCopyWithImpl<$Res>
    implements $ErrorBlogTagsStateCopyWith<$Res> {
  _$ErrorBlogTagsStateCopyWithImpl(this._self, this._then);

  final ErrorBlogTagsState _self;
  final $Res Function(ErrorBlogTagsState) _then;

/// Create a copy of BlogTagsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorBlogTagsState(
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


class SuccessBlogTagsState extends BlogTagsState {
  const SuccessBlogTagsState({required final  List<BlogTagEntity> tags}): _tags = tags,super._();
  

 final  List<BlogTagEntity> _tags;
 List<BlogTagEntity> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of BlogTagsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessBlogTagsStateCopyWith<SuccessBlogTagsState> get copyWith => _$SuccessBlogTagsStateCopyWithImpl<SuccessBlogTagsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessBlogTagsState&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'BlogTagsState.success(tags: $tags)';
}


}

/// @nodoc
abstract mixin class $SuccessBlogTagsStateCopyWith<$Res> implements $BlogTagsStateCopyWith<$Res> {
  factory $SuccessBlogTagsStateCopyWith(SuccessBlogTagsState value, $Res Function(SuccessBlogTagsState) _then) = _$SuccessBlogTagsStateCopyWithImpl;
@useResult
$Res call({
 List<BlogTagEntity> tags
});




}
/// @nodoc
class _$SuccessBlogTagsStateCopyWithImpl<$Res>
    implements $SuccessBlogTagsStateCopyWith<$Res> {
  _$SuccessBlogTagsStateCopyWithImpl(this._self, this._then);

  final SuccessBlogTagsState _self;
  final $Res Function(SuccessBlogTagsState) _then;

/// Create a copy of BlogTagsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tags = null,}) {
  return _then(SuccessBlogTagsState(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<BlogTagEntity>,
  ));
}


}

// dart format on
