// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight_inspection_categories_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreflightInspectionCategoriesDto {

 int get id; String get title; String get subTitle; int get mainCategoryId; String get titleEng; String get picture;
/// Create a copy of PreflightInspectionCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreflightInspectionCategoriesDtoCopyWith<PreflightInspectionCategoriesDto> get copyWith => _$PreflightInspectionCategoriesDtoCopyWithImpl<PreflightInspectionCategoriesDto>(this as PreflightInspectionCategoriesDto, _$identity);

  /// Serializes this PreflightInspectionCategoriesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightInspectionCategoriesDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subTitle,mainCategoryId,titleEng,picture);

@override
String toString() {
  return 'PreflightInspectionCategoriesDto(id: $id, title: $title, subTitle: $subTitle, mainCategoryId: $mainCategoryId, titleEng: $titleEng, picture: $picture)';
}


}

/// @nodoc
abstract mixin class $PreflightInspectionCategoriesDtoCopyWith<$Res>  {
  factory $PreflightInspectionCategoriesDtoCopyWith(PreflightInspectionCategoriesDto value, $Res Function(PreflightInspectionCategoriesDto) _then) = _$PreflightInspectionCategoriesDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subTitle, int mainCategoryId, String titleEng, String picture
});




}
/// @nodoc
class _$PreflightInspectionCategoriesDtoCopyWithImpl<$Res>
    implements $PreflightInspectionCategoriesDtoCopyWith<$Res> {
  _$PreflightInspectionCategoriesDtoCopyWithImpl(this._self, this._then);

  final PreflightInspectionCategoriesDto _self;
  final $Res Function(PreflightInspectionCategoriesDto) _then;

/// Create a copy of PreflightInspectionCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subTitle = null,Object? mainCategoryId = null,Object? titleEng = null,Object? picture = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,mainCategoryId: null == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreflightInspectionCategoriesDto].
extension PreflightInspectionCategoriesDtoPatterns on PreflightInspectionCategoriesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreflightInspectionCategoriesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreflightInspectionCategoriesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreflightInspectionCategoriesDto value)  $default,){
final _that = this;
switch (_that) {
case _PreflightInspectionCategoriesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreflightInspectionCategoriesDto value)?  $default,){
final _that = this;
switch (_that) {
case _PreflightInspectionCategoriesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subTitle,  int mainCategoryId,  String titleEng,  String picture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreflightInspectionCategoriesDto() when $default != null:
return $default(_that.id,_that.title,_that.subTitle,_that.mainCategoryId,_that.titleEng,_that.picture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subTitle,  int mainCategoryId,  String titleEng,  String picture)  $default,) {final _that = this;
switch (_that) {
case _PreflightInspectionCategoriesDto():
return $default(_that.id,_that.title,_that.subTitle,_that.mainCategoryId,_that.titleEng,_that.picture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subTitle,  int mainCategoryId,  String titleEng,  String picture)?  $default,) {final _that = this;
switch (_that) {
case _PreflightInspectionCategoriesDto() when $default != null:
return $default(_that.id,_that.title,_that.subTitle,_that.mainCategoryId,_that.titleEng,_that.picture);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PreflightInspectionCategoriesDto implements PreflightInspectionCategoriesDto {
  const _PreflightInspectionCategoriesDto({required this.id, required this.title, required this.subTitle, required this.mainCategoryId, required this.titleEng, required this.picture});
  factory _PreflightInspectionCategoriesDto.fromJson(Map<String, dynamic> json) => _$PreflightInspectionCategoriesDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String subTitle;
@override final  int mainCategoryId;
@override final  String titleEng;
@override final  String picture;

/// Create a copy of PreflightInspectionCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreflightInspectionCategoriesDtoCopyWith<_PreflightInspectionCategoriesDto> get copyWith => __$PreflightInspectionCategoriesDtoCopyWithImpl<_PreflightInspectionCategoriesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreflightInspectionCategoriesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreflightInspectionCategoriesDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subTitle,mainCategoryId,titleEng,picture);

@override
String toString() {
  return 'PreflightInspectionCategoriesDto(id: $id, title: $title, subTitle: $subTitle, mainCategoryId: $mainCategoryId, titleEng: $titleEng, picture: $picture)';
}


}

/// @nodoc
abstract mixin class _$PreflightInspectionCategoriesDtoCopyWith<$Res> implements $PreflightInspectionCategoriesDtoCopyWith<$Res> {
  factory _$PreflightInspectionCategoriesDtoCopyWith(_PreflightInspectionCategoriesDto value, $Res Function(_PreflightInspectionCategoriesDto) _then) = __$PreflightInspectionCategoriesDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subTitle, int mainCategoryId, String titleEng, String picture
});




}
/// @nodoc
class __$PreflightInspectionCategoriesDtoCopyWithImpl<$Res>
    implements _$PreflightInspectionCategoriesDtoCopyWith<$Res> {
  __$PreflightInspectionCategoriesDtoCopyWithImpl(this._self, this._then);

  final _PreflightInspectionCategoriesDto _self;
  final $Res Function(_PreflightInspectionCategoriesDto) _then;

/// Create a copy of PreflightInspectionCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subTitle = null,Object? mainCategoryId = null,Object? titleEng = null,Object? picture = null,}) {
  return _then(_PreflightInspectionCategoriesDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,mainCategoryId: null == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
