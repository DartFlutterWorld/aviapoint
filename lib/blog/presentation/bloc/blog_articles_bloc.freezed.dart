// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_articles_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlogArticlesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogArticlesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesEvent()';
}


}

/// @nodoc
class $BlogArticlesEventCopyWith<$Res>  {
$BlogArticlesEventCopyWith(BlogArticlesEvent _, $Res Function(BlogArticlesEvent) __);
}


/// Adds pattern-matching-related methods to [BlogArticlesEvent].
extension BlogArticlesEventPatterns on BlogArticlesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetBlogArticlesEvent value)?  get,TResult Function( LoadMoreBlogArticlesEvent value)?  loadMore,TResult Function( CreateBlogArticleEvent value)?  create,TResult Function( UpdateBlogArticleEvent value)?  update,TResult Function( DeleteBlogArticleEvent value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetBlogArticlesEvent() when get != null:
return get(_that);case LoadMoreBlogArticlesEvent() when loadMore != null:
return loadMore(_that);case CreateBlogArticleEvent() when create != null:
return create(_that);case UpdateBlogArticleEvent() when update != null:
return update(_that);case DeleteBlogArticleEvent() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetBlogArticlesEvent value)  get,required TResult Function( LoadMoreBlogArticlesEvent value)  loadMore,required TResult Function( CreateBlogArticleEvent value)  create,required TResult Function( UpdateBlogArticleEvent value)  update,required TResult Function( DeleteBlogArticleEvent value)  delete,}){
final _that = this;
switch (_that) {
case GetBlogArticlesEvent():
return get(_that);case LoadMoreBlogArticlesEvent():
return loadMore(_that);case CreateBlogArticleEvent():
return create(_that);case UpdateBlogArticleEvent():
return update(_that);case DeleteBlogArticleEvent():
return delete(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetBlogArticlesEvent value)?  get,TResult? Function( LoadMoreBlogArticlesEvent value)?  loadMore,TResult? Function( CreateBlogArticleEvent value)?  create,TResult? Function( UpdateBlogArticleEvent value)?  update,TResult? Function( DeleteBlogArticleEvent value)?  delete,}){
final _that = this;
switch (_that) {
case GetBlogArticlesEvent() when get != null:
return get(_that);case LoadMoreBlogArticlesEvent() when loadMore != null:
return loadMore(_that);case CreateBlogArticleEvent() when create != null:
return create(_that);case UpdateBlogArticleEvent() when update != null:
return update(_that);case DeleteBlogArticleEvent() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? categoryId,  int? tagId,  int? authorId,  bool? featured,  String? status,  int? limit,  int? offset,  String? search,  int? aircraftModelId)?  get,TResult Function()?  loadMore,TResult Function( int? categoryId,  int? aircraftModelId,  String title,  String? excerpt,  String content,  String? coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  File? coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverImageBytes,  String? coverImageFileName,  String? status,  List<int>? tagIds)?  create,TResult Function( int id,  int? categoryId,  int? aircraftModelId,  String? title,  String? excerpt,  String? content,  String? coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  File? coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverImageBytes,  String? coverImageFileName,  String? status,  List<int>? tagIds)?  update,TResult Function( int id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetBlogArticlesEvent() when get != null:
return get(_that.categoryId,_that.tagId,_that.authorId,_that.featured,_that.status,_that.limit,_that.offset,_that.search,_that.aircraftModelId);case LoadMoreBlogArticlesEvent() when loadMore != null:
return loadMore();case CreateBlogArticleEvent() when create != null:
return create(_that.categoryId,_that.aircraftModelId,_that.title,_that.excerpt,_that.content,_that.coverImageUrl,_that.coverImageFile,_that.coverImageBytes,_that.coverImageFileName,_that.status,_that.tagIds);case UpdateBlogArticleEvent() when update != null:
return update(_that.id,_that.categoryId,_that.aircraftModelId,_that.title,_that.excerpt,_that.content,_that.coverImageUrl,_that.coverImageFile,_that.coverImageBytes,_that.coverImageFileName,_that.status,_that.tagIds);case DeleteBlogArticleEvent() when delete != null:
return delete(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? categoryId,  int? tagId,  int? authorId,  bool? featured,  String? status,  int? limit,  int? offset,  String? search,  int? aircraftModelId)  get,required TResult Function()  loadMore,required TResult Function( int? categoryId,  int? aircraftModelId,  String title,  String? excerpt,  String content,  String? coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  File? coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverImageBytes,  String? coverImageFileName,  String? status,  List<int>? tagIds)  create,required TResult Function( int id,  int? categoryId,  int? aircraftModelId,  String? title,  String? excerpt,  String? content,  String? coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  File? coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverImageBytes,  String? coverImageFileName,  String? status,  List<int>? tagIds)  update,required TResult Function( int id)  delete,}) {final _that = this;
switch (_that) {
case GetBlogArticlesEvent():
return get(_that.categoryId,_that.tagId,_that.authorId,_that.featured,_that.status,_that.limit,_that.offset,_that.search,_that.aircraftModelId);case LoadMoreBlogArticlesEvent():
return loadMore();case CreateBlogArticleEvent():
return create(_that.categoryId,_that.aircraftModelId,_that.title,_that.excerpt,_that.content,_that.coverImageUrl,_that.coverImageFile,_that.coverImageBytes,_that.coverImageFileName,_that.status,_that.tagIds);case UpdateBlogArticleEvent():
return update(_that.id,_that.categoryId,_that.aircraftModelId,_that.title,_that.excerpt,_that.content,_that.coverImageUrl,_that.coverImageFile,_that.coverImageBytes,_that.coverImageFileName,_that.status,_that.tagIds);case DeleteBlogArticleEvent():
return delete(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? categoryId,  int? tagId,  int? authorId,  bool? featured,  String? status,  int? limit,  int? offset,  String? search,  int? aircraftModelId)?  get,TResult? Function()?  loadMore,TResult? Function( int? categoryId,  int? aircraftModelId,  String title,  String? excerpt,  String content,  String? coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  File? coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverImageBytes,  String? coverImageFileName,  String? status,  List<int>? tagIds)?  create,TResult? Function( int id,  int? categoryId,  int? aircraftModelId,  String? title,  String? excerpt,  String? content,  String? coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  File? coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverImageBytes,  String? coverImageFileName,  String? status,  List<int>? tagIds)?  update,TResult? Function( int id)?  delete,}) {final _that = this;
switch (_that) {
case GetBlogArticlesEvent() when get != null:
return get(_that.categoryId,_that.tagId,_that.authorId,_that.featured,_that.status,_that.limit,_that.offset,_that.search,_that.aircraftModelId);case LoadMoreBlogArticlesEvent() when loadMore != null:
return loadMore();case CreateBlogArticleEvent() when create != null:
return create(_that.categoryId,_that.aircraftModelId,_that.title,_that.excerpt,_that.content,_that.coverImageUrl,_that.coverImageFile,_that.coverImageBytes,_that.coverImageFileName,_that.status,_that.tagIds);case UpdateBlogArticleEvent() when update != null:
return update(_that.id,_that.categoryId,_that.aircraftModelId,_that.title,_that.excerpt,_that.content,_that.coverImageUrl,_that.coverImageFile,_that.coverImageBytes,_that.coverImageFileName,_that.status,_that.tagIds);case DeleteBlogArticleEvent() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetBlogArticlesEvent extends BlogArticlesEvent {
  const GetBlogArticlesEvent({this.categoryId, this.tagId, this.authorId, this.featured, this.status, this.limit, this.offset, this.search, this.aircraftModelId}): super._();
  

 final  int? categoryId;
 final  int? tagId;
 final  int? authorId;
 final  bool? featured;
 final  String? status;
 final  int? limit;
 final  int? offset;
 final  String? search;
 final  int? aircraftModelId;

/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetBlogArticlesEventCopyWith<GetBlogArticlesEvent> get copyWith => _$GetBlogArticlesEventCopyWithImpl<GetBlogArticlesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBlogArticlesEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.status, status) || other.status == status)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.search, search) || other.search == search)&&(identical(other.aircraftModelId, aircraftModelId) || other.aircraftModelId == aircraftModelId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,tagId,authorId,featured,status,limit,offset,search,aircraftModelId);

