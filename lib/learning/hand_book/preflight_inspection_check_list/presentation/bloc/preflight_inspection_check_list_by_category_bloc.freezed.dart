// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight_inspection_check_list_by_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreflightInspectionCheckListByCategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightInspectionCheckListByCategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryEvent()';
}


}

/// @nodoc
class $PreflightInspectionCheckListByCategoryEventCopyWith<$Res>  {
$PreflightInspectionCheckListByCategoryEventCopyWith(PreflightInspectionCheckListByCategoryEvent _, $Res Function(PreflightInspectionCheckListByCategoryEvent) __);
}


/// Adds pattern-matching-related methods to [PreflightInspectionCheckListByCategoryEvent].
extension PreflightInspectionCheckListByCategoryEventPatterns on PreflightInspectionCheckListByCategoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetPreflightInspectionCheckListByCategoryEvent value)?  get,TResult Function( InitialPreflightInspectionCheckListByCategoryEvent value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetPreflightInspectionCheckListByCategoryEvent() when get != null:
return get(_that);case InitialPreflightInspectionCheckListByCategoryEvent() when initial != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetPreflightInspectionCheckListByCategoryEvent value)  get,required TResult Function( InitialPreflightInspectionCheckListByCategoryEvent value)  initial,}){
final _that = this;
switch (_that) {
case GetPreflightInspectionCheckListByCategoryEvent():
return get(_that);case InitialPreflightInspectionCheckListByCategoryEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetPreflightInspectionCheckListByCategoryEvent value)?  get,TResult? Function( InitialPreflightInspectionCheckListByCategoryEvent value)?  initial,}){
final _that = this;
switch (_that) {
case GetPreflightInspectionCheckListByCategoryEvent() when get != null:
return get(_that);case InitialPreflightInspectionCheckListByCategoryEvent() when initial != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String preflihgtInspectionCategoryId)?  get,TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetPreflightInspectionCheckListByCategoryEvent() when get != null:
return get(_that.preflihgtInspectionCategoryId);case InitialPreflightInspectionCheckListByCategoryEvent() when initial != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String preflihgtInspectionCategoryId)  get,required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case GetPreflightInspectionCheckListByCategoryEvent():
return get(_that.preflihgtInspectionCategoryId);case InitialPreflightInspectionCheckListByCategoryEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String preflihgtInspectionCategoryId)?  get,TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case GetPreflightInspectionCheckListByCategoryEvent() when get != null:
return get(_that.preflihgtInspectionCategoryId);case InitialPreflightInspectionCheckListByCategoryEvent() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class GetPreflightInspectionCheckListByCategoryEvent extends PreflightInspectionCheckListByCategoryEvent {
  const GetPreflightInspectionCheckListByCategoryEvent(this.preflihgtInspectionCategoryId): super._();
  

 final  String preflihgtInspectionCategoryId;

/// Create a copy of PreflightInspectionCheckListByCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPreflightInspectionCheckListByCategoryEventCopyWith<GetPreflightInspectionCheckListByCategoryEvent> get copyWith => _$GetPreflightInspectionCheckListByCategoryEventCopyWithImpl<GetPreflightInspectionCheckListByCategoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPreflightInspectionCheckListByCategoryEvent&&(identical(other.preflihgtInspectionCategoryId, preflihgtInspectionCategoryId) || other.preflihgtInspectionCategoryId == preflihgtInspectionCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,preflihgtInspectionCategoryId);

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryEvent.get(preflihgtInspectionCategoryId: $preflihgtInspectionCategoryId)';
}


}

/// @nodoc
abstract mixin class $GetPreflightInspectionCheckListByCategoryEventCopyWith<$Res> implements $PreflightInspectionCheckListByCategoryEventCopyWith<$Res> {
  factory $GetPreflightInspectionCheckListByCategoryEventCopyWith(GetPreflightInspectionCheckListByCategoryEvent value, $Res Function(GetPreflightInspectionCheckListByCategoryEvent) _then) = _$GetPreflightInspectionCheckListByCategoryEventCopyWithImpl;
@useResult
$Res call({
 String preflihgtInspectionCategoryId
});




}
/// @nodoc
class _$GetPreflightInspectionCheckListByCategoryEventCopyWithImpl<$Res>
    implements $GetPreflightInspectionCheckListByCategoryEventCopyWith<$Res> {
  _$GetPreflightInspectionCheckListByCategoryEventCopyWithImpl(this._self, this._then);

  final GetPreflightInspectionCheckListByCategoryEvent _self;
  final $Res Function(GetPreflightInspectionCheckListByCategoryEvent) _then;

/// Create a copy of PreflightInspectionCheckListByCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preflihgtInspectionCategoryId = null,}) {
  return _then(GetPreflightInspectionCheckListByCategoryEvent(
null == preflihgtInspectionCategoryId ? _self.preflihgtInspectionCategoryId : preflihgtInspectionCategoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InitialPreflightInspectionCheckListByCategoryEvent extends PreflightInspectionCheckListByCategoryEvent {
  const InitialPreflightInspectionCheckListByCategoryEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialPreflightInspectionCheckListByCategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryEvent.initial()';
}


}




/// @nodoc
mixin _$PreflightInspectionCheckListByCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightInspectionCheckListByCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryState()';
}


}

