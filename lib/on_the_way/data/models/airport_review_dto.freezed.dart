// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airport_review_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AirportReviewDto {

 int get id;@JsonKey(name: 'airport_code') String get airportCode;@JsonKey(name: 'reviewer_id') int get reviewerId; int? get rating; String? get comment;@JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson) List<String>? get photoUrls;@JsonKey(name: 'reply_to_review_id') int? get replyToReviewId;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? get updatedAt;@JsonKey(name: 'reviewer_first_name') String? get reviewerFirstName;@JsonKey(name: 'reviewer_last_name') String? get reviewerLastName;@JsonKey(name: 'reviewer_avatar_url') String? get reviewerAvatarUrl;
/// Create a copy of AirportReviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirportReviewDtoCopyWith<AirportReviewDto> get copyWith => _$AirportReviewDtoCopyWithImpl<AirportReviewDto>(this as AirportReviewDto, _$identity);

  /// Serializes this AirportReviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirportReviewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.photoUrls, photoUrls)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.reviewerFirstName, reviewerFirstName) || other.reviewerFirstName == reviewerFirstName)&&(identical(other.reviewerLastName, reviewerLastName) || other.reviewerLastName == reviewerLastName)&&(identical(other.reviewerAvatarUrl, reviewerAvatarUrl) || other.reviewerAvatarUrl == reviewerAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,airportCode,reviewerId,rating,comment,const DeepCollectionEquality().hash(photoUrls),replyToReviewId,createdAt,updatedAt,reviewerFirstName,reviewerLastName,reviewerAvatarUrl);

@override
String toString() {
  return 'AirportReviewDto(id: $id, airportCode: $airportCode, reviewerId: $reviewerId, rating: $rating, comment: $comment, photoUrls: $photoUrls, replyToReviewId: $replyToReviewId, createdAt: $createdAt, updatedAt: $updatedAt, reviewerFirstName: $reviewerFirstName, reviewerLastName: $reviewerLastName, reviewerAvatarUrl: $reviewerAvatarUrl)';
}


}

/// @nodoc
abstract mixin class $AirportReviewDtoCopyWith<$Res>  {
  factory $AirportReviewDtoCopyWith(AirportReviewDto value, $Res Function(AirportReviewDto) _then) = _$AirportReviewDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'airport_code') String airportCode,@JsonKey(name: 'reviewer_id') int reviewerId, int? rating, String? comment,@JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson) List<String>? photoUrls,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'reviewer_first_name') String? reviewerFirstName,@JsonKey(name: 'reviewer_last_name') String? reviewerLastName,@JsonKey(name: 'reviewer_avatar_url') String? reviewerAvatarUrl
});




}
/// @nodoc
class _$AirportReviewDtoCopyWithImpl<$Res>
    implements $AirportReviewDtoCopyWith<$Res> {
  _$AirportReviewDtoCopyWithImpl(this._self, this._then);

  final AirportReviewDto _self;
  final $Res Function(AirportReviewDto) _then;

/// Create a copy of AirportReviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? airportCode = null,Object? reviewerId = null,Object? rating = freezed,Object? comment = freezed,Object? photoUrls = freezed,Object? replyToReviewId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? reviewerFirstName = freezed,Object? reviewerLastName = freezed,Object? reviewerAvatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,airportCode: null == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String,reviewerId: null == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewerFirstName: freezed == reviewerFirstName ? _self.reviewerFirstName : reviewerFirstName // ignore: cast_nullable_to_non_nullable
as String?,reviewerLastName: freezed == reviewerLastName ? _self.reviewerLastName : reviewerLastName // ignore: cast_nullable_to_non_nullable
as String?,reviewerAvatarUrl: freezed == reviewerAvatarUrl ? _self.reviewerAvatarUrl : reviewerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirportReviewDto].
extension AirportReviewDtoPatterns on AirportReviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirportReviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirportReviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirportReviewDto value)  $default,){
final _that = this;
switch (_that) {
case _AirportReviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirportReviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _AirportReviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'reviewer_id')  int reviewerId,  int? rating,  String? comment, @JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson)  List<String>? photoUrls, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'reviewer_first_name')  String? reviewerFirstName, @JsonKey(name: 'reviewer_last_name')  String? reviewerLastName, @JsonKey(name: 'reviewer_avatar_url')  String? reviewerAvatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirportReviewDto() when $default != null:
return $default(_that.id,_that.airportCode,_that.reviewerId,_that.rating,_that.comment,_that.photoUrls,_that.replyToReviewId,_that.createdAt,_that.updatedAt,_that.reviewerFirstName,_that.reviewerLastName,_that.reviewerAvatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'reviewer_id')  int reviewerId,  int? rating,  String? comment, @JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson)  List<String>? photoUrls, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'reviewer_first_name')  String? reviewerFirstName, @JsonKey(name: 'reviewer_last_name')  String? reviewerLastName, @JsonKey(name: 'reviewer_avatar_url')  String? reviewerAvatarUrl)  $default,) {final _that = this;
switch (_that) {
case _AirportReviewDto():
return $default(_that.id,_that.airportCode,_that.reviewerId,_that.rating,_that.comment,_that.photoUrls,_that.replyToReviewId,_that.createdAt,_that.updatedAt,_that.reviewerFirstName,_that.reviewerLastName,_that.reviewerAvatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'reviewer_id')  int reviewerId,  int? rating,  String? comment, @JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson)  List<String>? photoUrls, @JsonKey(name: 'reply_to_review_id')  int? replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'reviewer_first_name')  String? reviewerFirstName, @JsonKey(name: 'reviewer_last_name')  String? reviewerLastName, @JsonKey(name: 'reviewer_avatar_url')  String? reviewerAvatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _AirportReviewDto() when $default != null:
return $default(_that.id,_that.airportCode,_that.reviewerId,_that.rating,_that.comment,_that.photoUrls,_that.replyToReviewId,_that.createdAt,_that.updatedAt,_that.reviewerFirstName,_that.reviewerLastName,_that.reviewerAvatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirportReviewDto implements AirportReviewDto {
  const _AirportReviewDto({required this.id, @JsonKey(name: 'airport_code') required this.airportCode, @JsonKey(name: 'reviewer_id') required this.reviewerId, this.rating, this.comment, @JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson) final  List<String>? photoUrls, @JsonKey(name: 'reply_to_review_id') this.replyToReviewId, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) this.updatedAt, @JsonKey(name: 'reviewer_first_name') this.reviewerFirstName, @JsonKey(name: 'reviewer_last_name') this.reviewerLastName, @JsonKey(name: 'reviewer_avatar_url') this.reviewerAvatarUrl}): _photoUrls = photoUrls;
  factory _AirportReviewDto.fromJson(Map<String, dynamic> json) => _$AirportReviewDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'airport_code') final  String airportCode;
