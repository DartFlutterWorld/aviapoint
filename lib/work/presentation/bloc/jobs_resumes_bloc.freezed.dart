// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_resumes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobsResumesEvent {

 int? get userId; String? get search; String? get address; String? get license; String? get aircraftType; bool get onlyFavorites;
/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobsResumesEventCopyWith<JobsResumesEvent> get copyWith => _$JobsResumesEventCopyWithImpl<JobsResumesEvent>(this as JobsResumesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobsResumesEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.search, search) || other.search == search)&&(identical(other.address, address) || other.address == address)&&(identical(other.license, license) || other.license == license)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.onlyFavorites, onlyFavorites) || other.onlyFavorites == onlyFavorites));
}


@override
int get hashCode => Object.hash(runtimeType,userId,search,address,license,aircraftType,onlyFavorites);

@override
String toString() {
  return 'JobsResumesEvent(userId: $userId, search: $search, address: $address, license: $license, aircraftType: $aircraftType, onlyFavorites: $onlyFavorites)';
}


}

/// @nodoc
abstract mixin class $JobsResumesEventCopyWith<$Res>  {
  factory $JobsResumesEventCopyWith(JobsResumesEvent value, $Res Function(JobsResumesEvent) _then) = _$JobsResumesEventCopyWithImpl;
@useResult
$Res call({
 int? userId, String? search, String? address, String? license, String? aircraftType, bool onlyFavorites
});




}
/// @nodoc
class _$JobsResumesEventCopyWithImpl<$Res>
    implements $JobsResumesEventCopyWith<$Res> {
  _$JobsResumesEventCopyWithImpl(this._self, this._then);

  final JobsResumesEvent _self;
  final $Res Function(JobsResumesEvent) _then;

/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? search = freezed,Object? address = freezed,Object? license = freezed,Object? aircraftType = freezed,Object? onlyFavorites = null,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,onlyFavorites: null == onlyFavorites ? _self.onlyFavorites : onlyFavorites // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [JobsResumesEvent].
extension JobsResumesEventPatterns on JobsResumesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _LoadMore value)?  loadMore,TResult Function( _Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _LoadMore value)  loadMore,required TResult Function( _Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _LoadMore():
return loadMore(_that);case _Refresh():
return refresh(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _LoadMore value)?  loadMore,TResult? Function( _Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites,  int? limit)?  get,TResult Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites)?  loadMore,TResult Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites)?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites,_that.limit);case _LoadMore() when loadMore != null:
return loadMore(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites);case _Refresh() when refresh != null:
return refresh(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites,  int? limit)  get,required TResult Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites)  loadMore,required TResult Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites)  refresh,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites,_that.limit);case _LoadMore():
return loadMore(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites);case _Refresh():
return refresh(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites,  int? limit)?  get,TResult? Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites)?  loadMore,TResult? Function( int? userId,  String? search,  String? address,  String? license,  String? aircraftType,  bool onlyFavorites)?  refresh,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites,_that.limit);case _LoadMore() when loadMore != null:
return loadMore(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites);case _Refresh() when refresh != null:
return refresh(_that.userId,_that.search,_that.address,_that.license,_that.aircraftType,_that.onlyFavorites);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements JobsResumesEvent {
  const _Get({this.userId, this.search, this.address, this.license, this.aircraftType, this.onlyFavorites = false, this.limit});
  

@override final  int? userId;
@override final  String? search;
@override final  String? address;
@override final  String? license;
@override final  String? aircraftType;
@override@JsonKey() final  bool onlyFavorites;
 final  int? limit;

/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.search, search) || other.search == search)&&(identical(other.address, address) || other.address == address)&&(identical(other.license, license) || other.license == license)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.onlyFavorites, onlyFavorites) || other.onlyFavorites == onlyFavorites)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,userId,search,address,license,aircraftType,onlyFavorites,limit);

