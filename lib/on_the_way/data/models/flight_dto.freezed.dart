// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlightDto {

 int get id;@JsonKey(name: 'pilot_id') int get pilotId;@JsonKey(name: 'departure_airport') String get departureAirport;@JsonKey(name: 'arrival_airport') String get arrivalAirport;// Дополнительная информация об аэропорте отправления
@JsonKey(name: 'departure_airport_name') String? get departureAirportName;@JsonKey(name: 'departure_airport_city') String? get departureAirportCity;@JsonKey(name: 'departure_airport_region') String? get departureAirportRegion;@JsonKey(name: 'departure_airport_type') String? get departureAirportType;@JsonKey(name: 'departure_airport_ident_ru') String? get departureAirportIdentRu;// Дополнительная информация об аэропорте прибытия
@JsonKey(name: 'arrival_airport_name') String? get arrivalAirportName;@JsonKey(name: 'arrival_airport_city') String? get arrivalAirportCity;@JsonKey(name: 'arrival_airport_region') String? get arrivalAirportRegion;@JsonKey(name: 'arrival_airport_type') String? get arrivalAirportType;@JsonKey(name: 'arrival_airport_ident_ru') String? get arrivalAirportIdentRu;@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) DateTime get departureDate;@JsonKey(name: 'available_seats') int get availableSeats;@JsonKey(name: 'total_seats') int? get totalSeats;@JsonKey(name: 'price_per_seat') double get pricePerSeat;@JsonKey(name: 'aircraft_type') String? get aircraftType; String? get description; String? get status;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? get updatedAt;// Данные пилота (создателя полёта) - загружаются через JOIN в SQL
@JsonKey(name: 'pilot_first_name') String? get pilotFirstName;@JsonKey(name: 'pilot_last_name') String? get pilotLastName;@JsonKey(name: 'pilot_avatar_url') String? get pilotAvatarUrl;@JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable) double? get pilotAverageRating;// Фотографии полета
@JsonKey(name: 'photos', fromJson: _photosFromJson) List<String>? get photos;
/// Create a copy of FlightDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightDtoCopyWith<FlightDto> get copyWith => _$FlightDtoCopyWithImpl<FlightDto>(this as FlightDto, _$identity);

  /// Serializes this FlightDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightDto&&(identical(other.id, id) || other.id == id)&&(identical(other.pilotId, pilotId) || other.pilotId == pilotId)&&(identical(other.departureAirport, departureAirport) || other.departureAirport == departureAirport)&&(identical(other.arrivalAirport, arrivalAirport) || other.arrivalAirport == arrivalAirport)&&(identical(other.departureAirportName, departureAirportName) || other.departureAirportName == departureAirportName)&&(identical(other.departureAirportCity, departureAirportCity) || other.departureAirportCity == departureAirportCity)&&(identical(other.departureAirportRegion, departureAirportRegion) || other.departureAirportRegion == departureAirportRegion)&&(identical(other.departureAirportType, departureAirportType) || other.departureAirportType == departureAirportType)&&(identical(other.departureAirportIdentRu, departureAirportIdentRu) || other.departureAirportIdentRu == departureAirportIdentRu)&&(identical(other.arrivalAirportName, arrivalAirportName) || other.arrivalAirportName == arrivalAirportName)&&(identical(other.arrivalAirportCity, arrivalAirportCity) || other.arrivalAirportCity == arrivalAirportCity)&&(identical(other.arrivalAirportRegion, arrivalAirportRegion) || other.arrivalAirportRegion == arrivalAirportRegion)&&(identical(other.arrivalAirportType, arrivalAirportType) || other.arrivalAirportType == arrivalAirportType)&&(identical(other.arrivalAirportIdentRu, arrivalAirportIdentRu) || other.arrivalAirportIdentRu == arrivalAirportIdentRu)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.pricePerSeat, pricePerSeat) || other.pricePerSeat == pricePerSeat)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pilotFirstName, pilotFirstName) || other.pilotFirstName == pilotFirstName)&&(identical(other.pilotLastName, pilotLastName) || other.pilotLastName == pilotLastName)&&(identical(other.pilotAvatarUrl, pilotAvatarUrl) || other.pilotAvatarUrl == pilotAvatarUrl)&&(identical(other.pilotAverageRating, pilotAverageRating) || other.pilotAverageRating == pilotAverageRating)&&const DeepCollectionEquality().equals(other.photos, photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,pilotId,departureAirport,arrivalAirport,departureAirportName,departureAirportCity,departureAirportRegion,departureAirportType,departureAirportIdentRu,arrivalAirportName,arrivalAirportCity,arrivalAirportRegion,arrivalAirportType,arrivalAirportIdentRu,departureDate,availableSeats,totalSeats,pricePerSeat,aircraftType,description,status,createdAt,updatedAt,pilotFirstName,pilotLastName,pilotAvatarUrl,pilotAverageRating,const DeepCollectionEquality().hash(photos)]);