@override@JsonKey(name: 'reviewer_id') final  int reviewerId;
@override final  int? rating;
@override final  String? comment;
 final  List<String>? _photoUrls;
@override@JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson) List<String>? get photoUrls {
  final value = _photoUrls;
  if (value == null) return null;
  if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'reply_to_review_id') final  int? replyToReviewId;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? updatedAt;
@override@JsonKey(name: 'reviewer_first_name') final  String? reviewerFirstName;
@override@JsonKey(name: 'reviewer_last_name') final  String? reviewerLastName;
@override@JsonKey(name: 'reviewer_avatar_url') final  String? reviewerAvatarUrl;

/// Create a copy of AirportReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirportReviewDtoCopyWith<_AirportReviewDto> get copyWith => __$AirportReviewDtoCopyWithImpl<_AirportReviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirportReviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirportReviewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._photoUrls, _photoUrls)&&(identical(other.replyToReviewId, replyToReviewId) || other.replyToReviewId == replyToReviewId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.reviewerFirstName, reviewerFirstName) || other.reviewerFirstName == reviewerFirstName)&&(identical(other.reviewerLastName, reviewerLastName) || other.reviewerLastName == reviewerLastName)&&(identical(other.reviewerAvatarUrl, reviewerAvatarUrl) || other.reviewerAvatarUrl == reviewerAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,airportCode,reviewerId,rating,comment,const DeepCollectionEquality().hash(_photoUrls),replyToReviewId,createdAt,updatedAt,reviewerFirstName,reviewerLastName,reviewerAvatarUrl);

@override
String toString() {
  return 'AirportReviewDto(id: $id, airportCode: $airportCode, reviewerId: $reviewerId, rating: $rating, comment: $comment, photoUrls: $photoUrls, replyToReviewId: $replyToReviewId, createdAt: $createdAt, updatedAt: $updatedAt, reviewerFirstName: $reviewerFirstName, reviewerLastName: $reviewerLastName, reviewerAvatarUrl: $reviewerAvatarUrl)';
}


}

/// @nodoc
abstract mixin class _$AirportReviewDtoCopyWith<$Res> implements $AirportReviewDtoCopyWith<$Res> {
  factory _$AirportReviewDtoCopyWith(_AirportReviewDto value, $Res Function(_AirportReviewDto) _then) = __$AirportReviewDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'airport_code') String airportCode,@JsonKey(name: 'reviewer_id') int reviewerId, int? rating, String? comment,@JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson) List<String>? photoUrls,@JsonKey(name: 'reply_to_review_id') int? replyToReviewId,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'reviewer_first_name') String? reviewerFirstName,@JsonKey(name: 'reviewer_last_name') String? reviewerLastName,@JsonKey(name: 'reviewer_avatar_url') String? reviewerAvatarUrl
});




}
/// @nodoc
class __$AirportReviewDtoCopyWithImpl<$Res>
    implements _$AirportReviewDtoCopyWith<$Res> {
  __$AirportReviewDtoCopyWithImpl(this._self, this._then);

  final _AirportReviewDto _self;
  final $Res Function(_AirportReviewDto) _then;

/// Create a copy of AirportReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? airportCode = null,Object? reviewerId = null,Object? rating = freezed,Object? comment = freezed,Object? photoUrls = freezed,Object? replyToReviewId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? reviewerFirstName = freezed,Object? reviewerLastName = freezed,Object? reviewerAvatarUrl = freezed,}) {
  return _then(_AirportReviewDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,airportCode: null == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String,reviewerId: null == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as int,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,photoUrls: freezed == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,replyToReviewId: freezed == replyToReviewId ? _self.replyToReviewId : replyToReviewId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewerFirstName: freezed == reviewerFirstName ? _self.reviewerFirstName : reviewerFirstName // ignore: cast_nullable_to_non_nullable
as String?,reviewerLastName: freezed == reviewerLastName ? _self.reviewerLastName : reviewerLastName // ignore: cast_nullable_to_non_nullable
as String?,reviewerAvatarUrl: freezed == reviewerAvatarUrl ? _self.reviewerAvatarUrl : reviewerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