@override
String toString() {
  return 'JobsResumesEvent.get(userId: $userId, search: $search, address: $address, license: $license, aircraftType: $aircraftType, onlyFavorites: $onlyFavorites, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $JobsResumesEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@override @useResult
$Res call({
 int? userId, String? search, String? address, String? license, String? aircraftType, bool onlyFavorites, int? limit
});




}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? search = freezed,Object? address = freezed,Object? license = freezed,Object? aircraftType = freezed,Object? onlyFavorites = null,Object? limit = freezed,}) {
  return _then(_Get(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,onlyFavorites: null == onlyFavorites ? _self.onlyFavorites : onlyFavorites // ignore: cast_nullable_to_non_nullable
as bool,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _LoadMore implements JobsResumesEvent {
  const _LoadMore({this.userId, this.search, this.address, this.license, this.aircraftType, this.onlyFavorites = false});
  

@override final  int? userId;
@override final  String? search;
@override final  String? address;
@override final  String? license;
@override final  String? aircraftType;
@override@JsonKey() final  bool onlyFavorites;

/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadMoreCopyWith<_LoadMore> get copyWith => __$LoadMoreCopyWithImpl<_LoadMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMore&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.search, search) || other.search == search)&&(identical(other.address, address) || other.address == address)&&(identical(other.license, license) || other.license == license)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.onlyFavorites, onlyFavorites) || other.onlyFavorites == onlyFavorites));
}


@override
int get hashCode => Object.hash(runtimeType,userId,search,address,license,aircraftType,onlyFavorites);

@override
String toString() {
  return 'JobsResumesEvent.loadMore(userId: $userId, search: $search, address: $address, license: $license, aircraftType: $aircraftType, onlyFavorites: $onlyFavorites)';
}


}

/// @nodoc
abstract mixin class _$LoadMoreCopyWith<$Res> implements $JobsResumesEventCopyWith<$Res> {
  factory _$LoadMoreCopyWith(_LoadMore value, $Res Function(_LoadMore) _then) = __$LoadMoreCopyWithImpl;
@override @useResult
$Res call({
 int? userId, String? search, String? address, String? license, String? aircraftType, bool onlyFavorites
});




}
/// @nodoc
class __$LoadMoreCopyWithImpl<$Res>
    implements _$LoadMoreCopyWith<$Res> {
  __$LoadMoreCopyWithImpl(this._self, this._then);

  final _LoadMore _self;
  final $Res Function(_LoadMore) _then;

/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? search = freezed,Object? address = freezed,Object? license = freezed,Object? aircraftType = freezed,Object? onlyFavorites = null,}) {
  return _then(_LoadMore(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,onlyFavorites: null == onlyFavorites ? _self.onlyFavorites : onlyFavorites // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Refresh implements JobsResumesEvent {
  const _Refresh({this.userId, this.search, this.address, this.license, this.aircraftType, this.onlyFavorites = false});
  

@override final  int? userId;
@override final  String? search;
@override final  String? address;
@override final  String? license;
@override final  String? aircraftType;
@override@JsonKey() final  bool onlyFavorites;

/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshCopyWith<_Refresh> get copyWith => __$RefreshCopyWithImpl<_Refresh>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.search, search) || other.search == search)&&(identical(other.address, address) || other.address == address)&&(identical(other.license, license) || other.license == license)&&(identical(other.aircraftType, aircraftType) || other.aircraftType == aircraftType)&&(identical(other.onlyFavorites, onlyFavorites) || other.onlyFavorites == onlyFavorites));
}


@override
int get hashCode => Object.hash(runtimeType,userId,search,address,license,aircraftType,onlyFavorites);

@override
String toString() {
  return 'JobsResumesEvent.refresh(userId: $userId, search: $search, address: $address, license: $license, aircraftType: $aircraftType, onlyFavorites: $onlyFavorites)';
}


}

/// @nodoc
abstract mixin class _$RefreshCopyWith<$Res> implements $JobsResumesEventCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) _then) = __$RefreshCopyWithImpl;
@override @useResult
$Res call({
 int? userId, String? search, String? address, String? license, String? aircraftType, bool onlyFavorites
});




}
/// @nodoc
class __$RefreshCopyWithImpl<$Res>
    implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(this._self, this._then);

  final _Refresh _self;
  final $Res Function(_Refresh) _then;

/// Create a copy of JobsResumesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? search = freezed,Object? address = freezed,Object? license = freezed,Object? aircraftType = freezed,Object? onlyFavorites = null,}) {
  return _then(_Refresh(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,aircraftType: freezed == aircraftType ? _self.aircraftType : aircraftType // ignore: cast_nullable_to_non_nullable
as String?,onlyFavorites: null == onlyFavorites ? _self.onlyFavorites : onlyFavorites // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$JobsResumesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobsResumesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobsResumesState()';
}


}

