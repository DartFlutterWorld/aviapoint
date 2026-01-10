// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_article_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlogArticleDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogArticleDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticleDetailEvent()';
}


}

/// @nodoc
class $BlogArticleDetailEventCopyWith<$Res>  {
$BlogArticleDetailEventCopyWith(BlogArticleDetailEvent _, $Res Function(BlogArticleDetailEvent) __);
}


/// Adds pattern-matching-related methods to [BlogArticleDetailEvent].
extension BlogArticleDetailEventPatterns on BlogArticleDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetBlogArticleByIdEvent value)?  getById,TResult Function( ResetBlogArticleDetailEvent value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetBlogArticleByIdEvent() when getById != null:
return getById(_that);case ResetBlogArticleDetailEvent() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetBlogArticleByIdEvent value)  getById,required TResult Function( ResetBlogArticleDetailEvent value)  reset,}){
final _that = this;
switch (_that) {
case GetBlogArticleByIdEvent():
return getById(_that);case ResetBlogArticleDetailEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetBlogArticleByIdEvent value)?  getById,TResult? Function( ResetBlogArticleDetailEvent value)?  reset,}){
final _that = this;
switch (_that) {
case GetBlogArticleByIdEvent() when getById != null:
return getById(_that);case ResetBlogArticleDetailEvent() when reset != null:
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
case GetBlogArticleByIdEvent() when getById != null:
return getById(_that.id);case ResetBlogArticleDetailEvent() when reset != null:
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
case GetBlogArticleByIdEvent():
return getById(_that.id);case ResetBlogArticleDetailEvent():
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
case GetBlogArticleByIdEvent() when getById != null:
return getById(_that.id);case ResetBlogArticleDetailEvent() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class GetBlogArticleByIdEvent extends BlogArticleDetailEvent {
  const GetBlogArticleByIdEvent({required this.id}): super._();
  

 final  int id;

/// Create a copy of BlogArticleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetBlogArticleByIdEventCopyWith<GetBlogArticleByIdEvent> get copyWith => _$GetBlogArticleByIdEventCopyWithImpl<GetBlogArticleByIdEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBlogArticleByIdEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'BlogArticleDetailEvent.getById(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetBlogArticleByIdEventCopyWith<$Res> implements $BlogArticleDetailEventCopyWith<$Res> {
  factory $GetBlogArticleByIdEventCopyWith(GetBlogArticleByIdEvent value, $Res Function(GetBlogArticleByIdEvent) _then) = _$GetBlogArticleByIdEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetBlogArticleByIdEventCopyWithImpl<$Res>
    implements $GetBlogArticleByIdEventCopyWith<$Res> {
  _$GetBlogArticleByIdEventCopyWithImpl(this._self, this._then);

  final GetBlogArticleByIdEvent _self;
  final $Res Function(GetBlogArticleByIdEvent) _then;

/// Create a copy of BlogArticleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetBlogArticleByIdEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ResetBlogArticleDetailEvent extends BlogArticleDetailEvent {
  const ResetBlogArticleDetailEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetBlogArticleDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticleDetailEvent.reset()';
}


}




/// @nodoc
mixin _$BlogArticleDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogArticleDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticleDetailState()';
}


}

/// @nodoc
class $BlogArticleDetailStateCopyWith<$Res>  {
$BlogArticleDetailStateCopyWith(BlogArticleDetailState _, $Res Function(BlogArticleDetailState) __);
}


