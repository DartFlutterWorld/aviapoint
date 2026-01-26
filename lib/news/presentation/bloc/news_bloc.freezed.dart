// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent()';
}


}

/// @nodoc
class $NewsEventCopyWith<$Res>  {
$NewsEventCopyWith(NewsEvent _, $Res Function(NewsEvent) __);
}


/// Adds pattern-matching-related methods to [NewsEvent].
extension NewsEventPatterns on NewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetNewsEvent value)?  get,TResult Function( GetNewsByCategoryEvent value)?  getNewsByCategory,TResult Function( GetUserNewsEvent value)?  getUserNews,TResult Function( CreateNewsEvent value)?  create,TResult Function( UpdateNewsEvent value)?  update,TResult Function( DeleteNewsEvent value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get(_that);case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that);case GetUserNewsEvent() when getUserNews != null:
return getUserNews(_that);case CreateNewsEvent() when create != null:
return create(_that);case UpdateNewsEvent() when update != null:
return update(_that);case DeleteNewsEvent() when delete != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetNewsEvent value)  get,required TResult Function( GetNewsByCategoryEvent value)  getNewsByCategory,required TResult Function( GetUserNewsEvent value)  getUserNews,required TResult Function( CreateNewsEvent value)  create,required TResult Function( UpdateNewsEvent value)  update,required TResult Function( DeleteNewsEvent value)  delete,}){
final _that = this;
switch (_that) {
case GetNewsEvent():
return get(_that);case GetNewsByCategoryEvent():
return getNewsByCategory(_that);case GetUserNewsEvent():
return getUserNews(_that);case CreateNewsEvent():
return create(_that);case UpdateNewsEvent():
return update(_that);case DeleteNewsEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetNewsEvent value)?  get,TResult? Function( GetNewsByCategoryEvent value)?  getNewsByCategory,TResult? Function( GetUserNewsEvent value)?  getUserNews,TResult? Function( CreateNewsEvent value)?  create,TResult? Function( UpdateNewsEvent value)?  update,TResult? Function( DeleteNewsEvent value)?  delete,}){
final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get(_that);case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that);case GetUserNewsEvent() when getUserNews != null:
return getUserNews(_that);case CreateNewsEvent() when create != null:
return create(_that);case UpdateNewsEvent() when update != null:
return update(_that);case DeleteNewsEvent() when delete != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? authorId)?  get,TResult Function( int categoryId,  int? authorId)?  getNewsByCategory,TResult Function( int userId)?  getUserNews,TResult Function( String title,  String subTitle,  String source,  String body,  String? content,  String? pictureMini,  String? pictureBig,  File? pictureMiniFile,  File? pictureBigFile,  Uint8List? pictureMiniBytes,  Uint8List? pictureBigBytes,  String? pictureMiniFileName,  String? pictureBigFileName,  List<File>? additionalImageFiles,  List<Uint8List>? additionalImageBytes,  List<String>? additionalImageFileNames,  bool isBigNews,  int categoryId)?  create,TResult Function( int id,  String? title,  String? subTitle,  String? source,  String? body,  String? content,  String? pictureMini,  String? pictureBig,  File? pictureMiniFile,  File? pictureBigFile,  Uint8List? pictureMiniBytes,  Uint8List? pictureBigBytes,  String? pictureMiniFileName,  String? pictureBigFileName,  List<File>? additionalImageFiles,  List<Uint8List>? additionalImageBytes,  List<String>? additionalImageFileNames,  bool? deletePictureBig,  List<String>? imagesToDelete,  bool? isBigNews,  int? categoryId,  bool? published)?  update,TResult Function( int id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get(_that.authorId);case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that.categoryId,_that.authorId);case GetUserNewsEvent() when getUserNews != null:
return getUserNews(_that.userId);case CreateNewsEvent() when create != null:
return create(_that.title,_that.subTitle,_that.source,_that.body,_that.content,_that.pictureMini,_that.pictureBig,_that.pictureMiniFile,_that.pictureBigFile,_that.pictureMiniBytes,_that.pictureBigBytes,_that.pictureMiniFileName,_that.pictureBigFileName,_that.additionalImageFiles,_that.additionalImageBytes,_that.additionalImageFileNames,_that.isBigNews,_that.categoryId);case UpdateNewsEvent() when update != null:
return update(_that.id,_that.title,_that.subTitle,_that.source,_that.body,_that.content,_that.pictureMini,_that.pictureBig,_that.pictureMiniFile,_that.pictureBigFile,_that.pictureMiniBytes,_that.pictureBigBytes,_that.pictureMiniFileName,_that.pictureBigFileName,_that.additionalImageFiles,_that.additionalImageBytes,_that.additionalImageFileNames,_that.deletePictureBig,_that.imagesToDelete,_that.isBigNews,_that.categoryId,_that.published);case DeleteNewsEvent() when delete != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? authorId)  get,required TResult Function( int categoryId,  int? authorId)  getNewsByCategory,required TResult Function( int userId)  getUserNews,required TResult Function( String title,  String subTitle,  String source,  String body,  String? content,  String? pictureMini,  String? pictureBig,  File? pictureMiniFile,  File? pictureBigFile,  Uint8List? pictureMiniBytes,  Uint8List? pictureBigBytes,  String? pictureMiniFileName,  String? pictureBigFileName,  List<File>? additionalImageFiles,  List<Uint8List>? additionalImageBytes,  List<String>? additionalImageFileNames,  bool isBigNews,  int categoryId)  create,required TResult Function( int id,  String? title,  String? subTitle,  String? source,  String? body,  String? content,  String? pictureMini,  String? pictureBig,  File? pictureMiniFile,  File? pictureBigFile,  Uint8List? pictureMiniBytes,  Uint8List? pictureBigBytes,  String? pictureMiniFileName,  String? pictureBigFileName,  List<File>? additionalImageFiles,  List<Uint8List>? additionalImageBytes,  List<String>? additionalImageFileNames,  bool? deletePictureBig,  List<String>? imagesToDelete,  bool? isBigNews,  int? categoryId,  bool? published)  update,required TResult Function( int id)  delete,}) {final _that = this;
switch (_that) {
case GetNewsEvent():
return get(_that.authorId);case GetNewsByCategoryEvent():
return getNewsByCategory(_that.categoryId,_that.authorId);case GetUserNewsEvent():
return getUserNews(_that.userId);case CreateNewsEvent():
return create(_that.title,_that.subTitle,_that.source,_that.body,_that.content,_that.pictureMini,_that.pictureBig,_that.pictureMiniFile,_that.pictureBigFile,_that.pictureMiniBytes,_that.pictureBigBytes,_that.pictureMiniFileName,_that.pictureBigFileName,_that.additionalImageFiles,_that.additionalImageBytes,_that.additionalImageFileNames,_that.isBigNews,_that.categoryId);case UpdateNewsEvent():
return update(_that.id,_that.title,_that.subTitle,_that.source,_that.body,_that.content,_that.pictureMini,_that.pictureBig,_that.pictureMiniFile,_that.pictureBigFile,_that.pictureMiniBytes,_that.pictureBigBytes,_that.pictureMiniFileName,_that.pictureBigFileName,_that.additionalImageFiles,_that.additionalImageBytes,_that.additionalImageFileNames,_that.deletePictureBig,_that.imagesToDelete,_that.isBigNews,_that.categoryId,_that.published);case DeleteNewsEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? authorId)?  get,TResult? Function( int categoryId,  int? authorId)?  getNewsByCategory,TResult? Function( int userId)?  getUserNews,TResult? Function( String title,  String subTitle,  String source,  String body,  String? content,  String? pictureMini,  String? pictureBig,  File? pictureMiniFile,  File? pictureBigFile,  Uint8List? pictureMiniBytes,  Uint8List? pictureBigBytes,  String? pictureMiniFileName,  String? pictureBigFileName,  List<File>? additionalImageFiles,  List<Uint8List>? additionalImageBytes,  List<String>? additionalImageFileNames,  bool isBigNews,  int categoryId)?  create,TResult? Function( int id,  String? title,  String? subTitle,  String? source,  String? body,  String? content,  String? pictureMini,  String? pictureBig,  File? pictureMiniFile,  File? pictureBigFile,  Uint8List? pictureMiniBytes,  Uint8List? pictureBigBytes,  String? pictureMiniFileName,  String? pictureBigFileName,  List<File>? additionalImageFiles,  List<Uint8List>? additionalImageBytes,  List<String>? additionalImageFileNames,  bool? deletePictureBig,  List<String>? imagesToDelete,  bool? isBigNews,  int? categoryId,  bool? published)?  update,TResult? Function( int id)?  delete,}) {final _that = this;
switch (_that) {
case GetNewsEvent() when get != null:
return get(_that.authorId);case GetNewsByCategoryEvent() when getNewsByCategory != null:
return getNewsByCategory(_that.categoryId,_that.authorId);case GetUserNewsEvent() when getUserNews != null:
return getUserNews(_that.userId);case CreateNewsEvent() when create != null:
return create(_that.title,_that.subTitle,_that.source,_that.body,_that.content,_that.pictureMini,_that.pictureBig,_that.pictureMiniFile,_that.pictureBigFile,_that.pictureMiniBytes,_that.pictureBigBytes,_that.pictureMiniFileName,_that.pictureBigFileName,_that.additionalImageFiles,_that.additionalImageBytes,_that.additionalImageFileNames,_that.isBigNews,_that.categoryId);case UpdateNewsEvent() when update != null:
return update(_that.id,_that.title,_that.subTitle,_that.source,_that.body,_that.content,_that.pictureMini,_that.pictureBig,_that.pictureMiniFile,_that.pictureBigFile,_that.pictureMiniBytes,_that.pictureBigBytes,_that.pictureMiniFileName,_that.pictureBigFileName,_that.additionalImageFiles,_that.additionalImageBytes,_that.additionalImageFileNames,_that.deletePictureBig,_that.imagesToDelete,_that.isBigNews,_that.categoryId,_that.published);case DeleteNewsEvent() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetNewsEvent extends NewsEvent {
  const GetNewsEvent({this.authorId}): super._();
  

 final  int? authorId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNewsEventCopyWith<GetNewsEvent> get copyWith => _$GetNewsEventCopyWithImpl<GetNewsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNewsEvent&&(identical(other.authorId, authorId) || other.authorId == authorId));
}


@override
int get hashCode => Object.hash(runtimeType,authorId);

@override
String toString() {
  return 'NewsEvent.get(authorId: $authorId)';
}


}

