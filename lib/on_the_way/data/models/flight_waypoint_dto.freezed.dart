// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_waypoint_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlightWaypointDto {

 int get id;@JsonKey(name: 'flight_id') int get flightId;@JsonKey(name: 'airport_code') String get airportCode;@JsonKey(name: 'sequence_order') int get sequenceOrder;@JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable) DateTime? get arrivalTime;@JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable) DateTime? get departureTime; String? get comment;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;// Дополнительная информация об аэропорте
@JsonKey(name: 'airport_name') String? get airportName;@JsonKey(name: 'airport_city') String? get airportCity;@JsonKey(name: 'airport_region') String? get airportRegion;@JsonKey(name: 'airport_type') String? get airportType;@JsonKey(name: 'airport_ident_ru') String? get airportIdentRu;
/// Create a copy of FlightWaypointDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightWaypointDtoCopyWith<FlightWaypointDto> get copyWith => _$FlightWaypointDtoCopyWithImpl<FlightWaypointDto>(this as FlightWaypointDto, _$identity);

  /// Serializes this FlightWaypointDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightWaypointDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.airportName, airportName) || other.airportName == airportName)&&(identical(other.airportCity, airportCity) || other.airportCity == airportCity)&&(identical(other.airportRegion, airportRegion) || other.airportRegion == airportRegion)&&(identical(other.airportType, airportType) || other.airportType == airportType)&&(identical(other.airportIdentRu, airportIdentRu) || other.airportIdentRu == airportIdentRu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flightId,airportCode,sequenceOrder,arrivalTime,departureTime,comment,createdAt,airportName,airportCity,airportRegion,airportType,airportIdentRu);

@override
String toString() {
  return 'FlightWaypointDto(id: $id, flightId: $flightId, airportCode: $airportCode, sequenceOrder: $sequenceOrder, arrivalTime: $arrivalTime, departureTime: $departureTime, comment: $comment, createdAt: $createdAt, airportName: $airportName, airportCity: $airportCity, airportRegion: $airportRegion, airportType: $airportType, airportIdentRu: $airportIdentRu)';
}


}

