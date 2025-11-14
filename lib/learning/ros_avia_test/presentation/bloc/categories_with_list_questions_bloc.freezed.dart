// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_with_list_questions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesWithListQuestionsEvent {

 int get typeSsertificatesId;
/// Create a copy of CategoriesWithListQuestionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesWithListQuestionsEventCopyWith<CategoriesWithListQuestionsEvent> get copyWith => _$CategoriesWithListQuestionsEventCopyWithImpl<CategoriesWithListQuestionsEvent>(this as CategoriesWithListQuestionsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesWithListQuestionsEvent&&(identical(other.typeSsertificatesId, typeSsertificatesId) || other.typeSsertificatesId == typeSsertificatesId));
}


@override
int get hashCode => Object.hash(runtimeType,typeSsertificatesId);

@override
String toString() {
  return 'CategoriesWithListQuestionsEvent(typeSsertificatesId: $typeSsertificatesId)';
}


}

/// @nodoc
abstract mixin class $CategoriesWithListQuestionsEventCopyWith<$Res>  {
  factory $CategoriesWithListQuestionsEventCopyWith(CategoriesWithListQuestionsEvent value, $Res Function(CategoriesWithListQuestionsEvent) _then) = _$CategoriesWithListQuestionsEventCopyWithImpl;
@useResult
$Res call({
 int typeSsertificatesId
});




}
/// @nodoc
class _$CategoriesWithListQuestionsEventCopyWithImpl<$Res>
    implements $CategoriesWithListQuestionsEventCopyWith<$Res> {
  _$CategoriesWithListQuestionsEventCopyWithImpl(this._self, this._then);

  final CategoriesWithListQuestionsEvent _self;
  final $Res Function(CategoriesWithListQuestionsEvent) _then;

/// Create a copy of CategoriesWithListQuestionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? typeSsertificatesId = null,}) {
  return _then(_self.copyWith(
typeSsertificatesId: null == typeSsertificatesId ? _self.typeSsertificatesId : typeSsertificatesId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesWithListQuestionsEvent].
extension CategoriesWithListQuestionsEventPatterns on CategoriesWithListQuestionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetCategoriesWithListQuestionsEvent value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetCategoriesWithListQuestionsEvent() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetCategoriesWithListQuestionsEvent value)  get,}){
final _that = this;
switch (_that) {
case GetCategoriesWithListQuestionsEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetCategoriesWithListQuestionsEvent value)?  get,}){
final _that = this;
switch (_that) {
case GetCategoriesWithListQuestionsEvent() when get != null:
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
case GetCategoriesWithListQuestionsEvent() when get != null:
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
case GetCategoriesWithListQuestionsEvent():
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
case GetCategoriesWithListQuestionsEvent() when get != null:
return get(_that.typeSsertificatesId);case _:
  return null;

}
}

}

/// @nodoc


class GetCategoriesWithListQuestionsEvent extends CategoriesWithListQuestionsEvent {
  const GetCategoriesWithListQuestionsEvent({required this.typeSsertificatesId}): super._();
  

@override final  int typeSsertificatesId;

/// Create a copy of CategoriesWithListQuestionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCategoriesWithListQuestionsEventCopyWith<GetCategoriesWithListQuestionsEvent> get copyWith => _$GetCategoriesWithListQuestionsEventCopyWithImpl<GetCategoriesWithListQuestionsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoriesWithListQuestionsEvent&&(identical(other.typeSsertificatesId, typeSsertificatesId) || other.typeSsertificatesId == typeSsertificatesId));
}


@override
int get hashCode => Object.hash(runtimeType,typeSsertificatesId);

@override
String toString() {
  return 'CategoriesWithListQuestionsEvent.get(typeSsertificatesId: $typeSsertificatesId)';
}


}