@override
String toString() {
  return 'BlogArticlesEvent.get(categoryId: $categoryId, tagId: $tagId, authorId: $authorId, featured: $featured, status: $status, limit: $limit, offset: $offset, search: $search, aircraftModelId: $aircraftModelId)';
}


}

/// @nodoc
abstract mixin class $GetBlogArticlesEventCopyWith<$Res> implements $BlogArticlesEventCopyWith<$Res> {
  factory $GetBlogArticlesEventCopyWith(GetBlogArticlesEvent value, $Res Function(GetBlogArticlesEvent) _then) = _$GetBlogArticlesEventCopyWithImpl;
@useResult
$Res call({
 int? categoryId, int? tagId, int? authorId, bool? featured, String? status, int? limit, int? offset, String? search, int? aircraftModelId
});




}
/// @nodoc
class _$GetBlogArticlesEventCopyWithImpl<$Res>
    implements $GetBlogArticlesEventCopyWith<$Res> {
  _$GetBlogArticlesEventCopyWithImpl(this._self, this._then);

  final GetBlogArticlesEvent _self;
  final $Res Function(GetBlogArticlesEvent) _then;

/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? tagId = freezed,Object? authorId = freezed,Object? featured = freezed,Object? status = freezed,Object? limit = freezed,Object? offset = freezed,Object? search = freezed,Object? aircraftModelId = freezed,}) {
  return _then(GetBlogArticlesEvent(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,tagId: freezed == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int?,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,featured: freezed == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,aircraftModelId: freezed == aircraftModelId ? _self.aircraftModelId : aircraftModelId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class LoadMoreBlogArticlesEvent extends BlogArticlesEvent {
  const LoadMoreBlogArticlesEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreBlogArticlesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesEvent.loadMore()';
}


}




/// @nodoc


class CreateBlogArticleEvent extends BlogArticlesEvent {
  const CreateBlogArticleEvent({this.categoryId, this.aircraftModelId, required this.title, this.excerpt, required this.content, this.coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false) this.coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false) this.coverImageBytes, this.coverImageFileName, this.status, final  List<int>? tagIds}): _tagIds = tagIds,super._();
  

 final  int? categoryId;
 final  int? aircraftModelId;
 final  String title;
 final  String? excerpt;
 final  String content;
 final  String? coverImageUrl;
@JsonKey(includeFromJson: false, includeToJson: false) final  File? coverImageFile;
@JsonKey(includeFromJson: false, includeToJson: false) final  Uint8List? coverImageBytes;
 final  String? coverImageFileName;
 final  String? status;
 final  List<int>? _tagIds;
 List<int>? get tagIds {
  final value = _tagIds;
  if (value == null) return null;
  if (_tagIds is EqualUnmodifiableListView) return _tagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateBlogArticleEventCopyWith<CreateBlogArticleEvent> get copyWith => _$CreateBlogArticleEventCopyWithImpl<CreateBlogArticleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBlogArticleEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.aircraftModelId, aircraftModelId) || other.aircraftModelId == aircraftModelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.content, content) || other.content == content)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.coverImageFile, coverImageFile) || other.coverImageFile == coverImageFile)&&const DeepCollectionEquality().equals(other.coverImageBytes, coverImageBytes)&&(identical(other.coverImageFileName, coverImageFileName) || other.coverImageFileName == coverImageFileName)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tagIds, _tagIds));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,aircraftModelId,title,excerpt,content,coverImageUrl,coverImageFile,const DeepCollectionEquality().hash(coverImageBytes),coverImageFileName,status,const DeepCollectionEquality().hash(_tagIds));

