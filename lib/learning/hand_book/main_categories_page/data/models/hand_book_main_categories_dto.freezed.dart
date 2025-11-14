// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hand_book_main_categories_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HandBookMainCategoriesDto {

 int get mainCategoryId; String get title; String get subTitle; String get picture;
/// Create a copy of HandBookMainCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HandBookMainCategoriesDtoCopyWith<HandBookMainCategoriesDto> get copyWith => _$HandBookMainCategoriesDtoCopyWithImpl<HandBookMainCategoriesDto>(this as HandBookMainCategoriesDto, _$identity);

  /// Serializes this HandBookMainCategoriesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HandBookMainCategoriesDto&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainCategoryId,title,subTitle,picture);

@override
String toString() {
  return 'HandBookMainCategoriesDto(mainCategoryId: $mainCategoryId, title: $title, subTitle: $subTitle, picture: $picture)';
}


}

/// @nodoc
abstract mixin class $HandBookMainCategoriesDtoCopyWith<$Res>  {
  factory $HandBookMainCategoriesDtoCopyWith(HandBookMainCategoriesDto value, $Res Function(HandBookMainCategoriesDto) _then) = _$HandBookMainCategoriesDtoCopyWithImpl;
@useResult
$Res call({
 int mainCategoryId, String title, String subTitle, String picture
});




}
/// @nodoc
class _$HandBookMainCategoriesDtoCopyWithImpl<$Res>
    implements $HandBookMainCategoriesDtoCopyWith<$Res> {
  _$HandBookMainCategoriesDtoCopyWithImpl(this._self, this._then);

  final HandBookMainCategoriesDto _self;
  final $Res Function(HandBookMainCategoriesDto) _then;

/// Create a copy of HandBookMainCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainCategoryId = null,Object? title = null,Object? subTitle = null,Object? picture = null,}) {
  return _then(_self.copyWith(
mainCategoryId: null == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HandBookMainCategoriesDto].
extension HandBookMainCategoriesDtoPatterns on HandBookMainCategoriesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HandBookMainCategoriesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HandBookMainCategoriesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HandBookMainCategoriesDto value)  $default,){
final _that = this;
switch (_that) {
case _HandBookMainCategoriesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HandBookMainCategoriesDto value)?  $default,){
final _that = this;
switch (_that) {
case _HandBookMainCategoriesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int mainCategoryId,  String title,  String subTitle,  String picture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HandBookMainCategoriesDto() when $default != null:
return $default(_that.mainCategoryId,_that.title,_that.subTitle,_that.picture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int mainCategoryId,  String title,  String subTitle,  String picture)  $default,) {final _that = this;
switch (_that) {
case _HandBookMainCategoriesDto():
return $default(_that.mainCategoryId,_that.title,_that.subTitle,_that.picture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int mainCategoryId,  String title,  String subTitle,  String picture)?  $default,) {final _that = this;
switch (_that) {
case _HandBookMainCategoriesDto() when $default != null:
return $default(_that.mainCategoryId,_that.title,_that.subTitle,_that.picture);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HandBookMainCategoriesDto implements HandBookMainCategoriesDto {
  const _HandBookMainCategoriesDto({required this.mainCategoryId, required this.title, required this.subTitle, required this.picture});
  factory _HandBookMainCategoriesDto.fromJson(Map<String, dynamic> json) => _$HandBookMainCategoriesDtoFromJson(json);

@override final  int mainCategoryId;
@override final  String title;
@override final  String subTitle;
@override final  String picture;

/// Create a copy of HandBookMainCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HandBookMainCategoriesDtoCopyWith<_HandBookMainCategoriesDto> get copyWith => __$HandBookMainCategoriesDtoCopyWithImpl<_HandBookMainCategoriesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HandBookMainCategoriesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HandBookMainCategoriesDto&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainCategoryId,title,subTitle,picture);

@override
String toString() {
  return 'HandBookMainCategoriesDto(mainCategoryId: $mainCategoryId, title: $title, subTitle: $subTitle, picture: $picture)';
}


}

/// @nodoc
abstract mixin class _$HandBookMainCategoriesDtoCopyWith<$Res> implements $HandBookMainCategoriesDtoCopyWith<$Res> {
  factory _$HandBookMainCategoriesDtoCopyWith(_HandBookMainCategoriesDto value, $Res Function(_HandBookMainCategoriesDto) _then) = __$HandBookMainCategoriesDtoCopyWithImpl;
@override @useResult
$Res call({
 int mainCategoryId, String title, String subTitle, String picture
});




}
/// @nodoc
class __$HandBookMainCategoriesDtoCopyWithImpl<$Res>
    implements _$HandBookMainCategoriesDtoCopyWith<$Res> {
  __$HandBookMainCategoriesDtoCopyWithImpl(this._self, this._then);

  final _HandBookMainCategoriesDto _self;
  final $Res Function(_HandBookMainCategoriesDto) _then;

/// Create a copy of HandBookMainCategoriesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainCategoryId = null,Object? title = null,Object? subTitle = null,Object? picture = null,}) {
  return _then(_HandBookMainCategoriesDto(
mainCategoryId: null == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
