// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState()';
}


}

/// @nodoc
class $ReviewsStateCopyWith<$Res>  {
$ReviewsStateCopyWith(ReviewsState _, $Res Function(ReviewsState) __);
}


/// Adds pattern-matching-related methods to [ReviewsState].
extension ReviewsStatePatterns on ReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingReviewsState value)?  loading,TResult Function( ErrorReviewsState value)?  error,TResult Function( SuccessReviewsState value)?  success,TResult Function( ReviewCreatedState value)?  reviewCreated,TResult Function( ReviewUpdatedState value)?  reviewUpdated,TResult Function( ReviewDeletedState value)?  reviewDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingReviewsState() when loading != null:
return loading(_that);case ErrorReviewsState() when error != null:
return error(_that);case SuccessReviewsState() when success != null:
return success(_that);case ReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that);case ReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that);case ReviewDeletedState() when reviewDeleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingReviewsState value)  loading,required TResult Function( ErrorReviewsState value)  error,required TResult Function( SuccessReviewsState value)  success,required TResult Function( ReviewCreatedState value)  reviewCreated,required TResult Function( ReviewUpdatedState value)  reviewUpdated,required TResult Function( ReviewDeletedState value)  reviewDeleted,}){
final _that = this;
switch (_that) {
case LoadingReviewsState():
return loading(_that);case ErrorReviewsState():
return error(_that);case SuccessReviewsState():
return success(_that);case ReviewCreatedState():
return reviewCreated(_that);case ReviewUpdatedState():
return reviewUpdated(_that);case ReviewDeletedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingReviewsState value)?  loading,TResult? Function( ErrorReviewsState value)?  error,TResult? Function( SuccessReviewsState value)?  success,TResult? Function( ReviewCreatedState value)?  reviewCreated,TResult? Function( ReviewUpdatedState value)?  reviewUpdated,TResult? Function( ReviewDeletedState value)?  reviewDeleted,}){
final _that = this;
switch (_that) {
case LoadingReviewsState() when loading != null:
return loading(_that);case ErrorReviewsState() when error != null:
return error(_that);case SuccessReviewsState() when success != null:
return success(_that);case ReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that);case ReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that);case ReviewDeletedState() when reviewDeleted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<ReviewEntity> reviews,  Map<int, FlightEntity> flights)?  success,TResult Function( ReviewEntity review)?  reviewCreated,TResult Function( ReviewEntity review)?  reviewUpdated,TResult Function()?  reviewDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingReviewsState() when loading != null:
return loading();case ErrorReviewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessReviewsState() when success != null:
return success(_that.reviews,_that.flights);case ReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that.review);case ReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that.review);case ReviewDeletedState() when reviewDeleted != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<ReviewEntity> reviews,  Map<int, FlightEntity> flights)  success,required TResult Function( ReviewEntity review)  reviewCreated,required TResult Function( ReviewEntity review)  reviewUpdated,required TResult Function()  reviewDeleted,}) {final _that = this;
switch (_that) {
case LoadingReviewsState():
return loading();case ErrorReviewsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessReviewsState():
return success(_that.reviews,_that.flights);case ReviewCreatedState():
return reviewCreated(_that.review);case ReviewUpdatedState():
return reviewUpdated(_that.review);case ReviewDeletedState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<ReviewEntity> reviews,  Map<int, FlightEntity> flights)?  success,TResult? Function( ReviewEntity review)?  reviewCreated,TResult? Function( ReviewEntity review)?  reviewUpdated,TResult? Function()?  reviewDeleted,}) {final _that = this;
switch (_that) {
case LoadingReviewsState() when loading != null:
return loading();case ErrorReviewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessReviewsState() when success != null:
return success(_that.reviews,_that.flights);case ReviewCreatedState() when reviewCreated != null:
return reviewCreated(_that.review);case ReviewUpdatedState() when reviewUpdated != null:
return reviewUpdated(_that.review);case ReviewDeletedState() when reviewDeleted != null:
return reviewDeleted();case _:
  return null;

}
}

}

/// @nodoc


class LoadingReviewsState extends ReviewsState {
  const LoadingReviewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingReviewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.loading()';
}


}




/// @nodoc


