// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingsDto {

 int get id; String get key; bool get value; String? get description;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? get updatedAt;
/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsDtoCopyWith<AppSettingsDto> get copyWith => _$AppSettingsDtoCopyWithImpl<AppSettingsDto>(this as AppSettingsDto, _$identity);

  /// Serializes this AppSettingsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,value,description,createdAt,updatedAt);

@override
String toString() {
  return 'AppSettingsDto(id: $id, key: $key, value: $value, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AppSettingsDtoCopyWith<$Res>  {
  factory $AppSettingsDtoCopyWith(AppSettingsDto value, $Res Function(AppSettingsDto) _then) = _$AppSettingsDtoCopyWithImpl;
@useResult
$Res call({
 int id, String key, bool value, String? description,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt
});




}
/// @nodoc
class _$AppSettingsDtoCopyWithImpl<$Res>
    implements $AppSettingsDtoCopyWith<$Res> {
  _$AppSettingsDtoCopyWithImpl(this._self, this._then);

  final AppSettingsDto _self;
  final $Res Function(AppSettingsDto) _then;

/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? value = null,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingsDto].
extension AppSettingsDtoPatterns on AppSettingsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsDto value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String key,  bool value,  String? description, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsDto() when $default != null:
return $default(_that.id,_that.key,_that.value,_that.description,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String key,  bool value,  String? description, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsDto():
return $default(_that.id,_that.key,_that.value,_that.description,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String key,  bool value,  String? description, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsDto() when $default != null:
return $default(_that.id,_that.key,_that.value,_that.description,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettingsDto implements AppSettingsDto {
  const _AppSettingsDto({required this.id, required this.key, required this.value, this.description, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) this.updatedAt});
  factory _AppSettingsDto.fromJson(Map<String, dynamic> json) => _$AppSettingsDtoFromJson(json);

@override final  int id;
@override final  String key;
@override final  bool value;
@override final  String? description;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? updatedAt;

/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsDtoCopyWith<_AppSettingsDto> get copyWith => __$AppSettingsDtoCopyWithImpl<_AppSettingsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,value,description,createdAt,updatedAt);

@override
String toString() {
  return 'AppSettingsDto(id: $id, key: $key, value: $value, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsDtoCopyWith<$Res> implements $AppSettingsDtoCopyWith<$Res> {
  factory _$AppSettingsDtoCopyWith(_AppSettingsDto value, $Res Function(_AppSettingsDto) _then) = __$AppSettingsDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String key, bool value, String? description,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt
});




}
/// @nodoc
class __$AppSettingsDtoCopyWithImpl<$Res>
    implements _$AppSettingsDtoCopyWith<$Res> {
  __$AppSettingsDtoCopyWithImpl(this._self, this._then);

  final _AppSettingsDto _self;
  final $Res Function(_AppSettingsDto) _then;

/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? value = null,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AppSettingsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
