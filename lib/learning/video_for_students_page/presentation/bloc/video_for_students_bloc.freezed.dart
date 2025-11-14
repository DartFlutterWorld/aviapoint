// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_for_students_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoForStudentsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoForStudentsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoForStudentsEvent()';
}


}

/// @nodoc
class $VideoForStudentsEventCopyWith<$Res>  {
$VideoForStudentsEventCopyWith(VideoForStudentsEvent _, $Res Function(VideoForStudentsEvent) __);
}


/// Adds pattern-matching-related methods to [VideoForStudentsEvent].
extension VideoForStudentsEventPatterns on VideoForStudentsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetVideoForStudentsEvent value)?  get,TResult Function( GetByIdVideoForStudentsEvent value)?  getById,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetVideoForStudentsEvent() when get != null:
return get(_that);case GetByIdVideoForStudentsEvent() when getById != null:
return getById(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetVideoForStudentsEvent value)  get,required TResult Function( GetByIdVideoForStudentsEvent value)  getById,}){
final _that = this;
switch (_that) {
case GetVideoForStudentsEvent():
return get(_that);case GetByIdVideoForStudentsEvent():
return getById(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetVideoForStudentsEvent value)?  get,TResult? Function( GetByIdVideoForStudentsEvent value)?  getById,}){
final _that = this;
switch (_that) {
case GetVideoForStudentsEvent() when get != null:
return get(_that);case GetByIdVideoForStudentsEvent() when getById != null:
return getById(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  get,TResult Function( int id)?  getById,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetVideoForStudentsEvent() when get != null:
return get();case GetByIdVideoForStudentsEvent() when getById != null:
return getById(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  get,required TResult Function( int id)  getById,}) {final _that = this;
switch (_that) {
case GetVideoForStudentsEvent():
return get();case GetByIdVideoForStudentsEvent():
return getById(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  get,TResult? Function( int id)?  getById,}) {final _that = this;
switch (_that) {
case GetVideoForStudentsEvent() when get != null:
return get();case GetByIdVideoForStudentsEvent() when getById != null:
return getById(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetVideoForStudentsEvent extends VideoForStudentsEvent {
  const GetVideoForStudentsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetVideoForStudentsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoForStudentsEvent.get()';
}


}




/// @nodoc


class GetByIdVideoForStudentsEvent extends VideoForStudentsEvent {
  const GetByIdVideoForStudentsEvent(this.id): super._();
  

 final  int id;

/// Create a copy of VideoForStudentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetByIdVideoForStudentsEventCopyWith<GetByIdVideoForStudentsEvent> get copyWith => _$GetByIdVideoForStudentsEventCopyWithImpl<GetByIdVideoForStudentsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetByIdVideoForStudentsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'VideoForStudentsEvent.getById(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetByIdVideoForStudentsEventCopyWith<$Res> implements $VideoForStudentsEventCopyWith<$Res> {
  factory $GetByIdVideoForStudentsEventCopyWith(GetByIdVideoForStudentsEvent value, $Res Function(GetByIdVideoForStudentsEvent) _then) = _$GetByIdVideoForStudentsEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetByIdVideoForStudentsEventCopyWithImpl<$Res>
    implements $GetByIdVideoForStudentsEventCopyWith<$Res> {
  _$GetByIdVideoForStudentsEventCopyWithImpl(this._self, this._then);

  final GetByIdVideoForStudentsEvent _self;
  final $Res Function(GetByIdVideoForStudentsEvent) _then;

/// Create a copy of VideoForStudentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetByIdVideoForStudentsEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$VideoForStudentsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoForStudentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoForStudentsState()';
}


}

/// @nodoc
class $VideoForStudentsStateCopyWith<$Res>  {
$VideoForStudentsStateCopyWith(VideoForStudentsState _, $Res Function(VideoForStudentsState) __);
}


/// Adds pattern-matching-related methods to [VideoForStudentsState].
extension VideoForStudentsStatePatterns on VideoForStudentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingVideoForStudentsState value)?  loading,TResult Function( ErrorVideoForStudentsState value)?  error,TResult Function( SuccessVideoForStudentsState value)?  success,TResult Function( SuccessByIdVideoForStudentsState value)?  successById,TResult Function( DoneVideoForStudentsState value)?  done,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingVideoForStudentsState() when loading != null:
return loading(_that);case ErrorVideoForStudentsState() when error != null:
return error(_that);case SuccessVideoForStudentsState() when success != null:
return success(_that);case SuccessByIdVideoForStudentsState() when successById != null:
return successById(_that);case DoneVideoForStudentsState() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingVideoForStudentsState value)  loading,required TResult Function( ErrorVideoForStudentsState value)  error,required TResult Function( SuccessVideoForStudentsState value)  success,required TResult Function( SuccessByIdVideoForStudentsState value)  successById,required TResult Function( DoneVideoForStudentsState value)  done,}){
final _that = this;
switch (_that) {
case LoadingVideoForStudentsState():
return loading(_that);case ErrorVideoForStudentsState():
return error(_that);case SuccessVideoForStudentsState():
return success(_that);case SuccessByIdVideoForStudentsState():
return successById(_that);case DoneVideoForStudentsState():
return done(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingVideoForStudentsState value)?  loading,TResult? Function( ErrorVideoForStudentsState value)?  error,TResult? Function( SuccessVideoForStudentsState value)?  success,TResult? Function( SuccessByIdVideoForStudentsState value)?  successById,TResult? Function( DoneVideoForStudentsState value)?  done,}){
final _that = this;
switch (_that) {
case LoadingVideoForStudentsState() when loading != null:
return loading(_that);case ErrorVideoForStudentsState() when error != null:
return error(_that);case SuccessVideoForStudentsState() when success != null:
return success(_that);case SuccessByIdVideoForStudentsState() when successById != null:
return successById(_that);case DoneVideoForStudentsState() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<VideoForStudentsEntity> videoForStudents)?  success,TResult Function( VideoForStudentsEntity videoForStudents)?  successById,TResult Function()?  done,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingVideoForStudentsState() when loading != null:
return loading();case ErrorVideoForStudentsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessVideoForStudentsState() when success != null:
return success(_that.videoForStudents);case SuccessByIdVideoForStudentsState() when successById != null:
return successById(_that.videoForStudents);case DoneVideoForStudentsState() when done != null:
return done();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<VideoForStudentsEntity> videoForStudents)  success,required TResult Function( VideoForStudentsEntity videoForStudents)  successById,required TResult Function()  done,}) {final _that = this;
switch (_that) {
case LoadingVideoForStudentsState():
return loading();case ErrorVideoForStudentsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessVideoForStudentsState():
return success(_that.videoForStudents);case SuccessByIdVideoForStudentsState():
return successById(_that.videoForStudents);case DoneVideoForStudentsState():
return done();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<VideoForStudentsEntity> videoForStudents)?  success,TResult? Function( VideoForStudentsEntity videoForStudents)?  successById,TResult? Function()?  done,}) {final _that = this;
switch (_that) {
case LoadingVideoForStudentsState() when loading != null:
return loading();case ErrorVideoForStudentsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessVideoForStudentsState() when success != null:
return success(_that.videoForStudents);case SuccessByIdVideoForStudentsState() when successById != null:
return successById(_that.videoForStudents);case DoneVideoForStudentsState() when done != null:
return done();case _:
  return null;

}
}

}