class ErrorReviewsState extends ReviewsState {
  const ErrorReviewsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorReviewsStateCopyWith<ErrorReviewsState> get copyWith => _$ErrorReviewsStateCopyWithImpl<ErrorReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorReviewsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'ReviewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorReviewsStateCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
  factory $ErrorReviewsStateCopyWith(ErrorReviewsState value, $Res Function(ErrorReviewsState) _then) = _$ErrorReviewsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorReviewsStateCopyWithImpl<$Res>
    implements $ErrorReviewsStateCopyWith<$Res> {
  _$ErrorReviewsStateCopyWithImpl(this._self, this._then);

  final ErrorReviewsState _self;
  final $Res Function(ErrorReviewsState) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorReviewsState(
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


class SuccessReviewsState extends ReviewsState {
  const SuccessReviewsState({required final  List<ReviewEntity> reviews, required final  Map<int, FlightEntity> flights}): _reviews = reviews,_flights = flights,super._();
  

 final  List<ReviewEntity> _reviews;
 List<ReviewEntity> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

 final  Map<int, FlightEntity> _flights;
 Map<int, FlightEntity> get flights {
  if (_flights is EqualUnmodifiableMapView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_flights);
}


/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessReviewsStateCopyWith<SuccessReviewsState> get copyWith => _$SuccessReviewsStateCopyWithImpl<SuccessReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessReviewsState&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&const DeepCollectionEquality().equals(other._flights, _flights));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviews),const DeepCollectionEquality().hash(_flights));

@override
String toString() {
  return 'ReviewsState.success(reviews: $reviews, flights: $flights)';
}


}

/// @nodoc
abstract mixin class $SuccessReviewsStateCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
  factory $SuccessReviewsStateCopyWith(SuccessReviewsState value, $Res Function(SuccessReviewsState) _then) = _$SuccessReviewsStateCopyWithImpl;
@useResult
$Res call({
 List<ReviewEntity> reviews, Map<int, FlightEntity> flights
});




}
/// @nodoc
class _$SuccessReviewsStateCopyWithImpl<$Res>
    implements $SuccessReviewsStateCopyWith<$Res> {
  _$SuccessReviewsStateCopyWithImpl(this._self, this._then);

  final SuccessReviewsState _self;
  final $Res Function(SuccessReviewsState) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reviews = null,Object? flights = null,}) {
  return _then(SuccessReviewsState(
reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,flights: null == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as Map<int, FlightEntity>,
  ));
}


}

/// @nodoc


class ReviewCreatedState extends ReviewsState {
  const ReviewCreatedState({required this.review}): super._();
  

 final  ReviewEntity review;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCreatedStateCopyWith<ReviewCreatedState> get copyWith => _$ReviewCreatedStateCopyWithImpl<ReviewCreatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCreatedState&&(identical(other.review, review) || other.review == review));
}


@override
int get hashCode => Object.hash(runtimeType,review);

@override
String toString() {
  return 'ReviewsState.reviewCreated(review: $review)';
}


}

/// @nodoc
abstract mixin class $ReviewCreatedStateCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
  factory $ReviewCreatedStateCopyWith(ReviewCreatedState value, $Res Function(ReviewCreatedState) _then) = _$ReviewCreatedStateCopyWithImpl;
@useResult
$Res call({
 ReviewEntity review
});




}
/// @nodoc
class _$ReviewCreatedStateCopyWithImpl<$Res>
    implements $ReviewCreatedStateCopyWith<$Res> {
  _$ReviewCreatedStateCopyWithImpl(this._self, this._then);

  final ReviewCreatedState _self;
  final $Res Function(ReviewCreatedState) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? review = null,}) {
  return _then(ReviewCreatedState(
review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as ReviewEntity,
  ));
}


}

/// @nodoc


class ReviewUpdatedState extends ReviewsState {
  const ReviewUpdatedState({required this.review}): super._();
  

 final  ReviewEntity review;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewUpdatedStateCopyWith<ReviewUpdatedState> get copyWith => _$ReviewUpdatedStateCopyWithImpl<ReviewUpdatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewUpdatedState&&(identical(other.review, review) || other.review == review));
}


@override
int get hashCode => Object.hash(runtimeType,review);

@override
String toString() {
  return 'ReviewsState.reviewUpdated(review: $review)';
}


}

/// @nodoc
abstract mixin class $ReviewUpdatedStateCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
  factory $ReviewUpdatedStateCopyWith(ReviewUpdatedState value, $Res Function(ReviewUpdatedState) _then) = _$ReviewUpdatedStateCopyWithImpl;
@useResult
$Res call({
 ReviewEntity review
});




}
/// @nodoc
class _$ReviewUpdatedStateCopyWithImpl<$Res>
    implements $ReviewUpdatedStateCopyWith<$Res> {
  _$ReviewUpdatedStateCopyWithImpl(this._self, this._then);

  final ReviewUpdatedState _self;
  final $Res Function(ReviewUpdatedState) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? review = null,}) {
  return _then(ReviewUpdatedState(
review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as ReviewEntity,
  ));
}


}

/// @nodoc


class ReviewDeletedState extends ReviewsState {
  const ReviewDeletedState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDeletedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.reviewDeleted()';
}


}




// dart format on