@override
String toString() {
  return 'BlogArticlesEvent.create(categoryId: $categoryId, aircraftModelId: $aircraftModelId, title: $title, excerpt: $excerpt, content: $content, coverImageUrl: $coverImageUrl, coverImageFile: $coverImageFile, coverImageBytes: $coverImageBytes, coverImageFileName: $coverImageFileName, status: $status, tagIds: $tagIds)';
}


}

/// @nodoc
abstract mixin class $CreateBlogArticleEventCopyWith<$Res> implements $BlogArticlesEventCopyWith<$Res> {
  factory $CreateBlogArticleEventCopyWith(CreateBlogArticleEvent value, $Res Function(CreateBlogArticleEvent) _then) = _$CreateBlogArticleEventCopyWithImpl;
@useResult
$Res call({
 int? categoryId, int? aircraftModelId, String title, String? excerpt, String content, String? coverImageUrl,@JsonKey(includeFromJson: false, includeToJson: false) File? coverImageFile,@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? coverImageBytes, String? coverImageFileName, String? status, List<int>? tagIds
});




}
/// @nodoc
class _$CreateBlogArticleEventCopyWithImpl<$Res>
    implements $CreateBlogArticleEventCopyWith<$Res> {
  _$CreateBlogArticleEventCopyWithImpl(this._self, this._then);

  final CreateBlogArticleEvent _self;
  final $Res Function(CreateBlogArticleEvent) _then;

/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? aircraftModelId = freezed,Object? title = null,Object? excerpt = freezed,Object? content = null,Object? coverImageUrl = freezed,Object? coverImageFile = freezed,Object? coverImageBytes = freezed,Object? coverImageFileName = freezed,Object? status = freezed,Object? tagIds = freezed,}) {
  return _then(CreateBlogArticleEvent(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,aircraftModelId: freezed == aircraftModelId ? _self.aircraftModelId : aircraftModelId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,excerpt: freezed == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageFile: freezed == coverImageFile ? _self.coverImageFile : coverImageFile // ignore: cast_nullable_to_non_nullable
as File?,coverImageBytes: freezed == coverImageBytes ? _self.coverImageBytes : coverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,coverImageFileName: freezed == coverImageFileName ? _self.coverImageFileName : coverImageFileName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tagIds: freezed == tagIds ? _self._tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc


class UpdateBlogArticleEvent extends BlogArticlesEvent {
  const UpdateBlogArticleEvent({required this.id, this.categoryId, this.aircraftModelId, this.title, this.excerpt, this.content, this.coverImageUrl, @JsonKey(includeFromJson: false, includeToJson: false) this.coverImageFile, @JsonKey(includeFromJson: false, includeToJson: false) this.coverImageBytes, this.coverImageFileName, this.status, final  List<int>? tagIds}): _tagIds = tagIds,super._();
  

 final  int id;
 final  int? categoryId;
 final  int? aircraftModelId;
 final  String? title;
 final  String? excerpt;
 final  String? content;
 final  String? coverImageUrl;
@JsonKey(includeFromJson: false, includeToJson: false) final  File? coverImageFile;
@JsonKey(includeFromJson: false, includeToJson: false) final  Uint8List? coverImageBytes;
 final  String? coverImageFileName;
 final  String? status;
 final  List<int>? _tagIds;
 List<int>? get tagIds {
  final value = _tagIds;
  if (value == null) return null;
  if (_tagIds is EqualUnmodifiableListView) return _tagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBlogArticleEventCopyWith<UpdateBlogArticleEvent> get copyWith => _$UpdateBlogArticleEventCopyWithImpl<UpdateBlogArticleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBlogArticleEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.aircraftModelId, aircraftModelId) || other.aircraftModelId == aircraftModelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.content, content) || other.content == content)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.coverImageFile, coverImageFile) || other.coverImageFile == coverImageFile)&&const DeepCollectionEquality().equals(other.coverImageBytes, coverImageBytes)&&(identical(other.coverImageFileName, coverImageFileName) || other.coverImageFileName == coverImageFileName)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tagIds, _tagIds));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,aircraftModelId,title,excerpt,content,coverImageUrl,coverImageFile,const DeepCollectionEquality().hash(coverImageBytes),coverImageFileName,status,const DeepCollectionEquality().hash(_tagIds));

