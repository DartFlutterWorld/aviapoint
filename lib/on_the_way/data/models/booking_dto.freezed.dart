// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingDto {

@JsonKey(fromJson: _intFromJson) int get id;@JsonKey(name: 'flight_id', fromJson: _intFromJson) int get flightId;@JsonKey(name: 'passenger_id', fromJson: _intFromJson) int get passengerId;@JsonKey(name: 'seats_count', fromJson: _intFromJson) int get seatsCount;@JsonKey(name: 'total_price', fromJson: _intFromJson) int get totalPrice; String? get status;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? get updatedAt;// Данные пассажира (загружаются через JOIN в SQL)
@JsonKey(name: 'passenger_first_name') String? get passengerFirstName;@JsonKey(name: 'passenger_last_name') String? get passengerLastName;@JsonKey(name: 'passenger_avatar_url') String? get passengerAvatarUrl;@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) double? get passengerAverageRating;
/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDtoCopyWith<BookingDto> get copyWith => _$BookingDtoCopyWithImpl<BookingDto>(this as BookingDto, _$identity);

  /// Serializes this BookingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.passengerId, passengerId) || other.passengerId == passengerId)&&(identical(other.seatsCount, seatsCount) || other.seatsCount == seatsCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.passengerFirstName, passengerFirstName) || other.passengerFirstName == passengerFirstName)&&(identical(other.passengerLastName, passengerLastName) || other.passengerLastName == passengerLastName)&&(identical(other.passengerAvatarUrl, passengerAvatarUrl) || other.passengerAvatarUrl == passengerAvatarUrl)&&(identical(other.passengerAverageRating, passengerAverageRating) || other.passengerAverageRating == passengerAverageRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flightId,passengerId,seatsCount,totalPrice,status,createdAt,updatedAt,passengerFirstName,passengerLastName,passengerAvatarUrl,passengerAverageRating);

@override
String toString() {
  return 'BookingDto(id: $id, flightId: $flightId, passengerId: $passengerId, seatsCount: $seatsCount, totalPrice: $totalPrice, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, passengerFirstName: $passengerFirstName, passengerLastName: $passengerLastName, passengerAvatarUrl: $passengerAvatarUrl, passengerAverageRating: $passengerAverageRating)';
}


}

/// @nodoc
abstract mixin class $BookingDtoCopyWith<$Res>  {
  factory $BookingDtoCopyWith(BookingDto value, $Res Function(BookingDto) _then) = _$BookingDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intFromJson) int id,@JsonKey(name: 'flight_id', fromJson: _intFromJson) int flightId,@JsonKey(name: 'passenger_id', fromJson: _intFromJson) int passengerId,@JsonKey(name: 'seats_count', fromJson: _intFromJson) int seatsCount,@JsonKey(name: 'total_price', fromJson: _intFromJson) int totalPrice, String? status,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'passenger_first_name') String? passengerFirstName,@JsonKey(name: 'passenger_last_name') String? passengerLastName,@JsonKey(name: 'passenger_avatar_url') String? passengerAvatarUrl,@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) double? passengerAverageRating
});




}
/// @nodoc
class _$BookingDtoCopyWithImpl<$Res>
    implements $BookingDtoCopyWith<$Res> {
  _$BookingDtoCopyWithImpl(this._self, this._then);

  final BookingDto _self;
  final $Res Function(BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flightId = null,Object? passengerId = null,Object? seatsCount = null,Object? totalPrice = null,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? passengerFirstName = freezed,Object? passengerLastName = freezed,Object? passengerAvatarUrl = freezed,Object? passengerAverageRating = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,passengerId: null == passengerId ? _self.passengerId : passengerId // ignore: cast_nullable_to_non_nullable
as int,seatsCount: null == seatsCount ? _self.seatsCount : seatsCount // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,passengerFirstName: freezed == passengerFirstName ? _self.passengerFirstName : passengerFirstName // ignore: cast_nullable_to_non_nullable
as String?,passengerLastName: freezed == passengerLastName ? _self.passengerLastName : passengerLastName // ignore: cast_nullable_to_non_nullable
as String?,passengerAvatarUrl: freezed == passengerAvatarUrl ? _self.passengerAvatarUrl : passengerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,passengerAverageRating: freezed == passengerAverageRating ? _self.passengerAverageRating : passengerAverageRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingDto].
extension BookingDtoPatterns on BookingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'flight_id', fromJson: _intFromJson)  int flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson)  int passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson)  int seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson)  int totalPrice,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'passenger_first_name')  String? passengerFirstName, @JsonKey(name: 'passenger_last_name')  String? passengerLastName, @JsonKey(name: 'passenger_avatar_url')  String? passengerAvatarUrl, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable)  double? passengerAverageRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.id,_that.flightId,_that.passengerId,_that.seatsCount,_that.totalPrice,_that.status,_that.createdAt,_that.updatedAt,_that.passengerFirstName,_that.passengerLastName,_that.passengerAvatarUrl,_that.passengerAverageRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'flight_id', fromJson: _intFromJson)  int flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson)  int passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson)  int seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson)  int totalPrice,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'passenger_first_name')  String? passengerFirstName, @JsonKey(name: 'passenger_last_name')  String? passengerLastName, @JsonKey(name: 'passenger_avatar_url')  String? passengerAvatarUrl, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable)  double? passengerAverageRating)  $default,) {final _that = this;
switch (_that) {
case _BookingDto():
return $default(_that.id,_that.flightId,_that.passengerId,_that.seatsCount,_that.totalPrice,_that.status,_that.createdAt,_that.updatedAt,_that.passengerFirstName,_that.passengerLastName,_that.passengerAvatarUrl,_that.passengerAverageRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'flight_id', fromJson: _intFromJson)  int flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson)  int passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson)  int seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson)  int totalPrice,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'passenger_first_name')  String? passengerFirstName, @JsonKey(name: 'passenger_last_name')  String? passengerLastName, @JsonKey(name: 'passenger_avatar_url')  String? passengerAvatarUrl, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable)  double? passengerAverageRating)?  $default,) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.id,_that.flightId,_that.passengerId,_that.seatsCount,_that.totalPrice,_that.status,_that.createdAt,_that.updatedAt,_that.passengerFirstName,_that.passengerLastName,_that.passengerAvatarUrl,_that.passengerAverageRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDto implements BookingDto {
  const _BookingDto({@JsonKey(fromJson: _intFromJson) required this.id, @JsonKey(name: 'flight_id', fromJson: _intFromJson) required this.flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson) required this.passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson) required this.seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson) required this.totalPrice, this.status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) this.updatedAt, @JsonKey(name: 'passenger_first_name') this.passengerFirstName, @JsonKey(name: 'passenger_last_name') this.passengerLastName, @JsonKey(name: 'passenger_avatar_url') this.passengerAvatarUrl, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) this.passengerAverageRating});
  factory _BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);