/// @nodoc
abstract mixin class $GetNewsEventCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory $GetNewsEventCopyWith(GetNewsEvent value, $Res Function(GetNewsEvent) _then) = _$GetNewsEventCopyWithImpl;
@useResult
$Res call({
 int? authorId
});




}
/// @nodoc
class _$GetNewsEventCopyWithImpl<$Res>
    implements $GetNewsEventCopyWith<$Res> {
  _$GetNewsEventCopyWithImpl(this._self, this._then);

  final GetNewsEvent _self;
  final $Res Function(GetNewsEvent) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authorId = freezed,}) {
  return _then(GetNewsEvent(
authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class GetNewsByCategoryEvent extends NewsEvent {
  const GetNewsByCategoryEvent({required this.categoryId, this.authorId}): super._();
  

 final  int categoryId;
 final  int? authorId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNewsByCategoryEventCopyWith<GetNewsByCategoryEvent> get copyWith => _$GetNewsByCategoryEventCopyWithImpl<GetNewsByCategoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNewsByCategoryEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.authorId, authorId) || other.authorId == authorId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,authorId);

@override
String toString() {
  return 'NewsEvent.getNewsByCategory(categoryId: $categoryId, authorId: $authorId)';
}


}

/// @nodoc
abstract mixin class $GetNewsByCategoryEventCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory $GetNewsByCategoryEventCopyWith(GetNewsByCategoryEvent value, $Res Function(GetNewsByCategoryEvent) _then) = _$GetNewsByCategoryEventCopyWithImpl;
@useResult
$Res call({
 int categoryId, int? authorId
});




}
/// @nodoc
class _$GetNewsByCategoryEventCopyWithImpl<$Res>
    implements $GetNewsByCategoryEventCopyWith<$Res> {
  _$GetNewsByCategoryEventCopyWithImpl(this._self, this._then);

  final GetNewsByCategoryEvent _self;
  final $Res Function(GetNewsByCategoryEvent) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? authorId = freezed,}) {
  return _then(GetNewsByCategoryEvent(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class GetUserNewsEvent extends NewsEvent {
  const GetUserNewsEvent({required this.userId}): super._();
  

 final  int userId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetUserNewsEventCopyWith<GetUserNewsEvent> get copyWith => _$GetUserNewsEventCopyWithImpl<GetUserNewsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetUserNewsEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'NewsEvent.getUserNews(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $GetUserNewsEventCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory $GetUserNewsEventCopyWith(GetUserNewsEvent value, $Res Function(GetUserNewsEvent) _then) = _$GetUserNewsEventCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$GetUserNewsEventCopyWithImpl<$Res>
    implements $GetUserNewsEventCopyWith<$Res> {
  _$GetUserNewsEventCopyWithImpl(this._self, this._then);

  final GetUserNewsEvent _self;
  final $Res Function(GetUserNewsEvent) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(GetUserNewsEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CreateNewsEvent extends NewsEvent {
  const CreateNewsEvent({required this.title, required this.subTitle, required this.source, required this.body, this.content, this.pictureMini, this.pictureBig, this.pictureMiniFile, this.pictureBigFile, this.pictureMiniBytes, this.pictureBigBytes, this.pictureMiniFileName, this.pictureBigFileName, final  List<File>? additionalImageFiles, final  List<Uint8List>? additionalImageBytes, final  List<String>? additionalImageFileNames, required this.isBigNews, required this.categoryId}): _additionalImageFiles = additionalImageFiles,_additionalImageBytes = additionalImageBytes,_additionalImageFileNames = additionalImageFileNames,super._();
  

 final  String title;
 final  String subTitle;
 final  String source;
 final  String body;
 final  String? content;
// Quill Delta JSON
 final  String? pictureMini;
 final  String? pictureBig;
 final  File? pictureMiniFile;
 final  File? pictureBigFile;
 final  Uint8List? pictureMiniBytes;
 final  Uint8List? pictureBigBytes;
 final  String? pictureMiniFileName;
 final  String? pictureBigFileName;
 final  List<File>? _additionalImageFiles;
 List<File>? get additionalImageFiles {
  final value = _additionalImageFiles;
  if (value == null) return null;
  if (_additionalImageFiles is EqualUnmodifiableListView) return _additionalImageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Uint8List>? _additionalImageBytes;
 List<Uint8List>? get additionalImageBytes {
  final value = _additionalImageBytes;
  if (value == null) return null;
  if (_additionalImageBytes is EqualUnmodifiableListView) return _additionalImageBytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _additionalImageFileNames;
 List<String>? get additionalImageFileNames {
  final value = _additionalImageFileNames;
  if (value == null) return null;
  if (_additionalImageFileNames is EqualUnmodifiableListView) return _additionalImageFileNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool isBigNews;
 final  int categoryId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewsEventCopyWith<CreateNewsEvent> get copyWith => _$CreateNewsEventCopyWithImpl<CreateNewsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewsEvent&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.source, source) || other.source == source)&&(identical(other.body, body) || other.body == body)&&(identical(other.content, content) || other.content == content)&&(identical(other.pictureMini, pictureMini) || other.pictureMini == pictureMini)&&(identical(other.pictureBig, pictureBig) || other.pictureBig == pictureBig)&&(identical(other.pictureMiniFile, pictureMiniFile) || other.pictureMiniFile == pictureMiniFile)&&(identical(other.pictureBigFile, pictureBigFile) || other.pictureBigFile == pictureBigFile)&&const DeepCollectionEquality().equals(other.pictureMiniBytes, pictureMiniBytes)&&const DeepCollectionEquality().equals(other.pictureBigBytes, pictureBigBytes)&&(identical(other.pictureMiniFileName, pictureMiniFileName) || other.pictureMiniFileName == pictureMiniFileName)&&(identical(other.pictureBigFileName, pictureBigFileName) || other.pictureBigFileName == pictureBigFileName)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles)&&const DeepCollectionEquality().equals(other._additionalImageBytes, _additionalImageBytes)&&const DeepCollectionEquality().equals(other._additionalImageFileNames, _additionalImageFileNames)&&(identical(other.isBigNews, isBigNews) || other.isBigNews == isBigNews)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,title,subTitle,source,body,content,pictureMini,pictureBig,pictureMiniFile,pictureBigFile,const DeepCollectionEquality().hash(pictureMiniBytes),const DeepCollectionEquality().hash(pictureBigBytes),pictureMiniFileName,pictureBigFileName,const DeepCollectionEquality().hash(_additionalImageFiles),const DeepCollectionEquality().hash(_additionalImageBytes),const DeepCollectionEquality().hash(_additionalImageFileNames),isBigNews,categoryId);

@override
String toString() {
  return 'NewsEvent.create(title: $title, subTitle: $subTitle, source: $source, body: $body, content: $content, pictureMini: $pictureMini, pictureBig: $pictureBig, pictureMiniFile: $pictureMiniFile, pictureBigFile: $pictureBigFile, pictureMiniBytes: $pictureMiniBytes, pictureBigBytes: $pictureBigBytes, pictureMiniFileName: $pictureMiniFileName, pictureBigFileName: $pictureBigFileName, additionalImageFiles: $additionalImageFiles, additionalImageBytes: $additionalImageBytes, additionalImageFileNames: $additionalImageFileNames, isBigNews: $isBigNews, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $CreateNewsEventCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory $CreateNewsEventCopyWith(CreateNewsEvent value, $Res Function(CreateNewsEvent) _then) = _$CreateNewsEventCopyWithImpl;
@useResult
$Res call({
 String title, String subTitle, String source, String body, String? content, String? pictureMini, String? pictureBig, File? pictureMiniFile, File? pictureBigFile, Uint8List? pictureMiniBytes, Uint8List? pictureBigBytes, String? pictureMiniFileName, String? pictureBigFileName, List<File>? additionalImageFiles, List<Uint8List>? additionalImageBytes, List<String>? additionalImageFileNames, bool isBigNews, int categoryId
});




}
/// @nodoc
class _$CreateNewsEventCopyWithImpl<$Res>
    implements $CreateNewsEventCopyWith<$Res> {
  _$CreateNewsEventCopyWithImpl(this._self, this._then);

  final CreateNewsEvent _self;
  final $Res Function(CreateNewsEvent) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subTitle = null,Object? source = null,Object? body = null,Object? content = freezed,Object? pictureMini = freezed,Object? pictureBig = freezed,Object? pictureMiniFile = freezed,Object? pictureBigFile = freezed,Object? pictureMiniBytes = freezed,Object? pictureBigBytes = freezed,Object? pictureMiniFileName = freezed,Object? pictureBigFileName = freezed,Object? additionalImageFiles = freezed,Object? additionalImageBytes = freezed,Object? additionalImageFileNames = freezed,Object? isBigNews = null,Object? categoryId = null,}) {
  return _then(CreateNewsEvent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,pictureMini: freezed == pictureMini ? _self.pictureMini : pictureMini // ignore: cast_nullable_to_non_nullable
as String?,pictureBig: freezed == pictureBig ? _self.pictureBig : pictureBig // ignore: cast_nullable_to_non_nullable
as String?,pictureMiniFile: freezed == pictureMiniFile ? _self.pictureMiniFile : pictureMiniFile // ignore: cast_nullable_to_non_nullable
as File?,pictureBigFile: freezed == pictureBigFile ? _self.pictureBigFile : pictureBigFile // ignore: cast_nullable_to_non_nullable
as File?,pictureMiniBytes: freezed == pictureMiniBytes ? _self.pictureMiniBytes : pictureMiniBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,pictureBigBytes: freezed == pictureBigBytes ? _self.pictureBigBytes : pictureBigBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,pictureMiniFileName: freezed == pictureMiniFileName ? _self.pictureMiniFileName : pictureMiniFileName // ignore: cast_nullable_to_non_nullable
as String?,pictureBigFileName: freezed == pictureBigFileName ? _self.pictureBigFileName : pictureBigFileName // ignore: cast_nullable_to_non_nullable
as String?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<File>?,additionalImageBytes: freezed == additionalImageBytes ? _self._additionalImageBytes : additionalImageBytes // ignore: cast_nullable_to_non_nullable
as List<Uint8List>?,additionalImageFileNames: freezed == additionalImageFileNames ? _self._additionalImageFileNames : additionalImageFileNames // ignore: cast_nullable_to_non_nullable
as List<String>?,isBigNews: null == isBigNews ? _self.isBigNews : isBigNews // ignore: cast_nullable_to_non_nullable
as bool,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdateNewsEvent extends NewsEvent {
  const UpdateNewsEvent({required this.id, this.title, this.subTitle, this.source, this.body, this.content, this.pictureMini, this.pictureBig, this.pictureMiniFile, this.pictureBigFile, this.pictureMiniBytes, this.pictureBigBytes, this.pictureMiniFileName, this.pictureBigFileName, final  List<File>? additionalImageFiles, final  List<Uint8List>? additionalImageBytes, final  List<String>? additionalImageFileNames, this.deletePictureBig, final  List<String>? imagesToDelete, this.isBigNews, this.categoryId, this.published}): _additionalImageFiles = additionalImageFiles,_additionalImageBytes = additionalImageBytes,_additionalImageFileNames = additionalImageFileNames,_imagesToDelete = imagesToDelete,super._();
  

 final  int id;
 final  String? title;
 final  String? subTitle;
 final  String? source;
 final  String? body;
 final  String? content;
 final  String? pictureMini;
 final  String? pictureBig;
 final  File? pictureMiniFile;
 final  File? pictureBigFile;
 final  Uint8List? pictureMiniBytes;
 final  Uint8List? pictureBigBytes;
 final  String? pictureMiniFileName;
 final  String? pictureBigFileName;
 final  List<File>? _additionalImageFiles;
 List<File>? get additionalImageFiles {
  final value = _additionalImageFiles;
  if (value == null) return null;
  if (_additionalImageFiles is EqualUnmodifiableListView) return _additionalImageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Uint8List>? _additionalImageBytes;
 List<Uint8List>? get additionalImageBytes {
  final value = _additionalImageBytes;
  if (value == null) return null;
  if (_additionalImageBytes is EqualUnmodifiableListView) return _additionalImageBytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _additionalImageFileNames;
 List<String>? get additionalImageFileNames {
  final value = _additionalImageFileNames;
  if (value == null) return null;
  if (_additionalImageFileNames is EqualUnmodifiableListView) return _additionalImageFileNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? deletePictureBig;
 final  List<String>? _imagesToDelete;
 List<String>? get imagesToDelete {
  final value = _imagesToDelete;
  if (value == null) return null;
  if (_imagesToDelete is EqualUnmodifiableListView) return _imagesToDelete;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? isBigNews;
 final  int? categoryId;
 final  bool? published;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateNewsEventCopyWith<UpdateNewsEvent> get copyWith => _$UpdateNewsEventCopyWithImpl<UpdateNewsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateNewsEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.source, source) || other.source == source)&&(identical(other.body, body) || other.body == body)&&(identical(other.content, content) || other.content == content)&&(identical(other.pictureMini, pictureMini) || other.pictureMini == pictureMini)&&(identical(other.pictureBig, pictureBig) || other.pictureBig == pictureBig)&&(identical(other.pictureMiniFile, pictureMiniFile) || other.pictureMiniFile == pictureMiniFile)&&(identical(other.pictureBigFile, pictureBigFile) || other.pictureBigFile == pictureBigFile)&&const DeepCollectionEquality().equals(other.pictureMiniBytes, pictureMiniBytes)&&const DeepCollectionEquality().equals(other.pictureBigBytes, pictureBigBytes)&&(identical(other.pictureMiniFileName, pictureMiniFileName) || other.pictureMiniFileName == pictureMiniFileName)&&(identical(other.pictureBigFileName, pictureBigFileName) || other.pictureBigFileName == pictureBigFileName)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles)&&const DeepCollectionEquality().equals(other._additionalImageBytes, _additionalImageBytes)&&const DeepCollectionEquality().equals(other._additionalImageFileNames, _additionalImageFileNames)&&(identical(other.deletePictureBig, deletePictureBig) || other.deletePictureBig == deletePictureBig)&&const DeepCollectionEquality().equals(other._imagesToDelete, _imagesToDelete)&&(identical(other.isBigNews, isBigNews) || other.isBigNews == isBigNews)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.published, published) || other.published == published));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,subTitle,source,body,content,pictureMini,pictureBig,pictureMiniFile,pictureBigFile,const DeepCollectionEquality().hash(pictureMiniBytes),const DeepCollectionEquality().hash(pictureBigBytes),pictureMiniFileName,pictureBigFileName,const DeepCollectionEquality().hash(_additionalImageFiles),const DeepCollectionEquality().hash(_additionalImageBytes),const DeepCollectionEquality().hash(_additionalImageFileNames),deletePictureBig,const DeepCollectionEquality().hash(_imagesToDelete),isBigNews,categoryId,published]);

@override
String toString() {
  return 'NewsEvent.update(id: $id, title: $title, subTitle: $subTitle, source: $source, body: $body, content: $content, pictureMini: $pictureMini, pictureBig: $pictureBig, pictureMiniFile: $pictureMiniFile, pictureBigFile: $pictureBigFile, pictureMiniBytes: $pictureMiniBytes, pictureBigBytes: $pictureBigBytes, pictureMiniFileName: $pictureMiniFileName, pictureBigFileName: $pictureBigFileName, additionalImageFiles: $additionalImageFiles, additionalImageBytes: $additionalImageBytes, additionalImageFileNames: $additionalImageFileNames, deletePictureBig: $deletePictureBig, imagesToDelete: $imagesToDelete, isBigNews: $isBigNews, categoryId: $categoryId, published: $published)';
}


}

/// @nodoc
abstract mixin class $UpdateNewsEventCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory $UpdateNewsEventCopyWith(UpdateNewsEvent value, $Res Function(UpdateNewsEvent) _then) = _$UpdateNewsEventCopyWithImpl;
@useResult
$Res call({
 int id, String? title, String? subTitle, String? source, String? body, String? content, String? pictureMini, String? pictureBig, File? pictureMiniFile, File? pictureBigFile, Uint8List? pictureMiniBytes, Uint8List? pictureBigBytes, String? pictureMiniFileName, String? pictureBigFileName, List<File>? additionalImageFiles, List<Uint8List>? additionalImageBytes, List<String>? additionalImageFileNames, bool? deletePictureBig, List<String>? imagesToDelete, bool? isBigNews, int? categoryId, bool? published
});




}
/// @nodoc
class _$UpdateNewsEventCopyWithImpl<$Res>
    implements $UpdateNewsEventCopyWith<$Res> {
  _$UpdateNewsEventCopyWithImpl(this._self, this._then);

  final UpdateNewsEvent _self;
  final $Res Function(UpdateNewsEvent) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? subTitle = freezed,Object? source = freezed,Object? body = freezed,Object? content = freezed,Object? pictureMini = freezed,Object? pictureBig = freezed,Object? pictureMiniFile = freezed,Object? pictureBigFile = freezed,Object? pictureMiniBytes = freezed,Object? pictureBigBytes = freezed,Object? pictureMiniFileName = freezed,Object? pictureBigFileName = freezed,Object? additionalImageFiles = freezed,Object? additionalImageBytes = freezed,Object? additionalImageFileNames = freezed,Object? deletePictureBig = freezed,Object? imagesToDelete = freezed,Object? isBigNews = freezed,Object? categoryId = freezed,Object? published = freezed,}) {
  return _then(UpdateNewsEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subTitle: freezed == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,pictureMini: freezed == pictureMini ? _self.pictureMini : pictureMini // ignore: cast_nullable_to_non_nullable
as String?,pictureBig: freezed == pictureBig ? _self.pictureBig : pictureBig // ignore: cast_nullable_to_non_nullable
as String?,pictureMiniFile: freezed == pictureMiniFile ? _self.pictureMiniFile : pictureMiniFile // ignore: cast_nullable_to_non_nullable
as File?,pictureBigFile: freezed == pictureBigFile ? _self.pictureBigFile : pictureBigFile // ignore: cast_nullable_to_non_nullable
as File?,pictureMiniBytes: freezed == pictureMiniBytes ? _self.pictureMiniBytes : pictureMiniBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,pictureBigBytes: freezed == pictureBigBytes ? _self.pictureBigBytes : pictureBigBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,pictureMiniFileName: freezed == pictureMiniFileName ? _self.pictureMiniFileName : pictureMiniFileName // ignore: cast_nullable_to_non_nullable
as String?,pictureBigFileName: freezed == pictureBigFileName ? _self.pictureBigFileName : pictureBigFileName // ignore: cast_nullable_to_non_nullable
as String?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<File>?,additionalImageBytes: freezed == additionalImageBytes ? _self._additionalImageBytes : additionalImageBytes // ignore: cast_nullable_to_non_nullable
as List<Uint8List>?,additionalImageFileNames: freezed == additionalImageFileNames ? _self._additionalImageFileNames : additionalImageFileNames // ignore: cast_nullable_to_non_nullable
as List<String>?,deletePictureBig: freezed == deletePictureBig ? _self.deletePictureBig : deletePictureBig // ignore: cast_nullable_to_non_nullable
as bool?,imagesToDelete: freezed == imagesToDelete ? _self._imagesToDelete : imagesToDelete // ignore: cast_nullable_to_non_nullable
as List<String>?,isBigNews: freezed == isBigNews ? _self.isBigNews : isBigNews // ignore: cast_nullable_to_non_nullable
as bool?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,published: freezed == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class DeleteNewsEvent extends NewsEvent {
  const DeleteNewsEvent({required this.id}): super._();
  

 final  int id;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteNewsEventCopyWith<DeleteNewsEvent> get copyWith => _$DeleteNewsEventCopyWithImpl<DeleteNewsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteNewsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'NewsEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteNewsEventCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory $DeleteNewsEventCopyWith(DeleteNewsEvent value, $Res Function(DeleteNewsEvent) _then) = _$DeleteNewsEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteNewsEventCopyWithImpl<$Res>
    implements $DeleteNewsEventCopyWith<$Res> {
  _$DeleteNewsEventCopyWithImpl(this._self, this._then);

  final DeleteNewsEvent _self;
  final $Res Function(DeleteNewsEvent) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteNewsEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState()';
}


}

/// @nodoc
class $NewsStateCopyWith<$Res>  {
$NewsStateCopyWith(NewsState _, $Res Function(NewsState) __);
}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingNewsState value)?  loading,TResult Function( ErrorNewsState value)?  error,TResult Function( SuccessNewsState value)?  success,TResult Function( CreatingNewsState value)?  creating,TResult Function( CreatedNewsState value)?  created,TResult Function( UpdatingNewsState value)?  updating,TResult Function( UpdatedNewsState value)?  updated,TResult Function( DeletingNewsState value)?  deleting,TResult Function( DeletedNewsState value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading(_that);case ErrorNewsState() when error != null:
return error(_that);case SuccessNewsState() when success != null:
return success(_that);case CreatingNewsState() when creating != null:
return creating(_that);case CreatedNewsState() when created != null:
return created(_that);case UpdatingNewsState() when updating != null:
return updating(_that);case UpdatedNewsState() when updated != null:
return updated(_that);case DeletingNewsState() when deleting != null:
return deleting(_that);case DeletedNewsState() when deleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingNewsState value)  loading,required TResult Function( ErrorNewsState value)  error,required TResult Function( SuccessNewsState value)  success,required TResult Function( CreatingNewsState value)  creating,required TResult Function( CreatedNewsState value)  created,required TResult Function( UpdatingNewsState value)  updating,required TResult Function( UpdatedNewsState value)  updated,required TResult Function( DeletingNewsState value)  deleting,required TResult Function( DeletedNewsState value)  deleted,}){
final _that = this;
switch (_that) {
case LoadingNewsState():
return loading(_that);case ErrorNewsState():
return error(_that);case SuccessNewsState():
return success(_that);case CreatingNewsState():
return creating(_that);case CreatedNewsState():
return created(_that);case UpdatingNewsState():
return updating(_that);case UpdatedNewsState():
return updated(_that);case DeletingNewsState():
return deleting(_that);case DeletedNewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingNewsState value)?  loading,TResult? Function( ErrorNewsState value)?  error,TResult? Function( SuccessNewsState value)?  success,TResult? Function( CreatingNewsState value)?  creating,TResult? Function( CreatedNewsState value)?  created,TResult? Function( UpdatingNewsState value)?  updating,TResult? Function( UpdatedNewsState value)?  updated,TResult? Function( DeletingNewsState value)?  deleting,TResult? Function( DeletedNewsState value)?  deleted,}){
final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading(_that);case ErrorNewsState() when error != null:
return error(_that);case SuccessNewsState() when success != null:
return success(_that);case CreatingNewsState() when creating != null:
return creating(_that);case CreatedNewsState() when created != null:
return created(_that);case UpdatingNewsState() when updating != null:
return updating(_that);case UpdatedNewsState() when updated != null:
return updated(_that);case DeletingNewsState() when deleting != null:
return deleting(_that);case DeletedNewsState() when deleted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<NewsEntity> news)?  success,TResult Function()?  creating,TResult Function( NewsEntity news)?  created,TResult Function()?  updating,TResult Function( NewsEntity news)?  updated,TResult Function()?  deleting,TResult Function()?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading();case ErrorNewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNewsState() when success != null:
return success(_that.news);case CreatingNewsState() when creating != null:
return creating();case CreatedNewsState() when created != null:
return created(_that.news);case UpdatingNewsState() when updating != null:
return updating();case UpdatedNewsState() when updated != null:
return updated(_that.news);case DeletingNewsState() when deleting != null:
return deleting();case DeletedNewsState() when deleted != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<NewsEntity> news)  success,required TResult Function()  creating,required TResult Function( NewsEntity news)  created,required TResult Function()  updating,required TResult Function( NewsEntity news)  updated,required TResult Function()  deleting,required TResult Function()  deleted,}) {final _that = this;
switch (_that) {
case LoadingNewsState():
return loading();case ErrorNewsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNewsState():
return success(_that.news);case CreatingNewsState():
return creating();case CreatedNewsState():
return created(_that.news);case UpdatingNewsState():
return updating();case UpdatedNewsState():
return updated(_that.news);case DeletingNewsState():
return deleting();case DeletedNewsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<NewsEntity> news)?  success,TResult? Function()?  creating,TResult? Function( NewsEntity news)?  created,TResult? Function()?  updating,TResult? Function( NewsEntity news)?  updated,TResult? Function()?  deleting,TResult? Function()?  deleted,}) {final _that = this;
switch (_that) {
case LoadingNewsState() when loading != null:
return loading();case ErrorNewsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessNewsState() when success != null:
return success(_that.news);case CreatingNewsState() when creating != null:
return creating();case CreatedNewsState() when created != null:
return created(_that.news);case UpdatingNewsState() when updating != null:
return updating();case UpdatedNewsState() when updated != null:
return updated(_that.news);case DeletingNewsState() when deleting != null:
return deleting();case DeletedNewsState() when deleted != null:
return deleted();case _:
  return null;

}
}

}

