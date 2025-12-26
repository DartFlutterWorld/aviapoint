// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewDto {

 int get id;@JsonKey(name: 'booking_id') int get bookingId;@JsonKey(name: 'reviewer_id') int get reviewerId;@JsonKey(name: 'reviewed_id') int get reviewedId; int? get rating; String? get comment;@JsonKey(name: 'reply_to_review_id') int? get replyToReviewId;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;@JsonKey(name: 'reviewer_first_name') String? get reviewerFirstName;@JsonKey(name: 'reviewer_last_name') String? get reviewerLastName;@JsonKey(name: 'reviewer_avatar_url') String? get reviewerAvatarUrl;@JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable) int? get flightId;
/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDtoCopyWith<ReviewDto> get copyWith => _$ReviewDtoCopyWithImpl<ReviewDto>(this as ReviewDto, _$identity);

  /// Serializes this ReviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.reviewedId, reviewedId) || other.reviewedId == reviewedId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reviewerFirstName, reviewerFirstName) || other.reviewerFirstName == reviewerFirstName)&&(identical(other.reviewerLastName, reviewerLastName) || other.reviewerLastName == reviewerLastName)&&(identical(other.reviewerAvatarUrl, reviewerAvatarUrl) || other.reviewerAvatarUrl == reviewerAvatarUrl)&&(identical(other.flightId, flightId) || other.flightId == flightId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookingId,reviewerId,reviewedId,rating,comment,replyToReviewId,createdAt,reviewerFirstName,reviewerLastName,reviewerAvatarUrl,flightId);

@override
String toString() {
  return 'ReviewDto(id: $id, bookingId: $bookingId, reviewerId: $reviewerId, reviewedId: $reviewedId, rating: $rating, comment: $comment, replyToReviewId: $replyToReviewId, createdAt: $createdAt, reviewerFirstName: $reviewerFirstName, reviewerLastName: $reviewerLastName, reviewerAvatarUrl: $reviewerAvatarUrl, flightId: $flightId)';
}


}

/// @nodoc
abstract mixin class $ReviewDtoCopyWith<$Res>  {
  factory $ReviewDtoCopyWith(ReviewDto value, $Res Function(ReviewDto) _then) = _$ReviewDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'booking_id') int bookingId,@JsonKey(name: 'reviewer_id') int reviewerId,@JsonKey(name: 'reviewed_id') int reviewedId, int? rating, String? comment,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'reviewer_first_name') String? reviewerFirstName,@JsonKey(name: 'reviewer_last_name') String? reviewerLastName,@JsonKey(name: 'reviewer_avatar_url') String? reviewerAvatarUrl,@JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable) int? flightId
});




}
/// @nodoc
class _$ReviewDtoCopyWithImpl<$Res>
    implements $ReviewDtoCopyWith<$Res> {
  _$ReviewDtoCopyWithImpl(this._self, this._then);

  final ReviewDto _self;
  final $Res Function(ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingId = null,Object? reviewerId = null,Object? reviewedId = null,Object? rating = freezed,Object? comment = freezed,Object? replyToReviewId = freezed,Object? createdAt = freezed,Object? reviewerFirstName = freezed,Object? reviewerLastName = freezed,Object? reviewerAvatarUrl = freezed,Object? flightId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,reviewerId: null == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as int,reviewedId: null == reviewedId ? _self.reviewedId : reviewedId // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewerFirstName: freezed == reviewerFirstName ? _self.reviewerFirstName : reviewerFirstName // ignore: cast_nullable_to_non_nullable
as String?,reviewerLastName: freezed == reviewerLastName ? _self.reviewerLastName : reviewerLastName // ignore: cast_nullable_to_non_nullable
as String?,reviewerAvatarUrl: freezed == reviewerAvatarUrl ? _self.reviewerAvatarUrl : reviewerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,flightId: freezed == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewDto].
extension ReviewDtoPatterns on ReviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDto value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'booking_id')  int bookingId, @JsonKey(name: 'reviewer_id')  int reviewerId, @JsonKey(name: 'reviewed_id')  int reviewedId,  int? rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'reviewer_first_name')  String? reviewerFirstName, @JsonKey(name: 'reviewer_last_name')  String? reviewerLastName, @JsonKey(name: 'reviewer_avatar_url')  String? reviewerAvatarUrl, @JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable)  int? flightId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.id,_that.bookingId,_that.reviewerId,_that.reviewedId,_that.rating,_that.comment,_that.replyToReviewId,_that.createdAt,_that.reviewerFirstName,_that.reviewerLastName,_that.reviewerAvatarUrl,_that.flightId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'booking_id')  int bookingId, @JsonKey(name: 'reviewer_id')  int reviewerId, @JsonKey(name: 'reviewed_id')  int reviewedId,  int? rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'reviewer_first_name')  String? reviewerFirstName, @JsonKey(name: 'reviewer_last_name')  String? reviewerLastName, @JsonKey(name: 'reviewer_avatar_url')  String? reviewerAvatarUrl, @JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable)  int? flightId)  $default,) {final _that = this;
switch (_that) {
case _ReviewDto():
return $default(_that.id,_that.bookingId,_that.reviewerId,_that.reviewedId,_that.rating,_that.comment,_that.replyToReviewId,_that.createdAt,_that.reviewerFirstName,_that.reviewerLastName,_that.reviewerAvatarUrl,_that.flightId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'booking_id')  int bookingId, @JsonKey(name: 'reviewer_id')  int reviewerId, @JsonKey(name: 'reviewed_id')  int reviewedId,  int? rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'reviewer_first_name')  String? reviewerFirstName, @JsonKey(name: 'reviewer_last_name')  String? reviewerLastName, @JsonKey(name: 'reviewer_avatar_url')  String? reviewerAvatarUrl, @JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable)  int? flightId)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.id,_that.bookingId,_that.reviewerId,_that.reviewedId,_that.rating,_that.comment,_that.replyToReviewId,_that.createdAt,_that.reviewerFirstName,_that.reviewerLastName,_that.reviewerAvatarUrl,_that.flightId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDto implements ReviewDto {
  const _ReviewDto({required this.id, @JsonKey(name: 'booking_id') required this.bookingId, @JsonKey(name: 'reviewer_id') required this.reviewerId, @JsonKey(name: 'reviewed_id') required this.reviewedId, this.rating, this.comment, @JsonKey(name: 'reply_to_review_id') this.replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'reviewer_first_name') this.reviewerFirstName, @JsonKey(name: 'reviewer_last_name') this.reviewerLastName, @JsonKey(name: 'reviewer_avatar_url') this.reviewerAvatarUrl, @JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable) this.flightId});
  factory _ReviewDto.fromJson(Map<String, dynamic> json) => _$ReviewDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'booking_id') final  int bookingId;