@override@JsonKey(fromJson: _intFromJson) final  int id;
@override@JsonKey(name: 'flight_id', fromJson: _intFromJson) final  int flightId;
@override@JsonKey(name: 'passenger_id', fromJson: _intFromJson) final  int passengerId;
@override@JsonKey(name: 'seats_count', fromJson: _intFromJson) final  int seatsCount;
@override@JsonKey(name: 'total_price', fromJson: _intFromJson) final  int totalPrice;
@override final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? updatedAt;
// Данные пассажира (загружаются через JOIN в SQL)
@override@JsonKey(name: 'passenger_first_name') final  String? passengerFirstName;
@override@JsonKey(name: 'passenger_last_name') final  String? passengerLastName;
@override@JsonKey(name: 'passenger_avatar_url') final  String? passengerAvatarUrl;
@override@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) final  double? passengerAverageRating;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDtoCopyWith<_BookingDto> get copyWith => __$BookingDtoCopyWithImpl<_BookingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.passengerId, passengerId) || other.passengerId == passengerId)&&(identical(other.seatsCount, seatsCount) || other.seatsCount == seatsCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.passengerFirstName, passengerFirstName) || other.passengerFirstName == passengerFirstName)&&(identical(other.passengerLastName, passengerLastName) || other.passengerLastName == passengerLastName)&&(identical(other.passengerAvatarUrl, passengerAvatarUrl) || other.passengerAvatarUrl == passengerAvatarUrl)&&(identical(other.passengerAverageRating, passengerAverageRating) || other.passengerAverageRating == passengerAverageRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flightId,passengerId,seatsCount,totalPrice,status,createdAt,updatedAt,passengerFirstName,passengerLastName,passengerAvatarUrl,passengerAverageRating);

@override
String toString() {
  return 'BookingDto(id: $id, flightId: $flightId, passengerId: $passengerId, seatsCount: $seatsCount, totalPrice: $totalPrice, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, passengerFirstName: $passengerFirstName, passengerLastName: $passengerLastName, passengerAvatarUrl: $passengerAvatarUrl, passengerAverageRating: $passengerAverageRating)';
}


}

/// @nodoc
abstract mixin class _$BookingDtoCopyWith<$Res> implements $BookingDtoCopyWith<$Res> {
  factory _$BookingDtoCopyWith(_BookingDto value, $Res Function(_BookingDto) _then) = __$BookingDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intFromJson) int id,@JsonKey(name: 'flight_id', fromJson: _intFromJson) int flightId,@JsonKey(name: 'passenger_id', fromJson: _intFromJson) int passengerId,@JsonKey(name: 'seats_count', fromJson: _intFromJson) int seatsCount,@JsonKey(name: 'total_price', fromJson: _intFromJson) int totalPrice, String? status,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'passenger_first_name') String? passengerFirstName,@JsonKey(name: 'passenger_last_name') String? passengerLastName,@JsonKey(name: 'passenger_avatar_url') String? passengerAvatarUrl,@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) double? passengerAverageRating
});




}
/// @nodoc
class __$BookingDtoCopyWithImpl<$Res>
    implements _$BookingDtoCopyWith<$Res> {
  __$BookingDtoCopyWithImpl(this._self, this._then);

  final _BookingDto _self;
  final $Res Function(_BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flightId = null,Object? passengerId = null,Object? seatsCount = null,Object? totalPrice = null,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? passengerFirstName = freezed,Object? passengerLastName = freezed,Object? passengerAvatarUrl = freezed,Object? passengerAverageRating = freezed,}) {
  return _then(_BookingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,passengerId: null == passengerId ? _self.passengerId : passengerId // ignore: cast_nullable_to_non_nullable
as int,seatsCount: null == seatsCount ? _self.seatsCount : seatsCount // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,passengerFirstName: freezed == passengerFirstName ? _self.passengerFirstName : passengerFirstName // ignore: cast_nullable_to_non_nullable
as String?,passengerLastName: freezed == passengerLastName ? _self.passengerLastName : passengerLastName // ignore: cast_nullable_to_non_nullable
as String?,passengerAvatarUrl: freezed == passengerAvatarUrl ? _self.passengerAvatarUrl : passengerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,passengerAverageRating: freezed == passengerAverageRating ? _self.passengerAverageRating : passengerAverageRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
