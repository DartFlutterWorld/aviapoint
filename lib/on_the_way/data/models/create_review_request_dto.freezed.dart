// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_review_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReviewRequestDto {

@JsonKey(name: 'booking_id') int get bookingId;@JsonKey(name: 'reviewed_id') int get reviewedId; int? get rating; String? get comment;@JsonKey(name: 'reply_to_review_id') int? get replyToReviewId;
/// Create a copy of CreateReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReviewRequestDtoCopyWith<CreateReviewRequestDto> get copyWith => _$CreateReviewRequestDtoCopyWithImpl<CreateReviewRequestDto>(this as CreateReviewRequestDto, _$identity);

  /// Serializes this CreateReviewRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReviewRequestDto&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.reviewedId, reviewedId) || other.reviewedId == reviewedId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,reviewedId,rating,comment,replyToReviewId);

@override
String toString() {
  return 'CreateReviewRequestDto(bookingId: $bookingId, reviewedId: $reviewedId, rating: $rating, comment: $comment, replyToReviewId: $replyToReviewId)';
}


}

/// @nodoc
abstract mixin class $CreateReviewRequestDtoCopyWith<$Res>  {
  factory $CreateReviewRequestDtoCopyWith(CreateReviewRequestDto value, $Res Function(CreateReviewRequestDto) _then) = _$CreateReviewRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'booking_id') int bookingId,@JsonKey(name: 'reviewed_id') int reviewedId, int? rating, String? comment,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId
});




}
/// @nodoc
class _$CreateReviewRequestDtoCopyWithImpl<$Res>
    implements $CreateReviewRequestDtoCopyWith<$Res> {
  _$CreateReviewRequestDtoCopyWithImpl(this._self, this._then);

  final CreateReviewRequestDto _self;
  final $Res Function(CreateReviewRequestDto) _then;

/// Create a copy of CreateReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookingId = null,Object? reviewedId = null,Object? rating = freezed,Object? comment = freezed,Object? replyToReviewId = freezed,}) {
  return _then(_self.copyWith(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,reviewedId: null == reviewedId ? _self.reviewedId : reviewedId // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateReviewRequestDto].
extension CreateReviewRequestDtoPatterns on CreateReviewRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReviewRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReviewRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReviewRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateReviewRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReviewRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReviewRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'booking_id')  int bookingId, @JsonKey(name: 'reviewed_id')  int reviewedId,  int? rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateReviewRequestDto() when $default != null:
return $default(_that.bookingId,_that.reviewedId,_that.rating,_that.comment,_that.replyToReviewId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'booking_id')  int bookingId, @JsonKey(name: 'reviewed_id')  int reviewedId,  int? rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId)  $default,) {final _that = this;
switch (_that) {
case _CreateReviewRequestDto():
return $default(_that.bookingId,_that.reviewedId,_that.rating,_that.comment,_that.replyToReviewId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'booking_id')  int bookingId, @JsonKey(name: 'reviewed_id')  int reviewedId,  int? rating,  String? comment, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId)?  $default,) {final _that = this;
switch (_that) {
case _CreateReviewRequestDto() when $default != null:
return $default(_that.bookingId,_that.reviewedId,_that.rating,_that.comment,_that.replyToReviewId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateReviewRequestDto implements CreateReviewRequestDto {
  const _CreateReviewRequestDto({@JsonKey(name: 'booking_id') required this.bookingId, @JsonKey(name: 'reviewed_id') required this.reviewedId, this.rating, this.comment, @JsonKey(name: 'reply_to_review_id') this.replyToReviewId});
  factory _CreateReviewRequestDto.fromJson(Map<String, dynamic> json) => _$CreateReviewRequestDtoFromJson(json);

@override@JsonKey(name: 'booking_id') final  int bookingId;
@override@JsonKey(name: 'reviewed_id') final  int reviewedId;
@override final  int? rating;
@override final  String? comment;
@override@JsonKey(name: 'reply_to_review_id') final  int? replyToReviewId;

/// Create a copy of CreateReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReviewRequestDtoCopyWith<_CreateReviewRequestDto> get copyWith => __$CreateReviewRequestDtoCopyWithImpl<_CreateReviewRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateReviewRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReviewRequestDto&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.reviewedId, reviewedId) || other.reviewedId == reviewedId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,reviewedId,rating,comment,replyToReviewId);

@override
String toString() {
  return 'CreateReviewRequestDto(bookingId: $bookingId, reviewedId: $reviewedId, rating: $rating, comment: $comment, replyToReviewId: $replyToReviewId)';
}


}

/// @nodoc
abstract mixin class _$CreateReviewRequestDtoCopyWith<$Res> implements $CreateReviewRequestDtoCopyWith<$Res> {
  factory _$CreateReviewRequestDtoCopyWith(_CreateReviewRequestDto value, $Res Function(_CreateReviewRequestDto) _then) = __$CreateReviewRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'booking_id') int bookingId,@JsonKey(name: 'reviewed_id') int reviewedId, int? rating, String? comment,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId
});




}
/// @nodoc
class __$CreateReviewRequestDtoCopyWithImpl<$Res>
    implements _$CreateReviewRequestDtoCopyWith<$Res> {
  __$CreateReviewRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateReviewRequestDto _self;
  final $Res Function(_CreateReviewRequestDto) _then;

/// Create a copy of CreateReviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookingId = null,Object? reviewedId = null,Object? rating = freezed,Object? comment = freezed,Object? replyToReviewId = freezed,}) {
  return _then(_CreateReviewRequestDto(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,reviewedId: null == reviewedId ? _self.reviewedId : reviewedId // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