/// @nodoc
class $PreflightInspectionCheckListByCategoryStateCopyWith<$Res>  {
$PreflightInspectionCheckListByCategoryStateCopyWith(PreflightInspectionCheckListByCategoryState _, $Res Function(PreflightInspectionCheckListByCategoryState) __);
}


/// Adds pattern-matching-related methods to [PreflightInspectionCheckListByCategoryState].
extension PreflightInspectionCheckListByCategoryStatePatterns on PreflightInspectionCheckListByCategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingPreflightInspectionCheckListByCategoryState value)?  loading,TResult Function( ErrorPreflightInspectionCheckListByCategoryState value)?  error,TResult Function( SuccessPreflightInspectionCheckListByCategoryState value)?  success,TResult Function( InitialPreflightInspectionCheckListByCategoryState value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingPreflightInspectionCheckListByCategoryState() when loading != null:
return loading(_that);case ErrorPreflightInspectionCheckListByCategoryState() when error != null:
return error(_that);case SuccessPreflightInspectionCheckListByCategoryState() when success != null:
return success(_that);case InitialPreflightInspectionCheckListByCategoryState() when initial != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingPreflightInspectionCheckListByCategoryState value)  loading,required TResult Function( ErrorPreflightInspectionCheckListByCategoryState value)  error,required TResult Function( SuccessPreflightInspectionCheckListByCategoryState value)  success,required TResult Function( InitialPreflightInspectionCheckListByCategoryState value)  initial,}){
final _that = this;
switch (_that) {
case LoadingPreflightInspectionCheckListByCategoryState():
return loading(_that);case ErrorPreflightInspectionCheckListByCategoryState():
return error(_that);case SuccessPreflightInspectionCheckListByCategoryState():
return success(_that);case InitialPreflightInspectionCheckListByCategoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingPreflightInspectionCheckListByCategoryState value)?  loading,TResult? Function( ErrorPreflightInspectionCheckListByCategoryState value)?  error,TResult? Function( SuccessPreflightInspectionCheckListByCategoryState value)?  success,TResult? Function( InitialPreflightInspectionCheckListByCategoryState value)?  initial,}){
final _that = this;
switch (_that) {
case LoadingPreflightInspectionCheckListByCategoryState() when loading != null:
return loading(_that);case ErrorPreflightInspectionCheckListByCategoryState() when error != null:
return error(_that);case SuccessPreflightInspectionCheckListByCategoryState() when success != null:
return success(_that);case InitialPreflightInspectionCheckListByCategoryState() when initial != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<PreflightInspectionCheckListEntity> preflightInspectionCheckListByCategory,  int index)?  success,TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingPreflightInspectionCheckListByCategoryState() when loading != null:
return loading();case ErrorPreflightInspectionCheckListByCategoryState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessPreflightInspectionCheckListByCategoryState() when success != null:
return success(_that.preflightInspectionCheckListByCategory,_that.index);case InitialPreflightInspectionCheckListByCategoryState() when initial != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<PreflightInspectionCheckListEntity> preflightInspectionCheckListByCategory,  int index)  success,required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case LoadingPreflightInspectionCheckListByCategoryState():
return loading();case ErrorPreflightInspectionCheckListByCategoryState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessPreflightInspectionCheckListByCategoryState():
return success(_that.preflightInspectionCheckListByCategory,_that.index);case InitialPreflightInspectionCheckListByCategoryState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<PreflightInspectionCheckListEntity> preflightInspectionCheckListByCategory,  int index)?  success,TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case LoadingPreflightInspectionCheckListByCategoryState() when loading != null:
return loading();case ErrorPreflightInspectionCheckListByCategoryState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessPreflightInspectionCheckListByCategoryState() when success != null:
return success(_that.preflightInspectionCheckListByCategory,_that.index);case InitialPreflightInspectionCheckListByCategoryState() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class LoadingPreflightInspectionCheckListByCategoryState extends PreflightInspectionCheckListByCategoryState {
  const LoadingPreflightInspectionCheckListByCategoryState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingPreflightInspectionCheckListByCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryState.loading()';
}


}




/// @nodoc


