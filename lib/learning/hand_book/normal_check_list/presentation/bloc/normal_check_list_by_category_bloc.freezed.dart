// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_check_list_by_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NormalCheckListByCategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NormalCheckListByCategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCheckListByCategoryEvent()';
}


}

/// @nodoc
class $NormalCheckListByCategoryEventCopyWith<$Res>  {
$NormalCheckListByCategoryEventCopyWith(NormalCheckListByCategoryEvent _, $Res Function(NormalCheckListByCategoryEvent) __);
}


/// Adds pattern-matching-related methods to [NormalCheckListByCategoryEvent].
extension NormalCheckListByCategoryEventPatterns on NormalCheckListByCategoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetNormalCheckListByCategoryEvent value)?  get,TResult Function( InitialNormalCheckListByCategoryEvent value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetNormalCheckListByCategoryEvent() when get != null:
return get(_that);case InitialNormalCheckListByCategoryEvent() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetNormalCheckListByCategoryEvent value)  get,required TResult Function( InitialNormalCheckListByCategoryEvent value)  initial,}){
final _that = this;
switch (_that) {
case GetNormalCheckListByCategoryEvent():
return get(_that);case InitialNormalCheckListByCategoryEvent():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetNormalCheckListByCategoryEvent value)?  get,TResult? Function( InitialNormalCheckListByCategoryEvent value)?  initial,}){
final _that = this;
switch (_that) {
case GetNormalCheckListByCategoryEvent() when get != null:
return get(_that);case InitialNormalCheckListByCategoryEvent() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String normalCategoryId)?  get,TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetNormalCheckListByCategoryEvent() when get != null:
return get(_that.normalCategoryId);case InitialNormalCheckListByCategoryEvent() when initial != null:
return initial();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String normalCategoryId)  get,required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case GetNormalCheckListByCategoryEvent():
return get(_that.normalCategoryId);case InitialNormalCheckListByCategoryEvent():
return initial();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String normalCategoryId)?  get,TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case GetNormalCheckListByCategoryEvent() when get != null:
return get(_that.normalCategoryId);case InitialNormalCheckListByCategoryEvent() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class GetNormalCheckListByCategoryEvent extends NormalCheckListByCategoryEvent {
  const GetNormalCheckListByCategoryEvent(this.normalCategoryId): super._();
  

 final  String normalCategoryId;

/// Create a copy of NormalCheckListByCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNormalCheckListByCategoryEventCopyWith<GetNormalCheckListByCategoryEvent> get copyWith => _$GetNormalCheckListByCategoryEventCopyWithImpl<GetNormalCheckListByCategoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNormalCheckListByCategoryEvent&&(identical(other.normalCategoryId, normalCategoryId) || other.normalCategoryId == normalCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,normalCategoryId);

@override
String toString() {
  return 'NormalCheckListByCategoryEvent.get(normalCategoryId: $normalCategoryId)';
}


}

/// @nodoc
abstract mixin class $GetNormalCheckListByCategoryEventCopyWith<$Res> implements $NormalCheckListByCategoryEventCopyWith<$Res> {
  factory $GetNormalCheckListByCategoryEventCopyWith(GetNormalCheckListByCategoryEvent value, $Res Function(GetNormalCheckListByCategoryEvent) _then) = _$GetNormalCheckListByCategoryEventCopyWithImpl;
@useResult
$Res call({
 String normalCategoryId
});




}
/// @nodoc
class _$GetNormalCheckListByCategoryEventCopyWithImpl<$Res>
    implements $GetNormalCheckListByCategoryEventCopyWith<$Res> {
  _$GetNormalCheckListByCategoryEventCopyWithImpl(this._self, this._then);

  final GetNormalCheckListByCategoryEvent _self;
  final $Res Function(GetNormalCheckListByCategoryEvent) _then;

/// Create a copy of NormalCheckListByCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? normalCategoryId = null,}) {
  return _then(GetNormalCheckListByCategoryEvent(
null == normalCategoryId ? _self.normalCategoryId : normalCategoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InitialNormalCheckListByCategoryEvent extends NormalCheckListByCategoryEvent {
  const InitialNormalCheckListByCategoryEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialNormalCheckListByCategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCheckListByCategoryEvent.initial()';
}


}




/// @nodoc
mixin _$NormalCheckListByCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NormalCheckListByCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCheckListByCategoryState()';
}


}

