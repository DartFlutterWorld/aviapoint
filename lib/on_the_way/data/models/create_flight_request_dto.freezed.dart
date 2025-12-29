// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_flight_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateFlightRequestDto {

@JsonKey(name: 'departure_airport') String get departureAirport;@JsonKey(name: 'arrival_airport') String get arrivalAirport;@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) DateTime get departureDate;@JsonKey(name: 'available_seats') int get availableSeats;@JsonKey(name: 'price_per_seat') double get pricePerSeat;@JsonKey(name: 'aircraft_type') String? get aircraftType; String? get description;@JsonKey(name: 'waypoints') List<Map<String, dynamic>>? get waypoints;
/// Create a copy of CreateFlightRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateFlightRequestDtoCopyWith<CreateFlightRequestDto> get copyWith => _$CreateFlightRequestDtoCopyWithImpl<CreateFlightRequestDto>(this as CreateFlightRequestDto, _$identity);

  /// Serializes this CreateFlightRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateFlightRequestDto&&(identical(other.departureAirport, departureAirport) || other.departureAirport == departureAirport)&&(identical(other.arrivalAirport, arrivalAirport) || other.arrivalAirport == arrivalAirport)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.pricePerSeat, pricePerSeat) || other.pricePerSeat == pricePerSeat)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.waypoints, waypoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureAirport,arrivalAirport,departureDate,availableSeats,pricePerSeat,aircraftType,description,const DeepCollectionEquality().hash(waypoints));

@override
String toString() {
  return 'CreateFlightRequestDto(departureAirport: $departureAirport, arrivalAirport: $arrivalAirport, departureDate: $departureDate, availableSeats: $availableSeats, pricePerSeat: $pricePerSeat, aircraftType: $aircraftType, description: $description, waypoints: $waypoints)';
}


}

/// @nodoc
abstract mixin class $CreateFlightRequestDtoCopyWith<$Res>  {
  factory $CreateFlightRequestDtoCopyWith(CreateFlightRequestDto value, $Res Function(CreateFlightRequestDto) _then) = _$CreateFlightRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'departure_airport') String departureAirport,@JsonKey(name: 'arrival_airport') String arrivalAirport,@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) DateTime departureDate,@JsonKey(name: 'available_seats') int availableSeats,@JsonKey(name: 'price_per_seat') double pricePerSeat,@JsonKey(name: 'aircraft_type') String? aircraftType, String? description,@JsonKey(name: 'waypoints') List<Map<String, dynamic>>? waypoints
});




}
/// @nodoc
class _$CreateFlightRequestDtoCopyWithImpl<$Res>
    implements $CreateFlightRequestDtoCopyWith<$Res> {
  _$CreateFlightRequestDtoCopyWithImpl(this._self, this._then);

  final CreateFlightRequestDto _self;
  final $Res Function(CreateFlightRequestDto) _then;

/// Create a copy of CreateFlightRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departureAirport = null,Object? arrivalAirport = null,Object? departureDate = null,Object? availableSeats = null,Object? pricePerSeat = null,Object? aircraftType = freezed,Object? description = freezed,Object? waypoints = freezed,}) {
  return _then(_self.copyWith(
departureAirport: null == departureAirport ? _self.departureAirport : departureAirport // ignore: cast_nullable_to_non_nullable
as String,arrivalAirport: null == arrivalAirport ? _self.arrivalAirport : arrivalAirport // ignore: cast_nullable_to_non_nullable
as String,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,pricePerSeat: null == pricePerSeat ? _self.pricePerSeat : pricePerSeat // ignore: cast_nullable_to_non_nullable
as double,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,waypoints: freezed == waypoints ? _self.waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateFlightRequestDto].
extension CreateFlightRequestDtoPatterns on CreateFlightRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateFlightRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateFlightRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateFlightRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateFlightRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateFlightRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateFlightRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'departure_airport')  String departureAirport, @JsonKey(name: 'arrival_airport')  String arrivalAirport, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson)  DateTime departureDate, @JsonKey(name: 'available_seats')  int availableSeats, @JsonKey(name: 'price_per_seat')  double pricePerSeat, @JsonKey(name: 'aircraft_type')  String? aircraftType,  String? description, @JsonKey(name: 'waypoints')  List<Map<String, dynamic>>? waypoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateFlightRequestDto() when $default != null:
return $default(_that.departureAirport,_that.arrivalAirport,_that.departureDate,_that.availableSeats,_that.pricePerSeat,_that.aircraftType,_that.description,_that.waypoints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'departure_airport')  String departureAirport, @JsonKey(name: 'arrival_airport')  String arrivalAirport, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson)  DateTime departureDate, @JsonKey(name: 'available_seats')  int availableSeats, @JsonKey(name: 'price_per_seat')  double pricePerSeat, @JsonKey(name: 'aircraft_type')  String? aircraftType,  String? description, @JsonKey(name: 'waypoints')  List<Map<String, dynamic>>? waypoints)  $default,) {final _that = this;
switch (_that) {
case _CreateFlightRequestDto():
return $default(_that.departureAirport,_that.arrivalAirport,_that.departureDate,_that.availableSeats,_that.pricePerSeat,_that.aircraftType,_that.description,_that.waypoints);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'departure_airport')  String departureAirport, @JsonKey(name: 'arrival_airport')  String arrivalAirport, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson)  DateTime departureDate, @JsonKey(name: 'available_seats')  int availableSeats, @JsonKey(name: 'price_per_seat')  double pricePerSeat, @JsonKey(name: 'aircraft_type')  String? aircraftType,  String? description, @JsonKey(name: 'waypoints')  List<Map<String, dynamic>>? waypoints)?  $default,) {final _that = this;
switch (_that) {
case _CreateFlightRequestDto() when $default != null:
return $default(_that.departureAirport,_that.arrivalAirport,_that.departureDate,_that.availableSeats,_that.pricePerSeat,_that.aircraftType,_that.description,_that.waypoints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateFlightRequestDto implements CreateFlightRequestDto {
  const _CreateFlightRequestDto({@JsonKey(name: 'departure_airport') required this.departureAirport, @JsonKey(name: 'arrival_airport') required this.arrivalAirport, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) required this.departureDate, @JsonKey(name: 'available_seats') required this.availableSeats, @JsonKey(name: 'price_per_seat') required this.pricePerSeat, @JsonKey(name: 'aircraft_type') this.aircraftType, this.description, @JsonKey(name: 'waypoints') final  List<Map<String, dynamic>>? waypoints}): _waypoints = waypoints;
  factory _CreateFlightRequestDto.fromJson(Map<String, dynamic> json) => _$CreateFlightRequestDtoFromJson(json);

@override@JsonKey(name: 'departure_airport') final  String departureAirport;
@override@JsonKey(name: 'arrival_airport') final  String arrivalAirport;
@override@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) final  DateTime departureDate;
@override@JsonKey(name: 'available_seats') final  int availableSeats;
@override@JsonKey(name: 'price_per_seat') final  double pricePerSeat;
@override@JsonKey(name: 'aircraft_type') final  String? aircraftType;
@override final  String? description;
 final  List<Map<String, dynamic>>? _waypoints;
@override@JsonKey(name: 'waypoints') List<Map<String, dynamic>>? get waypoints {
  final value = _waypoints;
  if (value == null) return null;
  if (_waypoints is EqualUnmodifiableListView) return _waypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateFlightRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateFlightRequestDtoCopyWith<_CreateFlightRequestDto> get copyWith => __$CreateFlightRequestDtoCopyWithImpl<_CreateFlightRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateFlightRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateFlightRequestDto&&(identical(other.departureAirport, departureAirport) || other.departureAirport == departureAirport)&&(identical(other.arrivalAirport, arrivalAirport) || other.arrivalAirport == arrivalAirport)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.pricePerSeat, pricePerSeat) || other.pricePerSeat == pricePerSeat)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._waypoints, _waypoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departureAirport,arrivalAirport,departureDate,availableSeats,pricePerSeat,aircraftType,description,const DeepCollectionEquality().hash(_waypoints));