/// @nodoc
abstract mixin class $GetCategoriesWithListQuestionsEventCopyWith<$Res> implements $CategoriesWithListQuestionsEventCopyWith<$Res> {
  factory $GetCategoriesWithListQuestionsEventCopyWith(GetCategoriesWithListQuestionsEvent value, $Res Function(GetCategoriesWithListQuestionsEvent) _then) = _$GetCategoriesWithListQuestionsEventCopyWithImpl;
@override @useResult
$Res call({
 int typeSsertificatesId
});




}
/// @nodoc
class _$GetCategoriesWithListQuestionsEventCopyWithImpl<$Res>
    implements $GetCategoriesWithListQuestionsEventCopyWith<$Res> {
  _$GetCategoriesWithListQuestionsEventCopyWithImpl(this._self, this._then);

  final GetCategoriesWithListQuestionsEvent _self;
  final $Res Function(GetCategoriesWithListQuestionsEvent) _then;

/// Create a copy of CategoriesWithListQuestionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? typeSsertificatesId = null,}) {
  return _then(GetCategoriesWithListQuestionsEvent(
typeSsertificatesId: null == typeSsertificatesId ? _self.typeSsertificatesId : typeSsertificatesId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CategoriesWithListQuestionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesWithListQuestionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesWithListQuestionsState()';
}


}

/// @nodoc
class $CategoriesWithListQuestionsStateCopyWith<$Res>  {
$CategoriesWithListQuestionsStateCopyWith(CategoriesWithListQuestionsState _, $Res Function(CategoriesWithListQuestionsState) __);
}


/// Adds pattern-matching-related methods to [CategoriesWithListQuestionsState].
extension CategoriesWithListQuestionsStatePatterns on CategoriesWithListQuestionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingCategoriesWithListQuestionsState value)?  loading,TResult Function( ErrorCategoriesWithListQuestionsState value)?  error,TResult Function( SuccessCategoriesWithListQuestionsState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingCategoriesWithListQuestionsState() when loading != null:
return loading(_that);case ErrorCategoriesWithListQuestionsState() when error != null:
return error(_that);case SuccessCategoriesWithListQuestionsState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingCategoriesWithListQuestionsState value)  loading,required TResult Function( ErrorCategoriesWithListQuestionsState value)  error,required TResult Function( SuccessCategoriesWithListQuestionsState value)  success,}){
final _that = this;
switch (_that) {
case LoadingCategoriesWithListQuestionsState():
return loading(_that);case ErrorCategoriesWithListQuestionsState():
return error(_that);case SuccessCategoriesWithListQuestionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingCategoriesWithListQuestionsState value)?  loading,TResult? Function( ErrorCategoriesWithListQuestionsState value)?  error,TResult? Function( SuccessCategoriesWithListQuestionsState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingCategoriesWithListQuestionsState() when loading != null:
return loading(_that);case ErrorCategoriesWithListQuestionsState() when error != null:
return error(_that);case SuccessCategoriesWithListQuestionsState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<RosAviaTestCategoryWithQuestionsEntity> categoryWithQuestions)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingCategoriesWithListQuestionsState() when loading != null:
return loading();case ErrorCategoriesWithListQuestionsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCategoriesWithListQuestionsState() when success != null:
return success(_that.categoryWithQuestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<RosAviaTestCategoryWithQuestionsEntity> categoryWithQuestions)  success,}) {final _that = this;
switch (_that) {
case LoadingCategoriesWithListQuestionsState():
return loading();case ErrorCategoriesWithListQuestionsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCategoriesWithListQuestionsState():
return success(_that.categoryWithQuestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<RosAviaTestCategoryWithQuestionsEntity> categoryWithQuestions)?  success,}) {final _that = this;
switch (_that) {
case LoadingCategoriesWithListQuestionsState() when loading != null:
return loading();case ErrorCategoriesWithListQuestionsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessCategoriesWithListQuestionsState() when success != null:
return success(_that.categoryWithQuestions);case _:
  return null;

}
}

}

/// @nodoc


class LoadingCategoriesWithListQuestionsState extends CategoriesWithListQuestionsState {
  const LoadingCategoriesWithListQuestionsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCategoriesWithListQuestionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesWithListQuestionsState.loading()';
}


}




/// @nodoc


