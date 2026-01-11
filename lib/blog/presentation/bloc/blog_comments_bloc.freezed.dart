// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_comments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlogCommentsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogCommentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCommentsState()';
}


}

/// @nodoc
class $BlogCommentsStateCopyWith<$Res>  {
$BlogCommentsStateCopyWith(BlogCommentsState _, $Res Function(BlogCommentsState) __);
}


/// Adds pattern-matching-related methods to [BlogCommentsState].
extension BlogCommentsStatePatterns on BlogCommentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialBlogCommentsState value)?  initial,TResult Function( LoadingBlogCommentsState value)?  loading,TResult Function( ErrorBlogCommentsState value)?  error,TResult Function( SuccessBlogCommentsState value)?  success,TResult Function( CommentCreatedState value)?  commentCreated,TResult Function( CommentUpdatedState value)?  commentUpdated,TResult Function( CommentDeletedState value)?  commentDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialBlogCommentsState() when initial != null:
return initial(_that);case LoadingBlogCommentsState() when loading != null:
return loading(_that);case ErrorBlogCommentsState() when error != null:
return error(_that);case SuccessBlogCommentsState() when success != null:
return success(_that);case CommentCreatedState() when commentCreated != null:
return commentCreated(_that);case CommentUpdatedState() when commentUpdated != null:
return commentUpdated(_that);case CommentDeletedState() when commentDeleted != null:
return commentDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialBlogCommentsState value)  initial,required TResult Function( LoadingBlogCommentsState value)  loading,required TResult Function( ErrorBlogCommentsState value)  error,required TResult Function( SuccessBlogCommentsState value)  success,required TResult Function( CommentCreatedState value)  commentCreated,required TResult Function( CommentUpdatedState value)  commentUpdated,required TResult Function( CommentDeletedState value)  commentDeleted,}){
final _that = this;
switch (_that) {
case InitialBlogCommentsState():
return initial(_that);case LoadingBlogCommentsState():
return loading(_that);case ErrorBlogCommentsState():
return error(_that);case SuccessBlogCommentsState():
return success(_that);case CommentCreatedState():
return commentCreated(_that);case CommentUpdatedState():
return commentUpdated(_that);case CommentDeletedState():
return commentDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialBlogCommentsState value)?  initial,TResult? Function( LoadingBlogCommentsState value)?  loading,TResult? Function( ErrorBlogCommentsState value)?  error,TResult? Function( SuccessBlogCommentsState value)?  success,TResult? Function( CommentCreatedState value)?  commentCreated,TResult? Function( CommentUpdatedState value)?  commentUpdated,TResult? Function( CommentDeletedState value)?  commentDeleted,}){
final _that = this;
switch (_that) {
case InitialBlogCommentsState() when initial != null:
return initial(_that);case LoadingBlogCommentsState() when loading != null:
return loading(_that);case ErrorBlogCommentsState() when error != null:
return error(_that);case SuccessBlogCommentsState() when success != null:
return success(_that);case CommentCreatedState() when commentCreated != null:
return commentCreated(_that);case CommentUpdatedState() when commentUpdated != null:
return commentUpdated(_that);case CommentDeletedState() when commentDeleted != null:
return commentDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<BlogCommentEntity> comments)?  success,TResult Function( BlogCommentEntity comment)?  commentCreated,TResult Function( BlogCommentEntity comment)?  commentUpdated,TResult Function()?  commentDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialBlogCommentsState() when initial != null:
return initial();case LoadingBlogCommentsState() when loading != null:
return loading();case ErrorBlogCommentsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogCommentsState() when success != null:
return success(_that.comments);case CommentCreatedState() when commentCreated != null:
return commentCreated(_that.comment);case CommentUpdatedState() when commentUpdated != null:
return commentUpdated(_that.comment);case CommentDeletedState() when commentDeleted != null:
return commentDeleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<BlogCommentEntity> comments)  success,required TResult Function( BlogCommentEntity comment)  commentCreated,required TResult Function( BlogCommentEntity comment)  commentUpdated,required TResult Function()  commentDeleted,}) {final _that = this;
switch (_that) {
case InitialBlogCommentsState():
return initial();case LoadingBlogCommentsState():
return loading();case ErrorBlogCommentsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogCommentsState():
return success(_that.comments);case CommentCreatedState():
return commentCreated(_that.comment);case CommentUpdatedState():
return commentUpdated(_that.comment);case CommentDeletedState():
return commentDeleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<BlogCommentEntity> comments)?  success,TResult? Function( BlogCommentEntity comment)?  commentCreated,TResult? Function( BlogCommentEntity comment)?  commentUpdated,TResult? Function()?  commentDeleted,}) {final _that = this;
switch (_that) {
case InitialBlogCommentsState() when initial != null:
return initial();case LoadingBlogCommentsState() when loading != null:
return loading();case ErrorBlogCommentsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogCommentsState() when success != null:
return success(_that.comments);case CommentCreatedState() when commentCreated != null:
return commentCreated(_that.comment);case CommentUpdatedState() when commentUpdated != null:
return commentUpdated(_that.comment);case CommentDeletedState() when commentDeleted != null:
return commentDeleted();case _:
  return null;

}
}

}

/// @nodoc


