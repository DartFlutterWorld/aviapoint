// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailNewsEvent {

 int get id;
/// Create a copy of DetailNewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailNewsEventCopyWith<DetailNewsEvent> get copyWith => _$DetailNewsEventCopyWithImpl<DetailNewsEvent>(this as DetailNewsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailNewsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DetailNewsEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $DetailNewsEventCopyWith<$Res>  {
  factory $DetailNewsEventCopyWith(DetailNewsEvent value, $Res Function(DetailNewsEvent) _then) = _$DetailNewsEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DetailNewsEventCopyWithImpl<$Res>
    implements $DetailNewsEventCopyWith<$Res> {
  _$DetailNewsEventCopyWithImpl(this._self, this._then);

  final DetailNewsEvent _self;
  final $Res Function(DetailNewsEvent) _then;

/// Create a copy of DetailNewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailNewsEvent].
extension DetailNewsEventPatterns on DetailNewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetDetailNewsEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetDetailNewsEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetDetailNewsEvent value)  get,}){
final _that = this;
switch (_that) {
case GetDetailNewsEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetDetailNewsEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetDetailNewsEvent() when get != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  get,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetDetailNewsEvent() when get != null:
return get(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  get,}) {final _that = this;
switch (_that) {
case GetDetailNewsEvent():
return get(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  get,}) {final _that = this;
switch (_that) {
case GetDetailNewsEvent() when get != null:
return get(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetDetailNewsEvent extends DetailNewsEvent {
  const GetDetailNewsEvent({required this.id}): super._();
  

@override final  int id;

/// Create a copy of DetailNewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetDetailNewsEventCopyWith<GetDetailNewsEvent> get copyWith => _$GetDetailNewsEventCopyWithImpl<GetDetailNewsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDetailNewsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DetailNewsEvent.get(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetDetailNewsEventCopyWith<$Res> implements $DetailNewsEventCopyWith<$Res> {
  factory $GetDetailNewsEventCopyWith(GetDetailNewsEvent value, $Res Function(GetDetailNewsEvent) _then) = _$GetDetailNewsEventCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetDetailNewsEventCopyWithImpl<$Res>
    implements $GetDetailNewsEventCopyWith<$Res> {
  _$GetDetailNewsEventCopyWithImpl(this._self, this._then);

  final GetDetailNewsEvent _self;
  final $Res Function(GetDetailNewsEvent) _then;

/// Create a copy of DetailNewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetDetailNewsEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DetailNewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailNewsState()';
}


}

/// @nodoc
class $DetailNewsStateCopyWith<$Res>  {
$DetailNewsStateCopyWith(DetailNewsState _, $Res Function(DetailNewsState) __);
}


/// Adds pattern-matching-related methods to [DetailNewsState].
extension DetailNewsStatePatterns on DetailNewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingDetailNewsState value)?  loading,TResult Function( ErrorDetailNewsState value)?  error,TResult Function( SuccessDetailNewsState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingDetailNewsState() when loading != null:
return loading(_that);case ErrorDetailNewsState() when error != null:
return error(_that);case SuccessDetailNewsState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingDetailNewsState value)  loading,required TResult Function( ErrorDetailNewsState value)  error,required TResult Function( SuccessDetailNewsState value)  success,}){
final _that = this;
switch (_that) {
case LoadingDetailNewsState():
return loading(_that);case ErrorDetailNewsState():
return error(_that);case SuccessDetailNewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingDetailNewsState value)?  loading,TResult? Function( ErrorDetailNewsState value)?  error,TResult? Function( SuccessDetailNewsState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingDetailNewsState() when loading != null:
return loading(_that);case ErrorDetailNewsState() when error != null:
return error(_that);case SuccessDetailNewsState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( NewsEntity news)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingDetailNewsState() when loading != null:
return loading();case ErrorDetailNewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessDetailNewsState() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( NewsEntity news)  success,}) {final _that = this;
switch (_that) {
case LoadingDetailNewsState():
return loading();case ErrorDetailNewsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessDetailNewsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( NewsEntity news)?  success,}) {final _that = this;
switch (_that) {
case LoadingDetailNewsState() when loading != null:
return loading();case ErrorDetailNewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessDetailNewsState() when success != null:
return success(_that.news);case _:
  return null;

}
}

}

/// @nodoc


class LoadingDetailNewsState extends DetailNewsState {
  const LoadingDetailNewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingDetailNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailNewsState.loading()';
}


}




/// @nodoc


class ErrorDetailNewsState extends DetailNewsState {
  const ErrorDetailNewsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of DetailNewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorDetailNewsStateCopyWith<ErrorDetailNewsState> get copyWith => _$ErrorDetailNewsStateCopyWithImpl<ErrorDetailNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorDetailNewsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'DetailNewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorDetailNewsStateCopyWith<$Res> implements $DetailNewsStateCopyWith<$Res> {
  factory $ErrorDetailNewsStateCopyWith(ErrorDetailNewsState value, $Res Function(ErrorDetailNewsState) _then) = _$ErrorDetailNewsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorDetailNewsStateCopyWithImpl<$Res>
    implements $ErrorDetailNewsStateCopyWith<$Res> {
  _$ErrorDetailNewsStateCopyWithImpl(this._self, this._then);

  final ErrorDetailNewsState _self;
  final $Res Function(ErrorDetailNewsState) _then;

/// Create a copy of DetailNewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorDetailNewsState(
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


class SuccessDetailNewsState extends DetailNewsState {
  const SuccessDetailNewsState({required this.news}): super._();
  

 final  NewsEntity news;

/// Create a copy of DetailNewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessDetailNewsStateCopyWith<SuccessDetailNewsState> get copyWith => _$SuccessDetailNewsStateCopyWithImpl<SuccessDetailNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessDetailNewsState&&(identical(other.news, news) || other.news == news));
}


@override
int get hashCode => Object.hash(runtimeType,news);

@override
String toString() {
  return 'DetailNewsState.success(news: $news)';
}


}

/// @nodoc
abstract mixin class $SuccessDetailNewsStateCopyWith<$Res> implements $DetailNewsStateCopyWith<$Res> {
  factory $SuccessDetailNewsStateCopyWith(SuccessDetailNewsState value, $Res Function(SuccessDetailNewsState) _then) = _$SuccessDetailNewsStateCopyWithImpl;
@useResult
$Res call({
 NewsEntity news
});




}
/// @nodoc
class _$SuccessDetailNewsStateCopyWithImpl<$Res>
    implements $SuccessDetailNewsStateCopyWith<$Res> {
  _$SuccessDetailNewsStateCopyWithImpl(this._self, this._then);

  final SuccessDetailNewsState _self;
  final $Res Function(SuccessDetailNewsState) _then;

/// Create a copy of DetailNewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(SuccessDetailNewsState(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,
  ));
}


}

// dart format on