/// @nodoc
class $JobsResumesStateCopyWith<$Res>  {
$JobsResumesStateCopyWith(JobsResumesState _, $Res Function(JobsResumesState) __);
}


/// Adds pattern-matching-related methods to [JobsResumesState].
extension JobsResumesStatePatterns on JobsResumesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingJobsResumesState value)?  loading,TResult Function( LoadingMoreJobsResumesState value)?  loadingMore,TResult Function( SuccessJobsResumesState value)?  success,TResult Function( ErrorJobsResumesState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingJobsResumesState() when loading != null:
return loading(_that);case LoadingMoreJobsResumesState() when loadingMore != null:
return loadingMore(_that);case SuccessJobsResumesState() when success != null:
return success(_that);case ErrorJobsResumesState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingJobsResumesState value)  loading,required TResult Function( LoadingMoreJobsResumesState value)  loadingMore,required TResult Function( SuccessJobsResumesState value)  success,required TResult Function( ErrorJobsResumesState value)  error,}){
final _that = this;
switch (_that) {
case LoadingJobsResumesState():
return loading(_that);case LoadingMoreJobsResumesState():
return loadingMore(_that);case SuccessJobsResumesState():
return success(_that);case ErrorJobsResumesState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingJobsResumesState value)?  loading,TResult? Function( LoadingMoreJobsResumesState value)?  loadingMore,TResult? Function( SuccessJobsResumesState value)?  success,TResult? Function( ErrorJobsResumesState value)?  error,}){
final _that = this;
switch (_that) {
case LoadingJobsResumesState() when loading != null:
return loading(_that);case LoadingMoreJobsResumesState() when loadingMore != null:
return loadingMore(_that);case SuccessJobsResumesState() when success != null:
return success(_that);case ErrorJobsResumesState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<JobResumeEntity> resumes)?  loadingMore,TResult Function( List<JobResumeEntity> resumes,  bool hasMore)?  success,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingJobsResumesState() when loading != null:
return loading();case LoadingMoreJobsResumesState() when loadingMore != null:
return loadingMore(_that.resumes);case SuccessJobsResumesState() when success != null:
return success(_that.resumes,_that.hasMore);case ErrorJobsResumesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<JobResumeEntity> resumes)  loadingMore,required TResult Function( List<JobResumeEntity> resumes,  bool hasMore)  success,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,}) {final _that = this;
switch (_that) {
case LoadingJobsResumesState():
return loading();case LoadingMoreJobsResumesState():
return loadingMore(_that.resumes);case SuccessJobsResumesState():
return success(_that.resumes,_that.hasMore);case ErrorJobsResumesState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<JobResumeEntity> resumes)?  loadingMore,TResult? Function( List<JobResumeEntity> resumes,  bool hasMore)?  success,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,}) {final _that = this;
switch (_that) {
case LoadingJobsResumesState() when loading != null:
return loading();case LoadingMoreJobsResumesState() when loadingMore != null:
return loadingMore(_that.resumes);case SuccessJobsResumesState() when success != null:
return success(_that.resumes,_that.hasMore);case ErrorJobsResumesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc


class LoadingJobsResumesState implements JobsResumesState {
  const LoadingJobsResumesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingJobsResumesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobsResumesState.loading()';
}


}




/// @nodoc


class LoadingMoreJobsResumesState implements JobsResumesState {
  const LoadingMoreJobsResumesState({required final  List<JobResumeEntity> resumes}): _resumes = resumes;
  

 final  List<JobResumeEntity> _resumes;
 List<JobResumeEntity> get resumes {
  if (_resumes is EqualUnmodifiableListView) return _resumes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resumes);
}


/// Create a copy of JobsResumesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingMoreJobsResumesStateCopyWith<LoadingMoreJobsResumesState> get copyWith => _$LoadingMoreJobsResumesStateCopyWithImpl<LoadingMoreJobsResumesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMoreJobsResumesState&&const DeepCollectionEquality().equals(other._resumes, _resumes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_resumes));

@override
String toString() {
  return 'JobsResumesState.loadingMore(resumes: $resumes)';
}


}