@override@JsonKey(name: 'reviewer_id') final  int reviewerId;
@override@JsonKey(name: 'reviewed_id') final  int reviewedId;
@override final  int? rating;
@override final  String? comment;
@override@JsonKey(name: 'reply_to_review_id') final  int? replyToReviewId;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'reviewer_first_name') final  String? reviewerFirstName;
@override@JsonKey(name: 'reviewer_last_name') final  String? reviewerLastName;
@override@JsonKey(name: 'reviewer_avatar_url') final  String? reviewerAvatarUrl;
@override@JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable) final  int? flightId;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDtoCopyWith<_ReviewDto> get copyWith => __$ReviewDtoCopyWithImpl<_ReviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.reviewedId, reviewedId) || other.reviewedId == reviewedId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reviewerFirstName, reviewerFirstName) || other.reviewerFirstName == reviewerFirstName)&&(identical(other.reviewerLastName, reviewerLastName) || other.reviewerLastName == reviewerLastName)&&(identical(other.reviewerAvatarUrl, reviewerAvatarUrl) || other.reviewerAvatarUrl == reviewerAvatarUrl)&&(identical(other.flightId, flightId) || other.flightId == flightId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookingId,reviewerId,reviewedId,rating,comment,replyToReviewId,createdAt,reviewerFirstName,reviewerLastName,reviewerAvatarUrl,flightId);

@override
String toString() {
  return 'ReviewDto(id: $id, bookingId: $bookingId, reviewerId: $reviewerId, reviewedId: $reviewedId, rating: $rating, comment: $comment, replyToReviewId: $replyToReviewId, createdAt: $createdAt, reviewerFirstName: $reviewerFirstName, reviewerLastName: $reviewerLastName, reviewerAvatarUrl: $reviewerAvatarUrl, flightId: $flightId)';
}


}

/// @nodoc
abstract mixin class _$ReviewDtoCopyWith<$Res> implements $ReviewDtoCopyWith<$Res> {
  factory _$ReviewDtoCopyWith(_ReviewDto value, $Res Function(_ReviewDto) _then) = __$ReviewDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'booking_id') int bookingId,@JsonKey(name: 'reviewer_id') int reviewerId,@JsonKey(name: 'reviewed_id') int reviewedId, int? rating, String? comment,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'reviewer_first_name') String? reviewerFirstName,@JsonKey(name: 'reviewer_last_name') String? reviewerLastName,@JsonKey(name: 'reviewer_avatar_url') String? reviewerAvatarUrl,@JsonKey(name: 'flight_id', fromJson: _intFromJsonNullable) int? flightId
});




}
/// @nodoc
class __$ReviewDtoCopyWithImpl<$Res>
    implements _$ReviewDtoCopyWith<$Res> {
  __$ReviewDtoCopyWithImpl(this._self, this._then);

  final _ReviewDto _self;
  final $Res Function(_ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingId = null,Object? reviewerId = null,Object? reviewedId = null,Object? rating = freezed,Object? comment = freezed,Object? replyToReviewId = freezed,Object? createdAt = freezed,Object? reviewerFirstName = freezed,Object? reviewerLastName = freezed,Object? reviewerAvatarUrl = freezed,Object? flightId = freezed,}) {
  return _then(_ReviewDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,reviewerId: null == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as int,reviewedId: null == reviewedId ? _self.reviewedId : reviewedId // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewerFirstName: freezed == reviewerFirstName ? _self.reviewerFirstName : reviewerFirstName // ignore: cast_nullable_to_non_nullable
as String?,reviewerLastName: freezed == reviewerLastName ? _self.reviewerLastName : reviewerLastName // ignore: cast_nullable_to_non_nullable
as String?,reviewerAvatarUrl: freezed == reviewerAvatarUrl ? _self.reviewerAvatarUrl : reviewerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,flightId: freezed == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