/// @nodoc
class $NormalCheckListByCategoryStateCopyWith<$Res>  {
$NormalCheckListByCategoryStateCopyWith(NormalCheckListByCategoryState _, $Res Function(NormalCheckListByCategoryState) __);
}


/// Adds pattern-matching-related methods to [NormalCheckListByCategoryState].
extension NormalCheckListByCategoryStatePatterns on NormalCheckListByCategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingNormalCheckListByCategoryState value)?  loading,TResult Function( ErrorNormalCheckListByCategoryState value)?  error,TResult Function( SuccessNormalCheckListByCategoryState value)?  success,TResult Function( InitialNormalCheckListByCategoryState value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingNormalCheckListByCategoryState() when loading != null:
return loading(_that);case ErrorNormalCheckListByCategoryState() when error != null:
return error(_that);case SuccessNormalCheckListByCategoryState() when success != null:
return success(_that);case InitialNormalCheckListByCategoryState() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingNormalCheckListByCategoryState value)  loading,required TResult Function( ErrorNormalCheckListByCategoryState value)  error,required TResult Function( SuccessNormalCheckListByCategoryState value)  success,required TResult Function( InitialNormalCheckListByCategoryState value)  initial,}){
final _that = this;
switch (_that) {
case LoadingNormalCheckListByCategoryState():
return loading(_that);case ErrorNormalCheckListByCategoryState():
return error(_that);case SuccessNormalCheckListByCategoryState():
return success(_that);case InitialNormalCheckListByCategoryState():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingNormalCheckListByCategoryState value)?  loading,TResult? Function( ErrorNormalCheckListByCategoryState value)?  error,TResult? Function( SuccessNormalCheckListByCategoryState value)?  success,TResult? Function( InitialNormalCheckListByCategoryState value)?  initial,}){
final _that = this;
switch (_that) {
case LoadingNormalCheckListByCategoryState() when loading != null:
return loading(_that);case ErrorNormalCheckListByCategoryState() when error != null:
return error(_that);case SuccessNormalCheckListByCategoryState() when success != null:
return success(_that);case InitialNormalCheckListByCategoryState() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<NormalCheckListEntity> normalCheckListByCategory,  int index)?  success,TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingNormalCheckListByCategoryState() when loading != null:
return loading();case ErrorNormalCheckListByCategoryState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNormalCheckListByCategoryState() when success != null:
return success(_that.normalCheckListByCategory,_that.index);case InitialNormalCheckListByCategoryState() when initial != null:
return initial();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<NormalCheckListEntity> normalCheckListByCategory,  int index)  success,required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case LoadingNormalCheckListByCategoryState():
return loading();case ErrorNormalCheckListByCategoryState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNormalCheckListByCategoryState():
return success(_that.normalCheckListByCategory,_that.index);case InitialNormalCheckListByCategoryState():
return initial();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<NormalCheckListEntity> normalCheckListByCategory,  int index)?  success,TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case LoadingNormalCheckListByCategoryState() when loading != null:
return loading();case ErrorNormalCheckListByCategoryState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNormalCheckListByCategoryState() when success != null:
return success(_that.normalCheckListByCategory,_that.index);case InitialNormalCheckListByCategoryState() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class LoadingNormalCheckListByCategoryState extends NormalCheckListByCategoryState {
  const LoadingNormalCheckListByCategoryState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingNormalCheckListByCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCheckListByCategoryState.loading()';
}


}




/// @nodoc