/// @nodoc


class LoadingNewsState extends NewsState {
  const LoadingNewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.loading()';
}


}




/// @nodoc


class ErrorNewsState extends NewsState {
  const ErrorNewsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorNewsStateCopyWith<ErrorNewsState> get copyWith => _$ErrorNewsStateCopyWithImpl<ErrorNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorNewsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'NewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorNewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory $ErrorNewsStateCopyWith(ErrorNewsState value, $Res Function(ErrorNewsState) _then) = _$ErrorNewsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorNewsStateCopyWithImpl<$Res>
    implements $ErrorNewsStateCopyWith<$Res> {
  _$ErrorNewsStateCopyWithImpl(this._self, this._then);

  final ErrorNewsState _self;
  final $Res Function(ErrorNewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorNewsState(
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


class SuccessNewsState extends NewsState {
  const SuccessNewsState({required final  List<NewsEntity> news}): _news = news,super._();
  

 final  List<NewsEntity> _news;
 List<NewsEntity> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}


/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessNewsStateCopyWith<SuccessNewsState> get copyWith => _$SuccessNewsStateCopyWithImpl<SuccessNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessNewsState&&const DeepCollectionEquality().equals(other._news, _news));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news));

@override
String toString() {
  return 'NewsState.success(news: $news)';
}


}