@override
String toString() {
  return 'BlogArticlesEvent.update(id: $id, categoryId: $categoryId, aircraftModelId: $aircraftModelId, title: $title, excerpt: $excerpt, content: $content, coverImageUrl: $coverImageUrl, coverImageFile: $coverImageFile, coverImageBytes: $coverImageBytes, coverImageFileName: $coverImageFileName, status: $status, tagIds: $tagIds)';
}


}

/// @nodoc
abstract mixin class $UpdateBlogArticleEventCopyWith<$Res> implements $BlogArticlesEventCopyWith<$Res> {
  factory $UpdateBlogArticleEventCopyWith(UpdateBlogArticleEvent value, $Res Function(UpdateBlogArticleEvent) _then) = _$UpdateBlogArticleEventCopyWithImpl;
@useResult
$Res call({
 int id, int? categoryId, int? aircraftModelId, String? title, String? excerpt, String? content, String? coverImageUrl,@JsonKey(includeFromJson: false, includeToJson: false) File? coverImageFile,@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? coverImageBytes, String? coverImageFileName, String? status, List<int>? tagIds
});




}
/// @nodoc
class _$UpdateBlogArticleEventCopyWithImpl<$Res>
    implements $UpdateBlogArticleEventCopyWith<$Res> {
  _$UpdateBlogArticleEventCopyWithImpl(this._self, this._then);

  final UpdateBlogArticleEvent _self;
  final $Res Function(UpdateBlogArticleEvent) _then;

/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = freezed,Object? aircraftModelId = freezed,Object? title = freezed,Object? excerpt = freezed,Object? content = freezed,Object? coverImageUrl = freezed,Object? coverImageFile = freezed,Object? coverImageBytes = freezed,Object? coverImageFileName = freezed,Object? status = freezed,Object? tagIds = freezed,}) {
  return _then(UpdateBlogArticleEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,aircraftModelId: freezed == aircraftModelId ? _self.aircraftModelId : aircraftModelId // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,excerpt: freezed == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageFile: freezed == coverImageFile ? _self.coverImageFile : coverImageFile // ignore: cast_nullable_to_non_nullable
as File?,coverImageBytes: freezed == coverImageBytes ? _self.coverImageBytes : coverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,coverImageFileName: freezed == coverImageFileName ? _self.coverImageFileName : coverImageFileName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tagIds: freezed == tagIds ? _self._tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc


class DeleteBlogArticleEvent extends BlogArticlesEvent {
  const DeleteBlogArticleEvent({required this.id}): super._();
  

 final  int id;

/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteBlogArticleEventCopyWith<DeleteBlogArticleEvent> get copyWith => _$DeleteBlogArticleEventCopyWithImpl<DeleteBlogArticleEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteBlogArticleEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'BlogArticlesEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteBlogArticleEventCopyWith<$Res> implements $BlogArticlesEventCopyWith<$Res> {
  factory $DeleteBlogArticleEventCopyWith(DeleteBlogArticleEvent value, $Res Function(DeleteBlogArticleEvent) _then) = _$DeleteBlogArticleEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteBlogArticleEventCopyWithImpl<$Res>
    implements $DeleteBlogArticleEventCopyWith<$Res> {
  _$DeleteBlogArticleEventCopyWithImpl(this._self, this._then);

  final DeleteBlogArticleEvent _self;
  final $Res Function(DeleteBlogArticleEvent) _then;

/// Create a copy of BlogArticlesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteBlogArticleEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BlogArticlesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogArticlesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesState()';
}


}

/// @nodoc
class $BlogArticlesStateCopyWith<$Res>  {
$BlogArticlesStateCopyWith(BlogArticlesState _, $Res Function(BlogArticlesState) __);
}


/// Adds pattern-matching-related methods to [BlogArticlesState].
extension BlogArticlesStatePatterns on BlogArticlesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingBlogArticlesState value)?  loading,TResult Function( LoadingMoreBlogArticlesState value)?  loadingMore,TResult Function( ErrorBlogArticlesState value)?  error,TResult Function( SuccessBlogArticlesState value)?  success,TResult Function( CreatingBlogArticleState value)?  creating,TResult Function( CreatedBlogArticleState value)?  created,TResult Function( UpdatingBlogArticleState value)?  updating,TResult Function( UpdatedBlogArticleState value)?  updated,TResult Function( DeletingBlogArticleState value)?  deleting,TResult Function( DeletedBlogArticleState value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingBlogArticlesState() when loading != null:
return loading(_that);case LoadingMoreBlogArticlesState() when loadingMore != null:
return loadingMore(_that);case ErrorBlogArticlesState() when error != null:
return error(_that);case SuccessBlogArticlesState() when success != null:
return success(_that);case CreatingBlogArticleState() when creating != null:
return creating(_that);case CreatedBlogArticleState() when created != null:
return created(_that);case UpdatingBlogArticleState() when updating != null:
return updating(_that);case UpdatedBlogArticleState() when updated != null:
return updated(_that);case DeletingBlogArticleState() when deleting != null:
return deleting(_that);case DeletedBlogArticleState() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingBlogArticlesState value)  loading,required TResult Function( LoadingMoreBlogArticlesState value)  loadingMore,required TResult Function( ErrorBlogArticlesState value)  error,required TResult Function( SuccessBlogArticlesState value)  success,required TResult Function( CreatingBlogArticleState value)  creating,required TResult Function( CreatedBlogArticleState value)  created,required TResult Function( UpdatingBlogArticleState value)  updating,required TResult Function( UpdatedBlogArticleState value)  updated,required TResult Function( DeletingBlogArticleState value)  deleting,required TResult Function( DeletedBlogArticleState value)  deleted,}){
final _that = this;
switch (_that) {
case LoadingBlogArticlesState():
return loading(_that);case LoadingMoreBlogArticlesState():
return loadingMore(_that);case ErrorBlogArticlesState():
return error(_that);case SuccessBlogArticlesState():
return success(_that);case CreatingBlogArticleState():
return creating(_that);case CreatedBlogArticleState():
return created(_that);case UpdatingBlogArticleState():
return updating(_that);case UpdatedBlogArticleState():
return updated(_that);case DeletingBlogArticleState():
return deleting(_that);case DeletedBlogArticleState():
return deleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingBlogArticlesState value)?  loading,TResult? Function( LoadingMoreBlogArticlesState value)?  loadingMore,TResult? Function( ErrorBlogArticlesState value)?  error,TResult? Function( SuccessBlogArticlesState value)?  success,TResult? Function( CreatingBlogArticleState value)?  creating,TResult? Function( CreatedBlogArticleState value)?  created,TResult? Function( UpdatingBlogArticleState value)?  updating,TResult? Function( UpdatedBlogArticleState value)?  updated,TResult? Function( DeletingBlogArticleState value)?  deleting,TResult? Function( DeletedBlogArticleState value)?  deleted,}){
final _that = this;
switch (_that) {
case LoadingBlogArticlesState() when loading != null:
return loading(_that);case LoadingMoreBlogArticlesState() when loadingMore != null:
return loadingMore(_that);case ErrorBlogArticlesState() when error != null:
return error(_that);case SuccessBlogArticlesState() when success != null:
return success(_that);case CreatingBlogArticleState() when creating != null:
return creating(_that);case CreatedBlogArticleState() when created != null:
return created(_that);case UpdatingBlogArticleState() when updating != null:
return updating(_that);case UpdatedBlogArticleState() when updated != null:
return updated(_that);case DeletingBlogArticleState() when deleting != null:
return deleting(_that);case DeletedBlogArticleState() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<BlogArticleEntity> articles)?  loadingMore,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<BlogArticleEntity> articles,  bool hasMore)?  success,TResult Function()?  creating,TResult Function( BlogArticleEntity article)?  created,TResult Function()?  updating,TResult Function( BlogArticleEntity article)?  updated,TResult Function()?  deleting,TResult Function()?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingBlogArticlesState() when loading != null:
return loading();case LoadingMoreBlogArticlesState() when loadingMore != null:
return loadingMore(_that.articles);case ErrorBlogArticlesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogArticlesState() when success != null:
return success(_that.articles,_that.hasMore);case CreatingBlogArticleState() when creating != null:
return creating();case CreatedBlogArticleState() when created != null:
return created(_that.article);case UpdatingBlogArticleState() when updating != null:
return updating();case UpdatedBlogArticleState() when updated != null:
return updated(_that.article);case DeletingBlogArticleState() when deleting != null:
return deleting();case DeletedBlogArticleState() when deleted != null:
return deleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<BlogArticleEntity> articles)  loadingMore,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<BlogArticleEntity> articles,  bool hasMore)  success,required TResult Function()  creating,required TResult Function( BlogArticleEntity article)  created,required TResult Function()  updating,required TResult Function( BlogArticleEntity article)  updated,required TResult Function()  deleting,required TResult Function()  deleted,}) {final _that = this;
switch (_that) {
case LoadingBlogArticlesState():
return loading();case LoadingMoreBlogArticlesState():
return loadingMore(_that.articles);case ErrorBlogArticlesState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogArticlesState():
return success(_that.articles,_that.hasMore);case CreatingBlogArticleState():
return creating();case CreatedBlogArticleState():
return created(_that.article);case UpdatingBlogArticleState():
return updating();case UpdatedBlogArticleState():
return updated(_that.article);case DeletingBlogArticleState():
return deleting();case DeletedBlogArticleState():
return deleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<BlogArticleEntity> articles)?  loadingMore,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<BlogArticleEntity> articles,  bool hasMore)?  success,TResult? Function()?  creating,TResult? Function( BlogArticleEntity article)?  created,TResult? Function()?  updating,TResult? Function( BlogArticleEntity article)?  updated,TResult? Function()?  deleting,TResult? Function()?  deleted,}) {final _that = this;
switch (_that) {
case LoadingBlogArticlesState() when loading != null:
return loading();case LoadingMoreBlogArticlesState() when loadingMore != null:
return loadingMore(_that.articles);case ErrorBlogArticlesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBlogArticlesState() when success != null:
return success(_that.articles,_that.hasMore);case CreatingBlogArticleState() when creating != null:
return creating();case CreatedBlogArticleState() when created != null:
return created(_that.article);case UpdatingBlogArticleState() when updating != null:
return updating();case UpdatedBlogArticleState() when updated != null:
return updated(_that.article);case DeletingBlogArticleState() when deleting != null:
return deleting();case DeletedBlogArticleState() when deleted != null:
return deleted();case _:
  return null;

}
}

}

