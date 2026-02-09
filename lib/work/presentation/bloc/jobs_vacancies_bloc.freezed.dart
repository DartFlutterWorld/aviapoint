// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_vacancies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobsVacanciesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobsVacanciesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobsVacanciesEvent()';
}


}

/// @nodoc
class $JobsVacanciesEventCopyWith<$Res>  {
$JobsVacanciesEventCopyWith(JobsVacanciesEvent _, $Res Function(JobsVacanciesEvent) __);
}


/// Adds pattern-matching-related methods to [JobsVacanciesEvent].
extension JobsVacanciesEventPatterns on JobsVacanciesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _LoadMore value)?  loadMore,TResult Function( _Refresh value)?  refresh,TResult Function( _UpdateFavoriteState value)?  updateFavoriteState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _LoadMore value)  loadMore,required TResult Function( _Refresh value)  refresh,required TResult Function( _UpdateFavoriteState value)  updateFavoriteState,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _LoadMore():
return loadMore(_that);case _Refresh():
return refresh(_that);case _UpdateFavoriteState():
return updateFavoriteState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _LoadMore value)?  loadMore,TResult? Function( _Refresh value)?  refresh,TResult? Function( _UpdateFavoriteState value)?  updateFavoriteState,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive,  int? limit)?  get,TResult Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive)?  loadMore,TResult Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive,  bool resetToMainList)?  refresh,TResult Function( int vacancyId,  bool isFavorite)?  updateFavoriteState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive,_that.limit);case _LoadMore() when loadMore != null:
return loadMore(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive);case _Refresh() when refresh != null:
return refresh(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive,_that.resetToMainList);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that.vacancyId,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive,  int? limit)  get,required TResult Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive)  loadMore,required TResult Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive,  bool resetToMainList)  refresh,required TResult Function( int vacancyId,  bool isFavorite)  updateFavoriteState,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive,_that.limit);case _LoadMore():
return loadMore(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive);case _Refresh():
return refresh(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive,_that.resetToMainList);case _UpdateFavoriteState():
return updateFavoriteState(_that.vacancyId,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive,  int? limit)?  get,TResult? Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive)?  loadMore,TResult? Function( int? employerId,  String? search,  String? city,  String? experienceLevel,  String? employmentType,  String? schedule,  int? salaryFrom,  int? salaryTo,  bool includeInactive,  bool resetToMainList)?  refresh,TResult? Function( int vacancyId,  bool isFavorite)?  updateFavoriteState,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive,_that.limit);case _LoadMore() when loadMore != null:
return loadMore(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive);case _Refresh() when refresh != null:
return refresh(_that.employerId,_that.search,_that.city,_that.experienceLevel,_that.employmentType,_that.schedule,_that.salaryFrom,_that.salaryTo,_that.includeInactive,_that.resetToMainList);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that.vacancyId,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements JobsVacanciesEvent {
  const _Get({this.employerId, this.search, this.city, this.experienceLevel, this.employmentType, this.schedule, this.salaryFrom, this.salaryTo, this.includeInactive = false, this.limit});
  

 final  int? employerId;
 final  String? search;
 final  String? city;
 final  String? experienceLevel;
 final  String? employmentType;
 final  String? schedule;
 final  int? salaryFrom;
 final  int? salaryTo;
@JsonKey() final  bool includeInactive;
 final  int? limit;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.employerId, employerId) || other.employerId == employerId)&&(identical(other.search, search) || other.search == search)&&(identical(other.city, city) || other.city == city)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.includeInactive, includeInactive) || other.includeInactive == includeInactive)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,employerId,search,city,experienceLevel,employmentType,schedule,salaryFrom,salaryTo,includeInactive,limit);

