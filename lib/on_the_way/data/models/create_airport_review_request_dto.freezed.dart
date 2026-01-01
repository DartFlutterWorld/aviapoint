// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_airport_review_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAirportReviewRequestDto {

@JsonKey(name: 'airport_code') String get airportCode;@JsonKey(name: 'reviewer_id') int get reviewerId; int get rating; String? get comment;@JsonKey(name: 'reply_to_review_id') int? get replyToReviewId;
/// Create a copy of CreateAirportReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAirportReviewRequestDtoCopyWith<CreateAirportReviewRequestDto> get copyWith => _$CreateAirportReviewRequestDtoCopyWithImpl<CreateAirportReviewRequestDto>(this as CreateAirportReviewRequestDto, _$identity);

  /// Serializes this CreateAirportReviewRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAirportReviewRequestDto&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airportCode,reviewerId,rating,comment,replyToReviewId);

@override
String toString() {
  return 'CreateAirportReviewRequestDto(airportCode: $airportCode, reviewerId: $reviewerId, rating: $rating, comment: $comment, replyToReviewId: $replyToReviewId)';
}


}

/// @nodoc
abstract mixin class $CreateAirportReviewRequestDtoCopyWith<$Res>  {
  factory $CreateAirportReviewRequestDtoCopyWith(CreateAirportReviewRequestDto value, $Res Function(CreateAirportReviewRequestDto) _then) = _$CreateAirportReviewRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'airport_code') String airportCode,@JsonKey(name: 'reviewer_id') int reviewerId, int rating, String? comment,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId
});




}
/// @nodoc
class _$CreateAirportReviewRequestDtoCopyWithImpl<$Res>
    implements $CreateAirportReviewRequestDtoCopyWith<$Res> {
  _$CreateAirportReviewRequestDtoCopyWithImpl(this._self, this._then);

  final CreateAirportReviewRequestDto _self;
  final $Res Function(CreateAirportReviewRequestDto) _then;

/// Create a copy of CreateAirportReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airportCode = null,Object? reviewerId = null,Object? rating = null,Object? comment = freezed,Object? replyToReviewId = freezed,}) {
  return _then(_self.copyWith(
airportCode: null == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String,reviewerId: null == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAirportReviewRequestDto].
extension CreateAirportReviewRequestDtoPatterns on CreateAirportReviewRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAirportReviewRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAirportReviewRequestDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAirportReviewRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateAirportReviewRequestDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAirportReviewRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAirportReviewRequestDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'reviewer_id')  int reviewerId,  int rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAirportReviewRequestDto() when $default != null:
return $default(_that.airportCode,_that.reviewerId,_that.rating,_that.comment,_that.replyToReviewId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'reviewer_id')  int reviewerId,  int rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId)  $default,) {final _that = this;
switch (_that) {
case _CreateAirportReviewRequestDto():
return $default(_that.airportCode,_that.reviewerId,_that.rating,_that.comment,_that.replyToReviewId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'reviewer_id')  int reviewerId,  int rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId)?  $default,) {final _that = this;
switch (_that) {
case _CreateAirportReviewRequestDto() when $default != null:
return $default(_that.airportCode,_that.reviewerId,_that.rating,_that.comment,_that.replyToReviewId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAirportReviewRequestDto implements CreateAirportReviewRequestDto {
  const _CreateAirportReviewRequestDto({@JsonKey(name: 'airport_code') required this.airportCode, @JsonKey(name: 'reviewer_id') required this.reviewerId, required this.rating, this.comment, @JsonKey(name: 'reply_to_review_id') this.replyToReviewId});
  factory _CreateAirportReviewRequestDto.fromJson(Map<String, dynamic> json) => _$CreateAirportReviewRequestDtoFromJson(json);

@override@JsonKey(name: 'airport_code') final  String airportCode;
@override@JsonKey(name: 'reviewer_id') final  int reviewerId;
@override final  int rating;
@override final  String? comment;
@override@JsonKey(name: 'reply_to_review_id') final  int? replyToReviewId;

/// Create a copy of CreateAirportReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAirportReviewRequestDtoCopyWith<_CreateAirportReviewRequestDto> get copyWith => __$CreateAirportReviewRequestDtoCopyWithImpl<_CreateAirportReviewRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAirportReviewRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAirportReviewRequestDto&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airportCode,reviewerId,rating,comment,replyToReviewId);

@override
String toString() {
  return 'CreateAirportReviewRequestDto(airportCode: $airportCode, reviewerId: $reviewerId, rating: $rating, comment: $comment, replyToReviewId: $replyToReviewId)';
}


}

/// @nodoc
abstract mixin class _$CreateAirportReviewRequestDtoCopyWith<$Res> implements $CreateAirportReviewRequestDtoCopyWith<$Res> {
  factory _$CreateAirportReviewRequestDtoCopyWith(_CreateAirportReviewRequestDto value, $Res Function(_CreateAirportReviewRequestDto) _then) = __$CreateAirportReviewRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'airport_code') String airportCode,@JsonKey(name: 'reviewer_id') int reviewerId, int rating, String? comment,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId
});




}
/// @nodoc
class __$CreateAirportReviewRequestDtoCopyWithImpl<$Res>
    implements _$CreateAirportReviewRequestDtoCopyWith<$Res> {
  __$CreateAirportReviewRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateAirportReviewRequestDto _self;
  final $Res Function(_CreateAirportReviewRequestDto) _then;

/// Create a copy of CreateAirportReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airportCode = null,Object? reviewerId = null,Object? rating = null,Object? comment = freezed,Object? replyToReviewId = freezed,}) {
  return _then(_CreateAirportReviewRequestDto(
airportCode: null == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String,reviewerId: null == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
