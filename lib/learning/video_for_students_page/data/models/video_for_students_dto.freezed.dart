// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_for_students_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoForStudentsDto {

 int get id; String get title; String get fileName; String get url;
/// Create a copy of VideoForStudentsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoForStudentsDtoCopyWith<VideoForStudentsDto> get copyWith => _$VideoForStudentsDtoCopyWithImpl<VideoForStudentsDto>(this as VideoForStudentsDto, _$identity);

  /// Serializes this VideoForStudentsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoForStudentsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,fileName,url);

@override
String toString() {
  return 'VideoForStudentsDto(id: $id, title: $title, fileName: $fileName, url: $url)';
}


}

/// @nodoc
abstract mixin class $VideoForStudentsDtoCopyWith<$Res>  {
  factory $VideoForStudentsDtoCopyWith(VideoForStudentsDto value, $Res Function(VideoForStudentsDto) _then) = _$VideoForStudentsDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String fileName, String url
});




}
/// @nodoc
class _$VideoForStudentsDtoCopyWithImpl<$Res>
    implements $VideoForStudentsDtoCopyWith<$Res> {
  _$VideoForStudentsDtoCopyWithImpl(this._self, this._then);

  final VideoForStudentsDto _self;
  final $Res Function(VideoForStudentsDto) _then;

/// Create a copy of VideoForStudentsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? fileName = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoForStudentsDto].
extension VideoForStudentsDtoPatterns on VideoForStudentsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoForStudentsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoForStudentsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoForStudentsDto value)  $default,){
final _that = this;
switch (_that) {
case _VideoForStudentsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoForStudentsDto value)?  $default,){
final _that = this;
switch (_that) {
case _VideoForStudentsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String fileName,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoForStudentsDto() when $default != null:
return $default(_that.id,_that.title,_that.fileName,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String fileName,  String url)  $default,) {final _that = this;
switch (_that) {
case _VideoForStudentsDto():
return $default(_that.id,_that.title,_that.fileName,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String fileName,  String url)?  $default,) {final _that = this;
switch (_that) {
case _VideoForStudentsDto() when $default != null:
return $default(_that.id,_that.title,_that.fileName,_that.url);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _VideoForStudentsDto implements VideoForStudentsDto {
  const _VideoForStudentsDto({required this.id, required this.title, required this.fileName, required this.url});
  factory _VideoForStudentsDto.fromJson(Map<String, dynamic> json) => _$VideoForStudentsDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String fileName;
@override final  String url;

/// Create a copy of VideoForStudentsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoForStudentsDtoCopyWith<_VideoForStudentsDto> get copyWith => __$VideoForStudentsDtoCopyWithImpl<_VideoForStudentsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoForStudentsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoForStudentsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,fileName,url);

@override
String toString() {
  return 'VideoForStudentsDto(id: $id, title: $title, fileName: $fileName, url: $url)';
}


}

/// @nodoc
abstract mixin class _$VideoForStudentsDtoCopyWith<$Res> implements $VideoForStudentsDtoCopyWith<$Res> {
  factory _$VideoForStudentsDtoCopyWith(_VideoForStudentsDto value, $Res Function(_VideoForStudentsDto) _then) = __$VideoForStudentsDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String fileName, String url
});




}
/// @nodoc
class __$VideoForStudentsDtoCopyWithImpl<$Res>
    implements _$VideoForStudentsDtoCopyWith<$Res> {
  __$VideoForStudentsDtoCopyWithImpl(this._self, this._then);

  final _VideoForStudentsDto _self;
  final $Res Function(_VideoForStudentsDto) _then;

/// Create a copy of VideoForStudentsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? fileName = null,Object? url = null,}) {
  return _then(_VideoForStudentsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
