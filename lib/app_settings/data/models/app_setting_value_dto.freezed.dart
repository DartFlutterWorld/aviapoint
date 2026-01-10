// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_value_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingValueDto {

 String get key; bool get value;
/// Create a copy of AppSettingValueDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingValueDtoCopyWith<AppSettingValueDto> get copyWith => _$AppSettingValueDtoCopyWithImpl<AppSettingValueDto>(this as AppSettingValueDto, _$identity);

  /// Serializes this AppSettingValueDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingValueDto&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'AppSettingValueDto(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $AppSettingValueDtoCopyWith<$Res>  {
  factory $AppSettingValueDtoCopyWith(AppSettingValueDto value, $Res Function(AppSettingValueDto) _then) = _$AppSettingValueDtoCopyWithImpl;
@useResult
$Res call({
 String key, bool value
});




}
/// @nodoc
class _$AppSettingValueDtoCopyWithImpl<$Res>
    implements $AppSettingValueDtoCopyWith<$Res> {
  _$AppSettingValueDtoCopyWithImpl(this._self, this._then);

  final AppSettingValueDto _self;
  final $Res Function(AppSettingValueDto) _then;

/// Create a copy of AppSettingValueDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingValueDto].
extension AppSettingValueDtoPatterns on AppSettingValueDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingValueDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingValueDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingValueDto value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingValueDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingValueDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingValueDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  bool value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingValueDto() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  bool value)  $default,) {final _that = this;
switch (_that) {
case _AppSettingValueDto():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  bool value)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingValueDto() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettingValueDto implements AppSettingValueDto {
  const _AppSettingValueDto({required this.key, required this.value});
  factory _AppSettingValueDto.fromJson(Map<String, dynamic> json) => _$AppSettingValueDtoFromJson(json);

@override final  String key;
@override final  bool value;

/// Create a copy of AppSettingValueDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingValueDtoCopyWith<_AppSettingValueDto> get copyWith => __$AppSettingValueDtoCopyWithImpl<_AppSettingValueDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingValueDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingValueDto&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'AppSettingValueDto(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$AppSettingValueDtoCopyWith<$Res> implements $AppSettingValueDtoCopyWith<$Res> {
  factory _$AppSettingValueDtoCopyWith(_AppSettingValueDto value, $Res Function(_AppSettingValueDto) _then) = __$AppSettingValueDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, bool value
});




}
/// @nodoc
class __$AppSettingValueDtoCopyWithImpl<$Res>
    implements _$AppSettingValueDtoCopyWith<$Res> {
  __$AppSettingValueDtoCopyWithImpl(this._self, this._then);

  final _AppSettingValueDto _self;
  final $Res Function(_AppSettingValueDto) _then;

/// Create a copy of AppSettingValueDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(_AppSettingValueDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