class ErrorPreflightInspectionCheckListByCategoryState extends PreflightInspectionCheckListByCategoryState {
  const ErrorPreflightInspectionCheckListByCategoryState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of PreflightInspectionCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorPreflightInspectionCheckListByCategoryStateCopyWith<ErrorPreflightInspectionCheckListByCategoryState> get copyWith => _$ErrorPreflightInspectionCheckListByCategoryStateCopyWithImpl<ErrorPreflightInspectionCheckListByCategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorPreflightInspectionCheckListByCategoryState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorPreflightInspectionCheckListByCategoryStateCopyWith<$Res> implements $PreflightInspectionCheckListByCategoryStateCopyWith<$Res> {
  factory $ErrorPreflightInspectionCheckListByCategoryStateCopyWith(ErrorPreflightInspectionCheckListByCategoryState value, $Res Function(ErrorPreflightInspectionCheckListByCategoryState) _then) = _$ErrorPreflightInspectionCheckListByCategoryStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorPreflightInspectionCheckListByCategoryStateCopyWithImpl<$Res>
    implements $ErrorPreflightInspectionCheckListByCategoryStateCopyWith<$Res> {
  _$ErrorPreflightInspectionCheckListByCategoryStateCopyWithImpl(this._self, this._then);

  final ErrorPreflightInspectionCheckListByCategoryState _self;
  final $Res Function(ErrorPreflightInspectionCheckListByCategoryState) _then;

/// Create a copy of PreflightInspectionCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorPreflightInspectionCheckListByCategoryState(
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


class SuccessPreflightInspectionCheckListByCategoryState extends PreflightInspectionCheckListByCategoryState {
  const SuccessPreflightInspectionCheckListByCategoryState({required final  List<PreflightInspectionCheckListEntity> preflightInspectionCheckListByCategory, required this.index}): _preflightInspectionCheckListByCategory = preflightInspectionCheckListByCategory,super._();
  

 final  List<PreflightInspectionCheckListEntity> _preflightInspectionCheckListByCategory;
 List<PreflightInspectionCheckListEntity> get preflightInspectionCheckListByCategory {
  if (_preflightInspectionCheckListByCategory is EqualUnmodifiableListView) return _preflightInspectionCheckListByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preflightInspectionCheckListByCategory);
}

 final  int index;

/// Create a copy of PreflightInspectionCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessPreflightInspectionCheckListByCategoryStateCopyWith<SuccessPreflightInspectionCheckListByCategoryState> get copyWith => _$SuccessPreflightInspectionCheckListByCategoryStateCopyWithImpl<SuccessPreflightInspectionCheckListByCategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessPreflightInspectionCheckListByCategoryState&&const DeepCollectionEquality().equals(other._preflightInspectionCheckListByCategory, _preflightInspectionCheckListByCategory)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_preflightInspectionCheckListByCategory),index);

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryState.success(preflightInspectionCheckListByCategory: $preflightInspectionCheckListByCategory, index: $index)';
}


}

/// @nodoc
abstract mixin class $SuccessPreflightInspectionCheckListByCategoryStateCopyWith<$Res> implements $PreflightInspectionCheckListByCategoryStateCopyWith<$Res> {
  factory $SuccessPreflightInspectionCheckListByCategoryStateCopyWith(SuccessPreflightInspectionCheckListByCategoryState value, $Res Function(SuccessPreflightInspectionCheckListByCategoryState) _then) = _$SuccessPreflightInspectionCheckListByCategoryStateCopyWithImpl;
@useResult
$Res call({
 List<PreflightInspectionCheckListEntity> preflightInspectionCheckListByCategory, int index
});




}
/// @nodoc
class _$SuccessPreflightInspectionCheckListByCategoryStateCopyWithImpl<$Res>
    implements $SuccessPreflightInspectionCheckListByCategoryStateCopyWith<$Res> {
  _$SuccessPreflightInspectionCheckListByCategoryStateCopyWithImpl(this._self, this._then);

  final SuccessPreflightInspectionCheckListByCategoryState _self;
  final $Res Function(SuccessPreflightInspectionCheckListByCategoryState) _then;

/// Create a copy of PreflightInspectionCheckListByCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preflightInspectionCheckListByCategory = null,Object? index = null,}) {
  return _then(SuccessPreflightInspectionCheckListByCategoryState(
preflightInspectionCheckListByCategory: null == preflightInspectionCheckListByCategory ? _self._preflightInspectionCheckListByCategory : preflightInspectionCheckListByCategory // ignore: cast_nullable_to_non_nullable
as List<PreflightInspectionCheckListEntity>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class InitialPreflightInspectionCheckListByCategoryState extends PreflightInspectionCheckListByCategoryState {
  const InitialPreflightInspectionCheckListByCategoryState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialPreflightInspectionCheckListByCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreflightInspectionCheckListByCategoryState.initial()';
}


}




// dart format on
