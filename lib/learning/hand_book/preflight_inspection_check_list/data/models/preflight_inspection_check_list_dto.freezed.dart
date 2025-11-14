// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight_inspection_check_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreflightInspectionCheckListDto {

 int get id; int get preflightInspectionCategoryId; String get title; String get doing; String? get picture; String get titleEng; String get doingEng;
/// Create a copy of PreflightInspectionCheckListDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreflightInspectionCheckListDtoCopyWith<PreflightInspectionCheckListDto> get copyWith => _$PreflightInspectionCheckListDtoCopyWithImpl<PreflightInspectionCheckListDto>(this as PreflightInspectionCheckListDto, _$identity);

  /// Serializes this PreflightInspectionCheckListDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightInspectionCheckListDto&&(identical(other.id, id) || other.id == id)&&(identical(other.preflightInspectionCategoryId, preflightInspectionCategoryId) || other.preflightInspectionCategoryId == preflightInspectionCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.doing, doing) || other.doing == doing)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.doingEng, doingEng) || other.doingEng == doingEng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,preflightInspectionCategoryId,title,doing,picture,titleEng,doingEng);

@override
String toString() {
  return 'PreflightInspectionCheckListDto(id: $id, preflightInspectionCategoryId: $preflightInspectionCategoryId, title: $title, doing: $doing, picture: $picture, titleEng: $titleEng, doingEng: $doingEng)';
}


}

/// @nodoc
abstract mixin class $PreflightInspectionCheckListDtoCopyWith<$Res>  {
  factory $PreflightInspectionCheckListDtoCopyWith(PreflightInspectionCheckListDto value, $Res Function(PreflightInspectionCheckListDto) _then) = _$PreflightInspectionCheckListDtoCopyWithImpl;
@useResult
$Res call({
 int id, int preflightInspectionCategoryId, String title, String doing, String? picture, String titleEng, String doingEng
});




}
/// @nodoc
class _$PreflightInspectionCheckListDtoCopyWithImpl<$Res>
    implements $PreflightInspectionCheckListDtoCopyWith<$Res> {
  _$PreflightInspectionCheckListDtoCopyWithImpl(this._self, this._then);

  final PreflightInspectionCheckListDto _self;
  final $Res Function(PreflightInspectionCheckListDto) _then;

/// Create a copy of PreflightInspectionCheckListDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? preflightInspectionCategoryId = null,Object? title = null,Object? doing = null,Object? picture = freezed,Object? titleEng = null,Object? doingEng = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,preflightInspectionCategoryId: null == preflightInspectionCategoryId ? _self.preflightInspectionCategoryId : preflightInspectionCategoryId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,doing: null == doing ? _self.doing : doing // ignore: cast_nullable_to_non_nullable
as String,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,doingEng: null == doingEng ? _self.doingEng : doingEng // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreflightInspectionCheckListDto].
extension PreflightInspectionCheckListDtoPatterns on PreflightInspectionCheckListDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreflightInspectionCheckListDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreflightInspectionCheckListDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreflightInspectionCheckListDto value)  $default,){
final _that = this;
switch (_that) {
case _PreflightInspectionCheckListDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreflightInspectionCheckListDto value)?  $default,){
final _that = this;
switch (_that) {
case _PreflightInspectionCheckListDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int preflightInspectionCategoryId,  String title,  String doing,  String? picture,  String titleEng,  String doingEng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreflightInspectionCheckListDto() when $default != null:
return $default(_that.id,_that.preflightInspectionCategoryId,_that.title,_that.doing,_that.picture,_that.titleEng,_that.doingEng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int preflightInspectionCategoryId,  String title,  String doing,  String? picture,  String titleEng,  String doingEng)  $default,) {final _that = this;
switch (_that) {
case _PreflightInspectionCheckListDto():
return $default(_that.id,_that.preflightInspectionCategoryId,_that.title,_that.doing,_that.picture,_that.titleEng,_that.doingEng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int preflightInspectionCategoryId,  String title,  String doing,  String? picture,  String titleEng,  String doingEng)?  $default,) {final _that = this;
switch (_that) {
case _PreflightInspectionCheckListDto() when $default != null:
return $default(_that.id,_that.preflightInspectionCategoryId,_that.title,_that.doing,_that.picture,_that.titleEng,_that.doingEng);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PreflightInspectionCheckListDto implements PreflightInspectionCheckListDto {
  const _PreflightInspectionCheckListDto({required this.id, required this.preflightInspectionCategoryId, required this.title, required this.doing, this.picture = '', required this.titleEng, required this.doingEng});
  factory _PreflightInspectionCheckListDto.fromJson(Map<String, dynamic> json) => _$PreflightInspectionCheckListDtoFromJson(json);

@override final  int id;
@override final  int preflightInspectionCategoryId;
@override final  String title;
@override final  String doing;
@override@JsonKey() final  String? picture;
@override final  String titleEng;
@override final  String doingEng;

/// Create a copy of PreflightInspectionCheckListDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreflightInspectionCheckListDtoCopyWith<_PreflightInspectionCheckListDto> get copyWith => __$PreflightInspectionCheckListDtoCopyWithImpl<_PreflightInspectionCheckListDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreflightInspectionCheckListDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreflightInspectionCheckListDto&&(identical(other.id, id) || other.id == id)&&(identical(other.preflightInspectionCategoryId, preflightInspectionCategoryId) || other.preflightInspectionCategoryId == preflightInspectionCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.doing, doing) || other.doing == doing)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.titleEng, titleEng) || other.titleEng == titleEng)&&(identical(other.doingEng, doingEng) || other.doingEng == doingEng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,preflightInspectionCategoryId,title,doing,picture,titleEng,doingEng);

@override
String toString() {
  return 'PreflightInspectionCheckListDto(id: $id, preflightInspectionCategoryId: $preflightInspectionCategoryId, title: $title, doing: $doing, picture: $picture, titleEng: $titleEng, doingEng: $doingEng)';
}


}

/// @nodoc
abstract mixin class _$PreflightInspectionCheckListDtoCopyWith<$Res> implements $PreflightInspectionCheckListDtoCopyWith<$Res> {
  factory _$PreflightInspectionCheckListDtoCopyWith(_PreflightInspectionCheckListDto value, $Res Function(_PreflightInspectionCheckListDto) _then) = __$PreflightInspectionCheckListDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int preflightInspectionCategoryId, String title, String doing, String? picture, String titleEng, String doingEng
});




}
/// @nodoc
class __$PreflightInspectionCheckListDtoCopyWithImpl<$Res>
    implements _$PreflightInspectionCheckListDtoCopyWith<$Res> {
  __$PreflightInspectionCheckListDtoCopyWithImpl(this._self, this._then);

  final _PreflightInspectionCheckListDto _self;
  final $Res Function(_PreflightInspectionCheckListDto) _then;

/// Create a copy of PreflightInspectionCheckListDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? preflightInspectionCategoryId = null,Object? title = null,Object? doing = null,Object? picture = freezed,Object? titleEng = null,Object? doingEng = null,}) {
  return _then(_PreflightInspectionCheckListDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,preflightInspectionCategoryId: null == preflightInspectionCategoryId ? _self.preflightInspectionCategoryId : preflightInspectionCategoryId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,doing: null == doing ? _self.doing : doing // ignore: cast_nullable_to_non_nullable
as String,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,titleEng: null == titleEng ? _self.titleEng : titleEng // ignore: cast_nullable_to_non_nullable
as String,doingEng: null == doingEng ? _self.doingEng : doingEng // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