/// @nodoc


class LoadingBlogArticlesState extends BlogArticlesState {
  const LoadingBlogArticlesState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBlogArticlesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesState.loading()';
}


}




/// @nodoc


class LoadingMoreBlogArticlesState extends BlogArticlesState {
  const LoadingMoreBlogArticlesState({required final  List<BlogArticleEntity> articles}): _articles = articles,super._();
  

 final  List<BlogArticleEntity> _articles;
 List<BlogArticleEntity> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}


/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingMoreBlogArticlesStateCopyWith<LoadingMoreBlogArticlesState> get copyWith => _$LoadingMoreBlogArticlesStateCopyWithImpl<LoadingMoreBlogArticlesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMoreBlogArticlesState&&const DeepCollectionEquality().equals(other._articles, _articles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'BlogArticlesState.loadingMore(articles: $articles)';
}


}

/// @nodoc
abstract mixin class $LoadingMoreBlogArticlesStateCopyWith<$Res> implements $BlogArticlesStateCopyWith<$Res> {
  factory $LoadingMoreBlogArticlesStateCopyWith(LoadingMoreBlogArticlesState value, $Res Function(LoadingMoreBlogArticlesState) _then) = _$LoadingMoreBlogArticlesStateCopyWithImpl;
@useResult
$Res call({
 List<BlogArticleEntity> articles
});




}
/// @nodoc
class _$LoadingMoreBlogArticlesStateCopyWithImpl<$Res>
    implements $LoadingMoreBlogArticlesStateCopyWith<$Res> {
  _$LoadingMoreBlogArticlesStateCopyWithImpl(this._self, this._then);

  final LoadingMoreBlogArticlesState _self;
  final $Res Function(LoadingMoreBlogArticlesState) _then;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? articles = null,}) {
  return _then(LoadingMoreBlogArticlesState(
articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<BlogArticleEntity>,
  ));
}


}