/// @nodoc
abstract mixin class $FlightWaypointDtoCopyWith<$Res>  {
  factory $FlightWaypointDtoCopyWith(FlightWaypointDto value, $Res Function(FlightWaypointDto) _then) = _$FlightWaypointDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'flight_id') int flightId,@JsonKey(name: 'airport_code') String airportCode,@JsonKey(name: 'sequence_order') int sequenceOrder,@JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable) DateTime? arrivalTime,@JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable) DateTime? departureTime, String? comment,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'airport_name') String? airportName,@JsonKey(name: 'airport_city') String? airportCity,@JsonKey(name: 'airport_region') String? airportRegion,@JsonKey(name: 'airport_type') String? airportType,@JsonKey(name: 'airport_ident_ru') String? airportIdentRu
});




}
/// @nodoc
class _$FlightWaypointDtoCopyWithImpl<$Res>
    implements $FlightWaypointDtoCopyWith<$Res> {
  _$FlightWaypointDtoCopyWithImpl(this._self, this._then);

  final FlightWaypointDto _self;
  final $Res Function(FlightWaypointDto) _then;

/// Create a copy of FlightWaypointDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flightId = null,Object? airportCode = null,Object? sequenceOrder = null,Object? arrivalTime = freezed,Object? departureTime = freezed,Object? comment = freezed,Object? createdAt = freezed,Object? airportName = freezed,Object? airportCity = freezed,Object? airportRegion = freezed,Object? airportType = freezed,Object? airportIdentRu = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,airportCode: null == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,airportName: freezed == airportName ? _self.airportName : airportName // ignore: cast_nullable_to_non_nullable
as String?,airportCity: freezed == airportCity ? _self.airportCity : airportCity // ignore: cast_nullable_to_non_nullable
as String?,airportRegion: freezed == airportRegion ? _self.airportRegion : airportRegion // ignore: cast_nullable_to_non_nullable
as String?,airportType: freezed == airportType ? _self.airportType : airportType // ignore: cast_nullable_to_non_nullable
as String?,airportIdentRu: freezed == airportIdentRu ? _self.airportIdentRu : airportIdentRu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightWaypointDto].
extension FlightWaypointDtoPatterns on FlightWaypointDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightWaypointDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightWaypointDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightWaypointDto value)  $default,){
final _that = this;
switch (_that) {
case _FlightWaypointDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightWaypointDto value)?  $default,){
final _that = this;
switch (_that) {
case _FlightWaypointDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'sequence_order')  int sequenceOrder, @JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable)  DateTime? arrivalTime, @JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable)  DateTime? departureTime,  String? comment, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'airport_name')  String? airportName, @JsonKey(name: 'airport_city')  String? airportCity, @JsonKey(name: 'airport_region')  String? airportRegion, @JsonKey(name: 'airport_type')  String? airportType, @JsonKey(name: 'airport_ident_ru')  String? airportIdentRu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightWaypointDto() when $default != null:
return $default(_that.id,_that.flightId,_that.airportCode,_that.sequenceOrder,_that.arrivalTime,_that.departureTime,_that.comment,_that.createdAt,_that.airportName,_that.airportCity,_that.airportRegion,_that.airportType,_that.airportIdentRu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'sequence_order')  int sequenceOrder, @JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable)  DateTime? arrivalTime, @JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable)  DateTime? departureTime,  String? comment, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'airport_name')  String? airportName, @JsonKey(name: 'airport_city')  String? airportCity, @JsonKey(name: 'airport_region')  String? airportRegion, @JsonKey(name: 'airport_type')  String? airportType, @JsonKey(name: 'airport_ident_ru')  String? airportIdentRu)  $default,) {final _that = this;
switch (_that) {
case _FlightWaypointDto():
return $default(_that.id,_that.flightId,_that.airportCode,_that.sequenceOrder,_that.arrivalTime,_that.departureTime,_that.comment,_that.createdAt,_that.airportName,_that.airportCity,_that.airportRegion,_that.airportType,_that.airportIdentRu);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'flight_id')  int flightId, @JsonKey(name: 'airport_code')  String airportCode, @JsonKey(name: 'sequence_order')  int sequenceOrder, @JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable)  DateTime? arrivalTime, @JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable)  DateTime? departureTime,  String? comment, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'airport_name')  String? airportName, @JsonKey(name: 'airport_city')  String? airportCity, @JsonKey(name: 'airport_region')  String? airportRegion, @JsonKey(name: 'airport_type')  String? airportType, @JsonKey(name: 'airport_ident_ru')  String? airportIdentRu)?  $default,) {final _that = this;
switch (_that) {
case _FlightWaypointDto() when $default != null:
return $default(_that.id,_that.flightId,_that.airportCode,_that.sequenceOrder,_that.arrivalTime,_that.departureTime,_that.comment,_that.createdAt,_that.airportName,_that.airportCity,_that.airportRegion,_that.airportType,_that.airportIdentRu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlightWaypointDto implements FlightWaypointDto {
  const _FlightWaypointDto({required this.id, @JsonKey(name: 'flight_id') required this.flightId, @JsonKey(name: 'airport_code') required this.airportCode, @JsonKey(name: 'sequence_order') required this.sequenceOrder, @JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable) this.arrivalTime, @JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable) this.departureTime, this.comment, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'airport_name') this.airportName, @JsonKey(name: 'airport_city') this.airportCity, @JsonKey(name: 'airport_region') this.airportRegion, @JsonKey(name: 'airport_type') this.airportType, @JsonKey(name: 'airport_ident_ru') this.airportIdentRu});
  factory _FlightWaypointDto.fromJson(Map<String, dynamic> json) => _$FlightWaypointDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'flight_id') final  int flightId;
