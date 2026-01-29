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
@JsonKey(name: 'passenger_first_name') String? get passengerFirstName;@JsonKey(name: 'passenger_last_name') String? get passengerLastName;@JsonKey(name: 'passenger_avatar_url') String? get passengerAvatarUrl;@JsonKey(name: 'passenger_phone') String? get passengerPhone;@JsonKey(name: 'passenger_email') String? get passengerEmail;@JsonKey(name: 'passenger_telegram') String? get passengerTelegram;@JsonKey(name: 'passenger_max') String? get passengerMax;@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) double? get passengerAverageRating;@JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable) DateTime? get flightDepartureDate;@JsonKey(name: 'flight_departure_airport') String? get flightDepartureAirport;@JsonKey(name: 'flight_arrival_airport') String? get flightArrivalAirport;@JsonKey(name: 'flight_waypoints') dynamic get flightWaypoints;// JSON массив кодов аэропортов
// Данные пилота (загружаются через JOIN в SQL)
@JsonKey(name: 'pilot_first_name') String? get pilotFirstName;@JsonKey(name: 'pilot_last_name') String? get pilotLastName;@JsonKey(name: 'pilot_phone') String? get pilotPhone;@JsonKey(name: 'pilot_email') String? get pilotEmail;@JsonKey(name: 'pilot_telegram') String? get pilotTelegram;@JsonKey(name: 'pilot_max') String? get pilotMax;
/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDtoCopyWith<BookingDto> get copyWith => _$BookingDtoCopyWithImpl<BookingDto>(this as BookingDto, _$identity);

  /// Serializes this BookingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.passengerId, passengerId) || other.passengerId == passengerId)&&(identical(other.seatsCount, seatsCount) || other.seatsCount == seatsCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.passengerFirstName, passengerFirstName) || other.passengerFirstName == passengerFirstName)&&(identical(other.passengerLastName, passengerLastName) || other.passengerLastName == passengerLastName)&&(identical(other.passengerAvatarUrl, passengerAvatarUrl) || other.passengerAvatarUrl == passengerAvatarUrl)&&(identical(other.passengerPhone, passengerPhone) || other.passengerPhone == passengerPhone)&&(identical(other.passengerEmail, passengerEmail) || other.passengerEmail == passengerEmail)&&(identical(other.passengerTelegram, passengerTelegram) || other.passengerTelegram == passengerTelegram)&&(identical(other.passengerMax, passengerMax) || other.passengerMax == passengerMax)&&(identical(other.passengerAverageRating, passengerAverageRating) || other.passengerAverageRating == passengerAverageRating)&&(identical(other.flightDepartureDate, flightDepartureDate) || other.flightDepartureDate == flightDepartureDate)&&(identical(other.flightDepartureAirport, flightDepartureAirport) || other.flightDepartureAirport == flightDepartureAirport)&&(identical(other.flightArrivalAirport, flightArrivalAirport) || other.flightArrivalAirport == flightArrivalAirport)&&const DeepCollectionEquality().equals(other.flightWaypoints, flightWaypoints)&&(identical(other.pilotFirstName, pilotFirstName) || other.pilotFirstName == pilotFirstName)&&(identical(other.pilotLastName, pilotLastName) || other.pilotLastName == pilotLastName)&&(identical(other.pilotPhone, pilotPhone) || other.pilotPhone == pilotPhone)&&(identical(other.pilotEmail, pilotEmail) || other.pilotEmail == pilotEmail)&&(identical(other.pilotTelegram, pilotTelegram) || other.pilotTelegram == pilotTelegram)&&(identical(other.pilotMax, pilotMax) || other.pilotMax == pilotMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,flightId,passengerId,seatsCount,totalPrice,status,createdAt,updatedAt,passengerFirstName,passengerLastName,passengerAvatarUrl,passengerPhone,passengerEmail,passengerTelegram,passengerMax,passengerAverageRating,flightDepartureDate,flightDepartureAirport,flightArrivalAirport,const DeepCollectionEquality().hash(flightWaypoints),pilotFirstName,pilotLastName,pilotPhone,pilotEmail,pilotTelegram,pilotMax]);

