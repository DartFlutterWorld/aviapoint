// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ros_avia_test_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RosAviaTestCategoryDto {

 int get id; String get title; String get image;
/// Create a copy of RosAviaTestCategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosAviaTestCategoryDtoCopyWith<RosAviaTestCategoryDto> get copyWith => _$RosAviaTestCategoryDtoCopyWithImpl<RosAviaTestCategoryDto>(this as RosAviaTestCategoryDto, _$identity);

  /// Serializes this RosAviaTestCategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosAviaTestCategoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image);

@override
String toString() {
  return 'RosAviaTestCategoryDto(id: $id, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class $RosAviaTestCategoryDtoCopyWith<$Res>  {
  factory $RosAviaTestCategoryDtoCopyWith(RosAviaTestCategoryDto value, $Res Function(RosAviaTestCategoryDto) _then) = _$RosAviaTestCategoryDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String image
});




}
/// @nodoc
class _$RosAviaTestCategoryDtoCopyWithImpl<$Res>
    implements $RosAviaTestCategoryDtoCopyWith<$Res> {
  _$RosAviaTestCategoryDtoCopyWithImpl(this._self, this._then);

  final RosAviaTestCategoryDto _self;
  final $Res Function(RosAviaTestCategoryDto) _then;

/// Create a copy of RosAviaTestCategoryDto
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


/// Adds pattern-matching-related methods to [RosAviaTestCategoryDto].
extension RosAviaTestCategoryDtoPatterns on RosAviaTestCategoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RosAviaTestCategoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RosAviaTestCategoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RosAviaTestCategoryDto value)  $default,){
final _that = this;
switch (_that) {
case _RosAviaTestCategoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RosAviaTestCategoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _RosAviaTestCategoryDto() when $default != null:
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
case _RosAviaTestCategoryDto() when $default != null:
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
case _RosAviaTestCategoryDto():
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
case _RosAviaTestCategoryDto() when $default != null:
return $default(_that.id,_that.title,_that.image);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RosAviaTestCategoryDto implements RosAviaTestCategoryDto {
  const _RosAviaTestCategoryDto({required this.id, required this.title, required this.image});
  factory _RosAviaTestCategoryDto.fromJson(Map<String, dynamic> json) => _$RosAviaTestCategoryDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String image;

/// Create a copy of RosAviaTestCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RosAviaTestCategoryDtoCopyWith<_RosAviaTestCategoryDto> get copyWith => __$RosAviaTestCategoryDtoCopyWithImpl<_RosAviaTestCategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RosAviaTestCategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RosAviaTestCategoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image);

@override
String toString() {
  return 'RosAviaTestCategoryDto(id: $id, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class _$RosAviaTestCategoryDtoCopyWith<$Res> implements $RosAviaTestCategoryDtoCopyWith<$Res> {
  factory _$RosAviaTestCategoryDtoCopyWith(_RosAviaTestCategoryDto value, $Res Function(_RosAviaTestCategoryDto) _then) = __$RosAviaTestCategoryDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String image
});




}
/// @nodoc
class __$RosAviaTestCategoryDtoCopyWithImpl<$Res>
    implements _$RosAviaTestCategoryDtoCopyWith<$Res> {
  __$RosAviaTestCategoryDtoCopyWithImpl(this._self, this._then);

  final _RosAviaTestCategoryDto _self;
  final $Res Function(_RosAviaTestCategoryDto) _then;

/// Create a copy of RosAviaTestCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = null,}) {
  return _then(_RosAviaTestCategoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
