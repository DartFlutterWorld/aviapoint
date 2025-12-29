// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_question_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlightQuestionDto {

 int get id;@JsonKey(name: 'flight_id') int get flightId;@JsonKey(name: 'author_id', fromJson: _intFromJsonNullable) int? get authorId;@JsonKey(name: 'question_text') String get questionText;@JsonKey(name: 'answer_text') String? get answerText;@JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable) int? get answeredById;@JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable) DateTime? get answeredAt;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? get updatedAt;@JsonKey(name: 'author_first_name') String? get authorFirstName;@JsonKey(name: 'author_last_name') String? get authorLastName;@JsonKey(name: 'author_avatar_url') String? get authorAvatarUrl;@JsonKey(name: 'answered_by_first_name') String? get answeredByFirstName;@JsonKey(name: 'answered_by_last_name') String? get answeredByLastName;@JsonKey(name: 'answered_by_avatar_url') String? get answeredByAvatarUrl;
/// Create a copy of FlightQuestionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightQuestionDtoCopyWith<FlightQuestionDto> get copyWith => _$FlightQuestionDtoCopyWithImpl<FlightQuestionDto>(this as FlightQuestionDto, _$identity);

  /// Serializes this FlightQuestionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.answerText, answerText) || other.answerText == answerText)&&(identical(other.answeredById, answeredById) || other.answeredById == answeredById)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authorFirstName, authorFirstName) || other.authorFirstName == authorFirstName)&&(identical(other.authorLastName, authorLastName) || other.authorLastName == authorLastName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.answeredByFirstName, answeredByFirstName) || other.answeredByFirstName == answeredByFirstName)&&(identical(other.answeredByLastName, answeredByLastName) || other.answeredByLastName == answeredByLastName)&&(identical(other.answeredByAvatarUrl, answeredByAvatarUrl) || other.answeredByAvatarUrl == answeredByAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flightId,authorId,questionText,answerText,answeredById,answeredAt,createdAt,updatedAt,authorFirstName,authorLastName,authorAvatarUrl,answeredByFirstName,answeredByLastName,answeredByAvatarUrl);

@override
String toString() {
  return 'FlightQuestionDto(id: $id, flightId: $flightId, authorId: $authorId, questionText: $questionText, answerText: $answerText, answeredById: $answeredById, answeredAt: $answeredAt, createdAt: $createdAt, updatedAt: $updatedAt, authorFirstName: $authorFirstName, authorLastName: $authorLastName, authorAvatarUrl: $authorAvatarUrl, answeredByFirstName: $answeredByFirstName, answeredByLastName: $answeredByLastName, answeredByAvatarUrl: $answeredByAvatarUrl)';
}


}

