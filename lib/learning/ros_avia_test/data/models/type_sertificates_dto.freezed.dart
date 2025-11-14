// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_sertificates_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TypeSertificatesDto {

 int get id; String get title; String get image;
/// Create a copy of TypeSertificatesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeSertificatesDtoCopyWith<TypeSertificatesDto> get copyWith => _$TypeSertificatesDtoCopyWithImpl<TypeSertificatesDto>(this as TypeSertificatesDto, _$identity);

  /// Serializes this TypeSertificatesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeSertificatesDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image);

@override
String toString() {
  return 'TypeSertificatesDto(id: $id, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class $TypeSertificatesDtoCopyWith<$Res>  {
  factory $TypeSertificatesDtoCopyWith(TypeSertificatesDto value, $Res Function(TypeSertificatesDto) _then) = _$TypeSertificatesDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String image
});




}
/// @nodoc
class _$TypeSertificatesDtoCopyWithImpl<$Res>
    implements $TypeSertificatesDtoCopyWith<$Res> {
  _$TypeSertificatesDtoCopyWithImpl(this._self, this._then);

  final TypeSertificatesDto _self;
  final $Res Function(TypeSertificatesDto) _then;

/// Create a copy of TypeSertificatesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TypeSertificatesDto].
extension TypeSertificatesDtoPatterns on TypeSertificatesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypeSertificatesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypeSertificatesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypeSertificatesDto value)  $default,){
final _that = this;
switch (_that) {
case _TypeSertificatesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypeSertificatesDto value)?  $default,){
final _that = this;
switch (_that) {
case _TypeSertificatesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TypeSertificatesDto() when $default != null:
return $default(_that.id,_that.title,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String image)  $default,) {final _that = this;
switch (_that) {
case _TypeSertificatesDto():
return $default(_that.id,_that.title,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String image)?  $default,) {final _that = this;
switch (_that) {
case _TypeSertificatesDto() when $default != null:
return $default(_that.id,_that.title,_that.image);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TypeSertificatesDto implements TypeSertificatesDto {
  const _TypeSertificatesDto({required this.id, required this.title, required this.image});
  factory _TypeSertificatesDto.fromJson(Map<String, dynamic> json) => _$TypeSertificatesDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String image;

/// Create a copy of TypeSertificatesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeSertificatesDtoCopyWith<_TypeSertificatesDto> get copyWith => __$TypeSertificatesDtoCopyWithImpl<_TypeSertificatesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeSertificatesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeSertificatesDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image);

@override
String toString() {
  return 'TypeSertificatesDto(id: $id, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class _$TypeSertificatesDtoCopyWith<$Res> implements $TypeSertificatesDtoCopyWith<$Res> {
  factory _$TypeSertificatesDtoCopyWith(_TypeSertificatesDto value, $Res Function(_TypeSertificatesDto) _then) = __$TypeSertificatesDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String image
});




}
/// @nodoc
class __$TypeSertificatesDtoCopyWithImpl<$Res>
    implements _$TypeSertificatesDtoCopyWith<$Res> {
  __$TypeSertificatesDtoCopyWithImpl(this._self, this._then);

  final _TypeSertificatesDto _self;
  final $Res Function(_TypeSertificatesDto) _then;

/// Create a copy of TypeSertificatesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = null,}) {
  return _then(_TypeSertificatesDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