/// @nodoc
abstract mixin class $SuccessNewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory $SuccessNewsStateCopyWith(SuccessNewsState value, $Res Function(SuccessNewsState) _then) = _$SuccessNewsStateCopyWithImpl;
@useResult
$Res call({
 List<NewsEntity> news
});




}
/// @nodoc
class _$SuccessNewsStateCopyWithImpl<$Res>
    implements $SuccessNewsStateCopyWith<$Res> {
  _$SuccessNewsStateCopyWithImpl(this._self, this._then);

  final SuccessNewsState _self;
  final $Res Function(SuccessNewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(SuccessNewsState(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>,
  ));
}


}

/// @nodoc


class CreatingNewsState extends NewsState {
  const CreatingNewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.creating()';
}


}




/// @nodoc


class CreatedNewsState extends NewsState {
  const CreatedNewsState({required this.news}): super._();
  

 final  NewsEntity news;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedNewsStateCopyWith<CreatedNewsState> get copyWith => _$CreatedNewsStateCopyWithImpl<CreatedNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedNewsState&&(identical(other.news, news) || other.news == news));
}


@override
int get hashCode => Object.hash(runtimeType,news);

@override
String toString() {
  return 'NewsState.created(news: $news)';
}


}

/// @nodoc
abstract mixin class $CreatedNewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory $CreatedNewsStateCopyWith(CreatedNewsState value, $Res Function(CreatedNewsState) _then) = _$CreatedNewsStateCopyWithImpl;
@useResult
$Res call({
 NewsEntity news
});




}
/// @nodoc
class _$CreatedNewsStateCopyWithImpl<$Res>
    implements $CreatedNewsStateCopyWith<$Res> {
  _$CreatedNewsStateCopyWithImpl(this._self, this._then);

  final CreatedNewsState _self;
  final $Res Function(CreatedNewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(CreatedNewsState(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,
  ));
}


}