@override
String toString() {
  return 'JobsVacanciesEvent.get(employerId: $employerId, search: $search, city: $city, experienceLevel: $experienceLevel, employmentType: $employmentType, schedule: $schedule, salaryFrom: $salaryFrom, salaryTo: $salaryTo, includeInactive: $includeInactive, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $JobsVacanciesEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 int? employerId, String? search, String? city, String? experienceLevel, String? employmentType, String? schedule, int? salaryFrom, int? salaryTo, bool includeInactive, int? limit
});




}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employerId = freezed,Object? search = freezed,Object? city = freezed,Object? experienceLevel = freezed,Object? employmentType = freezed,Object? schedule = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? includeInactive = null,Object? limit = freezed,}) {
  return _then(_Get(
employerId: freezed == employerId ? _self.employerId : employerId // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,experienceLevel: freezed == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,includeInactive: null == includeInactive ? _self.includeInactive : includeInactive // ignore: cast_nullable_to_non_nullable
as bool,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _LoadMore implements JobsVacanciesEvent {
  const _LoadMore({this.employerId, this.search, this.city, this.experienceLevel, this.employmentType, this.schedule, this.salaryFrom, this.salaryTo, this.includeInactive = false});
  

 final  int? employerId;
 final  String? search;
 final  String? city;
 final  String? experienceLevel;
 final  String? employmentType;
 final  String? schedule;
 final  int? salaryFrom;
 final  int? salaryTo;
@JsonKey() final  bool includeInactive;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadMoreCopyWith<_LoadMore> get copyWith => __$LoadMoreCopyWithImpl<_LoadMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMore&&(identical(other.employerId, employerId) || other.employerId == employerId)&&(identical(other.search, search) || other.search == search)&&(identical(other.city, city) || other.city == city)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.includeInactive, includeInactive) || other.includeInactive == includeInactive));
}


@override
int get hashCode => Object.hash(runtimeType,employerId,search,city,experienceLevel,employmentType,schedule,salaryFrom,salaryTo,includeInactive);

@override
String toString() {
  return 'JobsVacanciesEvent.loadMore(employerId: $employerId, search: $search, city: $city, experienceLevel: $experienceLevel, employmentType: $employmentType, schedule: $schedule, salaryFrom: $salaryFrom, salaryTo: $salaryTo, includeInactive: $includeInactive)';
}


}

/// @nodoc
abstract mixin class _$LoadMoreCopyWith<$Res> implements $JobsVacanciesEventCopyWith<$Res> {
  factory _$LoadMoreCopyWith(_LoadMore value, $Res Function(_LoadMore) _then) = __$LoadMoreCopyWithImpl;
@useResult
$Res call({
 int? employerId, String? search, String? city, String? experienceLevel, String? employmentType, String? schedule, int? salaryFrom, int? salaryTo, bool includeInactive
});




}
/// @nodoc
class __$LoadMoreCopyWithImpl<$Res>
    implements _$LoadMoreCopyWith<$Res> {
  __$LoadMoreCopyWithImpl(this._self, this._then);

  final _LoadMore _self;
  final $Res Function(_LoadMore) _then;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employerId = freezed,Object? search = freezed,Object? city = freezed,Object? experienceLevel = freezed,Object? employmentType = freezed,Object? schedule = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? includeInactive = null,}) {
  return _then(_LoadMore(
employerId: freezed == employerId ? _self.employerId : employerId // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,experienceLevel: freezed == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,includeInactive: null == includeInactive ? _self.includeInactive : includeInactive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Refresh implements JobsVacanciesEvent {
  const _Refresh({this.employerId, this.search, this.city, this.experienceLevel, this.employmentType, this.schedule, this.salaryFrom, this.salaryTo, this.includeInactive = false, this.resetToMainList = false});
  

 final  int? employerId;
 final  String? search;
 final  String? city;
 final  String? experienceLevel;
 final  String? employmentType;
 final  String? schedule;
 final  int? salaryFrom;
 final  int? salaryTo;
@JsonKey() final  bool includeInactive;
@JsonKey() final  bool resetToMainList;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshCopyWith<_Refresh> get copyWith => __$RefreshCopyWithImpl<_Refresh>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh&&(identical(other.employerId, employerId) || other.employerId == employerId)&&(identical(other.search, search) || other.search == search)&&(identical(other.city, city) || other.city == city)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.includeInactive, includeInactive) || other.includeInactive == includeInactive)&&(identical(other.resetToMainList, resetToMainList) || other.resetToMainList == resetToMainList));
}