@override
String toString() {
  return 'FlightDto(id: $id, pilotId: $pilotId, departureAirport: $departureAirport, arrivalAirport: $arrivalAirport, departureAirportName: $departureAirportName, departureAirportCity: $departureAirportCity, departureAirportRegion: $departureAirportRegion, departureAirportType: $departureAirportType, departureAirportIdentRu: $departureAirportIdentRu, arrivalAirportName: $arrivalAirportName, arrivalAirportCity: $arrivalAirportCity, arrivalAirportRegion: $arrivalAirportRegion, arrivalAirportType: $arrivalAirportType, arrivalAirportIdentRu: $arrivalAirportIdentRu, departureDate: $departureDate, availableSeats: $availableSeats, totalSeats: $totalSeats, pricePerSeat: $pricePerSeat, aircraftType: $aircraftType, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, pilotFirstName: $pilotFirstName, pilotLastName: $pilotLastName, pilotAvatarUrl: $pilotAvatarUrl, pilotAverageRating: $pilotAverageRating, photos: $photos)';
}


}

/// @nodoc
abstract mixin class $FlightDtoCopyWith<$Res>  {
  factory $FlightDtoCopyWith(FlightDto value, $Res Function(FlightDto) _then) = _$FlightDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'pilot_id') int pilotId,@JsonKey(name: 'departure_airport') String departureAirport,@JsonKey(name: 'arrival_airport') String arrivalAirport,@JsonKey(name: 'departure_airport_name') String? departureAirportName,@JsonKey(name: 'departure_airport_city') String? departureAirportCity,@JsonKey(name: 'departure_airport_region') String? departureAirportRegion,@JsonKey(name: 'departure_airport_type') String? departureAirportType,@JsonKey(name: 'departure_airport_ident_ru') String? departureAirportIdentRu,@JsonKey(name: 'arrival_airport_name') String? arrivalAirportName,@JsonKey(name: 'arrival_airport_city') String? arrivalAirportCity,@JsonKey(name: 'arrival_airport_region') String? arrivalAirportRegion,@JsonKey(name: 'arrival_airport_type') String? arrivalAirportType,@JsonKey(name: 'arrival_airport_ident_ru') String? arrivalAirportIdentRu,@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) DateTime departureDate,@JsonKey(name: 'available_seats') int availableSeats,@JsonKey(name: 'total_seats') int? totalSeats,@JsonKey(name: 'price_per_seat') double pricePerSeat,@JsonKey(name: 'aircraft_type') String? aircraftType, String? description, String? status,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'pilot_first_name') String? pilotFirstName,@JsonKey(name: 'pilot_last_name') String? pilotLastName,@JsonKey(name: 'pilot_avatar_url') String? pilotAvatarUrl,@JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable) double? pilotAverageRating,@JsonKey(name: 'photos', fromJson: _photosFromJson) List<String>? photos
});




}
/// @nodoc
class _$FlightDtoCopyWithImpl<$Res>
    implements $FlightDtoCopyWith<$Res> {
  _$FlightDtoCopyWithImpl(this._self, this._then);

  final FlightDto _self;
  final $Res Function(FlightDto) _then;

/// Create a copy of FlightDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pilotId = null,Object? departureAirport = null,Object? arrivalAirport = null,Object? departureAirportName = freezed,Object? departureAirportCity = freezed,Object? departureAirportRegion = freezed,Object? departureAirportType = freezed,Object? departureAirportIdentRu = freezed,Object? arrivalAirportName = freezed,Object? arrivalAirportCity = freezed,Object? arrivalAirportRegion = freezed,Object? arrivalAirportType = freezed,Object? arrivalAirportIdentRu = freezed,Object? departureDate = null,Object? availableSeats = null,Object? totalSeats = freezed,Object? pricePerSeat = null,Object? aircraftType = freezed,Object? description = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? pilotFirstName = freezed,Object? pilotLastName = freezed,Object? pilotAvatarUrl = freezed,Object? pilotAverageRating = freezed,Object? photos = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,pilotId: null == pilotId ? _self.pilotId : pilotId // ignore: cast_nullable_to_non_nullable
as int,departureAirport: null == departureAirport ? _self.departureAirport : departureAirport // ignore: cast_nullable_to_non_nullable
as String,arrivalAirport: null == arrivalAirport ? _self.arrivalAirport : arrivalAirport // ignore: cast_nullable_to_non_nullable
as String,departureAirportName: freezed == departureAirportName ? _self.departureAirportName : departureAirportName // ignore: cast_nullable_to_non_nullable
as String?,departureAirportCity: freezed == departureAirportCity ? _self.departureAirportCity : departureAirportCity // ignore: cast_nullable_to_non_nullable
as String?,departureAirportRegion: freezed == departureAirportRegion ? _self.departureAirportRegion : departureAirportRegion // ignore: cast_nullable_to_non_nullable
as String?,departureAirportType: freezed == departureAirportType ? _self.departureAirportType : departureAirportType // ignore: cast_nullable_to_non_nullable
as String?,departureAirportIdentRu: freezed == departureAirportIdentRu ? _self.departureAirportIdentRu : departureAirportIdentRu // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportName: freezed == arrivalAirportName ? _self.arrivalAirportName : arrivalAirportName // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportCity: freezed == arrivalAirportCity ? _self.arrivalAirportCity : arrivalAirportCity // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportRegion: freezed == arrivalAirportRegion ? _self.arrivalAirportRegion : arrivalAirportRegion // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportType: freezed == arrivalAirportType ? _self.arrivalAirportType : arrivalAirportType // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportIdentRu: freezed == arrivalAirportIdentRu ? _self.arrivalAirportIdentRu : arrivalAirportIdentRu // ignore: cast_nullable_to_non_nullable
as String?,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,totalSeats: freezed == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int?,pricePerSeat: null == pricePerSeat ? _self.pricePerSeat : pricePerSeat // ignore: cast_nullable_to_non_nullable
as double,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pilotFirstName: freezed == pilotFirstName ? _self.pilotFirstName : pilotFirstName // ignore: cast_nullable_to_non_nullable
as String?,pilotLastName: freezed == pilotLastName ? _self.pilotLastName : pilotLastName // ignore: cast_nullable_to_non_nullable
as String?,pilotAvatarUrl: freezed == pilotAvatarUrl ? _self.pilotAvatarUrl : pilotAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,pilotAverageRating: freezed == pilotAverageRating ? _self.pilotAverageRating : pilotAverageRating // ignore: cast_nullable_to_non_nullable
as double?,photos: freezed == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightDto].
extension FlightDtoPatterns on FlightDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightDto value)  $default,){
final _that = this;
switch (_that) {
case _FlightDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightDto value)?  $default,){
final _that = this;
switch (_that) {
case _FlightDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'pilot_id')  int pilotId, @JsonKey(name: 'departure_airport')  String departureAirport, @JsonKey(name: 'arrival_airport')  String arrivalAirport, @JsonKey(name: 'departure_airport_name')  String? departureAirportName, @JsonKey(name: 'departure_airport_city')  String? departureAirportCity, @JsonKey(name: 'departure_airport_region')  String? departureAirportRegion, @JsonKey(name: 'departure_airport_type')  String? departureAirportType, @JsonKey(name: 'departure_airport_ident_ru')  String? departureAirportIdentRu, @JsonKey(name: 'arrival_airport_name')  String? arrivalAirportName, @JsonKey(name: 'arrival_airport_city')  String? arrivalAirportCity, @JsonKey(name: 'arrival_airport_region')  String? arrivalAirportRegion, @JsonKey(name: 'arrival_airport_type')  String? arrivalAirportType, @JsonKey(name: 'arrival_airport_ident_ru')  String? arrivalAirportIdentRu, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson)  DateTime departureDate, @JsonKey(name: 'available_seats')  int availableSeats, @JsonKey(name: 'total_seats')  int? totalSeats, @JsonKey(name: 'price_per_seat')  double pricePerSeat, @JsonKey(name: 'aircraft_type')  String? aircraftType,  String? description,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'pilot_first_name')  String? pilotFirstName, @JsonKey(name: 'pilot_last_name')  String? pilotLastName, @JsonKey(name: 'pilot_avatar_url')  String? pilotAvatarUrl, @JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable)  double? pilotAverageRating, @JsonKey(name: 'photos', fromJson: _photosFromJson)  List<String>? photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightDto() when $default != null:
return $default(_that.id,_that.pilotId,_that.departureAirport,_that.arrivalAirport,_that.departureAirportName,_that.departureAirportCity,_that.departureAirportRegion,_that.departureAirportType,_that.departureAirportIdentRu,_that.arrivalAirportName,_that.arrivalAirportCity,_that.arrivalAirportRegion,_that.arrivalAirportType,_that.arrivalAirportIdentRu,_that.departureDate,_that.availableSeats,_that.totalSeats,_that.pricePerSeat,_that.aircraftType,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.pilotFirstName,_that.pilotLastName,_that.pilotAvatarUrl,_that.pilotAverageRating,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'pilot_id')  int pilotId, @JsonKey(name: 'departure_airport')  String departureAirport, @JsonKey(name: 'arrival_airport')  String arrivalAirport, @JsonKey(name: 'departure_airport_name')  String? departureAirportName, @JsonKey(name: 'departure_airport_city')  String? departureAirportCity, @JsonKey(name: 'departure_airport_region')  String? departureAirportRegion, @JsonKey(name: 'departure_airport_type')  String? departureAirportType, @JsonKey(name: 'departure_airport_ident_ru')  String? departureAirportIdentRu, @JsonKey(name: 'arrival_airport_name')  String? arrivalAirportName, @JsonKey(name: 'arrival_airport_city')  String? arrivalAirportCity, @JsonKey(name: 'arrival_airport_region')  String? arrivalAirportRegion, @JsonKey(name: 'arrival_airport_type')  String? arrivalAirportType, @JsonKey(name: 'arrival_airport_ident_ru')  String? arrivalAirportIdentRu, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson)  DateTime departureDate, @JsonKey(name: 'available_seats')  int availableSeats, @JsonKey(name: 'total_seats')  int? totalSeats, @JsonKey(name: 'price_per_seat')  double pricePerSeat, @JsonKey(name: 'aircraft_type')  String? aircraftType,  String? description,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'pilot_first_name')  String? pilotFirstName, @JsonKey(name: 'pilot_last_name')  String? pilotLastName, @JsonKey(name: 'pilot_avatar_url')  String? pilotAvatarUrl, @JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable)  double? pilotAverageRating, @JsonKey(name: 'photos', fromJson: _photosFromJson)  List<String>? photos)  $default,) {final _that = this;
switch (_that) {
case _FlightDto():
return $default(_that.id,_that.pilotId,_that.departureAirport,_that.arrivalAirport,_that.departureAirportName,_that.departureAirportCity,_that.departureAirportRegion,_that.departureAirportType,_that.departureAirportIdentRu,_that.arrivalAirportName,_that.arrivalAirportCity,_that.arrivalAirportRegion,_that.arrivalAirportType,_that.arrivalAirportIdentRu,_that.departureDate,_that.availableSeats,_that.totalSeats,_that.pricePerSeat,_that.aircraftType,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.pilotFirstName,_that.pilotLastName,_that.pilotAvatarUrl,_that.pilotAverageRating,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'pilot_id')  int pilotId, @JsonKey(name: 'departure_airport')  String departureAirport, @JsonKey(name: 'arrival_airport')  String arrivalAirport, @JsonKey(name: 'departure_airport_name')  String? departureAirportName, @JsonKey(name: 'departure_airport_city')  String? departureAirportCity, @JsonKey(name: 'departure_airport_region')  String? departureAirportRegion, @JsonKey(name: 'departure_airport_type')  String? departureAirportType, @JsonKey(name: 'departure_airport_ident_ru')  String? departureAirportIdentRu, @JsonKey(name: 'arrival_airport_name')  String? arrivalAirportName, @JsonKey(name: 'arrival_airport_city')  String? arrivalAirportCity, @JsonKey(name: 'arrival_airport_region')  String? arrivalAirportRegion, @JsonKey(name: 'arrival_airport_type')  String? arrivalAirportType, @JsonKey(name: 'arrival_airport_ident_ru')  String? arrivalAirportIdentRu, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson)  DateTime departureDate, @JsonKey(name: 'available_seats')  int availableSeats, @JsonKey(name: 'total_seats')  int? totalSeats, @JsonKey(name: 'price_per_seat')  double pricePerSeat, @JsonKey(name: 'aircraft_type')  String? aircraftType,  String? description,  String? status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'pilot_first_name')  String? pilotFirstName, @JsonKey(name: 'pilot_last_name')  String? pilotLastName, @JsonKey(name: 'pilot_avatar_url')  String? pilotAvatarUrl, @JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable)  double? pilotAverageRating, @JsonKey(name: 'photos', fromJson: _photosFromJson)  List<String>? photos)?  $default,) {final _that = this;
switch (_that) {
case _FlightDto() when $default != null:
return $default(_that.id,_that.pilotId,_that.departureAirport,_that.arrivalAirport,_that.departureAirportName,_that.departureAirportCity,_that.departureAirportRegion,_that.departureAirportType,_that.departureAirportIdentRu,_that.arrivalAirportName,_that.arrivalAirportCity,_that.arrivalAirportRegion,_that.arrivalAirportType,_that.arrivalAirportIdentRu,_that.departureDate,_that.availableSeats,_that.totalSeats,_that.pricePerSeat,_that.aircraftType,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.pilotFirstName,_that.pilotLastName,_that.pilotAvatarUrl,_that.pilotAverageRating,_that.photos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlightDto implements FlightDto {
  const _FlightDto({required this.id, @JsonKey(name: 'pilot_id') required this.pilotId, @JsonKey(name: 'departure_airport') required this.departureAirport, @JsonKey(name: 'arrival_airport') required this.arrivalAirport, @JsonKey(name: 'departure_airport_name') this.departureAirportName, @JsonKey(name: 'departure_airport_city') this.departureAirportCity, @JsonKey(name: 'departure_airport_region') this.departureAirportRegion, @JsonKey(name: 'departure_airport_type') this.departureAirportType, @JsonKey(name: 'departure_airport_ident_ru') this.departureAirportIdentRu, @JsonKey(name: 'arrival_airport_name') this.arrivalAirportName, @JsonKey(name: 'arrival_airport_city') this.arrivalAirportCity, @JsonKey(name: 'arrival_airport_region') this.arrivalAirportRegion, @JsonKey(name: 'arrival_airport_type') this.arrivalAirportType, @JsonKey(name: 'arrival_airport_ident_ru') this.arrivalAirportIdentRu, @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) required this.departureDate, @JsonKey(name: 'available_seats') required this.availableSeats, @JsonKey(name: 'total_seats') this.totalSeats, @JsonKey(name: 'price_per_seat') required this.pricePerSeat, @JsonKey(name: 'aircraft_type') this.aircraftType, this.description, this.status, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) this.updatedAt, @JsonKey(name: 'pilot_first_name') this.pilotFirstName, @JsonKey(name: 'pilot_last_name') this.pilotLastName, @JsonKey(name: 'pilot_avatar_url') this.pilotAvatarUrl, @JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable) this.pilotAverageRating, @JsonKey(name: 'photos', fromJson: _photosFromJson) final  List<String>? photos}): _photos = photos;
  factory _FlightDto.fromJson(Map<String, dynamic> json) => _$FlightDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'pilot_id') final  int pilotId;