/// @nodoc


class ErrorBlogArticlesState extends BlogArticlesState {
  const ErrorBlogArticlesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBlogArticlesStateCopyWith<ErrorBlogArticlesState> get copyWith => _$ErrorBlogArticlesStateCopyWithImpl<ErrorBlogArticlesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBlogArticlesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'BlogArticlesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorBlogArticlesStateCopyWith<$Res> implements $BlogArticlesStateCopyWith<$Res> {
  factory $ErrorBlogArticlesStateCopyWith(ErrorBlogArticlesState value, $Res Function(ErrorBlogArticlesState) _then) = _$ErrorBlogArticlesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorBlogArticlesStateCopyWithImpl<$Res>
    implements $ErrorBlogArticlesStateCopyWith<$Res> {
  _$ErrorBlogArticlesStateCopyWithImpl(this._self, this._then);

  final ErrorBlogArticlesState _self;
  final $Res Function(ErrorBlogArticlesState) _then;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorBlogArticlesState(
errorFromApi: freezed == errorFromApi ? _self.errorFromApi : errorFromApi // ignore: cast_nullable_to_non_nullable
as String?,errorForUser: null == errorForUser ? _self.errorForUser : errorForUser // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SuccessBlogArticlesState extends BlogArticlesState {
  const SuccessBlogArticlesState({required final  List<BlogArticleEntity> articles, required this.hasMore}): _articles = articles,super._();
  

 final  List<BlogArticleEntity> _articles;
 List<BlogArticleEntity> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}

 final  bool hasMore;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessBlogArticlesStateCopyWith<SuccessBlogArticlesState> get copyWith => _$SuccessBlogArticlesStateCopyWithImpl<SuccessBlogArticlesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessBlogArticlesState&&const DeepCollectionEquality().equals(other._articles, _articles)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_articles),hasMore);