class InitialBlogCommentsState extends BlogCommentsState {
  const InitialBlogCommentsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialBlogCommentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCommentsState.initial()';
}


}




/// @nodoc


class LoadingBlogCommentsState extends BlogCommentsState {
  const LoadingBlogCommentsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBlogCommentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCommentsState.loading()';
}


}




/// @nodoc


class ErrorBlogCommentsState extends BlogCommentsState {
  const ErrorBlogCommentsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBlogCommentsStateCopyWith<ErrorBlogCommentsState> get copyWith => _$ErrorBlogCommentsStateCopyWithImpl<ErrorBlogCommentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBlogCommentsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'BlogCommentsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorBlogCommentsStateCopyWith<$Res> implements $BlogCommentsStateCopyWith<$Res> {
  factory $ErrorBlogCommentsStateCopyWith(ErrorBlogCommentsState value, $Res Function(ErrorBlogCommentsState) _then) = _$ErrorBlogCommentsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorBlogCommentsStateCopyWithImpl<$Res>
    implements $ErrorBlogCommentsStateCopyWith<$Res> {
  _$ErrorBlogCommentsStateCopyWithImpl(this._self, this._then);

  final ErrorBlogCommentsState _self;
  final $Res Function(ErrorBlogCommentsState) _then;

/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorBlogCommentsState(
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


class SuccessBlogCommentsState extends BlogCommentsState {
  const SuccessBlogCommentsState({required final  List<BlogCommentEntity> comments}): _comments = comments,super._();
  

 final  List<BlogCommentEntity> _comments;
 List<BlogCommentEntity> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessBlogCommentsStateCopyWith<SuccessBlogCommentsState> get copyWith => _$SuccessBlogCommentsStateCopyWithImpl<SuccessBlogCommentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessBlogCommentsState&&const DeepCollectionEquality().equals(other._comments, _comments));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'BlogCommentsState.success(comments: $comments)';
}


}

/// @nodoc
abstract mixin class $SuccessBlogCommentsStateCopyWith<$Res> implements $BlogCommentsStateCopyWith<$Res> {
  factory $SuccessBlogCommentsStateCopyWith(SuccessBlogCommentsState value, $Res Function(SuccessBlogCommentsState) _then) = _$SuccessBlogCommentsStateCopyWithImpl;
@useResult
$Res call({
 List<BlogCommentEntity> comments
});




}
/// @nodoc
class _$SuccessBlogCommentsStateCopyWithImpl<$Res>
    implements $SuccessBlogCommentsStateCopyWith<$Res> {
  _$SuccessBlogCommentsStateCopyWithImpl(this._self, this._then);

  final SuccessBlogCommentsState _self;
  final $Res Function(SuccessBlogCommentsState) _then;

/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comments = null,}) {
  return _then(SuccessBlogCommentsState(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<BlogCommentEntity>,
  ));
}


}

/// @nodoc


class CommentCreatedState extends BlogCommentsState {
  const CommentCreatedState({required this.comment}): super._();
  

 final  BlogCommentEntity comment;

/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentCreatedStateCopyWith<CommentCreatedState> get copyWith => _$CommentCreatedStateCopyWithImpl<CommentCreatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentCreatedState&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'BlogCommentsState.commentCreated(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $CommentCreatedStateCopyWith<$Res> implements $BlogCommentsStateCopyWith<$Res> {
  factory $CommentCreatedStateCopyWith(CommentCreatedState value, $Res Function(CommentCreatedState) _then) = _$CommentCreatedStateCopyWithImpl;
@useResult
$Res call({
 BlogCommentEntity comment
});




}
/// @nodoc
class _$CommentCreatedStateCopyWithImpl<$Res>
    implements $CommentCreatedStateCopyWith<$Res> {
  _$CommentCreatedStateCopyWithImpl(this._self, this._then);

  final CommentCreatedState _self;
  final $Res Function(CommentCreatedState) _then;

/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(CommentCreatedState(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as BlogCommentEntity,
  ));
}


}

/// @nodoc


class CommentUpdatedState extends BlogCommentsState {
  const CommentUpdatedState({required this.comment}): super._();
  

 final  BlogCommentEntity comment;

/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentUpdatedStateCopyWith<CommentUpdatedState> get copyWith => _$CommentUpdatedStateCopyWithImpl<CommentUpdatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentUpdatedState&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'BlogCommentsState.commentUpdated(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $CommentUpdatedStateCopyWith<$Res> implements $BlogCommentsStateCopyWith<$Res> {
  factory $CommentUpdatedStateCopyWith(CommentUpdatedState value, $Res Function(CommentUpdatedState) _then) = _$CommentUpdatedStateCopyWithImpl;
@useResult
$Res call({
 BlogCommentEntity comment
});




}
/// @nodoc
class _$CommentUpdatedStateCopyWithImpl<$Res>
    implements $CommentUpdatedStateCopyWith<$Res> {
  _$CommentUpdatedStateCopyWithImpl(this._self, this._then);

  final CommentUpdatedState _self;
  final $Res Function(CommentUpdatedState) _then;

/// Create a copy of BlogCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(CommentUpdatedState(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as BlogCommentEntity,
  ));
}


}

/// @nodoc


class CommentDeletedState extends BlogCommentsState {
  const CommentDeletedState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDeletedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCommentsState.commentDeleted()';
}


}




// dart format on
