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

 int get id;@JsonKey(name: 'manufacturer_id') int get manufacturerId;@JsonKey(name: 'model_code') String get modelCode;@JsonKey(name: 'full_name') String get fullName; String? get category;@JsonKey(name: 'engine_type') String? get engineType;@JsonKey(name: 'engine_count') int get engineCount;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt; AircraftManufacturerDto? get manufacturer;
/// Create a copy of AircraftModelDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftModelDtoCopyWith<AircraftModelDto> get copyWith => _$AircraftModelDtoCopyWithImpl<AircraftModelDto>(this as AircraftModelDto, _$identity);

  /// Serializes this AircraftModelDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.modelCode, modelCode) || other.modelCode == modelCode)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.category, category) || other.category == category)&&(identical(other.engineType, engineType) || other.engineType == engineType)&&(identical(other.engineCount, engineCount) || other.engineCount == engineCount)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,manufacturerId,modelCode,fullName,category,engineType,engineCount,isActive,createdAt,updatedAt,manufacturer);

@override
String toString() {
  return 'AircraftModelDto(id: $id, manufacturerId: $manufacturerId, modelCode: $modelCode, fullName: $fullName, category: $category, engineType: $engineType, engineCount: $engineCount, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, manufacturer: $manufacturer)';
}


}

/// @nodoc
abstract mixin class $AircraftModelDtoCopyWith<$Res>  {
  factory $AircraftModelDtoCopyWith(AircraftModelDto value, $Res Function(AircraftModelDto) _then) = _$AircraftModelDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'manufacturer_id') int manufacturerId,@JsonKey(name: 'model_code') String modelCode,@JsonKey(name: 'full_name') String fullName, String? category,@JsonKey(name: 'engine_type') String? engineType,@JsonKey(name: 'engine_count') int engineCount,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, AircraftManufacturerDto? manufacturer
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? manufacturerId = null,Object? modelCode = null,Object? fullName = null,Object? category = freezed,Object? engineType = freezed,Object? engineCount = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? manufacturer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,manufacturerId: null == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int,modelCode: null == modelCode ? _self.modelCode : modelCode // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,engineType: freezed == engineType ? _self.engineType : engineType // ignore: cast_nullable_to_non_nullable
as String?,engineCount: null == engineCount ? _self.engineCount : engineCount // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'model_code')  String modelCode, @JsonKey(name: 'full_name')  String fullName,  String? category, @JsonKey(name: 'engine_type')  String? engineType, @JsonKey(name: 'engine_count')  int engineCount, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  AircraftManufacturerDto? manufacturer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AircraftModelDto() when $default != null:
return $default(_that.id,_that.manufacturerId,_that.modelCode,_that.fullName,_that.category,_that.engineType,_that.engineCount,_that.isActive,_that.createdAt,_that.updatedAt,_that.manufacturer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'model_code')  String modelCode, @JsonKey(name: 'full_name')  String fullName,  String? category, @JsonKey(name: 'engine_type')  String? engineType, @JsonKey(name: 'engine_count')  int engineCount, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  AircraftManufacturerDto? manufacturer)  $default,) {final _that = this;
switch (_that) {
case _AircraftModelDto():
return $default(_that.id,_that.manufacturerId,_that.modelCode,_that.fullName,_that.category,_that.engineType,_that.engineCount,_that.isActive,_that.createdAt,_that.updatedAt,_that.manufacturer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'model_code')  String modelCode, @JsonKey(name: 'full_name')  String fullName,  String? category, @JsonKey(name: 'engine_type')  String? engineType, @JsonKey(name: 'engine_count')  int engineCount, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  AircraftManufacturerDto? manufacturer)?  $default,) {final _that = this;
switch (_that) {
case _AircraftModelDto() when $default != null:
return $default(_that.id,_that.manufacturerId,_that.modelCode,_that.fullName,_that.category,_that.engineType,_that.engineCount,_that.isActive,_that.createdAt,_that.updatedAt,_that.manufacturer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AircraftModelDto implements AircraftModelDto {
  const _AircraftModelDto({required this.id, @JsonKey(name: 'manufacturer_id') required this.manufacturerId, @JsonKey(name: 'model_code') required this.modelCode, @JsonKey(name: 'full_name') required this.fullName, this.category, @JsonKey(name: 'engine_type') this.engineType, @JsonKey(name: 'engine_count') this.engineCount = 1, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.manufacturer});
  factory _AircraftModelDto.fromJson(Map<String, dynamic> json) => _$AircraftModelDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'manufacturer_id') final  int manufacturerId;
@override@JsonKey(name: 'model_code') final  String modelCode;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String? category;
@override@JsonKey(name: 'engine_type') final  String? engineType;
@override@JsonKey(name: 'engine_count') final  int engineCount;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AircraftModelDto&&(identical(other.id, id) || other.id == id)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.modelCode, modelCode) || other.modelCode == modelCode)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.category, category) || other.category == category)&&(identical(other.engineType, engineType) || other.engineType == engineType)&&(identical(other.engineCount, engineCount) || other.engineCount == engineCount)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,manufacturerId,modelCode,fullName,category,engineType,engineCount,isActive,createdAt,updatedAt,manufacturer);

@override
String toString() {
  return 'AircraftModelDto(id: $id, manufacturerId: $manufacturerId, modelCode: $modelCode, fullName: $fullName, category: $category, engineType: $engineType, engineCount: $engineCount, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, manufacturer: $manufacturer)';
}


}

/// @nodoc
abstract mixin class _$AircraftModelDtoCopyWith<$Res> implements $AircraftModelDtoCopyWith<$Res> {
  factory _$AircraftModelDtoCopyWith(_AircraftModelDto value, $Res Function(_AircraftModelDto) _then) = __$AircraftModelDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'manufacturer_id') int manufacturerId,@JsonKey(name: 'model_code') String modelCode,@JsonKey(name: 'full_name') String fullName, String? category,@JsonKey(name: 'engine_type') String? engineType,@JsonKey(name: 'engine_count') int engineCount,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, AircraftManufacturerDto? manufacturer
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? manufacturerId = null,Object? modelCode = null,Object? fullName = null,Object? category = freezed,Object? engineType = freezed,Object? engineCount = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? manufacturer = freezed,}) {
  return _then(_AircraftModelDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,manufacturerId: null == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int,modelCode: null == modelCode ? _self.modelCode : modelCode // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,engineType: freezed == engineType ? _self.engineType : engineType // ignore: cast_nullable_to_non_nullable
as String?,engineCount: null == engineCount ? _self.engineCount : engineCount // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
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
