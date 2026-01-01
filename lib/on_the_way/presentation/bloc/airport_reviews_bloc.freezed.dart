// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airport_reviews_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AirportReviewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirportReviewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AirportReviewsState()';
}


}

/// @nodoc
class $AirportReviewsStateCopyWith<$Res>  {
$AirportReviewsStateCopyWith(AirportReviewsState _, $Res Function(AirportReviewsState) __);
}


/// Adds pattern-matching-related methods to [AirportReviewsState].
extension AirportReviewsStatePatterns on AirportReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingAirportReviewsState value)?  loading,TResult Function( ErrorAirportReviewsState value)?  error,TResult Function( SuccessAirportReviewsState value)?  success,TResult Function( AirportReviewCreatedState value)?  reviewCreated,TResult Function( AirportReviewUpdatedState value)?  reviewUpdated,TResult Function( AirportReviewDeletedState value)?  reviewDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingAirportReviewsState() when loading != null:
return loading(_that);case ErrorAirportReviewsState() when error != null:
return error(_that);case SuccessAirportReviewsState() when success != null:
return success(_that);case AirportReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that);case AirportReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that);case AirportReviewDeletedState() when reviewDeleted != null:
return reviewDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingAirportReviewsState value)  loading,required TResult Function( ErrorAirportReviewsState value)  error,required TResult Function( SuccessAirportReviewsState value)  success,required TResult Function( AirportReviewCreatedState value)  reviewCreated,required TResult Function( AirportReviewUpdatedState value)  reviewUpdated,required TResult Function( AirportReviewDeletedState value)  reviewDeleted,}){
final _that = this;
switch (_that) {
case LoadingAirportReviewsState():
return loading(_that);case ErrorAirportReviewsState():
return error(_that);case SuccessAirportReviewsState():
return success(_that);case AirportReviewCreatedState():
return reviewCreated(_that);case AirportReviewUpdatedState():
return reviewUpdated(_that);case AirportReviewDeletedState():
return reviewDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingAirportReviewsState value)?  loading,TResult? Function( ErrorAirportReviewsState value)?  error,TResult? Function( SuccessAirportReviewsState value)?  success,TResult? Function( AirportReviewCreatedState value)?  reviewCreated,TResult? Function( AirportReviewUpdatedState value)?  reviewUpdated,TResult? Function( AirportReviewDeletedState value)?  reviewDeleted,}){
final _that = this;
switch (_that) {
case LoadingAirportReviewsState() when loading != null:
return loading(_that);case ErrorAirportReviewsState() when error != null:
return error(_that);case SuccessAirportReviewsState() when success != null:
return success(_that);case AirportReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that);case AirportReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that);case AirportReviewDeletedState() when reviewDeleted != null:
return reviewDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<AirportReviewEntity> reviews)?  success,TResult Function( AirportReviewEntity review)?  reviewCreated,TResult Function( AirportReviewEntity review)?  reviewUpdated,TResult Function()?  reviewDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingAirportReviewsState() when loading != null:
return loading();case ErrorAirportReviewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessAirportReviewsState() when success != null:
return success(_that.reviews);case AirportReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that.review);case AirportReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that.review);case AirportReviewDeletedState() when reviewDeleted != null:
return reviewDeleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<AirportReviewEntity> reviews)  success,required TResult Function( AirportReviewEntity review)  reviewCreated,required TResult Function( AirportReviewEntity review)  reviewUpdated,required TResult Function()  reviewDeleted,}) {final _that = this;
switch (_that) {
case LoadingAirportReviewsState():
return loading();case ErrorAirportReviewsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessAirportReviewsState():
return success(_that.reviews);case AirportReviewCreatedState():
return reviewCreated(_that.review);case AirportReviewUpdatedState():
return reviewUpdated(_that.review);case AirportReviewDeletedState():
return reviewDeleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<AirportReviewEntity> reviews)?  success,TResult? Function( AirportReviewEntity review)?  reviewCreated,TResult? Function( AirportReviewEntity review)?  reviewUpdated,TResult? Function()?  reviewDeleted,}) {final _that = this;
switch (_that) {
case LoadingAirportReviewsState() when loading != null:
return loading();case ErrorAirportReviewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessAirportReviewsState() when success != null:
return success(_that.reviews);case AirportReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that.review);case AirportReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that.review);case AirportReviewDeletedState() when reviewDeleted != null:
return reviewDeleted();case _:
  return null;

}
}

}

/// @nodoc


class LoadingAirportReviewsState extends AirportReviewsState {
  const LoadingAirportReviewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAirportReviewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AirportReviewsState.loading()';
}


}




/// @nodoc