@override
int get hashCode => Object.hash(runtimeType,employerId,search,city,experienceLevel,employmentType,schedule,salaryFrom,salaryTo,includeInactive,resetToMainList);

@override
String toString() {
  return 'JobsVacanciesEvent.refresh(employerId: $employerId, search: $search, city: $city, experienceLevel: $experienceLevel, employmentType: $employmentType, schedule: $schedule, salaryFrom: $salaryFrom, salaryTo: $salaryTo, includeInactive: $includeInactive, resetToMainList: $resetToMainList)';
}


}

/// @nodoc
abstract mixin class _$RefreshCopyWith<$Res> implements $JobsVacanciesEventCopyWith<$Res> {
  factory _$RefreshCopyWith(_Refresh value, $Res Function(_Refresh) _then) = __$RefreshCopyWithImpl;
@useResult
$Res call({
 int? employerId, String? search, String? city, String? experienceLevel, String? employmentType, String? schedule, int? salaryFrom, int? salaryTo, bool includeInactive, bool resetToMainList
});




}
/// @nodoc
class __$RefreshCopyWithImpl<$Res>
    implements _$RefreshCopyWith<$Res> {
  __$RefreshCopyWithImpl(this._self, this._then);

  final _Refresh _self;
  final $Res Function(_Refresh) _then;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employerId = freezed,Object? search = freezed,Object? city = freezed,Object? experienceLevel = freezed,Object? employmentType = freezed,Object? schedule = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? includeInactive = null,Object? resetToMainList = null,}) {
  return _then(_Refresh(
employerId: freezed == employerId ? _self.employerId : employerId // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,experienceLevel: freezed == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,includeInactive: null == includeInactive ? _self.includeInactive : includeInactive // ignore: cast_nullable_to_non_nullable
as bool,resetToMainList: null == resetToMainList ? _self.resetToMainList : resetToMainList // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _UpdateFavoriteState implements JobsVacanciesEvent {
  const _UpdateFavoriteState({required this.vacancyId, required this.isFavorite});
  

 final  int vacancyId;
 final  bool isFavorite;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFavoriteStateCopyWith<_UpdateFavoriteState> get copyWith => __$UpdateFavoriteStateCopyWithImpl<_UpdateFavoriteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFavoriteState&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,vacancyId,isFavorite);

@override
String toString() {
  return 'JobsVacanciesEvent.updateFavoriteState(vacancyId: $vacancyId, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$UpdateFavoriteStateCopyWith<$Res> implements $JobsVacanciesEventCopyWith<$Res> {
  factory _$UpdateFavoriteStateCopyWith(_UpdateFavoriteState value, $Res Function(_UpdateFavoriteState) _then) = __$UpdateFavoriteStateCopyWithImpl;
@useResult
$Res call({
 int vacancyId, bool isFavorite
});




}
/// @nodoc
class __$UpdateFavoriteStateCopyWithImpl<$Res>
    implements _$UpdateFavoriteStateCopyWith<$Res> {
  __$UpdateFavoriteStateCopyWithImpl(this._self, this._then);

  final _UpdateFavoriteState _self;
  final $Res Function(_UpdateFavoriteState) _then;

/// Create a copy of JobsVacanciesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancyId = null,Object? isFavorite = null,}) {
  return _then(_UpdateFavoriteState(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as int,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$JobsVacanciesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobsVacanciesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobsVacanciesState()';
}


}

/// @nodoc
class $JobsVacanciesStateCopyWith<$Res>  {
$JobsVacanciesStateCopyWith(JobsVacanciesState _, $Res Function(JobsVacanciesState) __);
}


/// Adds pattern-matching-related methods to [JobsVacanciesState].
extension JobsVacanciesStatePatterns on JobsVacanciesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingJobsVacanciesState value)?  loading,TResult Function( LoadingMoreJobsVacanciesState value)?  loadingMore,TResult Function( SuccessJobsVacanciesState value)?  success,TResult Function( ErrorJobsVacanciesState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingJobsVacanciesState() when loading != null:
return loading(_that);case LoadingMoreJobsVacanciesState() when loadingMore != null:
return loadingMore(_that);case SuccessJobsVacanciesState() when success != null:
return success(_that);case ErrorJobsVacanciesState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingJobsVacanciesState value)  loading,required TResult Function( LoadingMoreJobsVacanciesState value)  loadingMore,required TResult Function( SuccessJobsVacanciesState value)  success,required TResult Function( ErrorJobsVacanciesState value)  error,}){
final _that = this;
switch (_that) {
case LoadingJobsVacanciesState():
return loading(_that);case LoadingMoreJobsVacanciesState():
return loadingMore(_that);case SuccessJobsVacanciesState():
return success(_that);case ErrorJobsVacanciesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingJobsVacanciesState value)?  loading,TResult? Function( LoadingMoreJobsVacanciesState value)?  loadingMore,TResult? Function( SuccessJobsVacanciesState value)?  success,TResult? Function( ErrorJobsVacanciesState value)?  error,}){
final _that = this;
switch (_that) {
case LoadingJobsVacanciesState() when loading != null:
return loading(_that);case LoadingMoreJobsVacanciesState() when loadingMore != null:
return loadingMore(_that);case SuccessJobsVacanciesState() when success != null:
return success(_that);case ErrorJobsVacanciesState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<JobVacancyEntity> vacancies)?  loadingMore,TResult Function( List<JobVacancyEntity> vacancies,  bool hasMore)?  success,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingJobsVacanciesState() when loading != null:
return loading();case LoadingMoreJobsVacanciesState() when loadingMore != null:
return loadingMore(_that.vacancies);case SuccessJobsVacanciesState() when success != null:
return success(_that.vacancies,_that.hasMore);case ErrorJobsVacanciesState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<JobVacancyEntity> vacancies)  loadingMore,required TResult Function( List<JobVacancyEntity> vacancies,  bool hasMore)  success,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,}) {final _that = this;
switch (_that) {
case LoadingJobsVacanciesState():
return loading();case LoadingMoreJobsVacanciesState():
return loadingMore(_that.vacancies);case SuccessJobsVacanciesState():
return success(_that.vacancies,_that.hasMore);case ErrorJobsVacanciesState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<JobVacancyEntity> vacancies)?  loadingMore,TResult? Function( List<JobVacancyEntity> vacancies,  bool hasMore)?  success,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,}) {final _that = this;
switch (_that) {
case LoadingJobsVacanciesState() when loading != null:
return loading();case LoadingMoreJobsVacanciesState() when loadingMore != null:
return loadingMore(_that.vacancies);case SuccessJobsVacanciesState() when success != null:
return success(_that.vacancies,_that.hasMore);case ErrorJobsVacanciesState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc


class LoadingJobsVacanciesState implements JobsVacanciesState {
  const LoadingJobsVacanciesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingJobsVacanciesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobsVacanciesState.loading()';
}


}




/// @nodoc


class LoadingMoreJobsVacanciesState implements JobsVacanciesState {
  const LoadingMoreJobsVacanciesState({required final  List<JobVacancyEntity> vacancies}): _vacancies = vacancies;
  

 final  List<JobVacancyEntity> _vacancies;
 List<JobVacancyEntity> get vacancies {
  if (_vacancies is EqualUnmodifiableListView) return _vacancies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vacancies);
}


/// Create a copy of JobsVacanciesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingMoreJobsVacanciesStateCopyWith<LoadingMoreJobsVacanciesState> get copyWith => _$LoadingMoreJobsVacanciesStateCopyWithImpl<LoadingMoreJobsVacanciesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMoreJobsVacanciesState&&const DeepCollectionEquality().equals(other._vacancies, _vacancies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_vacancies));

@override
String toString() {
  return 'JobsVacanciesState.loadingMore(vacancies: $vacancies)';
}


}

