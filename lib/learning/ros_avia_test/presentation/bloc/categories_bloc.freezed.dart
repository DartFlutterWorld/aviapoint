// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesEvent {

 int get typeSsertificatesId;
/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesEventCopyWith<CategoriesEvent> get copyWith => _$CategoriesEventCopyWithImpl<CategoriesEvent>(this as CategoriesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesEvent&&(identical(other.typeSsertificatesId, typeSsertificatesId) || other.typeSsertificatesId == typeSsertificatesId));
}


@override
int get hashCode => Object.hash(runtimeType,typeSsertificatesId);

@override
String toString() {
  return 'CategoriesEvent(typeSsertificatesId: $typeSsertificatesId)';
}


}

/// @nodoc
abstract mixin class $CategoriesEventCopyWith<$Res>  {
  factory $CategoriesEventCopyWith(CategoriesEvent value, $Res Function(CategoriesEvent) _then) = _$CategoriesEventCopyWithImpl;
@useResult
$Res call({
 int typeSsertificatesId
});




}
/// @nodoc
class _$CategoriesEventCopyWithImpl<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  _$CategoriesEventCopyWithImpl(this._self, this._then);

  final CategoriesEvent _self;
  final $Res Function(CategoriesEvent) _then;

/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? typeSsertificatesId = null,}) {
  return _then(_self.copyWith(
typeSsertificatesId: null == typeSsertificatesId ? _self.typeSsertificatesId : typeSsertificatesId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesEvent].
extension CategoriesEventPatterns on CategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetCategoriesEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetCategoriesEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetCategoriesEvent value)  get,}){
final _that = this;
switch (_that) {
case GetCategoriesEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetCategoriesEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetCategoriesEvent() when get != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int typeSsertificatesId)?  get,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetCategoriesEvent() when get != null:
return get(_that.typeSsertificatesId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int typeSsertificatesId)  get,}) {final _that = this;
switch (_that) {
case GetCategoriesEvent():
return get(_that.typeSsertificatesId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int typeSsertificatesId)?  get,}) {final _that = this;
switch (_that) {
case GetCategoriesEvent() when get != null:
return get(_that.typeSsertificatesId);case _:
  return null;

}
}

}

/// @nodoc


class GetCategoriesEvent extends CategoriesEvent {
  const GetCategoriesEvent({required this.typeSsertificatesId}): super._();
  

@override final  int typeSsertificatesId;

/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCategoriesEventCopyWith<GetCategoriesEvent> get copyWith => _$GetCategoriesEventCopyWithImpl<GetCategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoriesEvent&&(identical(other.typeSsertificatesId, typeSsertificatesId) || other.typeSsertificatesId == typeSsertificatesId));
}


@override
int get hashCode => Object.hash(runtimeType,typeSsertificatesId);

@override
String toString() {
  return 'CategoriesEvent.get(typeSsertificatesId: $typeSsertificatesId)';
}


}

/// @nodoc
abstract mixin class $GetCategoriesEventCopyWith<$Res> implements $CategoriesEventCopyWith<$Res> {
  factory $GetCategoriesEventCopyWith(GetCategoriesEvent value, $Res Function(GetCategoriesEvent) _then) = _$GetCategoriesEventCopyWithImpl;
@override @useResult
$Res call({
 int typeSsertificatesId
});




}
/// @nodoc
class _$GetCategoriesEventCopyWithImpl<$Res>
    implements $GetCategoriesEventCopyWith<$Res> {
  _$GetCategoriesEventCopyWithImpl(this._self, this._then);

  final GetCategoriesEvent _self;
  final $Res Function(GetCategoriesEvent) _then;

/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? typeSsertificatesId = null,}) {
  return _then(GetCategoriesEvent(
typeSsertificatesId: null == typeSsertificatesId ? _self.typeSsertificatesId : typeSsertificatesId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState()';
}


}

/// @nodoc
class $CategoriesStateCopyWith<$Res>  {
$CategoriesStateCopyWith(CategoriesState _, $Res Function(CategoriesState) __);
}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingCategoriesState value)?  loading,TResult Function( ErrorCategoriesState value)?  error,TResult Function( SuccessCategoriesState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingCategoriesState() when loading != null:
return loading(_that);case ErrorCategoriesState() when error != null:
return error(_that);case SuccessCategoriesState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingCategoriesState value)  loading,required TResult Function( ErrorCategoriesState value)  error,required TResult Function( SuccessCategoriesState value)  success,}){
final _that = this;
switch (_that) {
case LoadingCategoriesState():
return loading(_that);case ErrorCategoriesState():
return error(_that);case SuccessCategoriesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingCategoriesState value)?  loading,TResult? Function( ErrorCategoriesState value)?  error,TResult? Function( SuccessCategoriesState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingCategoriesState() when loading != null:
return loading(_that);case ErrorCategoriesState() when error != null:
return error(_that);case SuccessCategoriesState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<RosAviaTestCategoryEntity> categories)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingCategoriesState() when loading != null:
return loading();case ErrorCategoriesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCategoriesState() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<RosAviaTestCategoryEntity> categories)  success,}) {final _that = this;
switch (_that) {
case LoadingCategoriesState():
return loading();case ErrorCategoriesState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCategoriesState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<RosAviaTestCategoryEntity> categories)?  success,}) {final _that = this;
switch (_that) {
case LoadingCategoriesState() when loading != null:
return loading();case ErrorCategoriesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCategoriesState() when success != null:
return success(_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class LoadingCategoriesState extends CategoriesState {
  const LoadingCategoriesState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.loading()';
}


}




/// @nodoc


class ErrorCategoriesState extends CategoriesState {
  const ErrorCategoriesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCategoriesStateCopyWith<ErrorCategoriesState> get copyWith => _$ErrorCategoriesStateCopyWithImpl<ErrorCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCategoriesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'CategoriesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorCategoriesStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $ErrorCategoriesStateCopyWith(ErrorCategoriesState value, $Res Function(ErrorCategoriesState) _then) = _$ErrorCategoriesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorCategoriesStateCopyWithImpl<$Res>
    implements $ErrorCategoriesStateCopyWith<$Res> {
  _$ErrorCategoriesStateCopyWithImpl(this._self, this._then);

  final ErrorCategoriesState _self;
  final $Res Function(ErrorCategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorCategoriesState(
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


class SuccessCategoriesState extends CategoriesState {
  const SuccessCategoriesState({required final  List<RosAviaTestCategoryEntity> categories}): _categories = categories,super._();
  

 final  List<RosAviaTestCategoryEntity> _categories;
 List<RosAviaTestCategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCategoriesStateCopyWith<SuccessCategoriesState> get copyWith => _$SuccessCategoriesStateCopyWithImpl<SuccessCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCategoriesState&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoriesState.success(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $SuccessCategoriesStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $SuccessCategoriesStateCopyWith(SuccessCategoriesState value, $Res Function(SuccessCategoriesState) _then) = _$SuccessCategoriesStateCopyWithImpl;
@useResult
$Res call({
 List<RosAviaTestCategoryEntity> categories
});




}
/// @nodoc
class _$SuccessCategoriesStateCopyWithImpl<$Res>
    implements $SuccessCategoriesStateCopyWith<$Res> {
  _$SuccessCategoriesStateCopyWithImpl(this._self, this._then);

  final SuccessCategoriesState _self;
  final $Res Function(SuccessCategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(SuccessCategoriesState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<RosAviaTestCategoryEntity>,
  ));
}


}

// dart format on