@override@JsonKey(name: 'departure_airport') final  String departureAirport;
@override@JsonKey(name: 'arrival_airport') final  String arrivalAirport;
// Дополнительная информация об аэропорте отправления
@override@JsonKey(name: 'departure_airport_name') final  String? departureAirportName;
@override@JsonKey(name: 'departure_airport_city') final  String? departureAirportCity;
@override@JsonKey(name: 'departure_airport_region') final  String? departureAirportRegion;
@override@JsonKey(name: 'departure_airport_type') final  String? departureAirportType;
@override@JsonKey(name: 'departure_airport_ident_ru') final  String? departureAirportIdentRu;
// Дополнительная информация об аэропорте прибытия
@override@JsonKey(name: 'arrival_airport_name') final  String? arrivalAirportName;
@override@JsonKey(name: 'arrival_airport_city') final  String? arrivalAirportCity;
@override@JsonKey(name: 'arrival_airport_region') final  String? arrivalAirportRegion;
@override@JsonKey(name: 'arrival_airport_type') final  String? arrivalAirportType;
@override@JsonKey(name: 'arrival_airport_ident_ru') final  String? arrivalAirportIdentRu;
@override@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) final  DateTime departureDate;
@override@JsonKey(name: 'available_seats') final  int availableSeats;
@override@JsonKey(name: 'total_seats') final  int? totalSeats;
@override@JsonKey(name: 'price_per_seat') final  double pricePerSeat;
@override@JsonKey(name: 'aircraft_type') final  String? aircraftType;
@override final  String? description;
@override final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? updatedAt;
// Данные пилота (создателя полёта) - загружаются через JOIN в SQL
@override@JsonKey(name: 'pilot_first_name') final  String? pilotFirstName;
@override@JsonKey(name: 'pilot_last_name') final  String? pilotLastName;
@override@JsonKey(name: 'pilot_avatar_url') final  String? pilotAvatarUrl;
@override@JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable) final  double? pilotAverageRating;
// Фотографии полета
 final  List<String>? _photos;