/// @nodoc
abstract mixin class $LoadingMoreJobsVacanciesStateCopyWith<$Res> implements $JobsVacanciesStateCopyWith<$Res> {
  factory $LoadingMoreJobsVacanciesStateCopyWith(LoadingMoreJobsVacanciesState value, $Res Function(LoadingMoreJobsVacanciesState) _then) = _$LoadingMoreJobsVacanciesStateCopyWithImpl;
@useResult
$Res call({
 List<JobVacancyEntity> vacancies
});




}
/// @nodoc
class _$LoadingMoreJobsVacanciesStateCopyWithImpl<$Res>
    implements $LoadingMoreJobsVacanciesStateCopyWith<$Res> {
  _$LoadingMoreJobsVacanciesStateCopyWithImpl(this._self, this._then);

  final LoadingMoreJobsVacanciesState _self;
  final $Res Function(LoadingMoreJobsVacanciesState) _then;

/// Create a copy of JobsVacanciesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancies = null,}) {
  return _then(LoadingMoreJobsVacanciesState(
vacancies: null == vacancies ? _self._vacancies : vacancies // ignore: cast_nullable_to_non_nullable
as List<JobVacancyEntity>,
  ));
}


}

/// @nodoc


class SuccessJobsVacanciesState implements JobsVacanciesState {
  const SuccessJobsVacanciesState({required final  List<JobVacancyEntity> vacancies, this.hasMore = true}): _vacancies = vacancies;
  