@override@JsonKey(name: 'airport_code') final  String airportCode;
@override@JsonKey(name: 'sequence_order') final  int sequenceOrder;
@override@JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable) final  DateTime? arrivalTime;
@override@JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable) final  DateTime? departureTime;
@override final  String? comment;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
// Дополнительная информация об аэропорте
@override@JsonKey(name: 'airport_name') final  String? airportName;
@override@JsonKey(name: 'airport_city') final  String? airportCity;
@override@JsonKey(name: 'airport_region') final  String? airportRegion;
@override@JsonKey(name: 'airport_type') final  String? airportType;
@override@JsonKey(name: 'airport_ident_ru') final  String? airportIdentRu;

/// Create a copy of FlightWaypointDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightWaypointDtoCopyWith<_FlightWaypointDto> get copyWith => __$FlightWaypointDtoCopyWithImpl<_FlightWaypointDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightWaypointDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightWaypointDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.airportName, airportName) || other.airportName == airportName)&&(identical(other.airportCity, airportCity) || other.airportCity == airportCity)&&(identical(other.airportRegion, airportRegion) || other.airportRegion == airportRegion)&&(identical(other.airportType, airportType) || other.airportType == airportType)&&(identical(other.airportIdentRu, airportIdentRu) || other.airportIdentRu == airportIdentRu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,flightId,airportCode,sequenceOrder,arrivalTime,departureTime,comment,createdAt,airportName,airportCity,airportRegion,airportType,airportIdentRu);

@override
String toString() {
  return 'FlightWaypointDto(id: $id, flightId: $flightId, airportCode: $airportCode, sequenceOrder: $sequenceOrder, arrivalTime: $arrivalTime, departureTime: $departureTime, comment: $comment, createdAt: $createdAt, airportName: $airportName, airportCity: $airportCity, airportRegion: $airportRegion, airportType: $airportType, airportIdentRu: $airportIdentRu)';
}


}

/// @nodoc
abstract mixin class _$FlightWaypointDtoCopyWith<$Res> implements $FlightWaypointDtoCopyWith<$Res> {
  factory _$FlightWaypointDtoCopyWith(_FlightWaypointDto value, $Res Function(_FlightWaypointDto) _then) = __$FlightWaypointDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'flight_id') int flightId,@JsonKey(name: 'airport_code') String airportCode,@JsonKey(name: 'sequence_order') int sequenceOrder,@JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable) DateTime? arrivalTime,@JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable) DateTime? departureTime, String? comment,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'airport_name') String? airportName,@JsonKey(name: 'airport_city') String? airportCity,@JsonKey(name: 'airport_region') String? airportRegion,@JsonKey(name: 'airport_type') String? airportType,@JsonKey(name: 'airport_ident_ru') String? airportIdentRu
});




}
/// @nodoc
class __$FlightWaypointDtoCopyWithImpl<$Res>
    implements _$FlightWaypointDtoCopyWith<$Res> {
  __$FlightWaypointDtoCopyWithImpl(this._self, this._then);

  final _FlightWaypointDto _self;
  final $Res Function(_FlightWaypointDto) _then;

/// Create a copy of FlightWaypointDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flightId = null,Object? airportCode = null,Object? sequenceOrder = null,Object? arrivalTime = freezed,Object? departureTime = freezed,Object? comment = freezed,Object? createdAt = freezed,Object? airportName = freezed,Object? airportCity = freezed,Object? airportRegion = freezed,Object? airportType = freezed,Object? airportIdentRu = freezed,}) {
  return _then(_FlightWaypointDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,airportCode: null == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,airportName: freezed == airportName ? _self.airportName : airportName // ignore: cast_nullable_to_non_nullable
as String?,airportCity: freezed == airportCity ? _self.airportCity : airportCity // ignore: cast_nullable_to_non_nullable
as String?,airportRegion: freezed == airportRegion ? _self.airportRegion : airportRegion // ignore: cast_nullable_to_non_nullable
as String?,airportType: freezed == airportType ? _self.airportType : airportType // ignore: cast_nullable_to_non_nullable
as String?,airportIdentRu: freezed == airportIdentRu ? _self.airportIdentRu : airportIdentRu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
