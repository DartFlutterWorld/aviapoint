// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_resume_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobResumeEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobResumeEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeEditEvent()';
}


}

/// @nodoc
class $JobResumeEditEventCopyWith<$Res>  {
$JobResumeEditEventCopyWith(JobResumeEditEvent _, $Res Function(JobResumeEditEvent) __);
}


/// Adds pattern-matching-related methods to [JobResumeEditEvent].
extension JobResumeEditEventPatterns on JobResumeEditEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Create value)?  create,TResult Function( _Update value)?  update,TResult Function( _Delete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Create value)  create,required TResult Function( _Update value)  update,required TResult Function( _Delete value)  delete,}){
final _that = this;
switch (_that) {
case _Create():
return create(_that);case _Update():
return update(_that);case _Delete():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Create value)?  create,TResult? Function( _Update value)?  update,TResult? Function( _Delete value)?  delete,}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title,  String? about,  int? desiredSalary,  String? currency,  String? employmentTypes,  String? schedules,  bool? readyToRelocate,  bool? readyForBusinessTrips,  String? address,  String? dateOfBirth,  List<String>? citizenship,  bool? workPermit,  String? photoUrl,  List<String>? additionalPhotoUrls,  int? contactProfileId,  String? currentPosition,  String? currentCompany,  int? totalExperienceMonths,  int? flightHoursTotal,  int? flightHoursPic,  String? licenses,  String? typeRatings,  String? medicalClass,  bool isVisibleForEmployers)?  create,TResult Function( int id,  String? title,  String? about,  String? status,  bool? isVisibleForEmployers,  int? desiredSalary,  String? currency,  String? employmentTypes,  String? schedules,  bool? readyToRelocate,  bool? readyForBusinessTrips,  String? address,  String? dateOfBirth,  List<String>? citizenship,  bool? workPermit,  String? photoUrl,  List<String>? additionalPhotoUrls,  int? contactProfileId,  bool? clearContactProfileId,  String? currentPosition,  String? currentCompany,  int? totalExperienceMonths,  int? flightHoursTotal,  int? flightHoursPic,  String? licenses,  String? typeRatings,  String? medicalClass)?  update,TResult Function( int id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.title,_that.about,_that.desiredSalary,_that.currency,_that.employmentTypes,_that.schedules,_that.readyToRelocate,_that.readyForBusinessTrips,_that.address,_that.dateOfBirth,_that.citizenship,_that.workPermit,_that.photoUrl,_that.additionalPhotoUrls,_that.contactProfileId,_that.currentPosition,_that.currentCompany,_that.totalExperienceMonths,_that.flightHoursTotal,_that.flightHoursPic,_that.licenses,_that.typeRatings,_that.medicalClass,_that.isVisibleForEmployers);case _Update() when update != null:
return update(_that.id,_that.title,_that.about,_that.status,_that.isVisibleForEmployers,_that.desiredSalary,_that.currency,_that.employmentTypes,_that.schedules,_that.readyToRelocate,_that.readyForBusinessTrips,_that.address,_that.dateOfBirth,_that.citizenship,_that.workPermit,_that.photoUrl,_that.additionalPhotoUrls,_that.contactProfileId,_that.clearContactProfileId,_that.currentPosition,_that.currentCompany,_that.totalExperienceMonths,_that.flightHoursTotal,_that.flightHoursPic,_that.licenses,_that.typeRatings,_that.medicalClass);case _Delete() when delete != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title,  String? about,  int? desiredSalary,  String? currency,  String? employmentTypes,  String? schedules,  bool? readyToRelocate,  bool? readyForBusinessTrips,  String? address,  String? dateOfBirth,  List<String>? citizenship,  bool? workPermit,  String? photoUrl,  List<String>? additionalPhotoUrls,  int? contactProfileId,  String? currentPosition,  String? currentCompany,  int? totalExperienceMonths,  int? flightHoursTotal,  int? flightHoursPic,  String? licenses,  String? typeRatings,  String? medicalClass,  bool isVisibleForEmployers)  create,required TResult Function( int id,  String? title,  String? about,  String? status,  bool? isVisibleForEmployers,  int? desiredSalary,  String? currency,  String? employmentTypes,  String? schedules,  bool? readyToRelocate,  bool? readyForBusinessTrips,  String? address,  String? dateOfBirth,  List<String>? citizenship,  bool? workPermit,  String? photoUrl,  List<String>? additionalPhotoUrls,  int? contactProfileId,  bool? clearContactProfileId,  String? currentPosition,  String? currentCompany,  int? totalExperienceMonths,  int? flightHoursTotal,  int? flightHoursPic,  String? licenses,  String? typeRatings,  String? medicalClass)  update,required TResult Function( int id)  delete,}) {final _that = this;
switch (_that) {
case _Create():
return create(_that.title,_that.about,_that.desiredSalary,_that.currency,_that.employmentTypes,_that.schedules,_that.readyToRelocate,_that.readyForBusinessTrips,_that.address,_that.dateOfBirth,_that.citizenship,_that.workPermit,_that.photoUrl,_that.additionalPhotoUrls,_that.contactProfileId,_that.currentPosition,_that.currentCompany,_that.totalExperienceMonths,_that.flightHoursTotal,_that.flightHoursPic,_that.licenses,_that.typeRatings,_that.medicalClass,_that.isVisibleForEmployers);case _Update():
return update(_that.id,_that.title,_that.about,_that.status,_that.isVisibleForEmployers,_that.desiredSalary,_that.currency,_that.employmentTypes,_that.schedules,_that.readyToRelocate,_that.readyForBusinessTrips,_that.address,_that.dateOfBirth,_that.citizenship,_that.workPermit,_that.photoUrl,_that.additionalPhotoUrls,_that.contactProfileId,_that.clearContactProfileId,_that.currentPosition,_that.currentCompany,_that.totalExperienceMonths,_that.flightHoursTotal,_that.flightHoursPic,_that.licenses,_that.typeRatings,_that.medicalClass);case _Delete():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title,  String? about,  int? desiredSalary,  String? currency,  String? employmentTypes,  String? schedules,  bool? readyToRelocate,  bool? readyForBusinessTrips,  String? address,  String? dateOfBirth,  List<String>? citizenship,  bool? workPermit,  String? photoUrl,  List<String>? additionalPhotoUrls,  int? contactProfileId,  String? currentPosition,  String? currentCompany,  int? totalExperienceMonths,  int? flightHoursTotal,  int? flightHoursPic,  String? licenses,  String? typeRatings,  String? medicalClass,  bool isVisibleForEmployers)?  create,TResult? Function( int id,  String? title,  String? about,  String? status,  bool? isVisibleForEmployers,  int? desiredSalary,  String? currency,  String? employmentTypes,  String? schedules,  bool? readyToRelocate,  bool? readyForBusinessTrips,  String? address,  String? dateOfBirth,  List<String>? citizenship,  bool? workPermit,  String? photoUrl,  List<String>? additionalPhotoUrls,  int? contactProfileId,  bool? clearContactProfileId,  String? currentPosition,  String? currentCompany,  int? totalExperienceMonths,  int? flightHoursTotal,  int? flightHoursPic,  String? licenses,  String? typeRatings,  String? medicalClass)?  update,TResult? Function( int id)?  delete,}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.title,_that.about,_that.desiredSalary,_that.currency,_that.employmentTypes,_that.schedules,_that.readyToRelocate,_that.readyForBusinessTrips,_that.address,_that.dateOfBirth,_that.citizenship,_that.workPermit,_that.photoUrl,_that.additionalPhotoUrls,_that.contactProfileId,_that.currentPosition,_that.currentCompany,_that.totalExperienceMonths,_that.flightHoursTotal,_that.flightHoursPic,_that.licenses,_that.typeRatings,_that.medicalClass,_that.isVisibleForEmployers);case _Update() when update != null:
return update(_that.id,_that.title,_that.about,_that.status,_that.isVisibleForEmployers,_that.desiredSalary,_that.currency,_that.employmentTypes,_that.schedules,_that.readyToRelocate,_that.readyForBusinessTrips,_that.address,_that.dateOfBirth,_that.citizenship,_that.workPermit,_that.photoUrl,_that.additionalPhotoUrls,_that.contactProfileId,_that.clearContactProfileId,_that.currentPosition,_that.currentCompany,_that.totalExperienceMonths,_that.flightHoursTotal,_that.flightHoursPic,_that.licenses,_that.typeRatings,_that.medicalClass);case _Delete() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Create implements JobResumeEditEvent {
  const _Create({required this.title, this.about, this.desiredSalary, this.currency, this.employmentTypes, this.schedules, this.readyToRelocate, this.readyForBusinessTrips, this.address, this.dateOfBirth, final  List<String>? citizenship, this.workPermit, this.photoUrl, final  List<String>? additionalPhotoUrls, this.contactProfileId, this.currentPosition, this.currentCompany, this.totalExperienceMonths, this.flightHoursTotal, this.flightHoursPic, this.licenses, this.typeRatings, this.medicalClass, this.isVisibleForEmployers = true}): _citizenship = citizenship,_additionalPhotoUrls = additionalPhotoUrls;
  

 final  String title;
 final  String? about;
 final  int? desiredSalary;
 final  String? currency;
 final  String? employmentTypes;
 final  String? schedules;
 final  bool? readyToRelocate;
 final  bool? readyForBusinessTrips;
 final  String? address;
 final  String? dateOfBirth;
 final  List<String>? _citizenship;
 List<String>? get citizenship {
  final value = _citizenship;
  if (value == null) return null;
  if (_citizenship is EqualUnmodifiableListView) return _citizenship;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? workPermit;
 final  String? photoUrl;
 final  List<String>? _additionalPhotoUrls;
 List<String>? get additionalPhotoUrls {
  final value = _additionalPhotoUrls;
  if (value == null) return null;
  if (_additionalPhotoUrls is EqualUnmodifiableListView) return _additionalPhotoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? contactProfileId;
 final  String? currentPosition;
 final  String? currentCompany;
 final  int? totalExperienceMonths;
 final  int? flightHoursTotal;
 final  int? flightHoursPic;
 final  String? licenses;
 final  String? typeRatings;
 final  String? medicalClass;
@JsonKey() final  bool isVisibleForEmployers;

/// Create a copy of JobResumeEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.title, title) || other.title == title)&&(identical(other.about, about) || other.about == about)&&(identical(other.desiredSalary, desiredSalary) || other.desiredSalary == desiredSalary)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.employmentTypes, employmentTypes) || other.employmentTypes == employmentTypes)&&(identical(other.schedules, schedules) || other.schedules == schedules)&&(identical(other.readyToRelocate, readyToRelocate) || other.readyToRelocate == readyToRelocate)&&(identical(other.readyForBusinessTrips, readyForBusinessTrips) || other.readyForBusinessTrips == readyForBusinessTrips)&&(identical(other.address, address) || other.address == address)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&const DeepCollectionEquality().equals(other._citizenship, _citizenship)&&(identical(other.workPermit, workPermit) || other.workPermit == workPermit)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&const DeepCollectionEquality().equals(other._additionalPhotoUrls, _additionalPhotoUrls)&&(identical(other.contactProfileId, contactProfileId) || other.contactProfileId == contactProfileId)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.totalExperienceMonths, totalExperienceMonths) || other.totalExperienceMonths == totalExperienceMonths)&&(identical(other.flightHoursTotal, flightHoursTotal) || other.flightHoursTotal == flightHoursTotal)&&(identical(other.flightHoursPic, flightHoursPic) || other.flightHoursPic == flightHoursPic)&&(identical(other.licenses, licenses) || other.licenses == licenses)&&(identical(other.typeRatings, typeRatings) || other.typeRatings == typeRatings)&&(identical(other.medicalClass, medicalClass) || other.medicalClass == medicalClass)&&(identical(other.isVisibleForEmployers, isVisibleForEmployers) || other.isVisibleForEmployers == isVisibleForEmployers));
}


@override
int get hashCode => Object.hashAll([runtimeType,title,about,desiredSalary,currency,employmentTypes,schedules,readyToRelocate,readyForBusinessTrips,address,dateOfBirth,const DeepCollectionEquality().hash(_citizenship),workPermit,photoUrl,const DeepCollectionEquality().hash(_additionalPhotoUrls),contactProfileId,currentPosition,currentCompany,totalExperienceMonths,flightHoursTotal,flightHoursPic,licenses,typeRatings,medicalClass,isVisibleForEmployers]);

@override
String toString() {
  return 'JobResumeEditEvent.create(title: $title, about: $about, desiredSalary: $desiredSalary, currency: $currency, employmentTypes: $employmentTypes, schedules: $schedules, readyToRelocate: $readyToRelocate, readyForBusinessTrips: $readyForBusinessTrips, address: $address, dateOfBirth: $dateOfBirth, citizenship: $citizenship, workPermit: $workPermit, photoUrl: $photoUrl, additionalPhotoUrls: $additionalPhotoUrls, contactProfileId: $contactProfileId, currentPosition: $currentPosition, currentCompany: $currentCompany, totalExperienceMonths: $totalExperienceMonths, flightHoursTotal: $flightHoursTotal, flightHoursPic: $flightHoursPic, licenses: $licenses, typeRatings: $typeRatings, medicalClass: $medicalClass, isVisibleForEmployers: $isVisibleForEmployers)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $JobResumeEditEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String title, String? about, int? desiredSalary, String? currency, String? employmentTypes, String? schedules, bool? readyToRelocate, bool? readyForBusinessTrips, String? address, String? dateOfBirth, List<String>? citizenship, bool? workPermit, String? photoUrl, List<String>? additionalPhotoUrls, int? contactProfileId, String? currentPosition, String? currentCompany, int? totalExperienceMonths, int? flightHoursTotal, int? flightHoursPic, String? licenses, String? typeRatings, String? medicalClass, bool isVisibleForEmployers
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of JobResumeEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? about = freezed,Object? desiredSalary = freezed,Object? currency = freezed,Object? employmentTypes = freezed,Object? schedules = freezed,Object? readyToRelocate = freezed,Object? readyForBusinessTrips = freezed,Object? address = freezed,Object? dateOfBirth = freezed,Object? citizenship = freezed,Object? workPermit = freezed,Object? photoUrl = freezed,Object? additionalPhotoUrls = freezed,Object? contactProfileId = freezed,Object? currentPosition = freezed,Object? currentCompany = freezed,Object? totalExperienceMonths = freezed,Object? flightHoursTotal = freezed,Object? flightHoursPic = freezed,Object? licenses = freezed,Object? typeRatings = freezed,Object? medicalClass = freezed,Object? isVisibleForEmployers = null,}) {
  return _then(_Create(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,desiredSalary: freezed == desiredSalary ? _self.desiredSalary : desiredSalary // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,employmentTypes: freezed == employmentTypes ? _self.employmentTypes : employmentTypes // ignore: cast_nullable_to_non_nullable
as String?,schedules: freezed == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as String?,readyToRelocate: freezed == readyToRelocate ? _self.readyToRelocate : readyToRelocate // ignore: cast_nullable_to_non_nullable
as bool?,readyForBusinessTrips: freezed == readyForBusinessTrips ? _self.readyForBusinessTrips : readyForBusinessTrips // ignore: cast_nullable_to_non_nullable
as bool?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,citizenship: freezed == citizenship ? _self._citizenship : citizenship // ignore: cast_nullable_to_non_nullable
as List<String>?,workPermit: freezed == workPermit ? _self.workPermit : workPermit // ignore: cast_nullable_to_non_nullable
as bool?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,additionalPhotoUrls: freezed == additionalPhotoUrls ? _self._additionalPhotoUrls : additionalPhotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,contactProfileId: freezed == contactProfileId ? _self.contactProfileId : contactProfileId // ignore: cast_nullable_to_non_nullable
as int?,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,totalExperienceMonths: freezed == totalExperienceMonths ? _self.totalExperienceMonths : totalExperienceMonths // ignore: cast_nullable_to_non_nullable
as int?,flightHoursTotal: freezed == flightHoursTotal ? _self.flightHoursTotal : flightHoursTotal // ignore: cast_nullable_to_non_nullable
as int?,flightHoursPic: freezed == flightHoursPic ? _self.flightHoursPic : flightHoursPic // ignore: cast_nullable_to_non_nullable
as int?,licenses: freezed == licenses ? _self.licenses : licenses // ignore: cast_nullable_to_non_nullable
as String?,typeRatings: freezed == typeRatings ? _self.typeRatings : typeRatings // ignore: cast_nullable_to_non_nullable
as String?,medicalClass: freezed == medicalClass ? _self.medicalClass : medicalClass // ignore: cast_nullable_to_non_nullable
as String?,isVisibleForEmployers: null == isVisibleForEmployers ? _self.isVisibleForEmployers : isVisibleForEmployers // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Update implements JobResumeEditEvent {
  const _Update({required this.id, this.title, this.about, this.status, this.isVisibleForEmployers, this.desiredSalary, this.currency, this.employmentTypes, this.schedules, this.readyToRelocate, this.readyForBusinessTrips, this.address, this.dateOfBirth, final  List<String>? citizenship, this.workPermit, this.photoUrl, final  List<String>? additionalPhotoUrls, this.contactProfileId, this.clearContactProfileId, this.currentPosition, this.currentCompany, this.totalExperienceMonths, this.flightHoursTotal, this.flightHoursPic, this.licenses, this.typeRatings, this.medicalClass}): _citizenship = citizenship,_additionalPhotoUrls = additionalPhotoUrls;
  

 final  int id;
 final  String? title;
 final  String? about;
 final  String? status;
 final  bool? isVisibleForEmployers;
 final  int? desiredSalary;
 final  String? currency;
 final  String? employmentTypes;
 final  String? schedules;
 final  bool? readyToRelocate;
 final  bool? readyForBusinessTrips;
 final  String? address;
 final  String? dateOfBirth;
 final  List<String>? _citizenship;
 List<String>? get citizenship {
  final value = _citizenship;
  if (value == null) return null;
  if (_citizenship is EqualUnmodifiableListView) return _citizenship;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? workPermit;
 final  String? photoUrl;
 final  List<String>? _additionalPhotoUrls;
 List<String>? get additionalPhotoUrls {
  final value = _additionalPhotoUrls;
  if (value == null) return null;
  if (_additionalPhotoUrls is EqualUnmodifiableListView) return _additionalPhotoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? contactProfileId;
 final  bool? clearContactProfileId;
 final  String? currentPosition;
 final  String? currentCompany;
 final  int? totalExperienceMonths;
 final  int? flightHoursTotal;
 final  int? flightHoursPic;
 final  String? licenses;
 final  String? typeRatings;
 final  String? medicalClass;

/// Create a copy of JobResumeEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.about, about) || other.about == about)&&(identical(other.status, status) || other.status == status)&&(identical(other.isVisibleForEmployers, isVisibleForEmployers) || other.isVisibleForEmployers == isVisibleForEmployers)&&(identical(other.desiredSalary, desiredSalary) || other.desiredSalary == desiredSalary)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.employmentTypes, employmentTypes) || other.employmentTypes == employmentTypes)&&(identical(other.schedules, schedules) || other.schedules == schedules)&&(identical(other.readyToRelocate, readyToRelocate) || other.readyToRelocate == readyToRelocate)&&(identical(other.readyForBusinessTrips, readyForBusinessTrips) || other.readyForBusinessTrips == readyForBusinessTrips)&&(identical(other.address, address) || other.address == address)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&const DeepCollectionEquality().equals(other._citizenship, _citizenship)&&(identical(other.workPermit, workPermit) || other.workPermit == workPermit)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&const DeepCollectionEquality().equals(other._additionalPhotoUrls, _additionalPhotoUrls)&&(identical(other.contactProfileId, contactProfileId) || other.contactProfileId == contactProfileId)&&(identical(other.clearContactProfileId, clearContactProfileId) || other.clearContactProfileId == clearContactProfileId)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.totalExperienceMonths, totalExperienceMonths) || other.totalExperienceMonths == totalExperienceMonths)&&(identical(other.flightHoursTotal, flightHoursTotal) || other.flightHoursTotal == flightHoursTotal)&&(identical(other.flightHoursPic, flightHoursPic) || other.flightHoursPic == flightHoursPic)&&(identical(other.licenses, licenses) || other.licenses == licenses)&&(identical(other.typeRatings, typeRatings) || other.typeRatings == typeRatings)&&(identical(other.medicalClass, medicalClass) || other.medicalClass == medicalClass));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,about,status,isVisibleForEmployers,desiredSalary,currency,employmentTypes,schedules,readyToRelocate,readyForBusinessTrips,address,dateOfBirth,const DeepCollectionEquality().hash(_citizenship),workPermit,photoUrl,const DeepCollectionEquality().hash(_additionalPhotoUrls),contactProfileId,clearContactProfileId,currentPosition,currentCompany,totalExperienceMonths,flightHoursTotal,flightHoursPic,licenses,typeRatings,medicalClass]);

@override
String toString() {
  return 'JobResumeEditEvent.update(id: $id, title: $title, about: $about, status: $status, isVisibleForEmployers: $isVisibleForEmployers, desiredSalary: $desiredSalary, currency: $currency, employmentTypes: $employmentTypes, schedules: $schedules, readyToRelocate: $readyToRelocate, readyForBusinessTrips: $readyForBusinessTrips, address: $address, dateOfBirth: $dateOfBirth, citizenship: $citizenship, workPermit: $workPermit, photoUrl: $photoUrl, additionalPhotoUrls: $additionalPhotoUrls, contactProfileId: $contactProfileId, clearContactProfileId: $clearContactProfileId, currentPosition: $currentPosition, currentCompany: $currentCompany, totalExperienceMonths: $totalExperienceMonths, flightHoursTotal: $flightHoursTotal, flightHoursPic: $flightHoursPic, licenses: $licenses, typeRatings: $typeRatings, medicalClass: $medicalClass)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $JobResumeEditEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 int id, String? title, String? about, String? status, bool? isVisibleForEmployers, int? desiredSalary, String? currency, String? employmentTypes, String? schedules, bool? readyToRelocate, bool? readyForBusinessTrips, String? address, String? dateOfBirth, List<String>? citizenship, bool? workPermit, String? photoUrl, List<String>? additionalPhotoUrls, int? contactProfileId, bool? clearContactProfileId, String? currentPosition, String? currentCompany, int? totalExperienceMonths, int? flightHoursTotal, int? flightHoursPic, String? licenses, String? typeRatings, String? medicalClass
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of JobResumeEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? about = freezed,Object? status = freezed,Object? isVisibleForEmployers = freezed,Object? desiredSalary = freezed,Object? currency = freezed,Object? employmentTypes = freezed,Object? schedules = freezed,Object? readyToRelocate = freezed,Object? readyForBusinessTrips = freezed,Object? address = freezed,Object? dateOfBirth = freezed,Object? citizenship = freezed,Object? workPermit = freezed,Object? photoUrl = freezed,Object? additionalPhotoUrls = freezed,Object? contactProfileId = freezed,Object? clearContactProfileId = freezed,Object? currentPosition = freezed,Object? currentCompany = freezed,Object? totalExperienceMonths = freezed,Object? flightHoursTotal = freezed,Object? flightHoursPic = freezed,Object? licenses = freezed,Object? typeRatings = freezed,Object? medicalClass = freezed,}) {
  return _then(_Update(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isVisibleForEmployers: freezed == isVisibleForEmployers ? _self.isVisibleForEmployers : isVisibleForEmployers // ignore: cast_nullable_to_non_nullable
as bool?,desiredSalary: freezed == desiredSalary ? _self.desiredSalary : desiredSalary // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,employmentTypes: freezed == employmentTypes ? _self.employmentTypes : employmentTypes // ignore: cast_nullable_to_non_nullable
as String?,schedules: freezed == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as String?,readyToRelocate: freezed == readyToRelocate ? _self.readyToRelocate : readyToRelocate // ignore: cast_nullable_to_non_nullable
as bool?,readyForBusinessTrips: freezed == readyForBusinessTrips ? _self.readyForBusinessTrips : readyForBusinessTrips // ignore: cast_nullable_to_non_nullable
as bool?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,citizenship: freezed == citizenship ? _self._citizenship : citizenship // ignore: cast_nullable_to_non_nullable
as List<String>?,workPermit: freezed == workPermit ? _self.workPermit : workPermit // ignore: cast_nullable_to_non_nullable
as bool?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,additionalPhotoUrls: freezed == additionalPhotoUrls ? _self._additionalPhotoUrls : additionalPhotoUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,contactProfileId: freezed == contactProfileId ? _self.contactProfileId : contactProfileId // ignore: cast_nullable_to_non_nullable
as int?,clearContactProfileId: freezed == clearContactProfileId ? _self.clearContactProfileId : clearContactProfileId // ignore: cast_nullable_to_non_nullable
as bool?,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,totalExperienceMonths: freezed == totalExperienceMonths ? _self.totalExperienceMonths : totalExperienceMonths // ignore: cast_nullable_to_non_nullable
as int?,flightHoursTotal: freezed == flightHoursTotal ? _self.flightHoursTotal : flightHoursTotal // ignore: cast_nullable_to_non_nullable
as int?,flightHoursPic: freezed == flightHoursPic ? _self.flightHoursPic : flightHoursPic // ignore: cast_nullable_to_non_nullable
as int?,licenses: freezed == licenses ? _self.licenses : licenses // ignore: cast_nullable_to_non_nullable
as String?,typeRatings: freezed == typeRatings ? _self.typeRatings : typeRatings // ignore: cast_nullable_to_non_nullable
as String?,medicalClass: freezed == medicalClass ? _self.medicalClass : medicalClass // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Delete implements JobResumeEditEvent {
  const _Delete({required this.id});
  

 final  int id;

/// Create a copy of JobResumeEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'JobResumeEditEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $JobResumeEditEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of JobResumeEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Delete(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$JobResumeEditState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobResumeEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeEditState()';
}


}

/// @nodoc
class $JobResumeEditStateCopyWith<$Res>  {
$JobResumeEditStateCopyWith(JobResumeEditState _, $Res Function(JobResumeEditState) __);
}


/// Adds pattern-matching-related methods to [JobResumeEditState].
extension JobResumeEditStatePatterns on JobResumeEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Creating value)?  creating,TResult Function( _Updating value)?  updating,TResult Function( _Deleting value)?  deleting,TResult Function( _Created value)?  created,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Creating() when creating != null:
return creating(_that);case _Updating() when updating != null:
return updating(_that);case _Deleting() when deleting != null:
return deleting(_that);case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Creating value)  creating,required TResult Function( _Updating value)  updating,required TResult Function( _Deleting value)  deleting,required TResult Function( _Created value)  created,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Creating():
return creating(_that);case _Updating():
return updating(_that);case _Deleting():
return deleting(_that);case _Created():
return created(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Creating value)?  creating,TResult? Function( _Updating value)?  updating,TResult? Function( _Deleting value)?  deleting,TResult? Function( _Created value)?  created,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Creating() when creating != null:
return creating(_that);case _Updating() when updating != null:
return updating(_that);case _Deleting() when deleting != null:
return deleting(_that);case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  creating,TResult Function()?  updating,TResult Function()?  deleting,TResult Function( JobResumeEntity resume)?  created,TResult Function( JobResumeEntity resume)?  updated,TResult Function( int id)?  deleted,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Creating() when creating != null:
return creating();case _Updating() when updating != null:
return updating();case _Deleting() when deleting != null:
return deleting();case _Created() when created != null:
return created(_that.resume);case _Updated() when updated != null:
return updated(_that.resume);case _Deleted() when deleted != null:
return deleted(_that.id);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  creating,required TResult Function()  updating,required TResult Function()  deleting,required TResult Function( JobResumeEntity resume)  created,required TResult Function( JobResumeEntity resume)  updated,required TResult Function( int id)  deleted,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Creating():
return creating();case _Updating():
return updating();case _Deleting():
return deleting();case _Created():
return created(_that.resume);case _Updated():
return updated(_that.resume);case _Deleted():
return deleted(_that.id);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  creating,TResult? Function()?  updating,TResult? Function()?  deleting,TResult? Function( JobResumeEntity resume)?  created,TResult? Function( JobResumeEntity resume)?  updated,TResult? Function( int id)?  deleted,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Creating() when creating != null:
return creating();case _Updating() when updating != null:
return updating();case _Deleting() when deleting != null:
return deleting();case _Created() when created != null:
return created(_that.resume);case _Updated() when updated != null:
return updated(_that.resume);case _Deleted() when deleted != null:
return deleted(_that.id);case _Error() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements JobResumeEditState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeEditState.initial()';
}


}




/// @nodoc


class _Creating implements JobResumeEditState {
  const _Creating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Creating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeEditState.creating()';
}


}




/// @nodoc


class _Updating implements JobResumeEditState {
  const _Updating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeEditState.updating()';
}


}