/// @nodoc


class LoadingVideoForStudentsState extends VideoForStudentsState {
  const LoadingVideoForStudentsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingVideoForStudentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoForStudentsState.loading()';
}


}




/// @nodoc


class ErrorVideoForStudentsState extends VideoForStudentsState {
  const ErrorVideoForStudentsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of VideoForStudentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorVideoForStudentsStateCopyWith<ErrorVideoForStudentsState> get copyWith => _$ErrorVideoForStudentsStateCopyWithImpl<ErrorVideoForStudentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorVideoForStudentsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'VideoForStudentsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorVideoForStudentsStateCopyWith<$Res> implements $VideoForStudentsStateCopyWith<$Res> {
  factory $ErrorVideoForStudentsStateCopyWith(ErrorVideoForStudentsState value, $Res Function(ErrorVideoForStudentsState) _then) = _$ErrorVideoForStudentsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorVideoForStudentsStateCopyWithImpl<$Res>
    implements $ErrorVideoForStudentsStateCopyWith<$Res> {
  _$ErrorVideoForStudentsStateCopyWithImpl(this._self, this._then);

  final ErrorVideoForStudentsState _self;
  final $Res Function(ErrorVideoForStudentsState) _then;

/// Create a copy of VideoForStudentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorVideoForStudentsState(
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


class SuccessVideoForStudentsState extends VideoForStudentsState {
  const SuccessVideoForStudentsState({required final  List<VideoForStudentsEntity> videoForStudents}): _videoForStudents = videoForStudents,super._();
  

 final  List<VideoForStudentsEntity> _videoForStudents;
 List<VideoForStudentsEntity> get videoForStudents {
  if (_videoForStudents is EqualUnmodifiableListView) return _videoForStudents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videoForStudents);
}


/// Create a copy of VideoForStudentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessVideoForStudentsStateCopyWith<SuccessVideoForStudentsState> get copyWith => _$SuccessVideoForStudentsStateCopyWithImpl<SuccessVideoForStudentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessVideoForStudentsState&&const DeepCollectionEquality().equals(other._videoForStudents, _videoForStudents));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_videoForStudents));

@override
String toString() {
  return 'VideoForStudentsState.success(videoForStudents: $videoForStudents)';
}


}

/// @nodoc
abstract mixin class $SuccessVideoForStudentsStateCopyWith<$Res> implements $VideoForStudentsStateCopyWith<$Res> {
  factory $SuccessVideoForStudentsStateCopyWith(SuccessVideoForStudentsState value, $Res Function(SuccessVideoForStudentsState) _then) = _$SuccessVideoForStudentsStateCopyWithImpl;
@useResult
$Res call({
 List<VideoForStudentsEntity> videoForStudents
});




}
/// @nodoc
class _$SuccessVideoForStudentsStateCopyWithImpl<$Res>
    implements $SuccessVideoForStudentsStateCopyWith<$Res> {
  _$SuccessVideoForStudentsStateCopyWithImpl(this._self, this._then);

  final SuccessVideoForStudentsState _self;
  final $Res Function(SuccessVideoForStudentsState) _then;

/// Create a copy of VideoForStudentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoForStudents = null,}) {
  return _then(SuccessVideoForStudentsState(
videoForStudents: null == videoForStudents ? _self._videoForStudents : videoForStudents // ignore: cast_nullable_to_non_nullable
as List<VideoForStudentsEntity>,
  ));
}


}