/// @nodoc
abstract mixin class $LoadingMoreJobsResumesStateCopyWith<$Res> implements $JobsResumesStateCopyWith<$Res> {
  factory $LoadingMoreJobsResumesStateCopyWith(LoadingMoreJobsResumesState value, $Res Function(LoadingMoreJobsResumesState) _then) = _$LoadingMoreJobsResumesStateCopyWithImpl;
@useResult
$Res call({
 List<JobResumeEntity> resumes
});




}
/// @nodoc
class _$LoadingMoreJobsResumesStateCopyWithImpl<$Res>
    implements $LoadingMoreJobsResumesStateCopyWith<$Res> {
  _$LoadingMoreJobsResumesStateCopyWithImpl(this._self, this._then);

  final LoadingMoreJobsResumesState _self;
  final $Res Function(LoadingMoreJobsResumesState) _then;

/// Create a copy of JobsResumesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resumes = null,}) {
  return _then(LoadingMoreJobsResumesState(
resumes: null == resumes ? _self._resumes : resumes // ignore: cast_nullable_to_non_nullable
as List<JobResumeEntity>,
  ));
}


}

/// @nodoc


class SuccessJobsResumesState implements JobsResumesState {
  const SuccessJobsResumesState({required final  List<JobResumeEntity> resumes, this.hasMore = true}): _resumes = resumes;
  

 final  List<JobResumeEntity> _resumes;
 List<JobResumeEntity> get resumes {
  if (_resumes is EqualUnmodifiableListView) return _resumes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resumes);
}

@JsonKey() final  bool hasMore;

/// Create a copy of JobsResumesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessJobsResumesStateCopyWith<SuccessJobsResumesState> get copyWith => _$SuccessJobsResumesStateCopyWithImpl<SuccessJobsResumesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessJobsResumesState&&const DeepCollectionEquality().equals(other._resumes, _resumes)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_resumes),hasMore);

@override
String toString() {
  return 'JobsResumesState.success(resumes: $resumes, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SuccessJobsResumesStateCopyWith<$Res> implements $JobsResumesStateCopyWith<$Res> {
  factory $SuccessJobsResumesStateCopyWith(SuccessJobsResumesState value, $Res Function(SuccessJobsResumesState) _then) = _$SuccessJobsResumesStateCopyWithImpl;
@useResult
$Res call({
 List<JobResumeEntity> resumes, bool hasMore
});




}
/// @nodoc
class _$SuccessJobsResumesStateCopyWithImpl<$Res>
    implements $SuccessJobsResumesStateCopyWith<$Res> {
  _$SuccessJobsResumesStateCopyWithImpl(this._self, this._then);

  final SuccessJobsResumesState _self;
  final $Res Function(SuccessJobsResumesState) _then;

/// Create a copy of JobsResumesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resumes = null,Object? hasMore = null,}) {
  return _then(SuccessJobsResumesState(
resumes: null == resumes ? _self._resumes : resumes // ignore: cast_nullable_to_non_nullable
as List<JobResumeEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ErrorJobsResumesState implements JobsResumesState {
  const ErrorJobsResumesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobsResumesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorJobsResumesStateCopyWith<ErrorJobsResumesState> get copyWith => _$ErrorJobsResumesStateCopyWithImpl<ErrorJobsResumesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorJobsResumesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'JobsResumesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorJobsResumesStateCopyWith<$Res> implements $JobsResumesStateCopyWith<$Res> {
  factory $ErrorJobsResumesStateCopyWith(ErrorJobsResumesState value, $Res Function(ErrorJobsResumesState) _then) = _$ErrorJobsResumesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorJobsResumesStateCopyWithImpl<$Res>
    implements $ErrorJobsResumesStateCopyWith<$Res> {
  _$ErrorJobsResumesStateCopyWithImpl(this._self, this._then);

  final ErrorJobsResumesState _self;
  final $Res Function(ErrorJobsResumesState) _then;

/// Create a copy of JobsResumesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorJobsResumesState(
errorFromApi: freezed == errorFromApi ? _self.errorFromApi : errorFromApi // ignore: cast_nullable_to_non_nullable
as String?,errorForUser: null == errorForUser ? _self.errorForUser : errorForUser // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