@override
String toString() {
  return 'BlogArticlesState.success(articles: $articles, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SuccessBlogArticlesStateCopyWith<$Res> implements $BlogArticlesStateCopyWith<$Res> {
  factory $SuccessBlogArticlesStateCopyWith(SuccessBlogArticlesState value, $Res Function(SuccessBlogArticlesState) _then) = _$SuccessBlogArticlesStateCopyWithImpl;
@useResult
$Res call({
 List<BlogArticleEntity> articles, bool hasMore
});




}
/// @nodoc
class _$SuccessBlogArticlesStateCopyWithImpl<$Res>
    implements $SuccessBlogArticlesStateCopyWith<$Res> {
  _$SuccessBlogArticlesStateCopyWithImpl(this._self, this._then);

  final SuccessBlogArticlesState _self;
  final $Res Function(SuccessBlogArticlesState) _then;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? articles = null,Object? hasMore = null,}) {
  return _then(SuccessBlogArticlesState(
articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<BlogArticleEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CreatingBlogArticleState extends BlogArticlesState {
  const CreatingBlogArticleState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingBlogArticleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesState.creating()';
}


}




/// @nodoc


class CreatedBlogArticleState extends BlogArticlesState {
  const CreatedBlogArticleState({required this.article}): super._();
  

 final  BlogArticleEntity article;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedBlogArticleStateCopyWith<CreatedBlogArticleState> get copyWith => _$CreatedBlogArticleStateCopyWithImpl<CreatedBlogArticleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedBlogArticleState&&(identical(other.article, article) || other.article == article));
}


@override
int get hashCode => Object.hash(runtimeType,article);

@override
String toString() {
  return 'BlogArticlesState.created(article: $article)';
}


}

