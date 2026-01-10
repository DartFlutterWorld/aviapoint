// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlogCategoriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCategoriesEvent()';
}


}

/// @nodoc
class $BlogCategoriesEventCopyWith<$Res>  {
$BlogCategoriesEventCopyWith(BlogCategoriesEvent _, $Res Function(BlogCategoriesEvent) __);
}


/// Adds pattern-matching-related methods to [BlogCategoriesEvent].
extension BlogCategoriesEventPatterns on BlogCategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetBlogCategoriesEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetBlogCategoriesEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetBlogCategoriesEvent value)  get,}){
final _that = this;
switch (_that) {
case GetBlogCategoriesEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetBlogCategoriesEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetBlogCategoriesEvent() when get != null:
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
case GetBlogCategoriesEvent() when get != null:
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
case GetBlogCategoriesEvent():
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
case GetBlogCategoriesEvent() when get != null:
return get();case _:
  return null;

}
}

}

/// @nodoc


class GetBlogCategoriesEvent extends BlogCategoriesEvent {
  const GetBlogCategoriesEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBlogCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCategoriesEvent.get()';
}


}




/// @nodoc
mixin _$BlogCategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCategoriesState()';
}


}

/// @nodoc
class $BlogCategoriesStateCopyWith<$Res>  {
$BlogCategoriesStateCopyWith(BlogCategoriesState _, $Res Function(BlogCategoriesState) __);
}


/// Adds pattern-matching-related methods to [BlogCategoriesState].
extension BlogCategoriesStatePatterns on BlogCategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingBlogCategoriesState value)?  loading,TResult Function( ErrorBlogCategoriesState value)?  error,TResult Function( SuccessBlogCategoriesState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingBlogCategoriesState() when loading != null:
return loading(_that);case ErrorBlogCategoriesState() when error != null:
return error(_that);case SuccessBlogCategoriesState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingBlogCategoriesState value)  loading,required TResult Function( ErrorBlogCategoriesState value)  error,required TResult Function( SuccessBlogCategoriesState value)  success,}){
final _that = this;
switch (_that) {
case LoadingBlogCategoriesState():
return loading(_that);case ErrorBlogCategoriesState():
return error(_that);case SuccessBlogCategoriesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingBlogCategoriesState value)?  loading,TResult? Function( ErrorBlogCategoriesState value)?  error,TResult? Function( SuccessBlogCategoriesState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingBlogCategoriesState() when loading != null:
return loading(_that);case ErrorBlogCategoriesState() when error != null:
return error(_that);case SuccessBlogCategoriesState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<BlogCategoryEntity> categories)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingBlogCategoriesState() when loading != null:
return loading();case ErrorBlogCategoriesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogCategoriesState() when success != null:
return success(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<BlogCategoryEntity> categories)  success,}) {final _that = this;
switch (_that) {
case LoadingBlogCategoriesState():
return loading();case ErrorBlogCategoriesState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogCategoriesState():
return success(_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<BlogCategoryEntity> categories)?  success,}) {final _that = this;
switch (_that) {
case LoadingBlogCategoriesState() when loading != null:
return loading();case ErrorBlogCategoriesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogCategoriesState() when success != null:
return success(_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class LoadingBlogCategoriesState extends BlogCategoriesState {
  const LoadingBlogCategoriesState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBlogCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogCategoriesState.loading()';
}


}




/// @nodoc


class ErrorBlogCategoriesState extends BlogCategoriesState {
  const ErrorBlogCategoriesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of BlogCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBlogCategoriesStateCopyWith<ErrorBlogCategoriesState> get copyWith => _$ErrorBlogCategoriesStateCopyWithImpl<ErrorBlogCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBlogCategoriesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'BlogCategoriesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorBlogCategoriesStateCopyWith<$Res> implements $BlogCategoriesStateCopyWith<$Res> {
  factory $ErrorBlogCategoriesStateCopyWith(ErrorBlogCategoriesState value, $Res Function(ErrorBlogCategoriesState) _then) = _$ErrorBlogCategoriesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorBlogCategoriesStateCopyWithImpl<$Res>
    implements $ErrorBlogCategoriesStateCopyWith<$Res> {
  _$ErrorBlogCategoriesStateCopyWithImpl(this._self, this._then);

  final ErrorBlogCategoriesState _self;
  final $Res Function(ErrorBlogCategoriesState) _then;

/// Create a copy of BlogCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorBlogCategoriesState(
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


class SuccessBlogCategoriesState extends BlogCategoriesState {
  const SuccessBlogCategoriesState({required final  List<BlogCategoryEntity> categories}): _categories = categories,super._();
  

 final  List<BlogCategoryEntity> _categories;
 List<BlogCategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of BlogCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessBlogCategoriesStateCopyWith<SuccessBlogCategoriesState> get copyWith => _$SuccessBlogCategoriesStateCopyWithImpl<SuccessBlogCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessBlogCategoriesState&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'BlogCategoriesState.success(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $SuccessBlogCategoriesStateCopyWith<$Res> implements $BlogCategoriesStateCopyWith<$Res> {
  factory $SuccessBlogCategoriesStateCopyWith(SuccessBlogCategoriesState value, $Res Function(SuccessBlogCategoriesState) _then) = _$SuccessBlogCategoriesStateCopyWithImpl;
@useResult
$Res call({
 List<BlogCategoryEntity> categories
});




}
/// @nodoc
class _$SuccessBlogCategoriesStateCopyWithImpl<$Res>
    implements $SuccessBlogCategoriesStateCopyWith<$Res> {
  _$SuccessBlogCategoriesStateCopyWithImpl(this._self, this._then);

  final SuccessBlogCategoriesState _self;
  final $Res Function(SuccessBlogCategoriesState) _then;

/// Create a copy of BlogCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(SuccessBlogCategoriesState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<BlogCategoryEntity>,
  ));
}


}

// dart format on