// Фотографии полета
@override@JsonKey(name: 'photos', fromJson: _photosFromJson) List<String>? get photos {
  final value = _photos;
  if (value == null) return null;
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FlightDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightDtoCopyWith<_FlightDto> get copyWith => __$FlightDtoCopyWithImpl<_FlightDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightDto&&(identical(other.id, id) || other.id == id)&&(identical(other.pilotId, pilotId) || other.pilotId == pilotId)&&(identical(other.departureAirport, departureAirport) || other.departureAirport == departureAirport)&&(identical(other.arrivalAirport, arrivalAirport) || other.arrivalAirport == arrivalAirport)&&(identical(other.departureAirportName, departureAirportName) || other.departureAirportName == departureAirportName)&&(identical(other.departureAirportCity, departureAirportCity) || other.departureAirportCity == departureAirportCity)&&(identical(other.departureAirportRegion, departureAirportRegion) || other.departureAirportRegion == departureAirportRegion)&&(identical(other.departureAirportType, departureAirportType) || other.departureAirportType == departureAirportType)&&(identical(other.departureAirportIdentRu, departureAirportIdentRu) || other.departureAirportIdentRu == departureAirportIdentRu)&&(identical(other.arrivalAirportName, arrivalAirportName) || other.arrivalAirportName == arrivalAirportName)&&(identical(other.arrivalAirportCity, arrivalAirportCity) || other.arrivalAirportCity == arrivalAirportCity)&&(identical(other.arrivalAirportRegion, arrivalAirportRegion) || other.arrivalAirportRegion == arrivalAirportRegion)&&(identical(other.arrivalAirportType, arrivalAirportType) || other.arrivalAirportType == arrivalAirportType)&&(identical(other.arrivalAirportIdentRu, arrivalAirportIdentRu) || other.arrivalAirportIdentRu == arrivalAirportIdentRu)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.pricePerSeat, pricePerSeat) || other.pricePerSeat == pricePerSeat)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pilotFirstName, pilotFirstName) || other.pilotFirstName == pilotFirstName)&&(identical(other.pilotLastName, pilotLastName) || other.pilotLastName == pilotLastName)&&(identical(other.pilotAvatarUrl, pilotAvatarUrl) || other.pilotAvatarUrl == pilotAvatarUrl)&&(identical(other.pilotAverageRating, pilotAverageRating) || other.pilotAverageRating == pilotAverageRating)&&const DeepCollectionEquality().equals(other._photos, _photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,pilotId,departureAirport,arrivalAirport,departureAirportName,departureAirportCity,departureAirportRegion,departureAirportType,departureAirportIdentRu,arrivalAirportName,arrivalAirportCity,arrivalAirportRegion,arrivalAirportType,arrivalAirportIdentRu,departureDate,availableSeats,totalSeats,pricePerSeat,aircraftType,description,status,createdAt,updatedAt,pilotFirstName,pilotLastName,pilotAvatarUrl,pilotAverageRating,const DeepCollectionEquality().hash(_photos)]);