 final  List<JobVacancyEntity> _vacancies;
 List<JobVacancyEntity> get vacancies {
  if (_vacancies is EqualUnmodifiableListView) return _vacancies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vacancies);
}

@JsonKey() final  bool hasMore;

/// Create a copy of JobsVacanciesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessJobsVacanciesStateCopyWith<SuccessJobsVacanciesState> get copyWith => _$SuccessJobsVacanciesStateCopyWithImpl<SuccessJobsVacanciesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessJobsVacanciesState&&const DeepCollectionEquality().equals(other._vacancies, _vacancies)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_vacancies),hasMore);

@override
String toString() {
  return 'JobsVacanciesState.success(vacancies: $vacancies, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SuccessJobsVacanciesStateCopyWith<$Res> implements $JobsVacanciesStateCopyWith<$Res> {
  factory $SuccessJobsVacanciesStateCopyWith(SuccessJobsVacanciesState value, $Res Function(SuccessJobsVacanciesState) _then) = _$SuccessJobsVacanciesStateCopyWithImpl;
@useResult
$Res call({
 List<JobVacancyEntity> vacancies, bool hasMore
});




}
/// @nodoc
class _$SuccessJobsVacanciesStateCopyWithImpl<$Res>
    implements $SuccessJobsVacanciesStateCopyWith<$Res> {
  _$SuccessJobsVacanciesStateCopyWithImpl(this._self, this._then);

  final SuccessJobsVacanciesState _self;
  final $Res Function(SuccessJobsVacanciesState) _then;

/// Create a copy of JobsVacanciesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancies = null,Object? hasMore = null,}) {
  return _then(SuccessJobsVacanciesState(
vacancies: null == vacancies ? _self._vacancies : vacancies // ignore: cast_nullable_to_non_nullable
as List<JobVacancyEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ErrorJobsVacanciesState implements JobsVacanciesState {
  const ErrorJobsVacanciesState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobsVacanciesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorJobsVacanciesStateCopyWith<ErrorJobsVacanciesState> get copyWith => _$ErrorJobsVacanciesStateCopyWithImpl<ErrorJobsVacanciesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorJobsVacanciesState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'JobsVacanciesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorJobsVacanciesStateCopyWith<$Res> implements $JobsVacanciesStateCopyWith<$Res> {
  factory $ErrorJobsVacanciesStateCopyWith(ErrorJobsVacanciesState value, $Res Function(ErrorJobsVacanciesState) _then) = _$ErrorJobsVacanciesStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorJobsVacanciesStateCopyWithImpl<$Res>
    implements $ErrorJobsVacanciesStateCopyWith<$Res> {
  _$ErrorJobsVacanciesStateCopyWithImpl(this._self, this._then);

  final ErrorJobsVacanciesState _self;
  final $Res Function(ErrorJobsVacanciesState) _then;

/// Create a copy of JobsVacanciesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorJobsVacanciesState(
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