@override
String toString() {
  return 'BookingDto(id: $id, flightId: $flightId, passengerId: $passengerId, seatsCount: $seatsCount, totalPrice: $totalPrice, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, passengerFirstName: $passengerFirstName, passengerLastName: $passengerLastName, passengerAvatarUrl: $passengerAvatarUrl, passengerPhone: $passengerPhone, passengerEmail: $passengerEmail, passengerTelegram: $passengerTelegram, passengerMax: $passengerMax, passengerAverageRating: $passengerAverageRating, flightDepartureDate: $flightDepartureDate, flightDepartureAirport: $flightDepartureAirport, flightArrivalAirport: $flightArrivalAirport, flightWaypoints: $flightWaypoints, pilotFirstName: $pilotFirstName, pilotLastName: $pilotLastName, pilotPhone: $pilotPhone, pilotEmail: $pilotEmail, pilotTelegram: $pilotTelegram, pilotMax: $pilotMax)';
}


}

/// @nodoc
abstract mixin class $BookingDtoCopyWith<$Res>  {
  factory $BookingDtoCopyWith(BookingDto value, $Res Function(BookingDto) _then) = _$BookingDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _intFromJson) int id,@JsonKey(name: 'flight_id', fromJson: _intFromJson) int flightId,@JsonKey(name: 'passenger_id', fromJson: _intFromJson) int passengerId,@JsonKey(name: 'seats_count', fromJson: _intFromJson) int seatsCount,@JsonKey(name: 'total_price', fromJson: _intFromJson) int totalPrice, String? status,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'passenger_first_name') String? passengerFirstName,@JsonKey(name: 'passenger_last_name') String? passengerLastName,@JsonKey(name: 'passenger_avatar_url') String? passengerAvatarUrl,@JsonKey(name: 'passenger_phone') String? passengerPhone,@JsonKey(name: 'passenger_email') String? passengerEmail,@JsonKey(name: 'passenger_telegram') String? passengerTelegram,@JsonKey(name: 'passenger_max') String? passengerMax,@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) double? passengerAverageRating,@JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable) DateTime? flightDepartureDate,@JsonKey(name: 'flight_departure_airport') String? flightDepartureAirport,@JsonKey(name: 'flight_arrival_airport') String? flightArrivalAirport,@JsonKey(name: 'flight_waypoints') dynamic flightWaypoints,@JsonKey(name: 'pilot_first_name') String? pilotFirstName,@JsonKey(name: 'pilot_last_name') String? pilotLastName,@JsonKey(name: 'pilot_phone') String? pilotPhone,@JsonKey(name: 'pilot_email') String? pilotEmail,@JsonKey(name: 'pilot_telegram') String? pilotTelegram,@JsonKey(name: 'pilot_max') String? pilotMax
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? flightId = null,Object? passengerId = null,Object? seatsCount = null,Object? totalPrice = null,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? passengerFirstName = freezed,Object? passengerLastName = freezed,Object? passengerAvatarUrl = freezed,Object? passengerPhone = freezed,Object? passengerEmail = freezed,Object? passengerTelegram = freezed,Object? passengerMax = freezed,Object? passengerAverageRating = freezed,Object? flightDepartureDate = freezed,Object? flightDepartureAirport = freezed,Object? flightArrivalAirport = freezed,Object? flightWaypoints = freezed,Object? pilotFirstName = freezed,Object? pilotLastName = freezed,Object? pilotPhone = freezed,Object? pilotEmail = freezed,Object? pilotTelegram = freezed,Object? pilotMax = freezed,}) {
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
as String?,passengerPhone: freezed == passengerPhone ? _self.passengerPhone : passengerPhone // ignore: cast_nullable_to_non_nullable
as String?,passengerEmail: freezed == passengerEmail ? _self.passengerEmail : passengerEmail // ignore: cast_nullable_to_non_nullable
as String?,passengerTelegram: freezed == passengerTelegram ? _self.passengerTelegram : passengerTelegram // ignore: cast_nullable_to_non_nullable
as String?,passengerMax: freezed == passengerMax ? _self.passengerMax : passengerMax // ignore: cast_nullable_to_non_nullable
as String?,passengerAverageRating: freezed == passengerAverageRating ? _self.passengerAverageRating : passengerAverageRating // ignore: cast_nullable_to_non_nullable
as double?,flightDepartureDate: freezed == flightDepartureDate ? _self.flightDepartureDate : flightDepartureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,flightDepartureAirport: freezed == flightDepartureAirport ? _self.flightDepartureAirport : flightDepartureAirport // ignore: cast_nullable_to_non_nullable
as String?,flightArrivalAirport: freezed == flightArrivalAirport ? _self.flightArrivalAirport : flightArrivalAirport // ignore: cast_nullable_to_non_nullable
as String?,flightWaypoints: freezed == flightWaypoints ? _self.flightWaypoints : flightWaypoints // ignore: cast_nullable_to_non_nullable
as dynamic,pilotFirstName: freezed == pilotFirstName ? _self.pilotFirstName : pilotFirstName // ignore: cast_nullable_to_non_nullable
as String?,pilotLastName: freezed == pilotLastName ? _self.pilotLastName : pilotLastName // ignore: cast_nullable_to_non_nullable
as String?,pilotPhone: freezed == pilotPhone ? _self.pilotPhone : pilotPhone // ignore: cast_nullable_to_non_nullable
as String?,pilotEmail: freezed == pilotEmail ? _self.pilotEmail : pilotEmail // ignore: cast_nullable_to_non_nullable
as String?,pilotTelegram: freezed == pilotTelegram ? _self.pilotTelegram : pilotTelegram // ignore: cast_nullable_to_non_nullable
as String?,pilotMax: freezed == pilotMax ? _self.pilotMax : pilotMax // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'flight_id', fromJson: _intFromJson)  int flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson)  int passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson)  int seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson)  int totalPrice,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'passenger_first_name')  String? passengerFirstName, @JsonKey(name: 'passenger_last_name')  String? passengerLastName, @JsonKey(name: 'passenger_avatar_url')  String? passengerAvatarUrl, @JsonKey(name: 'passenger_phone')  String? passengerPhone, @JsonKey(name: 'passenger_email')  String? passengerEmail, @JsonKey(name: 'passenger_telegram')  String? passengerTelegram, @JsonKey(name: 'passenger_max')  String? passengerMax, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable)  double? passengerAverageRating, @JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable)  DateTime? flightDepartureDate, @JsonKey(name: 'flight_departure_airport')  String? flightDepartureAirport, @JsonKey(name: 'flight_arrival_airport')  String? flightArrivalAirport, @JsonKey(name: 'flight_waypoints')  dynamic flightWaypoints, @JsonKey(name: 'pilot_first_name')  String? pilotFirstName, @JsonKey(name: 'pilot_last_name')  String? pilotLastName, @JsonKey(name: 'pilot_phone')  String? pilotPhone, @JsonKey(name: 'pilot_email')  String? pilotEmail, @JsonKey(name: 'pilot_telegram')  String? pilotTelegram, @JsonKey(name: 'pilot_max')  String? pilotMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.id,_that.flightId,_that.passengerId,_that.seatsCount,_that.totalPrice,_that.status,_that.createdAt,_that.updatedAt,_that.passengerFirstName,_that.passengerLastName,_that.passengerAvatarUrl,_that.passengerPhone,_that.passengerEmail,_that.passengerTelegram,_that.passengerMax,_that.passengerAverageRating,_that.flightDepartureDate,_that.flightDepartureAirport,_that.flightArrivalAirport,_that.flightWaypoints,_that.pilotFirstName,_that.pilotLastName,_that.pilotPhone,_that.pilotEmail,_that.pilotTelegram,_that.pilotMax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'flight_id', fromJson: _intFromJson)  int flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson)  int passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson)  int seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson)  int totalPrice,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'passenger_first_name')  String? passengerFirstName, @JsonKey(name: 'passenger_last_name')  String? passengerLastName, @JsonKey(name: 'passenger_avatar_url')  String? passengerAvatarUrl, @JsonKey(name: 'passenger_phone')  String? passengerPhone, @JsonKey(name: 'passenger_email')  String? passengerEmail, @JsonKey(name: 'passenger_telegram')  String? passengerTelegram, @JsonKey(name: 'passenger_max')  String? passengerMax, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable)  double? passengerAverageRating, @JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable)  DateTime? flightDepartureDate, @JsonKey(name: 'flight_departure_airport')  String? flightDepartureAirport, @JsonKey(name: 'flight_arrival_airport')  String? flightArrivalAirport, @JsonKey(name: 'flight_waypoints')  dynamic flightWaypoints, @JsonKey(name: 'pilot_first_name')  String? pilotFirstName, @JsonKey(name: 'pilot_last_name')  String? pilotLastName, @JsonKey(name: 'pilot_phone')  String? pilotPhone, @JsonKey(name: 'pilot_email')  String? pilotEmail, @JsonKey(name: 'pilot_telegram')  String? pilotTelegram, @JsonKey(name: 'pilot_max')  String? pilotMax)  $default,) {final _that = this;
switch (_that) {
case _BookingDto():
return $default(_that.id,_that.flightId,_that.passengerId,_that.seatsCount,_that.totalPrice,_that.status,_that.createdAt,_that.updatedAt,_that.passengerFirstName,_that.passengerLastName,_that.passengerAvatarUrl,_that.passengerPhone,_that.passengerEmail,_that.passengerTelegram,_that.passengerMax,_that.passengerAverageRating,_that.flightDepartureDate,_that.flightDepartureAirport,_that.flightArrivalAirport,_that.flightWaypoints,_that.pilotFirstName,_that.pilotLastName,_that.pilotPhone,_that.pilotEmail,_that.pilotTelegram,_that.pilotMax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _intFromJson)  int id, @JsonKey(name: 'flight_id', fromJson: _intFromJson)  int flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson)  int passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson)  int seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson)  int totalPrice,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'passenger_first_name')  String? passengerFirstName, @JsonKey(name: 'passenger_last_name')  String? passengerLastName, @JsonKey(name: 'passenger_avatar_url')  String? passengerAvatarUrl, @JsonKey(name: 'passenger_phone')  String? passengerPhone, @JsonKey(name: 'passenger_email')  String? passengerEmail, @JsonKey(name: 'passenger_telegram')  String? passengerTelegram, @JsonKey(name: 'passenger_max')  String? passengerMax, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable)  double? passengerAverageRating, @JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable)  DateTime? flightDepartureDate, @JsonKey(name: 'flight_departure_airport')  String? flightDepartureAirport, @JsonKey(name: 'flight_arrival_airport')  String? flightArrivalAirport, @JsonKey(name: 'flight_waypoints')  dynamic flightWaypoints, @JsonKey(name: 'pilot_first_name')  String? pilotFirstName, @JsonKey(name: 'pilot_last_name')  String? pilotLastName, @JsonKey(name: 'pilot_phone')  String? pilotPhone, @JsonKey(name: 'pilot_email')  String? pilotEmail, @JsonKey(name: 'pilot_telegram')  String? pilotTelegram, @JsonKey(name: 'pilot_max')  String? pilotMax)?  $default,) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.id,_that.flightId,_that.passengerId,_that.seatsCount,_that.totalPrice,_that.status,_that.createdAt,_that.updatedAt,_that.passengerFirstName,_that.passengerLastName,_that.passengerAvatarUrl,_that.passengerPhone,_that.passengerEmail,_that.passengerTelegram,_that.passengerMax,_that.passengerAverageRating,_that.flightDepartureDate,_that.flightDepartureAirport,_that.flightArrivalAirport,_that.flightWaypoints,_that.pilotFirstName,_that.pilotLastName,_that.pilotPhone,_that.pilotEmail,_that.pilotTelegram,_that.pilotMax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDto implements BookingDto {
  const _BookingDto({@JsonKey(fromJson: _intFromJson) required this.id, @JsonKey(name: 'flight_id', fromJson: _intFromJson) required this.flightId, @JsonKey(name: 'passenger_id', fromJson: _intFromJson) required this.passengerId, @JsonKey(name: 'seats_count', fromJson: _intFromJson) required this.seatsCount, @JsonKey(name: 'total_price', fromJson: _intFromJson) required this.totalPrice, this.status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) this.updatedAt, @JsonKey(name: 'passenger_first_name') this.passengerFirstName, @JsonKey(name: 'passenger_last_name') this.passengerLastName, @JsonKey(name: 'passenger_avatar_url') this.passengerAvatarUrl, @JsonKey(name: 'passenger_phone') this.passengerPhone, @JsonKey(name: 'passenger_email') this.passengerEmail, @JsonKey(name: 'passenger_telegram') this.passengerTelegram, @JsonKey(name: 'passenger_max') this.passengerMax, @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) this.passengerAverageRating, @JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable) this.flightDepartureDate, @JsonKey(name: 'flight_departure_airport') this.flightDepartureAirport, @JsonKey(name: 'flight_arrival_airport') this.flightArrivalAirport, @JsonKey(name: 'flight_waypoints') this.flightWaypoints, @JsonKey(name: 'pilot_first_name') this.pilotFirstName, @JsonKey(name: 'pilot_last_name') this.pilotLastName, @JsonKey(name: 'pilot_phone') this.pilotPhone, @JsonKey(name: 'pilot_email') this.pilotEmail, @JsonKey(name: 'pilot_telegram') this.pilotTelegram, @JsonKey(name: 'pilot_max') this.pilotMax});
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
@override@JsonKey(name: 'passenger_phone') final  String? passengerPhone;
@override@JsonKey(name: 'passenger_email') final  String? passengerEmail;
@override@JsonKey(name: 'passenger_telegram') final  String? passengerTelegram;
@override@JsonKey(name: 'passenger_max') final  String? passengerMax;
@override@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) final  double? passengerAverageRating;
@override@JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable) final  DateTime? flightDepartureDate;
@override@JsonKey(name: 'flight_departure_airport') final  String? flightDepartureAirport;
@override@JsonKey(name: 'flight_arrival_airport') final  String? flightArrivalAirport;
@override@JsonKey(name: 'flight_waypoints') final  dynamic flightWaypoints;
// JSON массив кодов аэропортов
// Данные пилота (загружаются через JOIN в SQL)
@override@JsonKey(name: 'pilot_first_name') final  String? pilotFirstName;
@override@JsonKey(name: 'pilot_last_name') final  String? pilotLastName;
@override@JsonKey(name: 'pilot_phone') final  String? pilotPhone;
@override@JsonKey(name: 'pilot_email') final  String? pilotEmail;
@override@JsonKey(name: 'pilot_telegram') final  String? pilotTelegram;
@override@JsonKey(name: 'pilot_max') final  String? pilotMax;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.passengerId, passengerId) || other.passengerId == passengerId)&&(identical(other.seatsCount, seatsCount) || other.seatsCount == seatsCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.passengerFirstName, passengerFirstName) || other.passengerFirstName == passengerFirstName)&&(identical(other.passengerLastName, passengerLastName) || other.passengerLastName == passengerLastName)&&(identical(other.passengerAvatarUrl, passengerAvatarUrl) || other.passengerAvatarUrl == passengerAvatarUrl)&&(identical(other.passengerPhone, passengerPhone) || other.passengerPhone == passengerPhone)&&(identical(other.passengerEmail, passengerEmail) || other.passengerEmail == passengerEmail)&&(identical(other.passengerTelegram, passengerTelegram) || other.passengerTelegram == passengerTelegram)&&(identical(other.passengerMax, passengerMax) || other.passengerMax == passengerMax)&&(identical(other.passengerAverageRating, passengerAverageRating) || other.passengerAverageRating == passengerAverageRating)&&(identical(other.flightDepartureDate, flightDepartureDate) || other.flightDepartureDate == flightDepartureDate)&&(identical(other.flightDepartureAirport, flightDepartureAirport) || other.flightDepartureAirport == flightDepartureAirport)&&(identical(other.flightArrivalAirport, flightArrivalAirport) || other.flightArrivalAirport == flightArrivalAirport)&&const DeepCollectionEquality().equals(other.flightWaypoints, flightWaypoints)&&(identical(other.pilotFirstName, pilotFirstName) || other.pilotFirstName == pilotFirstName)&&(identical(other.pilotLastName, pilotLastName) || other.pilotLastName == pilotLastName)&&(identical(other.pilotPhone, pilotPhone) || other.pilotPhone == pilotPhone)&&(identical(other.pilotEmail, pilotEmail) || other.pilotEmail == pilotEmail)&&(identical(other.pilotTelegram, pilotTelegram) || other.pilotTelegram == pilotTelegram)&&(identical(other.pilotMax, pilotMax) || other.pilotMax == pilotMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,flightId,passengerId,seatsCount,totalPrice,status,createdAt,updatedAt,passengerFirstName,passengerLastName,passengerAvatarUrl,passengerPhone,passengerEmail,passengerTelegram,passengerMax,passengerAverageRating,flightDepartureDate,flightDepartureAirport,flightArrivalAirport,const DeepCollectionEquality().hash(flightWaypoints),pilotFirstName,pilotLastName,pilotPhone,pilotEmail,pilotTelegram,pilotMax]);