class ErrorCategoriesWithListQuestionsState extends CategoriesWithListQuestionsState {
  const ErrorCategoriesWithListQuestionsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of CategoriesWithListQuestionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCategoriesWithListQuestionsStateCopyWith<ErrorCategoriesWithListQuestionsState> get copyWith => _$ErrorCategoriesWithListQuestionsStateCopyWithImpl<ErrorCategoriesWithListQuestionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCategoriesWithListQuestionsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'CategoriesWithListQuestionsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorCategoriesWithListQuestionsStateCopyWith<$Res> implements $CategoriesWithListQuestionsStateCopyWith<$Res> {
  factory $ErrorCategoriesWithListQuestionsStateCopyWith(ErrorCategoriesWithListQuestionsState value, $Res Function(ErrorCategoriesWithListQuestionsState) _then) = _$ErrorCategoriesWithListQuestionsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorCategoriesWithListQuestionsStateCopyWithImpl<$Res>
    implements $ErrorCategoriesWithListQuestionsStateCopyWith<$Res> {
  _$ErrorCategoriesWithListQuestionsStateCopyWithImpl(this._self, this._then);

  final ErrorCategoriesWithListQuestionsState _self;
  final $Res Function(ErrorCategoriesWithListQuestionsState) _then;

/// Create a copy of CategoriesWithListQuestionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorCategoriesWithListQuestionsState(
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


class SuccessCategoriesWithListQuestionsState extends CategoriesWithListQuestionsState {
  const SuccessCategoriesWithListQuestionsState({required final  List<RosAviaTestCategoryWithQuestionsEntity> categoryWithQuestions}): _categoryWithQuestions = categoryWithQuestions,super._();
  

 final  List<RosAviaTestCategoryWithQuestionsEntity> _categoryWithQuestions;
 List<RosAviaTestCategoryWithQuestionsEntity> get categoryWithQuestions {
  if (_categoryWithQuestions is EqualUnmodifiableListView) return _categoryWithQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryWithQuestions);
}


/// Create a copy of CategoriesWithListQuestionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCategoriesWithListQuestionsStateCopyWith<SuccessCategoriesWithListQuestionsState> get copyWith => _$SuccessCategoriesWithListQuestionsStateCopyWithImpl<SuccessCategoriesWithListQuestionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCategoriesWithListQuestionsState&&const DeepCollectionEquality().equals(other._categoryWithQuestions, _categoryWithQuestions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categoryWithQuestions));

@override
String toString() {
  return 'CategoriesWithListQuestionsState.success(categoryWithQuestions: $categoryWithQuestions)';
}


}

/// @nodoc
abstract mixin class $SuccessCategoriesWithListQuestionsStateCopyWith<$Res> implements $CategoriesWithListQuestionsStateCopyWith<$Res> {
  factory $SuccessCategoriesWithListQuestionsStateCopyWith(SuccessCategoriesWithListQuestionsState value, $Res Function(SuccessCategoriesWithListQuestionsState) _then) = _$SuccessCategoriesWithListQuestionsStateCopyWithImpl;
@useResult
$Res call({
 List<RosAviaTestCategoryWithQuestionsEntity> categoryWithQuestions
});




}
/// @nodoc
class _$SuccessCategoriesWithListQuestionsStateCopyWithImpl<$Res>
    implements $SuccessCategoriesWithListQuestionsStateCopyWith<$Res> {
  _$SuccessCategoriesWithListQuestionsStateCopyWithImpl(this._self, this._then);

  final SuccessCategoriesWithListQuestionsState _self;
  final $Res Function(SuccessCategoriesWithListQuestionsState) _then;

/// Create a copy of CategoriesWithListQuestionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryWithQuestions = null,}) {
  return _then(SuccessCategoriesWithListQuestionsState(
categoryWithQuestions: null == categoryWithQuestions ? _self._categoryWithQuestions : categoryWithQuestions // ignore: cast_nullable_to_non_nullable
as List<RosAviaTestCategoryWithQuestionsEntity>,
  ));
}


}

// dart format on
