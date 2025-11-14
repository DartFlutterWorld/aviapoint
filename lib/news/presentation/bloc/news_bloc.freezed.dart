// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent()';
}


}

/// @nodoc
class $NewsEventCopyWith<$Res>  {
$NewsEventCopyWith(NewsEvent _, $Res Function(NewsEvent) __);
}


/// Adds pattern-matching-related methods to [NewsEvent].
extension NewsEventPatterns on NewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetNewsEvent value)?  get,TResult Function( GetNewsByCategoryEvent value)?  getNewsByCategory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get(_that);case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetNewsEvent value)  get,required TResult Function( GetNewsByCategoryEvent value)  getNewsByCategory,}){
final _that = this;
switch (_that) {
case GetNewsEvent():
return get(_that);case GetNewsByCategoryEvent():
return getNewsByCategory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetNewsEvent value)?  get,TResult? Function( GetNewsByCategoryEvent value)?  getNewsByCategory,}){
final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get(_that);case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  get,TResult Function( int categoryId)?  getNewsByCategory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get();case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  get,required TResult Function( int categoryId)  getNewsByCategory,}) {final _that = this;
switch (_that) {
case GetNewsEvent():
return get();case GetNewsByCategoryEvent():
return getNewsByCategory(_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  get,TResult? Function( int categoryId)?  getNewsByCategory,}) {final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get();case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc


class GetNewsEvent extends NewsEvent {
  const GetNewsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent.get()';
}


}




/// @nodoc


class GetNewsByCategoryEvent extends NewsEvent {
  const GetNewsByCategoryEvent({required this.categoryId}): super._();
  

 final  int categoryId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNewsByCategoryEventCopyWith<GetNewsByCategoryEvent> get copyWith => _$GetNewsByCategoryEventCopyWithImpl<GetNewsByCategoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNewsByCategoryEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'NewsEvent.getNewsByCategory(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $GetNewsByCategoryEventCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory $GetNewsByCategoryEventCopyWith(GetNewsByCategoryEvent value, $Res Function(GetNewsByCategoryEvent) _then) = _$GetNewsByCategoryEventCopyWithImpl;
@useResult
$Res call({
 int categoryId
});




}
/// @nodoc
class _$GetNewsByCategoryEventCopyWithImpl<$Res>
    implements $GetNewsByCategoryEventCopyWith<$Res> {
  _$GetNewsByCategoryEventCopyWithImpl(this._self, this._then);

  final GetNewsByCategoryEvent _self;
  final $Res Function(GetNewsByCategoryEvent) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(GetNewsByCategoryEvent(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState()';
}


}

/// @nodoc
class $NewsStateCopyWith<$Res>  {
$NewsStateCopyWith(NewsState _, $Res Function(NewsState) __);
}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingNewsState value)?  loading,TResult Function( ErrorNewsState value)?  error,TResult Function( SuccessNewsState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading(_that);case ErrorNewsState() when error != null:
return error(_that);case SuccessNewsState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingNewsState value)  loading,required TResult Function( ErrorNewsState value)  error,required TResult Function( SuccessNewsState value)  success,}){
final _that = this;
switch (_that) {
case LoadingNewsState():
return loading(_that);case ErrorNewsState():
return error(_that);case SuccessNewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingNewsState value)?  loading,TResult? Function( ErrorNewsState value)?  error,TResult? Function( SuccessNewsState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading(_that);case ErrorNewsState() when error != null:
return error(_that);case SuccessNewsState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<NewsEntity> news)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading();case ErrorNewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNewsState() when success != null:
return success(_that.news);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<NewsEntity> news)  success,}) {final _that = this;
switch (_that) {
case LoadingNewsState():
return loading();case ErrorNewsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNewsState():
return success(_that.news);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<NewsEntity> news)?  success,}) {final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading();case ErrorNewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNewsState() when success != null:
return success(_that.news);case _:
  return null;

}
}

}

/// @nodoc


class LoadingNewsState extends NewsState {
  const LoadingNewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.loading()';
}


}




/// @nodoc


class ErrorNewsState extends NewsState {
  const ErrorNewsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorNewsStateCopyWith<ErrorNewsState> get copyWith => _$ErrorNewsStateCopyWithImpl<ErrorNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorNewsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'NewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorNewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory $ErrorNewsStateCopyWith(ErrorNewsState value, $Res Function(ErrorNewsState) _then) = _$ErrorNewsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorNewsStateCopyWithImpl<$Res>
    implements $ErrorNewsStateCopyWith<$Res> {
  _$ErrorNewsStateCopyWithImpl(this._self, this._then);

  final ErrorNewsState _self;
  final $Res Function(ErrorNewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorNewsState(
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


class SuccessNewsState extends NewsState {
  const SuccessNewsState({required final  List<NewsEntity> news}): _news = news,super._();
  

 final  List<NewsEntity> _news;
 List<NewsEntity> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}


/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessNewsStateCopyWith<SuccessNewsState> get copyWith => _$SuccessNewsStateCopyWithImpl<SuccessNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessNewsState&&const DeepCollectionEquality().equals(other._news, _news));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news));

@override
String toString() {
  return 'NewsState.success(news: $news)';
}


}

/// @nodoc
abstract mixin class $SuccessNewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory $SuccessNewsStateCopyWith(SuccessNewsState value, $Res Function(SuccessNewsState) _then) = _$SuccessNewsStateCopyWithImpl;
@useResult
$Res call({
 List<NewsEntity> news
});




}
/// @nodoc
class _$SuccessNewsStateCopyWithImpl<$Res>
    implements $SuccessNewsStateCopyWith<$Res> {
  _$SuccessNewsStateCopyWithImpl(this._self, this._then);

  final SuccessNewsState _self;
  final $Res Function(SuccessNewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(SuccessNewsState(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>,
  ));
}


}

// dart format on
