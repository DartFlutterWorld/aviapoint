// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_booking_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateBookingRequestDto {

@JsonKey(name: 'flight_id') int get flightId;@JsonKey(name: 'seats_count') int get seatsCount;
/// Create a copy of CreateBookingRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateBookingRequestDtoCopyWith<CreateBookingRequestDto> get copyWith => _$CreateBookingRequestDtoCopyWithImpl<CreateBookingRequestDto>(this as CreateBookingRequestDto, _$identity);

  /// Serializes this CreateBookingRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBookingRequestDto&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.seatsCount, seatsCount) || other.seatsCount == seatsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flightId,seatsCount);

@override
String toString() {
  return 'CreateBookingRequestDto(flightId: $flightId, seatsCount: $seatsCount)';
}


}

/// @nodoc
abstract mixin class $CreateBookingRequestDtoCopyWith<$Res>  {
  factory $CreateBookingRequestDtoCopyWith(CreateBookingRequestDto value, $Res Function(CreateBookingRequestDto) _then) = _$CreateBookingRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'flight_id') int flightId,@JsonKey(name: 'seats_count') int seatsCount
});




}
/// @nodoc
class _$CreateBookingRequestDtoCopyWithImpl<$Res>
    implements $CreateBookingRequestDtoCopyWith<$Res> {
  _$CreateBookingRequestDtoCopyWithImpl(this._self, this._then);

  final CreateBookingRequestDto _self;
  final $Res Function(CreateBookingRequestDto) _then;

/// Create a copy of CreateBookingRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flightId = null,Object? seatsCount = null,}) {
  return _then(_self.copyWith(
flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,seatsCount: null == seatsCount ? _self.seatsCount : seatsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateBookingRequestDto].
extension CreateBookingRequestDtoPatterns on CreateBookingRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateBookingRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateBookingRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateBookingRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateBookingRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateBookingRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateBookingRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'seats_count')  int seatsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateBookingRequestDto() when $default != null:
return $default(_that.flightId,_that.seatsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'seats_count')  int seatsCount)  $default,) {final _that = this;
switch (_that) {
case _CreateBookingRequestDto():
return $default(_that.flightId,_that.seatsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'seats_count')  int seatsCount)?  $default,) {final _that = this;
switch (_that) {
case _CreateBookingRequestDto() when $default != null:
return $default(_that.flightId,_that.seatsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateBookingRequestDto implements CreateBookingRequestDto {
  const _CreateBookingRequestDto({@JsonKey(name: 'flight_id') required this.flightId, @JsonKey(name: 'seats_count') required this.seatsCount});
  factory _CreateBookingRequestDto.fromJson(Map<String, dynamic> json) => _$CreateBookingRequestDtoFromJson(json);

@override@JsonKey(name: 'flight_id') final  int flightId;
@override@JsonKey(name: 'seats_count') final  int seatsCount;

/// Create a copy of CreateBookingRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateBookingRequestDtoCopyWith<_CreateBookingRequestDto> get copyWith => __$CreateBookingRequestDtoCopyWithImpl<_CreateBookingRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateBookingRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateBookingRequestDto&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.seatsCount, seatsCount) || other.seatsCount == seatsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flightId,seatsCount);

@override
String toString() {
  return 'CreateBookingRequestDto(flightId: $flightId, seatsCount: $seatsCount)';
}


}

/// @nodoc
abstract mixin class _$CreateBookingRequestDtoCopyWith<$Res> implements $CreateBookingRequestDtoCopyWith<$Res> {
  factory _$CreateBookingRequestDtoCopyWith(_CreateBookingRequestDto value, $Res Function(_CreateBookingRequestDto) _then) = __$CreateBookingRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'flight_id') int flightId,@JsonKey(name: 'seats_count') int seatsCount
});




}
/// @nodoc
class __$CreateBookingRequestDtoCopyWithImpl<$Res>
    implements _$CreateBookingRequestDtoCopyWith<$Res> {
  __$CreateBookingRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateBookingRequestDto _self;
  final $Res Function(_CreateBookingRequestDto) _then;

/// Create a copy of CreateBookingRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flightId = null,Object? seatsCount = null,}) {
  return _then(_CreateBookingRequestDto(
flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,seatsCount: null == seatsCount ? _self.seatsCount : seatsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
