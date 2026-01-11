// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlogCommentDto {

 int get id;@JsonKey(name: 'article_id') int get articleId;@JsonKey(name: 'author_id') int get authorId;@JsonKey(name: 'parent_comment_id') int? get parentCommentId; String get content;@JsonKey(name: 'is_approved') bool get isApproved;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? get updatedAt;@JsonKey(name: 'author_first_name') String? get authorFirstName;@JsonKey(name: 'author_last_name') String? get authorLastName;@JsonKey(name: 'author_avatar_url') String? get authorAvatarUrl;@JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable) double? get authorRating;
/// Create a copy of BlogCommentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlogCommentDtoCopyWith<BlogCommentDto> get copyWith => _$BlogCommentDtoCopyWithImpl<BlogCommentDto>(this as BlogCommentDto, _$identity);

  /// Serializes this BlogCommentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogCommentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authorFirstName, authorFirstName) || other.authorFirstName == authorFirstName)&&(identical(other.authorLastName, authorLastName) || other.authorLastName == authorLastName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.authorRating, authorRating) || other.authorRating == authorRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,authorId,parentCommentId,content,isApproved,createdAt,updatedAt,authorFirstName,authorLastName,authorAvatarUrl,authorRating);

@override
String toString() {
  return 'BlogCommentDto(id: $id, articleId: $articleId, authorId: $authorId, parentCommentId: $parentCommentId, content: $content, isApproved: $isApproved, createdAt: $createdAt, updatedAt: $updatedAt, authorFirstName: $authorFirstName, authorLastName: $authorLastName, authorAvatarUrl: $authorAvatarUrl, authorRating: $authorRating)';
}


}

/// @nodoc
abstract mixin class $BlogCommentDtoCopyWith<$Res>  {
  factory $BlogCommentDtoCopyWith(BlogCommentDto value, $Res Function(BlogCommentDto) _then) = _$BlogCommentDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'article_id') int articleId,@JsonKey(name: 'author_id') int authorId,@JsonKey(name: 'parent_comment_id') int? parentCommentId, String content,@JsonKey(name: 'is_approved') bool isApproved,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'author_first_name') String? authorFirstName,@JsonKey(name: 'author_last_name') String? authorLastName,@JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,@JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable) double? authorRating
});




}
/// @nodoc
class _$BlogCommentDtoCopyWithImpl<$Res>
    implements $BlogCommentDtoCopyWith<$Res> {
  _$BlogCommentDtoCopyWithImpl(this._self, this._then);

  final BlogCommentDto _self;
  final $Res Function(BlogCommentDto) _then;

/// Create a copy of BlogCommentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? articleId = null,Object? authorId = null,Object? parentCommentId = freezed,Object? content = null,Object? isApproved = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? authorFirstName = freezed,Object? authorLastName = freezed,Object? authorAvatarUrl = freezed,Object? authorRating = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as int?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,authorFirstName: freezed == authorFirstName ? _self.authorFirstName : authorFirstName // ignore: cast_nullable_to_non_nullable
as String?,authorLastName: freezed == authorLastName ? _self.authorLastName : authorLastName // ignore: cast_nullable_to_non_nullable
as String?,authorAvatarUrl: freezed == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,authorRating: freezed == authorRating ? _self.authorRating : authorRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [BlogCommentDto].
extension BlogCommentDtoPatterns on BlogCommentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlogCommentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlogCommentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlogCommentDto value)  $default,){
final _that = this;
switch (_that) {
case _BlogCommentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlogCommentDto value)?  $default,){
final _that = this;
switch (_that) {
case _BlogCommentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'article_id')  int articleId, @JsonKey(name: 'author_id')  int authorId, @JsonKey(name: 'parent_comment_id')  int? parentCommentId,  String content, @JsonKey(name: 'is_approved')  bool isApproved, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'author_first_name')  String? authorFirstName, @JsonKey(name: 'author_last_name')  String? authorLastName, @JsonKey(name: 'author_avatar_url')  String? authorAvatarUrl, @JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable)  double? authorRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlogCommentDto() when $default != null:
return $default(_that.id,_that.articleId,_that.authorId,_that.parentCommentId,_that.content,_that.isApproved,_that.createdAt,_that.updatedAt,_that.authorFirstName,_that.authorLastName,_that.authorAvatarUrl,_that.authorRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'article_id')  int articleId, @JsonKey(name: 'author_id')  int authorId, @JsonKey(name: 'parent_comment_id')  int? parentCommentId,  String content, @JsonKey(name: 'is_approved')  bool isApproved, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'author_first_name')  String? authorFirstName, @JsonKey(name: 'author_last_name')  String? authorLastName, @JsonKey(name: 'author_avatar_url')  String? authorAvatarUrl, @JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable)  double? authorRating)  $default,) {final _that = this;
switch (_that) {
case _BlogCommentDto():
return $default(_that.id,_that.articleId,_that.authorId,_that.parentCommentId,_that.content,_that.isApproved,_that.createdAt,_that.updatedAt,_that.authorFirstName,_that.authorLastName,_that.authorAvatarUrl,_that.authorRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'article_id')  int articleId, @JsonKey(name: 'author_id')  int authorId, @JsonKey(name: 'parent_comment_id')  int? parentCommentId,  String content, @JsonKey(name: 'is_approved')  bool isApproved, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)  DateTime? createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)  DateTime? updatedAt, @JsonKey(name: 'author_first_name')  String? authorFirstName, @JsonKey(name: 'author_last_name')  String? authorLastName, @JsonKey(name: 'author_avatar_url')  String? authorAvatarUrl, @JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable)  double? authorRating)?  $default,) {final _that = this;
switch (_that) {
case _BlogCommentDto() when $default != null:
return $default(_that.id,_that.articleId,_that.authorId,_that.parentCommentId,_that.content,_that.isApproved,_that.createdAt,_that.updatedAt,_that.authorFirstName,_that.authorLastName,_that.authorAvatarUrl,_that.authorRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlogCommentDto implements BlogCommentDto {
  const _BlogCommentDto({required this.id, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'author_id') required this.authorId, @JsonKey(name: 'parent_comment_id') this.parentCommentId, required this.content, @JsonKey(name: 'is_approved') this.isApproved = true, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) this.updatedAt, @JsonKey(name: 'author_first_name') this.authorFirstName, @JsonKey(name: 'author_last_name') this.authorLastName, @JsonKey(name: 'author_avatar_url') this.authorAvatarUrl, @JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable) this.authorRating});
  factory _BlogCommentDto.fromJson(Map<String, dynamic> json) => _$BlogCommentDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'article_id') final  int articleId;