@override
String toString() {
  return 'FlightDto(id: $id, pilotId: $pilotId, departureAirport: $departureAirport, arrivalAirport: $arrivalAirport, departureAirportName: $departureAirportName, departureAirportCity: $departureAirportCity, departureAirportRegion: $departureAirportRegion, departureAirportType: $departureAirportType, departureAirportIdentRu: $departureAirportIdentRu, arrivalAirportName: $arrivalAirportName, arrivalAirportCity: $arrivalAirportCity, arrivalAirportRegion: $arrivalAirportRegion, arrivalAirportType: $arrivalAirportType, arrivalAirportIdentRu: $arrivalAirportIdentRu, departureDate: $departureDate, availableSeats: $availableSeats, totalSeats: $totalSeats, pricePerSeat: $pricePerSeat, aircraftType: $aircraftType, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, pilotFirstName: $pilotFirstName, pilotLastName: $pilotLastName, pilotAvatarUrl: $pilotAvatarUrl, pilotAverageRating: $pilotAverageRating, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$FlightDtoCopyWith<$Res> implements $FlightDtoCopyWith<$Res> {
  factory _$FlightDtoCopyWith(_FlightDto value, $Res Function(_FlightDto) _then) = __$FlightDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'pilot_id') int pilotId,@JsonKey(name: 'departure_airport') String departureAirport,@JsonKey(name: 'arrival_airport') String arrivalAirport,@JsonKey(name: 'departure_airport_name') String? departureAirportName,@JsonKey(name: 'departure_airport_city') String? departureAirportCity,@JsonKey(name: 'departure_airport_region') String? departureAirportRegion,@JsonKey(name: 'departure_airport_type') String? departureAirportType,@JsonKey(name: 'departure_airport_ident_ru') String? departureAirportIdentRu,@JsonKey(name: 'arrival_airport_name') String? arrivalAirportName,@JsonKey(name: 'arrival_airport_city') String? arrivalAirportCity,@JsonKey(name: 'arrival_airport_region') String? arrivalAirportRegion,@JsonKey(name: 'arrival_airport_type') String? arrivalAirportType,@JsonKey(name: 'arrival_airport_ident_ru') String? arrivalAirportIdentRu,@JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) DateTime departureDate,@JsonKey(name: 'available_seats') int availableSeats,@JsonKey(name: 'total_seats') int? totalSeats,@JsonKey(name: 'price_per_seat') double pricePerSeat,@JsonKey(name: 'aircraft_type') String? aircraftType, String? description, String? status,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'pilot_first_name') String? pilotFirstName,@JsonKey(name: 'pilot_last_name') String? pilotLastName,@JsonKey(name: 'pilot_avatar_url') String? pilotAvatarUrl,@JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable) double? pilotAverageRating,@JsonKey(name: 'photos', fromJson: _photosFromJson) List<String>? photos
});




}
/// @nodoc
class __$FlightDtoCopyWithImpl<$Res>
    implements _$FlightDtoCopyWith<$Res> {
  __$FlightDtoCopyWithImpl(this._self, this._then);

  final _FlightDto _self;
  final $Res Function(_FlightDto) _then;

/// Create a copy of FlightDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pilotId = null,Object? departureAirport = null,Object? arrivalAirport = null,Object? departureAirportName = freezed,Object? departureAirportCity = freezed,Object? departureAirportRegion = freezed,Object? departureAirportType = freezed,Object? departureAirportIdentRu = freezed,Object? arrivalAirportName = freezed,Object? arrivalAirportCity = freezed,Object? arrivalAirportRegion = freezed,Object? arrivalAirportType = freezed,Object? arrivalAirportIdentRu = freezed,Object? departureDate = null,Object? availableSeats = null,Object? totalSeats = freezed,Object? pricePerSeat = null,Object? aircraftType = freezed,Object? description = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? pilotFirstName = freezed,Object? pilotLastName = freezed,Object? pilotAvatarUrl = freezed,Object? pilotAverageRating = freezed,Object? photos = freezed,}) {
  return _then(_FlightDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,pilotId: null == pilotId ? _self.pilotId : pilotId // ignore: cast_nullable_to_non_nullable
as int,departureAirport: null == departureAirport ? _self.departureAirport : departureAirport // ignore: cast_nullable_to_non_nullable
as String,arrivalAirport: null == arrivalAirport ? _self.arrivalAirport : arrivalAirport // ignore: cast_nullable_to_non_nullable
as String,departureAirportName: freezed == departureAirportName ? _self.departureAirportName : departureAirportName // ignore: cast_nullable_to_non_nullable
as String?,departureAirportCity: freezed == departureAirportCity ? _self.departureAirportCity : departureAirportCity // ignore: cast_nullable_to_non_nullable
as String?,departureAirportRegion: freezed == departureAirportRegion ? _self.departureAirportRegion : departureAirportRegion // ignore: cast_nullable_to_non_nullable
as String?,departureAirportType: freezed == departureAirportType ? _self.departureAirportType : departureAirportType // ignore: cast_nullable_to_non_nullable
as String?,departureAirportIdentRu: freezed == departureAirportIdentRu ? _self.departureAirportIdentRu : departureAirportIdentRu // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportName: freezed == arrivalAirportName ? _self.arrivalAirportName : arrivalAirportName // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportCity: freezed == arrivalAirportCity ? _self.arrivalAirportCity : arrivalAirportCity // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportRegion: freezed == arrivalAirportRegion ? _self.arrivalAirportRegion : arrivalAirportRegion // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportType: freezed == arrivalAirportType ? _self.arrivalAirportType : arrivalAirportType // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirportIdentRu: freezed == arrivalAirportIdentRu ? _self.arrivalAirportIdentRu : arrivalAirportIdentRu // ignore: cast_nullable_to_non_nullable
as String?,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,totalSeats: freezed == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int?,pricePerSeat: null == pricePerSeat ? _self.pricePerSeat : pricePerSeat // ignore: cast_nullable_to_non_nullable
as double,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pilotFirstName: freezed == pilotFirstName ? _self.pilotFirstName : pilotFirstName // ignore: cast_nullable_to_non_nullable
as String?,pilotLastName: freezed == pilotLastName ? _self.pilotLastName : pilotLastName // ignore: cast_nullable_to_non_nullable
as String?,pilotAvatarUrl: freezed == pilotAvatarUrl ? _self.pilotAvatarUrl : pilotAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,pilotAverageRating: freezed == pilotAverageRating ? _self.pilotAverageRating : pilotAverageRating // ignore: cast_nullable_to_non_nullable
as double?,photos: freezed == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
