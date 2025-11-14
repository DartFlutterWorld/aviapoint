// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailStoryEvent {

 int get id;
/// Create a copy of DetailStoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStoryEventCopyWith<DetailStoryEvent> get copyWith => _$DetailStoryEventCopyWithImpl<DetailStoryEvent>(this as DetailStoryEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailStoryEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DetailStoryEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $DetailStoryEventCopyWith<$Res>  {
  factory $DetailStoryEventCopyWith(DetailStoryEvent value, $Res Function(DetailStoryEvent) _then) = _$DetailStoryEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DetailStoryEventCopyWithImpl<$Res>
    implements $DetailStoryEventCopyWith<$Res> {
  _$DetailStoryEventCopyWithImpl(this._self, this._then);

  final DetailStoryEvent _self;
  final $Res Function(DetailStoryEvent) _then;

/// Create a copy of DetailStoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailStoryEvent].
extension DetailStoryEventPatterns on DetailStoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetDetailStoryEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetDetailStoryEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetDetailStoryEvent value)  get,}){
final _that = this;
switch (_that) {
case GetDetailStoryEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetDetailStoryEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetDetailStoryEvent() when get != null:
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
case GetDetailStoryEvent() when get != null:
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
case GetDetailStoryEvent():
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
case GetDetailStoryEvent() when get != null:
return get(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetDetailStoryEvent extends DetailStoryEvent {
  const GetDetailStoryEvent({required this.id}): super._();
  

@override final  int id;

/// Create a copy of DetailStoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetDetailStoryEventCopyWith<GetDetailStoryEvent> get copyWith => _$GetDetailStoryEventCopyWithImpl<GetDetailStoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDetailStoryEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DetailStoryEvent.get(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetDetailStoryEventCopyWith<$Res> implements $DetailStoryEventCopyWith<$Res> {
  factory $GetDetailStoryEventCopyWith(GetDetailStoryEvent value, $Res Function(GetDetailStoryEvent) _then) = _$GetDetailStoryEventCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetDetailStoryEventCopyWithImpl<$Res>
    implements $GetDetailStoryEventCopyWith<$Res> {
  _$GetDetailStoryEventCopyWithImpl(this._self, this._then);

  final GetDetailStoryEvent _self;
  final $Res Function(GetDetailStoryEvent) _then;

/// Create a copy of DetailStoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetDetailStoryEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DetailStoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailStoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailStoryState()';
}


}

/// @nodoc
class $DetailStoryStateCopyWith<$Res>  {
$DetailStoryStateCopyWith(DetailStoryState _, $Res Function(DetailStoryState) __);
}


/// Adds pattern-matching-related methods to [DetailStoryState].
extension DetailStoryStatePatterns on DetailStoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingDetailStoryState value)?  loading,TResult Function( ErrorDetailStoryState value)?  error,TResult Function( SuccessDetailStoryState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingDetailStoryState() when loading != null:
return loading(_that);case ErrorDetailStoryState() when error != null:
return error(_that);case SuccessDetailStoryState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingDetailStoryState value)  loading,required TResult Function( ErrorDetailStoryState value)  error,required TResult Function( SuccessDetailStoryState value)  success,}){
final _that = this;
switch (_that) {
case LoadingDetailStoryState():
return loading(_that);case ErrorDetailStoryState():
return error(_that);case SuccessDetailStoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingDetailStoryState value)?  loading,TResult? Function( ErrorDetailStoryState value)?  error,TResult? Function( SuccessDetailStoryState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingDetailStoryState() when loading != null:
return loading(_that);case ErrorDetailStoryState() when error != null:
return error(_that);case SuccessDetailStoryState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( StoryEntity detailstory)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingDetailStoryState() when loading != null:
return loading();case ErrorDetailStoryState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessDetailStoryState() when success != null:
return success(_that.detailstory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( StoryEntity detailstory)  success,}) {final _that = this;
switch (_that) {
case LoadingDetailStoryState():
return loading();case ErrorDetailStoryState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessDetailStoryState():
return success(_that.detailstory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( StoryEntity detailstory)?  success,}) {final _that = this;
switch (_that) {
case LoadingDetailStoryState() when loading != null:
return loading();case ErrorDetailStoryState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessDetailStoryState() when success != null:
return success(_that.detailstory);case _:
  return null;

}
}

}

/// @nodoc


class LoadingDetailStoryState extends DetailStoryState {
  const LoadingDetailStoryState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingDetailStoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailStoryState.loading()';
}


}




/// @nodoc


class ErrorDetailStoryState extends DetailStoryState {
  const ErrorDetailStoryState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of DetailStoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorDetailStoryStateCopyWith<ErrorDetailStoryState> get copyWith => _$ErrorDetailStoryStateCopyWithImpl<ErrorDetailStoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorDetailStoryState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'DetailStoryState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorDetailStoryStateCopyWith<$Res> implements $DetailStoryStateCopyWith<$Res> {
  factory $ErrorDetailStoryStateCopyWith(ErrorDetailStoryState value, $Res Function(ErrorDetailStoryState) _then) = _$ErrorDetailStoryStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorDetailStoryStateCopyWithImpl<$Res>
    implements $ErrorDetailStoryStateCopyWith<$Res> {
  _$ErrorDetailStoryStateCopyWithImpl(this._self, this._then);

  final ErrorDetailStoryState _self;
  final $Res Function(ErrorDetailStoryState) _then;

/// Create a copy of DetailStoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorDetailStoryState(
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


class SuccessDetailStoryState extends DetailStoryState {
  const SuccessDetailStoryState({required this.detailstory}): super._();
  

 final  StoryEntity detailstory;

/// Create a copy of DetailStoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessDetailStoryStateCopyWith<SuccessDetailStoryState> get copyWith => _$SuccessDetailStoryStateCopyWithImpl<SuccessDetailStoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessDetailStoryState&&(identical(other.detailstory, detailstory) || other.detailstory == detailstory));
}


@override
int get hashCode => Object.hash(runtimeType,detailstory);

@override
String toString() {
  return 'DetailStoryState.success(detailstory: $detailstory)';
}


}

/// @nodoc
abstract mixin class $SuccessDetailStoryStateCopyWith<$Res> implements $DetailStoryStateCopyWith<$Res> {
  factory $SuccessDetailStoryStateCopyWith(SuccessDetailStoryState value, $Res Function(SuccessDetailStoryState) _then) = _$SuccessDetailStoryStateCopyWithImpl;
@useResult
$Res call({
 StoryEntity detailstory
});




}
/// @nodoc
class _$SuccessDetailStoryStateCopyWithImpl<$Res>
    implements $SuccessDetailStoryStateCopyWith<$Res> {
  _$SuccessDetailStoryStateCopyWithImpl(this._self, this._then);

  final SuccessDetailStoryState _self;
  final $Res Function(SuccessDetailStoryState) _then;

/// Create a copy of DetailStoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detailstory = null,}) {
  return _then(SuccessDetailStoryState(
detailstory: null == detailstory ? _self.detailstory : detailstory // ignore: cast_nullable_to_non_nullable
as StoryEntity,
  ));
}


}

// dart format on