@override
String toString() {
  return 'BookingDto(id: $id, flightId: $flightId, passengerId: $passengerId, seatsCount: $seatsCount, totalPrice: $totalPrice, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, passengerFirstName: $passengerFirstName, passengerLastName: $passengerLastName, passengerAvatarUrl: $passengerAvatarUrl, passengerPhone: $passengerPhone, passengerEmail: $passengerEmail, passengerTelegram: $passengerTelegram, passengerMax: $passengerMax, passengerAverageRating: $passengerAverageRating, flightDepartureDate: $flightDepartureDate, flightDepartureAirport: $flightDepartureAirport, flightArrivalAirport: $flightArrivalAirport, flightWaypoints: $flightWaypoints, pilotFirstName: $pilotFirstName, pilotLastName: $pilotLastName, pilotPhone: $pilotPhone, pilotEmail: $pilotEmail, pilotTelegram: $pilotTelegram, pilotMax: $pilotMax)';
}


}

/// @nodoc
abstract mixin class _$BookingDtoCopyWith<$Res> implements $BookingDtoCopyWith<$Res> {
  factory _$BookingDtoCopyWith(_BookingDto value, $Res Function(_BookingDto) _then) = __$BookingDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _intFromJson) int id,@JsonKey(name: 'flight_id', fromJson: _intFromJson) int flightId,@JsonKey(name: 'passenger_id', fromJson: _intFromJson) int passengerId,@JsonKey(name: 'seats_count', fromJson: _intFromJson) int seatsCount,@JsonKey(name: 'total_price', fromJson: _intFromJson) int totalPrice, String? status,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'passenger_first_name') String? passengerFirstName,@JsonKey(name: 'passenger_last_name') String? passengerLastName,@JsonKey(name: 'passenger_avatar_url') String? passengerAvatarUrl,@JsonKey(name: 'passenger_phone') String? passengerPhone,@JsonKey(name: 'passenger_email') String? passengerEmail,@JsonKey(name: 'passenger_telegram') String? passengerTelegram,@JsonKey(name: 'passenger_max') String? passengerMax,@JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) double? passengerAverageRating,@JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable) DateTime? flightDepartureDate,@JsonKey(name: 'flight_departure_airport') String? flightDepartureAirport,@JsonKey(name: 'flight_arrival_airport') String? flightArrivalAirport,@JsonKey(name: 'flight_waypoints') dynamic flightWaypoints,@JsonKey(name: 'pilot_first_name') String? pilotFirstName,@JsonKey(name: 'pilot_last_name') String? pilotLastName,@JsonKey(name: 'pilot_phone') String? pilotPhone,@JsonKey(name: 'pilot_email') String? pilotEmail,@JsonKey(name: 'pilot_telegram') String? pilotTelegram,@JsonKey(name: 'pilot_max') String? pilotMax
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? flightId = null,Object? passengerId = null,Object? seatsCount = null,Object? totalPrice = null,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? passengerFirstName = freezed,Object? passengerLastName = freezed,Object? passengerAvatarUrl = freezed,Object? passengerPhone = freezed,Object? passengerEmail = freezed,Object? passengerTelegram = freezed,Object? passengerMax = freezed,Object? passengerAverageRating = freezed,Object? flightDepartureDate = freezed,Object? flightDepartureAirport = freezed,Object? flightArrivalAirport = freezed,Object? flightWaypoints = freezed,Object? pilotFirstName = freezed,Object? pilotLastName = freezed,Object? pilotPhone = freezed,Object? pilotEmail = freezed,Object? pilotTelegram = freezed,Object? pilotMax = freezed,}) {
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
as String?,passengerPhone: freezed == passengerPhone ? _self.passengerPhone : passengerPhone // ignore: cast_nullable_to_non_nullable
as String?,passengerEmail: freezed == passengerEmail ? _self.passengerEmail : passengerEmail // ignore: cast_nullable_to_non_nullable
as String?,passengerTelegram: freezed == passengerTelegram ? _self.passengerTelegram : passengerTelegram // ignore: cast_nullable_to_non_nullable
as String?,passengerMax: freezed == passengerMax ? _self.passengerMax : passengerMax // ignore: cast_nullable_to_non_nullable
as String?,passengerAverageRating: freezed == passengerAverageRating ? _self.passengerAverageRating : passengerAverageRating // ignore: cast_nullable_to_non_nullable
as double?,flightDepartureDate: freezed == flightDepartureDate ? _self.flightDepartureDate : flightDepartureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,flightDepartureAirport: freezed == flightDepartureAirport ? _self.flightDepartureAirport : flightDepartureAirport // ignore: cast_nullable_to_non_nullable
as String?,flightArrivalAirport: freezed == flightArrivalAirport ? _self.flightArrivalAirport : flightArrivalAirport // ignore: cast_nullable_to_non_nullable
as String?,flightWaypoints: freezed == flightWaypoints ? _self.flightWaypoints : flightWaypoints // ignore: cast_nullable_to_non_nullable
as dynamic,pilotFirstName: freezed == pilotFirstName ? _self.pilotFirstName : pilotFirstName // ignore: cast_nullable_to_non_nullable
as String?,pilotLastName: freezed == pilotLastName ? _self.pilotLastName : pilotLastName // ignore: cast_nullable_to_non_nullable
as String?,pilotPhone: freezed == pilotPhone ? _self.pilotPhone : pilotPhone // ignore: cast_nullable_to_non_nullable
as String?,pilotEmail: freezed == pilotEmail ? _self.pilotEmail : pilotEmail // ignore: cast_nullable_to_non_nullable
as String?,pilotTelegram: freezed == pilotTelegram ? _self.pilotTelegram : pilotTelegram // ignore: cast_nullable_to_non_nullable
as String?,pilotMax: freezed == pilotMax ? _self.pilotMax : pilotMax // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
