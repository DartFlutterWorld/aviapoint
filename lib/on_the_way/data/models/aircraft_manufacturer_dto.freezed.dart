// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_manufacturer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AircraftManufacturerDto {

 int get id; String get name;
/// Create a copy of AircraftManufacturerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftManufacturerDtoCopyWith<AircraftManufacturerDto> get copyWith => _$AircraftManufacturerDtoCopyWithImpl<AircraftManufacturerDto>(this as AircraftManufacturerDto, _$identity);

  /// Serializes this AircraftManufacturerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftManufacturerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AircraftManufacturerDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $AircraftManufacturerDtoCopyWith<$Res>  {
  factory $AircraftManufacturerDtoCopyWith(AircraftManufacturerDto value, $Res Function(AircraftManufacturerDto) _then) = _$AircraftManufacturerDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$AircraftManufacturerDtoCopyWithImpl<$Res>
    implements $AircraftManufacturerDtoCopyWith<$Res> {
  _$AircraftManufacturerDtoCopyWithImpl(this._self, this._then);

  final AircraftManufacturerDto _self;
  final $Res Function(AircraftManufacturerDto) _then;

/// Create a copy of AircraftManufacturerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AircraftManufacturerDto].
extension AircraftManufacturerDtoPatterns on AircraftManufacturerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AircraftManufacturerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AircraftManufacturerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AircraftManufacturerDto value)  $default,){
final _that = this;
switch (_that) {
case _AircraftManufacturerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AircraftManufacturerDto value)?  $default,){
final _that = this;
switch (_that) {
case _AircraftManufacturerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AircraftManufacturerDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _AircraftManufacturerDto():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _AircraftManufacturerDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AircraftManufacturerDto implements AircraftManufacturerDto {
  const _AircraftManufacturerDto({required this.id, required this.name});
  factory _AircraftManufacturerDto.fromJson(Map<String, dynamic> json) => _$AircraftManufacturerDtoFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of AircraftManufacturerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AircraftManufacturerDtoCopyWith<_AircraftManufacturerDto> get copyWith => __$AircraftManufacturerDtoCopyWithImpl<_AircraftManufacturerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AircraftManufacturerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AircraftManufacturerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AircraftManufacturerDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AircraftManufacturerDtoCopyWith<$Res> implements $AircraftManufacturerDtoCopyWith<$Res> {
  factory _$AircraftManufacturerDtoCopyWith(_AircraftManufacturerDto value, $Res Function(_AircraftManufacturerDto) _then) = __$AircraftManufacturerDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$AircraftManufacturerDtoCopyWithImpl<$Res>
    implements _$AircraftManufacturerDtoCopyWith<$Res> {
  __$AircraftManufacturerDtoCopyWithImpl(this._self, this._then);

  final _AircraftManufacturerDto _self;
  final $Res Function(_AircraftManufacturerDto) _then;

/// Create a copy of AircraftManufacturerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_AircraftManufacturerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