/// @nodoc
abstract mixin class $CreatedBlogArticleStateCopyWith<$Res> implements $BlogArticlesStateCopyWith<$Res> {
  factory $CreatedBlogArticleStateCopyWith(CreatedBlogArticleState value, $Res Function(CreatedBlogArticleState) _then) = _$CreatedBlogArticleStateCopyWithImpl;
@useResult
$Res call({
 BlogArticleEntity article
});




}
/// @nodoc
class _$CreatedBlogArticleStateCopyWithImpl<$Res>
    implements $CreatedBlogArticleStateCopyWith<$Res> {
  _$CreatedBlogArticleStateCopyWithImpl(this._self, this._then);

  final CreatedBlogArticleState _self;
  final $Res Function(CreatedBlogArticleState) _then;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? article = null,}) {
  return _then(CreatedBlogArticleState(
article: null == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as BlogArticleEntity,
  ));
}


}

/// @nodoc


class UpdatingBlogArticleState extends BlogArticlesState {
  const UpdatingBlogArticleState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatingBlogArticleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesState.updating()';
}


}




/// @nodoc


class UpdatedBlogArticleState extends BlogArticlesState {
  const UpdatedBlogArticleState({required this.article}): super._();
  

 final  BlogArticleEntity article;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedBlogArticleStateCopyWith<UpdatedBlogArticleState> get copyWith => _$UpdatedBlogArticleStateCopyWithImpl<UpdatedBlogArticleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedBlogArticleState&&(identical(other.article, article) || other.article == article));
}


@override
int get hashCode => Object.hash(runtimeType,article);

@override
String toString() {
  return 'BlogArticlesState.updated(article: $article)';
}


}

/// @nodoc
abstract mixin class $UpdatedBlogArticleStateCopyWith<$Res> implements $BlogArticlesStateCopyWith<$Res> {
  factory $UpdatedBlogArticleStateCopyWith(UpdatedBlogArticleState value, $Res Function(UpdatedBlogArticleState) _then) = _$UpdatedBlogArticleStateCopyWithImpl;
@useResult
$Res call({
 BlogArticleEntity article
});




}
/// @nodoc
class _$UpdatedBlogArticleStateCopyWithImpl<$Res>
    implements $UpdatedBlogArticleStateCopyWith<$Res> {
  _$UpdatedBlogArticleStateCopyWithImpl(this._self, this._then);

  final UpdatedBlogArticleState _self;
  final $Res Function(UpdatedBlogArticleState) _then;

/// Create a copy of BlogArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? article = null,}) {
  return _then(UpdatedBlogArticleState(
article: null == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as BlogArticleEntity,
  ));
}


}

/// @nodoc


class DeletingBlogArticleState extends BlogArticlesState {
  const DeletingBlogArticleState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletingBlogArticleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesState.deleting()';
}


}




/// @nodoc


class DeletedBlogArticleState extends BlogArticlesState {
  const DeletedBlogArticleState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedBlogArticleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlogArticlesState.deleted()';
}


}




// dart format on
