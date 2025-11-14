// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_categories_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmergencyCategoriesDto {

 int get id; String get title; String get subTitle; String get subTitleEng; int get mainCategoryId; String get titleEng; String get picture;
/// Create a copy of EmergencyCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyCategoriesDtoCopyWith<EmergencyCategoriesDto> get copyWith => _$EmergencyCategoriesDtoCopyWithImpl<EmergencyCategoriesDto>(this as EmergencyCategoriesDto, _$identity);

  /// Serializes this EmergencyCategoriesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyCategoriesDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.subTitleEng, subTitleEng) || other.subTitleEng == subTitleEng)&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subTitle,subTitleEng,mainCategoryId,titleEng,picture);

@override
String toString() {
  return 'EmergencyCategoriesDto(id: $id, title: $title, subTitle: $subTitle, subTitleEng: $subTitleEng, mainCategoryId: $mainCategoryId, titleEng: $titleEng, picture: $picture)';
}


}

/// @nodoc
abstract mixin class $EmergencyCategoriesDtoCopyWith<$Res>  {
  factory $EmergencyCategoriesDtoCopyWith(EmergencyCategoriesDto value, $Res Function(EmergencyCategoriesDto) _then) = _$EmergencyCategoriesDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subTitle, String subTitleEng, int mainCategoryId, String titleEng, String picture
});




}
/// @nodoc
class _$EmergencyCategoriesDtoCopyWithImpl<$Res>
    implements $EmergencyCategoriesDtoCopyWith<$Res> {
  _$EmergencyCategoriesDtoCopyWithImpl(this._self, this._then);

  final EmergencyCategoriesDto _self;
  final $Res Function(EmergencyCategoriesDto) _then;

/// Create a copy of EmergencyCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subTitle = null,Object? subTitleEng = null,Object? mainCategoryId = null,Object? titleEng = null,Object? picture = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,subTitleEng: null == subTitleEng ? _self.subTitleEng : subTitleEng // ignore: cast_nullable_to_non_nullable
as String,mainCategoryId: null == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmergencyCategoriesDto].
extension EmergencyCategoriesDtoPatterns on EmergencyCategoriesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyCategoriesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyCategoriesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyCategoriesDto value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyCategoriesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyCategoriesDto value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyCategoriesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subTitle,  String subTitleEng,  int mainCategoryId,  String titleEng,  String picture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyCategoriesDto() when $default != null:
return $default(_that.id,_that.title,_that.subTitle,_that.subTitleEng,_that.mainCategoryId,_that.titleEng,_that.picture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subTitle,  String subTitleEng,  int mainCategoryId,  String titleEng,  String picture)  $default,) {final _that = this;
switch (_that) {
case _EmergencyCategoriesDto():
return $default(_that.id,_that.title,_that.subTitle,_that.subTitleEng,_that.mainCategoryId,_that.titleEng,_that.picture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subTitle,  String subTitleEng,  int mainCategoryId,  String titleEng,  String picture)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyCategoriesDto() when $default != null:
return $default(_that.id,_that.title,_that.subTitle,_that.subTitleEng,_that.mainCategoryId,_that.titleEng,_that.picture);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _EmergencyCategoriesDto implements EmergencyCategoriesDto {
  const _EmergencyCategoriesDto({required this.id, required this.title, required this.subTitle, required this.subTitleEng, required this.mainCategoryId, required this.titleEng, required this.picture});
  factory _EmergencyCategoriesDto.fromJson(Map<String, dynamic> json) => _$EmergencyCategoriesDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String subTitle;
@override final  String subTitleEng;
@override final  int mainCategoryId;
@override final  String titleEng;
@override final  String picture;

/// Create a copy of EmergencyCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyCategoriesDtoCopyWith<_EmergencyCategoriesDto> get copyWith => __$EmergencyCategoriesDtoCopyWithImpl<_EmergencyCategoriesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyCategoriesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyCategoriesDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.subTitleEng, subTitleEng) || other.subTitleEng == subTitleEng)&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subTitle,subTitleEng,mainCategoryId,titleEng,picture);

@override
String toString() {
  return 'EmergencyCategoriesDto(id: $id, title: $title, subTitle: $subTitle, subTitleEng: $subTitleEng, mainCategoryId: $mainCategoryId, titleEng: $titleEng, picture: $picture)';
}


}

/// @nodoc
abstract mixin class _$EmergencyCategoriesDtoCopyWith<$Res> implements $EmergencyCategoriesDtoCopyWith<$Res> {
  factory _$EmergencyCategoriesDtoCopyWith(_EmergencyCategoriesDto value, $Res Function(_EmergencyCategoriesDto) _then) = __$EmergencyCategoriesDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subTitle, String subTitleEng, int mainCategoryId, String titleEng, String picture
});




}
/// @nodoc
class __$EmergencyCategoriesDtoCopyWithImpl<$Res>
    implements _$EmergencyCategoriesDtoCopyWith<$Res> {
  __$EmergencyCategoriesDtoCopyWithImpl(this._self, this._then);

  final _EmergencyCategoriesDto _self;
  final $Res Function(_EmergencyCategoriesDto) _then;

/// Create a copy of EmergencyCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subTitle = null,Object? subTitleEng = null,Object? mainCategoryId = null,Object? titleEng = null,Object? picture = null,}) {
  return _then(_EmergencyCategoriesDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,subTitleEng: null == subTitleEng ? _self.subTitleEng : subTitleEng // ignore: cast_nullable_to_non_nullable
as String,mainCategoryId: null == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