/// @nodoc


class UpdatingNewsState extends NewsState {
  const UpdatingNewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatingNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.updating()';
}


}




/// @nodoc


class UpdatedNewsState extends NewsState {
  const UpdatedNewsState({required this.news}): super._();
  

 final  NewsEntity news;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedNewsStateCopyWith<UpdatedNewsState> get copyWith => _$UpdatedNewsStateCopyWithImpl<UpdatedNewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedNewsState&&(identical(other.news, news) || other.news == news));
}


@override
int get hashCode => Object.hash(runtimeType,news);

@override
String toString() {
  return 'NewsState.updated(news: $news)';
}


}

/// @nodoc
abstract mixin class $UpdatedNewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory $UpdatedNewsStateCopyWith(UpdatedNewsState value, $Res Function(UpdatedNewsState) _then) = _$UpdatedNewsStateCopyWithImpl;
@useResult
$Res call({
 NewsEntity news
});




}
/// @nodoc
class _$UpdatedNewsStateCopyWithImpl<$Res>
    implements $UpdatedNewsStateCopyWith<$Res> {
  _$UpdatedNewsStateCopyWithImpl(this._self, this._then);

  final UpdatedNewsState _self;
  final $Res Function(UpdatedNewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(UpdatedNewsState(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,
  ));
}


}

/// @nodoc


class DeletingNewsState extends NewsState {
  const DeletingNewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletingNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.deleting()';
}


}




/// @nodoc


class DeletedNewsState extends NewsState {
  const DeletedNewsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.deleted()';
}


}




// dart format on