class ErrorAirportReviewsState extends AirportReviewsState {
  const ErrorAirportReviewsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAirportReviewsStateCopyWith<ErrorAirportReviewsState> get copyWith => _$ErrorAirportReviewsStateCopyWithImpl<ErrorAirportReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAirportReviewsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'AirportReviewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorAirportReviewsStateCopyWith<$Res> implements $AirportReviewsStateCopyWith<$Res> {
  factory $ErrorAirportReviewsStateCopyWith(ErrorAirportReviewsState value, $Res Function(ErrorAirportReviewsState) _then) = _$ErrorAirportReviewsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorAirportReviewsStateCopyWithImpl<$Res>
    implements $ErrorAirportReviewsStateCopyWith<$Res> {
  _$ErrorAirportReviewsStateCopyWithImpl(this._self, this._then);

  final ErrorAirportReviewsState _self;
  final $Res Function(ErrorAirportReviewsState) _then;

/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorAirportReviewsState(
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


class SuccessAirportReviewsState extends AirportReviewsState {
  const SuccessAirportReviewsState({required final  List<AirportReviewEntity> reviews}): _reviews = reviews,super._();
  

 final  List<AirportReviewEntity> _reviews;
 List<AirportReviewEntity> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}


/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessAirportReviewsStateCopyWith<SuccessAirportReviewsState> get copyWith => _$SuccessAirportReviewsStateCopyWithImpl<SuccessAirportReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessAirportReviewsState&&const DeepCollectionEquality().equals(other._reviews, _reviews));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviews));

@override
String toString() {
  return 'AirportReviewsState.success(reviews: $reviews)';
}


}

/// @nodoc
abstract mixin class $SuccessAirportReviewsStateCopyWith<$Res> implements $AirportReviewsStateCopyWith<$Res> {
  factory $SuccessAirportReviewsStateCopyWith(SuccessAirportReviewsState value, $Res Function(SuccessAirportReviewsState) _then) = _$SuccessAirportReviewsStateCopyWithImpl;
@useResult
$Res call({
 List<AirportReviewEntity> reviews
});




}
/// @nodoc
class _$SuccessAirportReviewsStateCopyWithImpl<$Res>
    implements $SuccessAirportReviewsStateCopyWith<$Res> {
  _$SuccessAirportReviewsStateCopyWithImpl(this._self, this._then);

  final SuccessAirportReviewsState _self;
  final $Res Function(SuccessAirportReviewsState) _then;

/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reviews = null,}) {
  return _then(SuccessAirportReviewsState(
reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<AirportReviewEntity>,
  ));
}


}

/// @nodoc


class AirportReviewCreatedState extends AirportReviewsState {
  const AirportReviewCreatedState({required this.review}): super._();
  

 final  AirportReviewEntity review;

/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirportReviewCreatedStateCopyWith<AirportReviewCreatedState> get copyWith => _$AirportReviewCreatedStateCopyWithImpl<AirportReviewCreatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirportReviewCreatedState&&(identical(other.review, review) || other.review == review));
}


@override
int get hashCode => Object.hash(runtimeType,review);

@override
String toString() {
  return 'AirportReviewsState.reviewCreated(review: $review)';
}


}

/// @nodoc
abstract mixin class $AirportReviewCreatedStateCopyWith<$Res> implements $AirportReviewsStateCopyWith<$Res> {
  factory $AirportReviewCreatedStateCopyWith(AirportReviewCreatedState value, $Res Function(AirportReviewCreatedState) _then) = _$AirportReviewCreatedStateCopyWithImpl;
@useResult
$Res call({
 AirportReviewEntity review
});




}
/// @nodoc
class _$AirportReviewCreatedStateCopyWithImpl<$Res>
    implements $AirportReviewCreatedStateCopyWith<$Res> {
  _$AirportReviewCreatedStateCopyWithImpl(this._self, this._then);

  final AirportReviewCreatedState _self;
  final $Res Function(AirportReviewCreatedState) _then;

/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? review = null,}) {
  return _then(AirportReviewCreatedState(
review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as AirportReviewEntity,
  ));
}


}

/// @nodoc


class AirportReviewUpdatedState extends AirportReviewsState {
  const AirportReviewUpdatedState({required this.review}): super._();
  

 final  AirportReviewEntity review;

/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirportReviewUpdatedStateCopyWith<AirportReviewUpdatedState> get copyWith => _$AirportReviewUpdatedStateCopyWithImpl<AirportReviewUpdatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirportReviewUpdatedState&&(identical(other.review, review) || other.review == review));
}


@override
int get hashCode => Object.hash(runtimeType,review);

@override
String toString() {
  return 'AirportReviewsState.reviewUpdated(review: $review)';
}


}

/// @nodoc
abstract mixin class $AirportReviewUpdatedStateCopyWith<$Res> implements $AirportReviewsStateCopyWith<$Res> {
  factory $AirportReviewUpdatedStateCopyWith(AirportReviewUpdatedState value, $Res Function(AirportReviewUpdatedState) _then) = _$AirportReviewUpdatedStateCopyWithImpl;
@useResult
$Res call({
 AirportReviewEntity review
});




}
/// @nodoc
class _$AirportReviewUpdatedStateCopyWithImpl<$Res>
    implements $AirportReviewUpdatedStateCopyWith<$Res> {
  _$AirportReviewUpdatedStateCopyWithImpl(this._self, this._then);

  final AirportReviewUpdatedState _self;
  final $Res Function(AirportReviewUpdatedState) _then;

/// Create a copy of AirportReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? review = null,}) {
  return _then(AirportReviewUpdatedState(
review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as AirportReviewEntity,
  ));
}


}

/// @nodoc


class AirportReviewDeletedState extends AirportReviewsState {
  const AirportReviewDeletedState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirportReviewDeletedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AirportReviewsState.reviewDeleted()';
}


}




// dart format on