/// @nodoc


class SuccessByIdVideoForStudentsState extends VideoForStudentsState {
  const SuccessByIdVideoForStudentsState({required this.videoForStudents}): super._();
  

 final  VideoForStudentsEntity videoForStudents;

/// Create a copy of VideoForStudentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessByIdVideoForStudentsStateCopyWith<SuccessByIdVideoForStudentsState> get copyWith => _$SuccessByIdVideoForStudentsStateCopyWithImpl<SuccessByIdVideoForStudentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessByIdVideoForStudentsState&&(identical(other.videoForStudents, videoForStudents) || other.videoForStudents == videoForStudents));
}


@override
int get hashCode => Object.hash(runtimeType,videoForStudents);

@override
String toString() {
  return 'VideoForStudentsState.successById(videoForStudents: $videoForStudents)';
}


}

/// @nodoc
abstract mixin class $SuccessByIdVideoForStudentsStateCopyWith<$Res> implements $VideoForStudentsStateCopyWith<$Res> {
  factory $SuccessByIdVideoForStudentsStateCopyWith(SuccessByIdVideoForStudentsState value, $Res Function(SuccessByIdVideoForStudentsState) _then) = _$SuccessByIdVideoForStudentsStateCopyWithImpl;
@useResult
$Res call({
 VideoForStudentsEntity videoForStudents
});




}
/// @nodoc
class _$SuccessByIdVideoForStudentsStateCopyWithImpl<$Res>
    implements $SuccessByIdVideoForStudentsStateCopyWith<$Res> {
  _$SuccessByIdVideoForStudentsStateCopyWithImpl(this._self, this._then);

  final SuccessByIdVideoForStudentsState _self;
  final $Res Function(SuccessByIdVideoForStudentsState) _then;

/// Create a copy of VideoForStudentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoForStudents = null,}) {
  return _then(SuccessByIdVideoForStudentsState(
videoForStudents: null == videoForStudents ? _self.videoForStudents : videoForStudents // ignore: cast_nullable_to_non_nullable
as VideoForStudentsEntity,
  ));
}


}

/// @nodoc


class DoneVideoForStudentsState extends VideoForStudentsState {
  const DoneVideoForStudentsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoneVideoForStudentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoForStudentsState.done()';
}


}




// dart format on