/// @nodoc


class _Deleting implements JobResumeEditState {
  const _Deleting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobResumeEditState.deleting()';
}


}




/// @nodoc


class _Created implements JobResumeEditState {
  const _Created({required this.resume});
  

 final  JobResumeEntity resume;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&(identical(other.resume, resume) || other.resume == resume));
}


@override
int get hashCode => Object.hash(runtimeType,resume);

@override
String toString() {
  return 'JobResumeEditState.created(resume: $resume)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $JobResumeEditStateCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 JobResumeEntity resume
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resume = null,}) {
  return _then(_Created(
resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as JobResumeEntity,
  ));
}


}

/// @nodoc


class _Updated implements JobResumeEditState {
  const _Updated({required this.resume});
  

 final  JobResumeEntity resume;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&(identical(other.resume, resume) || other.resume == resume));
}


@override
int get hashCode => Object.hash(runtimeType,resume);

@override
String toString() {
  return 'JobResumeEditState.updated(resume: $resume)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $JobResumeEditStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 JobResumeEntity resume
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resume = null,}) {
  return _then(_Updated(
resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as JobResumeEntity,
  ));
}


}

/// @nodoc


class _Deleted implements JobResumeEditState {
  const _Deleted({required this.id});
  

 final  int id;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'JobResumeEditState.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $JobResumeEditStateCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Deleted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Error implements JobResumeEditState {
  const _Error({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'JobResumeEditState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $JobResumeEditStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of JobResumeEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(_Error(
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