class ErrorNormalCheckListByCategoryState extends NormalCheckListByCategoryState {
  const ErrorNormalCheckListByCategoryState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of NormalCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorNormalCheckListByCategoryStateCopyWith<ErrorNormalCheckListByCategoryState> get copyWith => _$ErrorNormalCheckListByCategoryStateCopyWithImpl<ErrorNormalCheckListByCategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorNormalCheckListByCategoryState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'NormalCheckListByCategoryState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorNormalCheckListByCategoryStateCopyWith<$Res> implements $NormalCheckListByCategoryStateCopyWith<$Res> {
  factory $ErrorNormalCheckListByCategoryStateCopyWith(ErrorNormalCheckListByCategoryState value, $Res Function(ErrorNormalCheckListByCategoryState) _then) = _$ErrorNormalCheckListByCategoryStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorNormalCheckListByCategoryStateCopyWithImpl<$Res>
    implements $ErrorNormalCheckListByCategoryStateCopyWith<$Res> {
  _$ErrorNormalCheckListByCategoryStateCopyWithImpl(this._self, this._then);

  final ErrorNormalCheckListByCategoryState _self;
  final $Res Function(ErrorNormalCheckListByCategoryState) _then;

/// Create a copy of NormalCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorNormalCheckListByCategoryState(
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


class SuccessNormalCheckListByCategoryState extends NormalCheckListByCategoryState {
  const SuccessNormalCheckListByCategoryState({required final  List<NormalCheckListEntity> normalCheckListByCategory, required this.index}): _normalCheckListByCategory = normalCheckListByCategory,super._();
  

 final  List<NormalCheckListEntity> _normalCheckListByCategory;
 List<NormalCheckListEntity> get normalCheckListByCategory {
  if (_normalCheckListByCategory is EqualUnmodifiableListView) return _normalCheckListByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_normalCheckListByCategory);
}

 final  int index;

/// Create a copy of NormalCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessNormalCheckListByCategoryStateCopyWith<SuccessNormalCheckListByCategoryState> get copyWith => _$SuccessNormalCheckListByCategoryStateCopyWithImpl<SuccessNormalCheckListByCategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessNormalCheckListByCategoryState&&const DeepCollectionEquality().equals(other._normalCheckListByCategory, _normalCheckListByCategory)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_normalCheckListByCategory),index);

@override
String toString() {
  return 'NormalCheckListByCategoryState.success(normalCheckListByCategory: $normalCheckListByCategory, index: $index)';
}


}

/// @nodoc
abstract mixin class $SuccessNormalCheckListByCategoryStateCopyWith<$Res> implements $NormalCheckListByCategoryStateCopyWith<$Res> {
  factory $SuccessNormalCheckListByCategoryStateCopyWith(SuccessNormalCheckListByCategoryState value, $Res Function(SuccessNormalCheckListByCategoryState) _then) = _$SuccessNormalCheckListByCategoryStateCopyWithImpl;
@useResult
$Res call({
 List<NormalCheckListEntity> normalCheckListByCategory, int index
});




}
/// @nodoc
class _$SuccessNormalCheckListByCategoryStateCopyWithImpl<$Res>
    implements $SuccessNormalCheckListByCategoryStateCopyWith<$Res> {
  _$SuccessNormalCheckListByCategoryStateCopyWithImpl(this._self, this._then);

  final SuccessNormalCheckListByCategoryState _self;
  final $Res Function(SuccessNormalCheckListByCategoryState) _then;

/// Create a copy of NormalCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? normalCheckListByCategory = null,Object? index = null,}) {
  return _then(SuccessNormalCheckListByCategoryState(
normalCheckListByCategory: null == normalCheckListByCategory ? _self._normalCheckListByCategory : normalCheckListByCategory // ignore: cast_nullable_to_non_nullable
as List<NormalCheckListEntity>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class InitialNormalCheckListByCategoryState extends NormalCheckListByCategoryState {
  const InitialNormalCheckListByCategoryState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialNormalCheckListByCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NormalCheckListByCategoryState.initial()';
}


}




// dart format on
