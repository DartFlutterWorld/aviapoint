// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_check_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NormalCheckListDto {

 int get id; int get normalCategoryId; String get title; String get doing; String? get picture; String get titleEng; String get doingEng; bool get checkList; String? get subCategory; String? get subCategoryEng;
/// Create a copy of NormalCheckListDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NormalCheckListDtoCopyWith<NormalCheckListDto> get copyWith => _$NormalCheckListDtoCopyWithImpl<NormalCheckListDto>(this as NormalCheckListDto, _$identity);

  /// Serializes this NormalCheckListDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NormalCheckListDto&&(identical(other.id, id) || other.id == id)&&(identical(other.normalCategoryId, normalCategoryId) || other.normalCategoryId == normalCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.doing, doing) || other.doing == doing)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.doingEng, doingEng) || other.doingEng == doingEng)&&(identical(other.checkList, checkList) || other.checkList == checkList)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.subCategoryEng, subCategoryEng) || other.subCategoryEng == subCategoryEng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,normalCategoryId,title,doing,picture,titleEng,doingEng,checkList,subCategory,subCategoryEng);

@override
String toString() {
  return 'NormalCheckListDto(id: $id, normalCategoryId: $normalCategoryId, title: $title, doing: $doing, picture: $picture, titleEng: $titleEng, doingEng: $doingEng, checkList: $checkList, subCategory: $subCategory, subCategoryEng: $subCategoryEng)';
}


}