@override
String toString() {
  return 'CreateFlightRequestDto(departureAirport: $departureAirport, arrivalAirport: $arrivalAirport, departureDate: $departureDate, availableSeats: $availableSeats, pricePerSeat: $pricePerSeat, aircraftType: $aircraftType, description: $description, waypoints: $waypoints)';
}


}

/// @nodoc
abstract mixin class _$CreateFlightRequestDtoCopyWith<$Res> implements $CreateFlightRequestDtoCopyWith<$Res> {
  factory _$CreateFlightRequestDtoCopyWith(_CreateFlightRequestDto value, $Res Function(_CreateFlightRequestDto) _then) = __$CreateFlightRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'departure_airport') String departureAirport,@JsonKey(name: 'arrival_airport') String arrivalAirport,@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) DateTime departureDate,@JsonKey(name: 'available_seats') int availableSeats,@JsonKey(name: 'price_per_seat') double pricePerSeat,@JsonKey(name: 'aircraft_type') String? aircraftType, String? description,@JsonKey(name: 'waypoints') List<Map<String, dynamic>>? waypoints
});




}
/// @nodoc
class __$CreateFlightRequestDtoCopyWithImpl<$Res>
    implements _$CreateFlightRequestDtoCopyWith<$Res> {
  __$CreateFlightRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateFlightRequestDto _self;
  final $Res Function(_CreateFlightRequestDto) _then;

/// Create a copy of CreateFlightRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departureAirport = null,Object? arrivalAirport = null,Object? departureDate = null,Object? availableSeats = null,Object? pricePerSeat = null,Object? aircraftType = freezed,Object? description = freezed,Object? waypoints = freezed,}) {
  return _then(_CreateFlightRequestDto(
departureAirport: null == departureAirport ? _self.departureAirport : departureAirport // ignore: cast_nullable_to_non_nullable
as String,arrivalAirport: null == arrivalAirport ? _self.arrivalAirport : arrivalAirport // ignore: cast_nullable_to_non_nullable
as String,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,pricePerSeat: null == pricePerSeat ? _self.pricePerSeat : pricePerSeat // ignore: cast_nullable_to_non_nullable
as double,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,waypoints: freezed == waypoints ? _self._waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}

// dart format on