/// @nodoc
abstract mixin class $FlightQuestionDtoCopyWith<$Res>  {
  factory $FlightQuestionDtoCopyWith(FlightQuestionDto value, $Res Function(FlightQuestionDto) _then) = _$FlightQuestionDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'flight_id') int flightId,@JsonKey(name: 'author_id', fromJson: _intFromJsonNullable) int? authorId,@JsonKey(name: 'question_text') String questionText,@JsonKey(name: 'answer_text') String? answerText,@JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable) int? answeredById,@JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable) DateTime? answeredAt,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'author_first_name') String? authorFirstName,@JsonKey(name: 'author_last_name') String? authorLastName,@JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,@JsonKey(name: 'answered_by_first_name') String? answeredByFirstName,@JsonKey(name: 'answered_by_last_name') String? answeredByLastName,@JsonKey(name: 'answered_by_avatar_url') String? answeredByAvatarUrl
});




}
/// @nodoc
class _$FlightQuestionDtoCopyWithImpl<$Res>
    implements $FlightQuestionDtoCopyWith<$Res> {
  _$FlightQuestionDtoCopyWithImpl(this._self, this._then);

  final FlightQuestionDto _self;
  final $Res Function(FlightQuestionDto) _then;

/// Create a copy of FlightQuestionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flightId = null,Object? authorId = freezed,Object? questionText = null,Object? answerText = freezed,Object? answeredById = freezed,Object? answeredAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? authorFirstName = freezed,Object? authorLastName = freezed,Object? authorAvatarUrl = freezed,Object? answeredByFirstName = freezed,Object? answeredByLastName = freezed,Object? answeredByAvatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,answerText: freezed == answerText ? _self.answerText : answerText // ignore: cast_nullable_to_non_nullable
as String?,answeredById: freezed == answeredById ? _self.answeredById : answeredById // ignore: cast_nullable_to_non_nullable
as int?,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,authorFirstName: freezed == authorFirstName ? _self.authorFirstName : authorFirstName // ignore: cast_nullable_to_non_nullable
as String?,authorLastName: freezed == authorLastName ? _self.authorLastName : authorLastName // ignore: cast_nullable_to_non_nullable
as String?,authorAvatarUrl: freezed == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,answeredByFirstName: freezed == answeredByFirstName ? _self.answeredByFirstName : answeredByFirstName // ignore: cast_nullable_to_non_nullable
as String?,answeredByLastName: freezed == answeredByLastName ? _self.answeredByLastName : answeredByLastName // ignore: cast_nullable_to_non_nullable
as String?,answeredByAvatarUrl: freezed == answeredByAvatarUrl ? _self.answeredByAvatarUrl : answeredByAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightQuestionDto].
extension FlightQuestionDtoPatterns on FlightQuestionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightQuestionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightQuestionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightQuestionDto value)  $default,){
final _that = this;
switch (_that) {
case _FlightQuestionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightQuestionDto value)?  $default,){
final _that = this;
switch (_that) {
case _FlightQuestionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'author_id', fromJson: _intFromJsonNullable)  int? authorId, @JsonKey(name: 'question_text')  String questionText, @JsonKey(name: 'answer_text')  String? answerText, @JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable)  int? answeredById, @JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable)  DateTime? answeredAt, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'author_first_name')  String? authorFirstName, @JsonKey(name: 'author_last_name')  String? authorLastName, @JsonKey(name: 'author_avatar_url')  String? authorAvatarUrl, @JsonKey(name: 'answered_by_first_name')  String? answeredByFirstName, @JsonKey(name: 'answered_by_last_name')  String? answeredByLastName, @JsonKey(name: 'answered_by_avatar_url')  String? answeredByAvatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightQuestionDto() when $default != null:
return $default(_that.id,_that.flightId,_that.authorId,_that.questionText,_that.answerText,_that.answeredById,_that.answeredAt,_that.createdAt,_that.updatedAt,_that.authorFirstName,_that.authorLastName,_that.authorAvatarUrl,_that.answeredByFirstName,_that.answeredByLastName,_that.answeredByAvatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'author_id', fromJson: _intFromJsonNullable)  int? authorId, @JsonKey(name: 'question_text')  String questionText, @JsonKey(name: 'answer_text')  String? answerText, @JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable)  int? answeredById, @JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable)  DateTime? answeredAt, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'author_first_name')  String? authorFirstName, @JsonKey(name: 'author_last_name')  String? authorLastName, @JsonKey(name: 'author_avatar_url')  String? authorAvatarUrl, @JsonKey(name: 'answered_by_first_name')  String? answeredByFirstName, @JsonKey(name: 'answered_by_last_name')  String? answeredByLastName, @JsonKey(name: 'answered_by_avatar_url')  String? answeredByAvatarUrl)  $default,) {final _that = this;
switch (_that) {
case _FlightQuestionDto():
return $default(_that.id,_that.flightId,_that.authorId,_that.questionText,_that.answerText,_that.answeredById,_that.answeredAt,_that.createdAt,_that.updatedAt,_that.authorFirstName,_that.authorLastName,_that.authorAvatarUrl,_that.answeredByFirstName,_that.answeredByLastName,_that.answeredByAvatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'author_id', fromJson: _intFromJsonNullable)  int? authorId, @JsonKey(name: 'question_text')  String questionText, @JsonKey(name: 'answer_text')  String? answerText, @JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable)  int? answeredById, @JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable)  DateTime? answeredAt, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'author_first_name')  String? authorFirstName, @JsonKey(name: 'author_last_name')  String? authorLastName, @JsonKey(name: 'author_avatar_url')  String? authorAvatarUrl, @JsonKey(name: 'answered_by_first_name')  String? answeredByFirstName, @JsonKey(name: 'answered_by_last_name')  String? answeredByLastName, @JsonKey(name: 'answered_by_avatar_url')  String? answeredByAvatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _FlightQuestionDto() when $default != null:
return $default(_that.id,_that.flightId,_that.authorId,_that.questionText,_that.answerText,_that.answeredById,_that.answeredAt,_that.createdAt,_that.updatedAt,_that.authorFirstName,_that.authorLastName,_that.authorAvatarUrl,_that.answeredByFirstName,_that.answeredByLastName,_that.answeredByAvatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlightQuestionDto implements FlightQuestionDto {
  const _FlightQuestionDto({required this.id, @JsonKey(name: 'flight_id') required this.flightId, @JsonKey(name: 'author_id', fromJson: _intFromJsonNullable) this.authorId, @JsonKey(name: 'question_text') required this.questionText, @JsonKey(name: 'answer_text') this.answerText, @JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable) this.answeredById, @JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable) this.answeredAt, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) this.updatedAt, @JsonKey(name: 'author_first_name') this.authorFirstName, @JsonKey(name: 'author_last_name') this.authorLastName, @JsonKey(name: 'author_avatar_url') this.authorAvatarUrl, @JsonKey(name: 'answered_by_first_name') this.answeredByFirstName, @JsonKey(name: 'answered_by_last_name') this.answeredByLastName, @JsonKey(name: 'answered_by_avatar_url') this.answeredByAvatarUrl});
  factory _FlightQuestionDto.fromJson(Map<String, dynamic> json) => _$FlightQuestionDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'flight_id') final  int flightId;