/// Adds pattern-matching-related methods to [BlogArticleDetailState].
extension BlogArticleDetailStatePatterns on BlogArticleDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingBlogArticleDetailState value)?  loading,TResult Function( ErrorBlogArticleDetailState value)?  error,TResult Function( SuccessBlogArticleDetailState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingBlogArticleDetailState() when loading != null:
return loading(_that);case ErrorBlogArticleDetailState() when error != null:
return error(_that);case SuccessBlogArticleDetailState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingBlogArticleDetailState value)  loading,required TResult Function( ErrorBlogArticleDetailState value)  error,required TResult Function( SuccessBlogArticleDetailState value)  success,}){
final _that = this;
switch (_that) {
case LoadingBlogArticleDetailState():
return loading(_that);case ErrorBlogArticleDetailState():
return error(_that);case SuccessBlogArticleDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingBlogArticleDetailState value)?  loading,TResult? Function( ErrorBlogArticleDetailState value)?  error,TResult? Function( SuccessBlogArticleDetailState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingBlogArticleDetailState() when loading != null:
return loading(_that);case ErrorBlogArticleDetailState() when error != null:
return error(_that);case SuccessBlogArticleDetailState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( BlogArticleEntity article)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingBlogArticleDetailState() when loading != null:
return loading();case ErrorBlogArticleDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogArticleDetailState() when success != null:
return success(_that.article);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( BlogArticleEntity article)  success,}) {final _that = this;
switch (_that) {
case LoadingBlogArticleDetailState():
return loading();case ErrorBlogArticleDetailState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogArticleDetailState():
return success(_that.article);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( BlogArticleEntity article)?  success,}) {final _that = this;
switch (_that) {
case LoadingBlogArticleDetailState() when loading != null:
return loading();case ErrorBlogArticleDetailState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogArticleDetailState() when success != null:
return success(_that.article);case _:
  return null;

}
}

}

/// @nodoc


class LoadingBlogArticleDetailState extends BlogArticleDetailState {
  const LoadingBlogArticleDetailState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBlogArticleDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticleDetailState.loading()';
}


}




/// @nodoc


class ErrorBlogArticleDetailState extends BlogArticleDetailState {
  const ErrorBlogArticleDetailState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of BlogArticleDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBlogArticleDetailStateCopyWith<ErrorBlogArticleDetailState> get copyWith => _$ErrorBlogArticleDetailStateCopyWithImpl<ErrorBlogArticleDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBlogArticleDetailState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'BlogArticleDetailState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorBlogArticleDetailStateCopyWith<$Res> implements $BlogArticleDetailStateCopyWith<$Res> {
  factory $ErrorBlogArticleDetailStateCopyWith(ErrorBlogArticleDetailState value, $Res Function(ErrorBlogArticleDetailState) _then) = _$ErrorBlogArticleDetailStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorBlogArticleDetailStateCopyWithImpl<$Res>
    implements $ErrorBlogArticleDetailStateCopyWith<$Res> {
  _$ErrorBlogArticleDetailStateCopyWithImpl(this._self, this._then);

  final ErrorBlogArticleDetailState _self;
  final $Res Function(ErrorBlogArticleDetailState) _then;

/// Create a copy of BlogArticleDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorBlogArticleDetailState(
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


class SuccessBlogArticleDetailState extends BlogArticleDetailState {
  const SuccessBlogArticleDetailState({required this.article}): super._();
  

 final  BlogArticleEntity article;

/// Create a copy of BlogArticleDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessBlogArticleDetailStateCopyWith<SuccessBlogArticleDetailState> get copyWith => _$SuccessBlogArticleDetailStateCopyWithImpl<SuccessBlogArticleDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessBlogArticleDetailState&&(identical(other.article, article) || other.article == article));
}


@override
int get hashCode => Object.hash(runtimeType,article);

@override
String toString() {
  return 'BlogArticleDetailState.success(article: $article)';
}


}

/// @nodoc
abstract mixin class $SuccessBlogArticleDetailStateCopyWith<$Res> implements $BlogArticleDetailStateCopyWith<$Res> {
  factory $SuccessBlogArticleDetailStateCopyWith(SuccessBlogArticleDetailState value, $Res Function(SuccessBlogArticleDetailState) _then) = _$SuccessBlogArticleDetailStateCopyWithImpl;
@useResult
$Res call({
 BlogArticleEntity article
});




}
/// @nodoc
class _$SuccessBlogArticleDetailStateCopyWithImpl<$Res>
    implements $SuccessBlogArticleDetailStateCopyWith<$Res> {
  _$SuccessBlogArticleDetailStateCopyWithImpl(this._self, this._then);

  final SuccessBlogArticleDetailState _self;
  final $Res Function(SuccessBlogArticleDetailState) _then;

/// Create a copy of BlogArticleDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? article = null,}) {
  return _then(SuccessBlogArticleDetailState(
article: null == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as BlogArticleEntity,
  ));
}


}

// dart format on
