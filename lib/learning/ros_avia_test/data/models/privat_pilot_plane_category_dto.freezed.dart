// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privat_pilot_plane_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivatPilotPlaneCategoryDto {

 int get id; String get title; String get image; int get typeCertificatesId;
/// Create a copy of PrivatPilotPlaneCategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivatPilotPlaneCategoryDtoCopyWith<PrivatPilotPlaneCategoryDto> get copyWith => _$PrivatPilotPlaneCategoryDtoCopyWithImpl<PrivatPilotPlaneCategoryDto>(this as PrivatPilotPlaneCategoryDto, _$identity);

  /// Serializes this PrivatPilotPlaneCategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivatPilotPlaneCategoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.typeCertificatesId, typeCertificatesId) || other.typeCertificatesId == typeCertificatesId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,typeCertificatesId);

@override
String toString() {
  return 'PrivatPilotPlaneCategoryDto(id: $id, title: $title, image: $image, typeCertificatesId: $typeCertificatesId)';
}


}

/// @nodoc
abstract mixin class $PrivatPilotPlaneCategoryDtoCopyWith<$Res>  {
  factory $PrivatPilotPlaneCategoryDtoCopyWith(PrivatPilotPlaneCategoryDto value, $Res Function(PrivatPilotPlaneCategoryDto) _then) = _$PrivatPilotPlaneCategoryDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String image, int typeCertificatesId
});




}
/// @nodoc
class _$PrivatPilotPlaneCategoryDtoCopyWithImpl<$Res>
    implements $PrivatPilotPlaneCategoryDtoCopyWith<$Res> {
  _$PrivatPilotPlaneCategoryDtoCopyWithImpl(this._self, this._then);

  final PrivatPilotPlaneCategoryDto _self;
  final $Res Function(PrivatPilotPlaneCategoryDto) _then;

/// Create a copy of PrivatPilotPlaneCategoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? image = null,Object? typeCertificatesId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,typeCertificatesId: null == typeCertificatesId ? _self.typeCertificatesId : typeCertificatesId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivatPilotPlaneCategoryDto].
extension PrivatPilotPlaneCategoryDtoPatterns on PrivatPilotPlaneCategoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivatPilotPlaneCategoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivatPilotPlaneCategoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivatPilotPlaneCategoryDto value)  $default,){
final _that = this;
switch (_that) {
case _PrivatPilotPlaneCategoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivatPilotPlaneCategoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _PrivatPilotPlaneCategoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String image,  int typeCertificatesId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivatPilotPlaneCategoryDto() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.typeCertificatesId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String image,  int typeCertificatesId)  $default,) {final _that = this;
switch (_that) {
case _PrivatPilotPlaneCategoryDto():
return $default(_that.id,_that.title,_that.image,_that.typeCertificatesId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String image,  int typeCertificatesId)?  $default,) {final _that = this;
switch (_that) {
case _PrivatPilotPlaneCategoryDto() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.typeCertificatesId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PrivatPilotPlaneCategoryDto implements PrivatPilotPlaneCategoryDto {
  const _PrivatPilotPlaneCategoryDto({required this.id, required this.title, required this.image, required this.typeCertificatesId});
  factory _PrivatPilotPlaneCategoryDto.fromJson(Map<String, dynamic> json) => _$PrivatPilotPlaneCategoryDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String image;
@override final  int typeCertificatesId;

/// Create a copy of PrivatPilotPlaneCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivatPilotPlaneCategoryDtoCopyWith<_PrivatPilotPlaneCategoryDto> get copyWith => __$PrivatPilotPlaneCategoryDtoCopyWithImpl<_PrivatPilotPlaneCategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivatPilotPlaneCategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivatPilotPlaneCategoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.typeCertificatesId, typeCertificatesId) || other.typeCertificatesId == typeCertificatesId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,typeCertificatesId);

@override
String toString() {
  return 'PrivatPilotPlaneCategoryDto(id: $id, title: $title, image: $image, typeCertificatesId: $typeCertificatesId)';
}


}

/// @nodoc
abstract mixin class _$PrivatPilotPlaneCategoryDtoCopyWith<$Res> implements $PrivatPilotPlaneCategoryDtoCopyWith<$Res> {
  factory _$PrivatPilotPlaneCategoryDtoCopyWith(_PrivatPilotPlaneCategoryDto value, $Res Function(_PrivatPilotPlaneCategoryDto) _then) = __$PrivatPilotPlaneCategoryDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String image, int typeCertificatesId
});




}
/// @nodoc
class __$PrivatPilotPlaneCategoryDtoCopyWithImpl<$Res>
    implements _$PrivatPilotPlaneCategoryDtoCopyWith<$Res> {
  __$PrivatPilotPlaneCategoryDtoCopyWithImpl(this._self, this._then);

  final _PrivatPilotPlaneCategoryDto _self;
  final $Res Function(_PrivatPilotPlaneCategoryDto) _then;

/// Create a copy of PrivatPilotPlaneCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = null,Object? typeCertificatesId = null,}) {
  return _then(_PrivatPilotPlaneCategoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,typeCertificatesId: null == typeCertificatesId ? _self.typeCertificatesId : typeCertificatesId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