/// @nodoc
abstract mixin class $NormalCheckListDtoCopyWith<$Res>  {
  factory $NormalCheckListDtoCopyWith(NormalCheckListDto value, $Res Function(NormalCheckListDto) _then) = _$NormalCheckListDtoCopyWithImpl;
@useResult
$Res call({
 int id, int normalCategoryId, String title, String doing, String? picture, String titleEng, String doingEng, bool checkList, String? subCategory, String? subCategoryEng
});




}
/// @nodoc
class _$NormalCheckListDtoCopyWithImpl<$Res>
    implements $NormalCheckListDtoCopyWith<$Res> {
  _$NormalCheckListDtoCopyWithImpl(this._self, this._then);

  final NormalCheckListDto _self;
  final $Res Function(NormalCheckListDto) _then;

/// Create a copy of NormalCheckListDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? normalCategoryId = null,Object? title = null,Object? doing = null,Object? picture = freezed,Object? titleEng = null,Object? doingEng = null,Object? checkList = null,Object? subCategory = freezed,Object? subCategoryEng = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,normalCategoryId: null == normalCategoryId ? _self.normalCategoryId : normalCategoryId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,doing: null == doing ? _self.doing : doing // ignore: cast_nullable_to_non_nullable
as String,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,doingEng: null == doingEng ? _self.doingEng : doingEng // ignore: cast_nullable_to_non_nullable
as String,checkList: null == checkList ? _self.checkList : checkList // ignore: cast_nullable_to_non_nullable
as bool,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String?,subCategoryEng: freezed == subCategoryEng ? _self.subCategoryEng : subCategoryEng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NormalCheckListDto].
extension NormalCheckListDtoPatterns on NormalCheckListDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NormalCheckListDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NormalCheckListDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NormalCheckListDto value)  $default,){
final _that = this;
switch (_that) {
case _NormalCheckListDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NormalCheckListDto value)?  $default,){
final _that = this;
switch (_that) {
case _NormalCheckListDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int normalCategoryId,  String title,  String doing,  String? picture,  String titleEng,  String doingEng,  bool checkList,  String? subCategory,  String? subCategoryEng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NormalCheckListDto() when $default != null:
return $default(_that.id,_that.normalCategoryId,_that.title,_that.doing,_that.picture,_that.titleEng,_that.doingEng,_that.checkList,_that.subCategory,_that.subCategoryEng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int normalCategoryId,  String title,  String doing,  String? picture,  String titleEng,  String doingEng,  bool checkList,  String? subCategory,  String? subCategoryEng)  $default,) {final _that = this;
switch (_that) {
case _NormalCheckListDto():
return $default(_that.id,_that.normalCategoryId,_that.title,_that.doing,_that.picture,_that.titleEng,_that.doingEng,_that.checkList,_that.subCategory,_that.subCategoryEng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int normalCategoryId,  String title,  String doing,  String? picture,  String titleEng,  String doingEng,  bool checkList,  String? subCategory,  String? subCategoryEng)?  $default,) {final _that = this;
switch (_that) {
case _NormalCheckListDto() when $default != null:
return $default(_that.id,_that.normalCategoryId,_that.title,_that.doing,_that.picture,_that.titleEng,_that.doingEng,_that.checkList,_that.subCategory,_that.subCategoryEng);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _NormalCheckListDto implements NormalCheckListDto {
  const _NormalCheckListDto({required this.id, required this.normalCategoryId, required this.title, required this.doing, this.picture = '', required this.titleEng, required this.doingEng, required this.checkList, this.subCategory, this.subCategoryEng});
  factory _NormalCheckListDto.fromJson(Map<String, dynamic> json) => _$NormalCheckListDtoFromJson(json);

@override final  int id;
@override final  int normalCategoryId;
@override final  String title;
@override final  String doing;
@override@JsonKey() final  String? picture;
@override final  String titleEng;
@override final  String doingEng;
@override final  bool checkList;
@override final  String? subCategory;
@override final  String? subCategoryEng;

/// Create a copy of NormalCheckListDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NormalCheckListDtoCopyWith<_NormalCheckListDto> get copyWith => __$NormalCheckListDtoCopyWithImpl<_NormalCheckListDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NormalCheckListDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NormalCheckListDto&&(identical(other.id, id) || other.id == id)&&(identical(other.normalCategoryId, normalCategoryId) || other.normalCategoryId == normalCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.doing, doing) || other.doing == doing)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.doingEng, doingEng) || other.doingEng == doingEng)&&(identical(other.checkList, checkList) || other.checkList == checkList)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.subCategoryEng, subCategoryEng) || other.subCategoryEng == subCategoryEng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,normalCategoryId,title,doing,picture,titleEng,doingEng,checkList,subCategory,subCategoryEng);

@override
String toString() {
  return 'NormalCheckListDto(id: $id, normalCategoryId: $normalCategoryId, title: $title, doing: $doing, picture: $picture, titleEng: $titleEng, doingEng: $doingEng, checkList: $checkList, subCategory: $subCategory, subCategoryEng: $subCategoryEng)';
}


}

/// @nodoc
abstract mixin class _$NormalCheckListDtoCopyWith<$Res> implements $NormalCheckListDtoCopyWith<$Res> {
  factory _$NormalCheckListDtoCopyWith(_NormalCheckListDto value, $Res Function(_NormalCheckListDto) _then) = __$NormalCheckListDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int normalCategoryId, String title, String doing, String? picture, String titleEng, String doingEng, bool checkList, String? subCategory, String? subCategoryEng
});




}
/// @nodoc
class __$NormalCheckListDtoCopyWithImpl<$Res>
    implements _$NormalCheckListDtoCopyWith<$Res> {
  __$NormalCheckListDtoCopyWithImpl(this._self, this._then);

  final _NormalCheckListDto _self;
  final $Res Function(_NormalCheckListDto) _then;

/// Create a copy of NormalCheckListDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? normalCategoryId = null,Object? title = null,Object? doing = null,Object? picture = freezed,Object? titleEng = null,Object? doingEng = null,Object? checkList = null,Object? subCategory = freezed,Object? subCategoryEng = freezed,}) {
  return _then(_NormalCheckListDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,normalCategoryId: null == normalCategoryId ? _self.normalCategoryId : normalCategoryId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,doing: null == doing ? _self.doing : doing // ignore: cast_nullable_to_non_nullable
as String,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,doingEng: null == doingEng ? _self.doingEng : doingEng // ignore: cast_nullable_to_non_nullable
as String,checkList: null == checkList ? _self.checkList : checkList // ignore: cast_nullable_to_non_nullable
as bool,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String?,subCategoryEng: freezed == subCategoryEng ? _self.subCategoryEng : subCategoryEng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