@override@JsonKey(name: 'author_id') final  int authorId;
@override@JsonKey(name: 'parent_comment_id') final  int? parentCommentId;
@override final  String content;
@override@JsonKey(name: 'is_approved') final  bool isApproved;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) final  DateTime? updatedAt;
@override@JsonKey(name: 'author_first_name') final  String? authorFirstName;
@override@JsonKey(name: 'author_last_name') final  String? authorLastName;
@override@JsonKey(name: 'author_avatar_url') final  String? authorAvatarUrl;
@override@JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable) final  double? authorRating;

/// Create a copy of BlogCommentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlogCommentDtoCopyWith<_BlogCommentDto> get copyWith => __$BlogCommentDtoCopyWithImpl<_BlogCommentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlogCommentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlogCommentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authorFirstName, authorFirstName) || other.authorFirstName == authorFirstName)&&(identical(other.authorLastName, authorLastName) || other.authorLastName == authorLastName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.authorRating, authorRating) || other.authorRating == authorRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,authorId,parentCommentId,content,isApproved,createdAt,updatedAt,authorFirstName,authorLastName,authorAvatarUrl,authorRating);

@override
String toString() {
  return 'BlogCommentDto(id: $id, articleId: $articleId, authorId: $authorId, parentCommentId: $parentCommentId, content: $content, isApproved: $isApproved, createdAt: $createdAt, updatedAt: $updatedAt, authorFirstName: $authorFirstName, authorLastName: $authorLastName, authorAvatarUrl: $authorAvatarUrl, authorRating: $authorRating)';
}


}

/// @nodoc
abstract mixin class _$BlogCommentDtoCopyWith<$Res> implements $BlogCommentDtoCopyWith<$Res> {
  factory _$BlogCommentDtoCopyWith(_BlogCommentDto value, $Res Function(_BlogCommentDto) _then) = __$BlogCommentDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'article_id') int articleId,@JsonKey(name: 'author_id') int authorId,@JsonKey(name: 'parent_comment_id') int? parentCommentId, String content,@JsonKey(name: 'is_approved') bool isApproved,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,@JsonKey(name: 'author_first_name') String? authorFirstName,@JsonKey(name: 'author_last_name') String? authorLastName,@JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,@JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable) double? authorRating
});




}
/// @nodoc
class __$BlogCommentDtoCopyWithImpl<$Res>
    implements _$BlogCommentDtoCopyWith<$Res> {
  __$BlogCommentDtoCopyWithImpl(this._self, this._then);

  final _BlogCommentDto _self;
  final $Res Function(_BlogCommentDto) _then;

/// Create a copy of BlogCommentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? articleId = null,Object? authorId = null,Object? parentCommentId = freezed,Object? content = null,Object? isApproved = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? authorFirstName = freezed,Object? authorLastName = freezed,Object? authorAvatarUrl = freezed,Object? authorRating = freezed,}) {
  return _then(_BlogCommentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as int?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,authorFirstName: freezed == authorFirstName ? _self.authorFirstName : authorFirstName // ignore: cast_nullable_to_non_nullable
as String?,authorLastName: freezed == authorLastName ? _self.authorLastName : authorLastName // ignore: cast_nullable_to_non_nullable
as String?,authorAvatarUrl: freezed == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,authorRating: freezed == authorRating ? _self.authorRating : authorRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