@override@JsonKey(name: 'author_id', fromJson: _intFromJsonNullable) final  int? authorId;
@override@JsonKey(name: 'question_text') final  String questionText;
@override@JsonKey(name: 'answer_text') final  String? answerText;
@override@JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable) final  int? answeredById;
@override@JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? answeredAt;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? updatedAt;
@override@JsonKey(name: 'author_first_name') final  String? authorFirstName;
@override@JsonKey(name: 'author_last_name') final  String? authorLastName;
@override@JsonKey(name: 'author_avatar_url') final  String? authorAvatarUrl;
@override@JsonKey(name: 'answered_by_first_name') final  String? answeredByFirstName;
@override@JsonKey(name: 'answered_by_last_name') final  String? answeredByLastName;
@override@JsonKey(name: 'answered_by_avatar_url') final  String? answeredByAvatarUrl;

/// Create a copy of FlightQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightQuestionDtoCopyWith<_FlightQuestionDto> get copyWith => __$FlightQuestionDtoCopyWithImpl<_FlightQuestionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightQuestionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.answerText, answerText) || other.answerText == answerText)&&(identical(other.answeredById, answeredById) || other.answeredById == answeredById)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authorFirstName, authorFirstName) || other.authorFirstName == authorFirstName)&&(identical(other.authorLastName, authorLastName) || other.authorLastName == authorLastName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.answeredByFirstName, answeredByFirstName) || other.answeredByFirstName == answeredByFirstName)&&(identical(other.answeredByLastName, answeredByLastName) || other.answeredByLastName == answeredByLastName)&&(identical(other.answeredByAvatarUrl, answeredByAvatarUrl) || other.answeredByAvatarUrl == answeredByAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flightId,authorId,questionText,answerText,answeredById,answeredAt,createdAt,updatedAt,authorFirstName,authorLastName,authorAvatarUrl,answeredByFirstName,answeredByLastName,answeredByAvatarUrl);

@override
String toString() {
  return 'FlightQuestionDto(id: $id, flightId: $flightId, authorId: $authorId, questionText: $questionText, answerText: $answerText, answeredById: $answeredById, answeredAt: $answeredAt, createdAt: $createdAt, updatedAt: $updatedAt, authorFirstName: $authorFirstName, authorLastName: $authorLastName, authorAvatarUrl: $authorAvatarUrl, answeredByFirstName: $answeredByFirstName, answeredByLastName: $answeredByLastName, answeredByAvatarUrl: $answeredByAvatarUrl)';
}


}

/// @nodoc
abstract mixin class _$FlightQuestionDtoCopyWith<$Res> implements $FlightQuestionDtoCopyWith<$Res> {
  factory _$FlightQuestionDtoCopyWith(_FlightQuestionDto value, $Res Function(_FlightQuestionDto) _then) = __$FlightQuestionDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'flight_id') int flightId,@JsonKey(name: 'author_id', fromJson: _intFromJsonNullable) int? authorId,@JsonKey(name: 'question_text') String questionText,@JsonKey(name: 'answer_text') String? answerText,@JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable) int? answeredById,@JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable) DateTime? answeredAt,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'author_first_name') String? authorFirstName,@JsonKey(name: 'author_last_name') String? authorLastName,@JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,@JsonKey(name: 'answered_by_first_name') String? answeredByFirstName,@JsonKey(name: 'answered_by_last_name') String? answeredByLastName,@JsonKey(name: 'answered_by_avatar_url') String? answeredByAvatarUrl
});




}
/// @nodoc
class __$FlightQuestionDtoCopyWithImpl<$Res>
    implements _$FlightQuestionDtoCopyWith<$Res> {
  __$FlightQuestionDtoCopyWithImpl(this._self, this._then);

  final _FlightQuestionDto _self;
  final $Res Function(_FlightQuestionDto) _then;

/// Create a copy of FlightQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flightId = null,Object? authorId = freezed,Object? questionText = null,Object? answerText = freezed,Object? answeredById = freezed,Object? answeredAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? authorFirstName = freezed,Object? authorLastName = freezed,Object? authorAvatarUrl = freezed,Object? answeredByFirstName = freezed,Object? answeredByLastName = freezed,Object? answeredByAvatarUrl = freezed,}) {
  return _then(_FlightQuestionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,answerText: freezed == answerText ? _self.answerText : answerText // ignore: cast_nullable_to_non_nullable
as String?,answeredById: freezed == answeredById ? _self.answeredById : answeredById // ignore: cast_nullable_to_non_nullable
as int?,answeredAt: freezed == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,authorFirstName: freezed == authorFirstName ? _self.authorFirstName : authorFirstName // ignore: cast_nullable_to_non_nullable
as String?,authorLastName: freezed == authorLastName ? _self.authorLastName : authorLastName // ignore: cast_nullable_to_non_nullable
as String?,authorAvatarUrl: freezed == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,answeredByFirstName: freezed == answeredByFirstName ? _self.answeredByFirstName : answeredByFirstName // ignore: cast_nullable_to_non_nullable
as String?,answeredByLastName: freezed == answeredByLastName ? _self.answeredByLastName : answeredByLastName // ignore: cast_nullable_to_non_nullable
as String?,answeredByAvatarUrl: freezed == answeredByAvatarUrl ? _self.answeredByAvatarUrl : answeredByAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
