// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AircraftModelDto {

 int get id;@JsonKey(name: 'manufacturer_id') int get manufacturerId;@JsonKey(name: 'model_code') String get modelCode; AircraftManufacturerDto? get manufacturer;
/// Create a copy of AircraftModelDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftModelDtoCopyWith<AircraftModelDto> get copyWith => _$AircraftModelDtoCopyWithImpl<AircraftModelDto>(this as AircraftModelDto, _$identity);

  /// Serializes this AircraftModelDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.modelCode, modelCode) || other.modelCode == modelCode)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,manufacturerId,modelCode,manufacturer);

@override
String toString() {
  return 'AircraftModelDto(id: $id, manufacturerId: $manufacturerId, modelCode: $modelCode, manufacturer: $manufacturer)';
}


}

/// @nodoc
abstract mixin class $AircraftModelDtoCopyWith<$Res>  {
  factory $AircraftModelDtoCopyWith(AircraftModelDto value, $Res Function(AircraftModelDto) _then) = _$AircraftModelDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'manufacturer_id') int manufacturerId,@JsonKey(name: 'model_code') String modelCode, AircraftManufacturerDto? manufacturer
});


$AircraftManufacturerDtoCopyWith<$Res>? get manufacturer;

}
/// @nodoc
class _$AircraftModelDtoCopyWithImpl<$Res>
    implements $AircraftModelDtoCopyWith<$Res> {
  _$AircraftModelDtoCopyWithImpl(this._self, this._then);

  final AircraftModelDto _self;
  final $Res Function(AircraftModelDto) _then;

/// Create a copy of AircraftModelDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? manufacturerId = null,Object? modelCode = null,Object? manufacturer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,manufacturerId: null == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int,modelCode: null == modelCode ? _self.modelCode : modelCode // ignore: cast_nullable_to_non_nullable
as String,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as AircraftManufacturerDto?,
  ));
}
/// Create a copy of AircraftModelDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AircraftManufacturerDtoCopyWith<$Res>? get manufacturer {
    if (_self.manufacturer == null) {
    return null;
  }

  return $AircraftManufacturerDtoCopyWith<$Res>(_self.manufacturer!, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}
}


/// Adds pattern-matching-related methods to [AircraftModelDto].
extension AircraftModelDtoPatterns on AircraftModelDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AircraftModelDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AircraftModelDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AircraftModelDto value)  $default,){
final _that = this;
switch (_that) {
case _AircraftModelDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AircraftModelDto value)?  $default,){
final _that = this;
switch (_that) {
case _AircraftModelDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'model_code')  String modelCode,  AircraftManufacturerDto? manufacturer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AircraftModelDto() when $default != null:
return $default(_that.id,_that.manufacturerId,_that.modelCode,_that.manufacturer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'model_code')  String modelCode,  AircraftManufacturerDto? manufacturer)  $default,) {final _that = this;
switch (_that) {
case _AircraftModelDto():
return $default(_that.id,_that.manufacturerId,_that.modelCode,_that.manufacturer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'model_code')  String modelCode,  AircraftManufacturerDto? manufacturer)?  $default,) {final _that = this;
switch (_that) {
case _AircraftModelDto() when $default != null:
return $default(_that.id,_that.manufacturerId,_that.modelCode,_that.manufacturer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AircraftModelDto implements AircraftModelDto {
  const _AircraftModelDto({required this.id, @JsonKey(name: 'manufacturer_id') required this.manufacturerId, @JsonKey(name: 'model_code') required this.modelCode, this.manufacturer});
  factory _AircraftModelDto.fromJson(Map<String, dynamic> json) => _$AircraftModelDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'manufacturer_id') final  int manufacturerId;
@override@JsonKey(name: 'model_code') final  String modelCode;
@override final  AircraftManufacturerDto? manufacturer;

/// Create a copy of AircraftModelDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AircraftModelDtoCopyWith<_AircraftModelDto> get copyWith => __$AircraftModelDtoCopyWithImpl<_AircraftModelDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AircraftModelDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AircraftModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.modelCode, modelCode) || other.modelCode == modelCode)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,manufacturerId,modelCode,manufacturer);

@override
String toString() {
  return 'AircraftModelDto(id: $id, manufacturerId: $manufacturerId, modelCode: $modelCode, manufacturer: $manufacturer)';
}


}

/// @nodoc
abstract mixin class _$AircraftModelDtoCopyWith<$Res> implements $AircraftModelDtoCopyWith<$Res> {
  factory _$AircraftModelDtoCopyWith(_AircraftModelDto value, $Res Function(_AircraftModelDto) _then) = __$AircraftModelDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'manufacturer_id') int manufacturerId,@JsonKey(name: 'model_code') String modelCode, AircraftManufacturerDto? manufacturer
});


@override $AircraftManufacturerDtoCopyWith<$Res>? get manufacturer;

}
/// @nodoc
class __$AircraftModelDtoCopyWithImpl<$Res>
    implements _$AircraftModelDtoCopyWith<$Res> {
  __$AircraftModelDtoCopyWithImpl(this._self, this._then);

  final _AircraftModelDto _self;
  final $Res Function(_AircraftModelDto) _then;

/// Create a copy of AircraftModelDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? manufacturerId = null,Object? modelCode = null,Object? manufacturer = freezed,}) {
  return _then(_AircraftModelDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,manufacturerId: null == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int,modelCode: null == modelCode ? _self.modelCode : modelCode // ignore: cast_nullable_to_non_nullable
as String,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as AircraftManufacturerDto?,
  ));
}

/// Create a copy of AircraftModelDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AircraftManufacturerDtoCopyWith<$Res>? get manufacturer {
    if (_self.manufacturer == null) {
    return null;
  }

  return $AircraftManufacturerDtoCopyWith<$Res>(_self.manufacturer!, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}
}

// dart format on
