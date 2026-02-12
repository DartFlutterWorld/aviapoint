// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_vacancy_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobVacancyEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditEvent()';
}


}

/// @nodoc
class $JobVacancyEditEventCopyWith<$Res>  {
$JobVacancyEditEventCopyWith(JobVacancyEditEvent _, $Res Function(JobVacancyEditEvent) __);
}


/// Adds pattern-matching-related methods to [JobVacancyEditEvent].
extension JobVacancyEditEventPatterns on JobVacancyEditEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Create value)?  create,TResult Function( _Update value)?  update,TResult Function( _Delete value)?  delete,TResult Function( _Publish value)?  publish,TResult Function( _Unpublish value)?  unpublish,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _Publish() when publish != null:
return publish(_that);case _Unpublish() when unpublish != null:
return unpublish(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Create value)  create,required TResult Function( _Update value)  update,required TResult Function( _Delete value)  delete,required TResult Function( _Publish value)  publish,required TResult Function( _Unpublish value)  unpublish,}){
final _that = this;
switch (_that) {
case _Create():
return create(_that);case _Update():
return update(_that);case _Delete():
return delete(_that);case _Publish():
return publish(_that);case _Unpublish():
return unpublish(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Create value)?  create,TResult? Function( _Update value)?  update,TResult? Function( _Delete value)?  delete,TResult? Function( _Publish value)?  publish,TResult? Function( _Unpublish value)?  unpublish,}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _Publish() when publish != null:
return publish(_that);case _Unpublish() when unpublish != null:
return unpublish(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title,  int contactProfileId,  String? description,  String? responsibilities,  String? requirements,  String? conditions,  int? salaryFrom,  int? salaryTo,  String? currency,  bool? isGross,  String? employmentType,  String? schedule,  String? experienceLevel,  String? educationLevel,  String? city,  String? region,  String? airportCode,  String? employmentForm,  String? workHours,  bool? relocationAllowed,  String? businessTrips,  String? aircraftCategory,  String? requiredLicense,  int? minFlightHours,  String? requiredTypeRating,  List<String>? skills,  bool isPublished)?  create,TResult Function( int id,  String? title,  int? contactProfileId,  String? description,  String? responsibilities,  String? requirements,  String? conditions,  int? salaryFrom,  int? salaryTo,  String? currency,  bool? isGross,  String? employmentType,  String? schedule,  String? experienceLevel,  String? educationLevel,  String? city,  String? region,  String? airportCode,  String? employmentForm,  String? workHours,  bool? relocationAllowed,  String? businessTrips,  String? aircraftCategory,  String? requiredLicense,  int? minFlightHours,  String? requiredTypeRating,  List<String>? skills,  bool? isPublished,  bool? isActive,  List<String>? additionalImageUrls)?  update,TResult Function( int id)?  delete,TResult Function( int id)?  publish,TResult Function( int id)?  unpublish,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.title,_that.contactProfileId,_that.description,_that.responsibilities,_that.requirements,_that.conditions,_that.salaryFrom,_that.salaryTo,_that.currency,_that.isGross,_that.employmentType,_that.schedule,_that.experienceLevel,_that.educationLevel,_that.city,_that.region,_that.airportCode,_that.employmentForm,_that.workHours,_that.relocationAllowed,_that.businessTrips,_that.aircraftCategory,_that.requiredLicense,_that.minFlightHours,_that.requiredTypeRating,_that.skills,_that.isPublished);case _Update() when update != null:
return update(_that.id,_that.title,_that.contactProfileId,_that.description,_that.responsibilities,_that.requirements,_that.conditions,_that.salaryFrom,_that.salaryTo,_that.currency,_that.isGross,_that.employmentType,_that.schedule,_that.experienceLevel,_that.educationLevel,_that.city,_that.region,_that.airportCode,_that.employmentForm,_that.workHours,_that.relocationAllowed,_that.businessTrips,_that.aircraftCategory,_that.requiredLicense,_that.minFlightHours,_that.requiredTypeRating,_that.skills,_that.isPublished,_that.isActive,_that.additionalImageUrls);case _Delete() when delete != null:
return delete(_that.id);case _Publish() when publish != null:
return publish(_that.id);case _Unpublish() when unpublish != null:
return unpublish(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title,  int contactProfileId,  String? description,  String? responsibilities,  String? requirements,  String? conditions,  int? salaryFrom,  int? salaryTo,  String? currency,  bool? isGross,  String? employmentType,  String? schedule,  String? experienceLevel,  String? educationLevel,  String? city,  String? region,  String? airportCode,  String? employmentForm,  String? workHours,  bool? relocationAllowed,  String? businessTrips,  String? aircraftCategory,  String? requiredLicense,  int? minFlightHours,  String? requiredTypeRating,  List<String>? skills,  bool isPublished)  create,required TResult Function( int id,  String? title,  int? contactProfileId,  String? description,  String? responsibilities,  String? requirements,  String? conditions,  int? salaryFrom,  int? salaryTo,  String? currency,  bool? isGross,  String? employmentType,  String? schedule,  String? experienceLevel,  String? educationLevel,  String? city,  String? region,  String? airportCode,  String? employmentForm,  String? workHours,  bool? relocationAllowed,  String? businessTrips,  String? aircraftCategory,  String? requiredLicense,  int? minFlightHours,  String? requiredTypeRating,  List<String>? skills,  bool? isPublished,  bool? isActive,  List<String>? additionalImageUrls)  update,required TResult Function( int id)  delete,required TResult Function( int id)  publish,required TResult Function( int id)  unpublish,}) {final _that = this;
switch (_that) {
case _Create():
return create(_that.title,_that.contactProfileId,_that.description,_that.responsibilities,_that.requirements,_that.conditions,_that.salaryFrom,_that.salaryTo,_that.currency,_that.isGross,_that.employmentType,_that.schedule,_that.experienceLevel,_that.educationLevel,_that.city,_that.region,_that.airportCode,_that.employmentForm,_that.workHours,_that.relocationAllowed,_that.businessTrips,_that.aircraftCategory,_that.requiredLicense,_that.minFlightHours,_that.requiredTypeRating,_that.skills,_that.isPublished);case _Update():
return update(_that.id,_that.title,_that.contactProfileId,_that.description,_that.responsibilities,_that.requirements,_that.conditions,_that.salaryFrom,_that.salaryTo,_that.currency,_that.isGross,_that.employmentType,_that.schedule,_that.experienceLevel,_that.educationLevel,_that.city,_that.region,_that.airportCode,_that.employmentForm,_that.workHours,_that.relocationAllowed,_that.businessTrips,_that.aircraftCategory,_that.requiredLicense,_that.minFlightHours,_that.requiredTypeRating,_that.skills,_that.isPublished,_that.isActive,_that.additionalImageUrls);case _Delete():
return delete(_that.id);case _Publish():
return publish(_that.id);case _Unpublish():
return unpublish(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title,  int contactProfileId,  String? description,  String? responsibilities,  String? requirements,  String? conditions,  int? salaryFrom,  int? salaryTo,  String? currency,  bool? isGross,  String? employmentType,  String? schedule,  String? experienceLevel,  String? educationLevel,  String? city,  String? region,  String? airportCode,  String? employmentForm,  String? workHours,  bool? relocationAllowed,  String? businessTrips,  String? aircraftCategory,  String? requiredLicense,  int? minFlightHours,  String? requiredTypeRating,  List<String>? skills,  bool isPublished)?  create,TResult? Function( int id,  String? title,  int? contactProfileId,  String? description,  String? responsibilities,  String? requirements,  String? conditions,  int? salaryFrom,  int? salaryTo,  String? currency,  bool? isGross,  String? employmentType,  String? schedule,  String? experienceLevel,  String? educationLevel,  String? city,  String? region,  String? airportCode,  String? employmentForm,  String? workHours,  bool? relocationAllowed,  String? businessTrips,  String? aircraftCategory,  String? requiredLicense,  int? minFlightHours,  String? requiredTypeRating,  List<String>? skills,  bool? isPublished,  bool? isActive,  List<String>? additionalImageUrls)?  update,TResult? Function( int id)?  delete,TResult? Function( int id)?  publish,TResult? Function( int id)?  unpublish,}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.title,_that.contactProfileId,_that.description,_that.responsibilities,_that.requirements,_that.conditions,_that.salaryFrom,_that.salaryTo,_that.currency,_that.isGross,_that.employmentType,_that.schedule,_that.experienceLevel,_that.educationLevel,_that.city,_that.region,_that.airportCode,_that.employmentForm,_that.workHours,_that.relocationAllowed,_that.businessTrips,_that.aircraftCategory,_that.requiredLicense,_that.minFlightHours,_that.requiredTypeRating,_that.skills,_that.isPublished);case _Update() when update != null:
return update(_that.id,_that.title,_that.contactProfileId,_that.description,_that.responsibilities,_that.requirements,_that.conditions,_that.salaryFrom,_that.salaryTo,_that.currency,_that.isGross,_that.employmentType,_that.schedule,_that.experienceLevel,_that.educationLevel,_that.city,_that.region,_that.airportCode,_that.employmentForm,_that.workHours,_that.relocationAllowed,_that.businessTrips,_that.aircraftCategory,_that.requiredLicense,_that.minFlightHours,_that.requiredTypeRating,_that.skills,_that.isPublished,_that.isActive,_that.additionalImageUrls);case _Delete() when delete != null:
return delete(_that.id);case _Publish() when publish != null:
return publish(_that.id);case _Unpublish() when unpublish != null:
return unpublish(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Create implements JobVacancyEditEvent {
  const _Create({required this.title, required this.contactProfileId, this.description, this.responsibilities, this.requirements, this.conditions, this.salaryFrom, this.salaryTo, this.currency, this.isGross, this.employmentType, this.schedule, this.experienceLevel, this.educationLevel, this.city, this.region, this.airportCode, this.employmentForm, this.workHours, this.relocationAllowed, this.businessTrips, this.aircraftCategory, this.requiredLicense, this.minFlightHours, this.requiredTypeRating, final  List<String>? skills, this.isPublished = true}): _skills = skills;
  

 final  String title;
 final  int contactProfileId;
 final  String? description;
 final  String? responsibilities;
 final  String? requirements;
 final  String? conditions;
 final  int? salaryFrom;
 final  int? salaryTo;
 final  String? currency;
 final  bool? isGross;
 final  String? employmentType;
 final  String? schedule;
 final  String? experienceLevel;
 final  String? educationLevel;
 final  String? city;
 final  String? region;
 final  String? airportCode;
 final  String? employmentForm;
 final  String? workHours;
 final  bool? relocationAllowed;
 final  String? businessTrips;
 final  String? aircraftCategory;
 final  String? requiredLicense;
 final  int? minFlightHours;
 final  String? requiredTypeRating;
 final  List<String>? _skills;
 List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@JsonKey() final  bool isPublished;

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.title, title) || other.title == title)&&(identical(other.contactProfileId, contactProfileId) || other.contactProfileId == contactProfileId)&&(identical(other.description, description) || other.description == description)&&(identical(other.responsibilities, responsibilities) || other.responsibilities == responsibilities)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.isGross, isGross) || other.isGross == isGross)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.employmentForm, employmentForm) || other.employmentForm == employmentForm)&&(identical(other.workHours, workHours) || other.workHours == workHours)&&(identical(other.relocationAllowed, relocationAllowed) || other.relocationAllowed == relocationAllowed)&&(identical(other.businessTrips, businessTrips) || other.businessTrips == businessTrips)&&(identical(other.aircraftCategory, aircraftCategory) || other.aircraftCategory == aircraftCategory)&&(identical(other.requiredLicense, requiredLicense) || other.requiredLicense == requiredLicense)&&(identical(other.minFlightHours, minFlightHours) || other.minFlightHours == minFlightHours)&&(identical(other.requiredTypeRating, requiredTypeRating) || other.requiredTypeRating == requiredTypeRating)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}


@override
int get hashCode => Object.hashAll([runtimeType,title,contactProfileId,description,responsibilities,requirements,conditions,salaryFrom,salaryTo,currency,isGross,employmentType,schedule,experienceLevel,educationLevel,city,region,airportCode,employmentForm,workHours,relocationAllowed,businessTrips,aircraftCategory,requiredLicense,minFlightHours,requiredTypeRating,const DeepCollectionEquality().hash(_skills),isPublished]);

@override
String toString() {
  return 'JobVacancyEditEvent.create(title: $title, contactProfileId: $contactProfileId, description: $description, responsibilities: $responsibilities, requirements: $requirements, conditions: $conditions, salaryFrom: $salaryFrom, salaryTo: $salaryTo, currency: $currency, isGross: $isGross, employmentType: $employmentType, schedule: $schedule, experienceLevel: $experienceLevel, educationLevel: $educationLevel, city: $city, region: $region, airportCode: $airportCode, employmentForm: $employmentForm, workHours: $workHours, relocationAllowed: $relocationAllowed, businessTrips: $businessTrips, aircraftCategory: $aircraftCategory, requiredLicense: $requiredLicense, minFlightHours: $minFlightHours, requiredTypeRating: $requiredTypeRating, skills: $skills, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $JobVacancyEditEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String title, int contactProfileId, String? description, String? responsibilities, String? requirements, String? conditions, int? salaryFrom, int? salaryTo, String? currency, bool? isGross, String? employmentType, String? schedule, String? experienceLevel, String? educationLevel, String? city, String? region, String? airportCode, String? employmentForm, String? workHours, bool? relocationAllowed, String? businessTrips, String? aircraftCategory, String? requiredLicense, int? minFlightHours, String? requiredTypeRating, List<String>? skills, bool isPublished
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? contactProfileId = null,Object? description = freezed,Object? responsibilities = freezed,Object? requirements = freezed,Object? conditions = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? currency = freezed,Object? isGross = freezed,Object? employmentType = freezed,Object? schedule = freezed,Object? experienceLevel = freezed,Object? educationLevel = freezed,Object? city = freezed,Object? region = freezed,Object? airportCode = freezed,Object? employmentForm = freezed,Object? workHours = freezed,Object? relocationAllowed = freezed,Object? businessTrips = freezed,Object? aircraftCategory = freezed,Object? requiredLicense = freezed,Object? minFlightHours = freezed,Object? requiredTypeRating = freezed,Object? skills = freezed,Object? isPublished = null,}) {
  return _then(_Create(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,contactProfileId: null == contactProfileId ? _self.contactProfileId : contactProfileId // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,responsibilities: freezed == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as String?,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,conditions: freezed == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,isGross: freezed == isGross ? _self.isGross : isGross // ignore: cast_nullable_to_non_nullable
as bool?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String?,experienceLevel: freezed == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String?,educationLevel: freezed == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,airportCode: freezed == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String?,employmentForm: freezed == employmentForm ? _self.employmentForm : employmentForm // ignore: cast_nullable_to_non_nullable
as String?,workHours: freezed == workHours ? _self.workHours : workHours // ignore: cast_nullable_to_non_nullable
as String?,relocationAllowed: freezed == relocationAllowed ? _self.relocationAllowed : relocationAllowed // ignore: cast_nullable_to_non_nullable
as bool?,businessTrips: freezed == businessTrips ? _self.businessTrips : businessTrips // ignore: cast_nullable_to_non_nullable
as String?,aircraftCategory: freezed == aircraftCategory ? _self.aircraftCategory : aircraftCategory // ignore: cast_nullable_to_non_nullable
as String?,requiredLicense: freezed == requiredLicense ? _self.requiredLicense : requiredLicense // ignore: cast_nullable_to_non_nullable
as String?,minFlightHours: freezed == minFlightHours ? _self.minFlightHours : minFlightHours // ignore: cast_nullable_to_non_nullable
as int?,requiredTypeRating: freezed == requiredTypeRating ? _self.requiredTypeRating : requiredTypeRating // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Update implements JobVacancyEditEvent {
  const _Update({required this.id, this.title, this.contactProfileId, this.description, this.responsibilities, this.requirements, this.conditions, this.salaryFrom, this.salaryTo, this.currency, this.isGross, this.employmentType, this.schedule, this.experienceLevel, this.educationLevel, this.city, this.region, this.airportCode, this.employmentForm, this.workHours, this.relocationAllowed, this.businessTrips, this.aircraftCategory, this.requiredLicense, this.minFlightHours, this.requiredTypeRating, final  List<String>? skills, this.isPublished, this.isActive, final  List<String>? additionalImageUrls}): _skills = skills,_additionalImageUrls = additionalImageUrls;
  

 final  int id;
 final  String? title;
 final  int? contactProfileId;
 final  String? description;
 final  String? responsibilities;
 final  String? requirements;
 final  String? conditions;
 final  int? salaryFrom;
 final  int? salaryTo;
 final  String? currency;
 final  bool? isGross;
 final  String? employmentType;
 final  String? schedule;
 final  String? experienceLevel;
 final  String? educationLevel;
 final  String? city;
 final  String? region;
 final  String? airportCode;
 final  String? employmentForm;
 final  String? workHours;
 final  bool? relocationAllowed;
 final  String? businessTrips;
 final  String? aircraftCategory;
 final  String? requiredLicense;
 final  int? minFlightHours;
 final  String? requiredTypeRating;
 final  List<String>? _skills;
 List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? isPublished;
 final  bool? isActive;
 final  List<String>? _additionalImageUrls;
 List<String>? get additionalImageUrls {
  final value = _additionalImageUrls;
  if (value == null) return null;
  if (_additionalImageUrls is EqualUnmodifiableListView) return _additionalImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.contactProfileId, contactProfileId) || other.contactProfileId == contactProfileId)&&(identical(other.description, description) || other.description == description)&&(identical(other.responsibilities, responsibilities) || other.responsibilities == responsibilities)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.isGross, isGross) || other.isGross == isGross)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.airportCode, airportCode) || other.airportCode == airportCode)&&(identical(other.employmentForm, employmentForm) || other.employmentForm == employmentForm)&&(identical(other.workHours, workHours) || other.workHours == workHours)&&(identical(other.relocationAllowed, relocationAllowed) || other.relocationAllowed == relocationAllowed)&&(identical(other.businessTrips, businessTrips) || other.businessTrips == businessTrips)&&(identical(other.aircraftCategory, aircraftCategory) || other.aircraftCategory == aircraftCategory)&&(identical(other.requiredLicense, requiredLicense) || other.requiredLicense == requiredLicense)&&(identical(other.minFlightHours, minFlightHours) || other.minFlightHours == minFlightHours)&&(identical(other.requiredTypeRating, requiredTypeRating) || other.requiredTypeRating == requiredTypeRating)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._additionalImageUrls, _additionalImageUrls));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,contactProfileId,description,responsibilities,requirements,conditions,salaryFrom,salaryTo,currency,isGross,employmentType,schedule,experienceLevel,educationLevel,city,region,airportCode,employmentForm,workHours,relocationAllowed,businessTrips,aircraftCategory,requiredLicense,minFlightHours,requiredTypeRating,const DeepCollectionEquality().hash(_skills),isPublished,isActive,const DeepCollectionEquality().hash(_additionalImageUrls)]);

@override
String toString() {
  return 'JobVacancyEditEvent.update(id: $id, title: $title, contactProfileId: $contactProfileId, description: $description, responsibilities: $responsibilities, requirements: $requirements, conditions: $conditions, salaryFrom: $salaryFrom, salaryTo: $salaryTo, currency: $currency, isGross: $isGross, employmentType: $employmentType, schedule: $schedule, experienceLevel: $experienceLevel, educationLevel: $educationLevel, city: $city, region: $region, airportCode: $airportCode, employmentForm: $employmentForm, workHours: $workHours, relocationAllowed: $relocationAllowed, businessTrips: $businessTrips, aircraftCategory: $aircraftCategory, requiredLicense: $requiredLicense, minFlightHours: $minFlightHours, requiredTypeRating: $requiredTypeRating, skills: $skills, isPublished: $isPublished, isActive: $isActive, additionalImageUrls: $additionalImageUrls)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $JobVacancyEditEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 int id, String? title, int? contactProfileId, String? description, String? responsibilities, String? requirements, String? conditions, int? salaryFrom, int? salaryTo, String? currency, bool? isGross, String? employmentType, String? schedule, String? experienceLevel, String? educationLevel, String? city, String? region, String? airportCode, String? employmentForm, String? workHours, bool? relocationAllowed, String? businessTrips, String? aircraftCategory, String? requiredLicense, int? minFlightHours, String? requiredTypeRating, List<String>? skills, bool? isPublished, bool? isActive, List<String>? additionalImageUrls
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? contactProfileId = freezed,Object? description = freezed,Object? responsibilities = freezed,Object? requirements = freezed,Object? conditions = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? currency = freezed,Object? isGross = freezed,Object? employmentType = freezed,Object? schedule = freezed,Object? experienceLevel = freezed,Object? educationLevel = freezed,Object? city = freezed,Object? region = freezed,Object? airportCode = freezed,Object? employmentForm = freezed,Object? workHours = freezed,Object? relocationAllowed = freezed,Object? businessTrips = freezed,Object? aircraftCategory = freezed,Object? requiredLicense = freezed,Object? minFlightHours = freezed,Object? requiredTypeRating = freezed,Object? skills = freezed,Object? isPublished = freezed,Object? isActive = freezed,Object? additionalImageUrls = freezed,}) {
  return _then(_Update(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,contactProfileId: freezed == contactProfileId ? _self.contactProfileId : contactProfileId // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,responsibilities: freezed == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as String?,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,conditions: freezed == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,isGross: freezed == isGross ? _self.isGross : isGross // ignore: cast_nullable_to_non_nullable
as bool?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as String?,experienceLevel: freezed == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String?,educationLevel: freezed == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,airportCode: freezed == airportCode ? _self.airportCode : airportCode // ignore: cast_nullable_to_non_nullable
as String?,employmentForm: freezed == employmentForm ? _self.employmentForm : employmentForm // ignore: cast_nullable_to_non_nullable
as String?,workHours: freezed == workHours ? _self.workHours : workHours // ignore: cast_nullable_to_non_nullable
as String?,relocationAllowed: freezed == relocationAllowed ? _self.relocationAllowed : relocationAllowed // ignore: cast_nullable_to_non_nullable
as bool?,businessTrips: freezed == businessTrips ? _self.businessTrips : businessTrips // ignore: cast_nullable_to_non_nullable
as String?,aircraftCategory: freezed == aircraftCategory ? _self.aircraftCategory : aircraftCategory // ignore: cast_nullable_to_non_nullable
as String?,requiredLicense: freezed == requiredLicense ? _self.requiredLicense : requiredLicense // ignore: cast_nullable_to_non_nullable
as String?,minFlightHours: freezed == minFlightHours ? _self.minFlightHours : minFlightHours // ignore: cast_nullable_to_non_nullable
as int?,requiredTypeRating: freezed == requiredTypeRating ? _self.requiredTypeRating : requiredTypeRating // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,isPublished: freezed == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,additionalImageUrls: freezed == additionalImageUrls ? _self._additionalImageUrls : additionalImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc


class _Delete implements JobVacancyEditEvent {
  const _Delete({required this.id});
  

 final  int id;

/// Create a copy of JobVacancyEditEvent
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
  return 'JobVacancyEditEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $JobVacancyEditEventCopyWith<$Res> {
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

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Delete(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Publish implements JobVacancyEditEvent {
  const _Publish({required this.id});
  

 final  int id;

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishCopyWith<_Publish> get copyWith => __$PublishCopyWithImpl<_Publish>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Publish&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'JobVacancyEditEvent.publish(id: $id)';
}


}

/// @nodoc
abstract mixin class _$PublishCopyWith<$Res> implements $JobVacancyEditEventCopyWith<$Res> {
  factory _$PublishCopyWith(_Publish value, $Res Function(_Publish) _then) = __$PublishCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$PublishCopyWithImpl<$Res>
    implements _$PublishCopyWith<$Res> {
  __$PublishCopyWithImpl(this._self, this._then);

  final _Publish _self;
  final $Res Function(_Publish) _then;

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Publish(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Unpublish implements JobVacancyEditEvent {
  const _Unpublish({required this.id});
  

 final  int id;

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnpublishCopyWith<_Unpublish> get copyWith => __$UnpublishCopyWithImpl<_Unpublish>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unpublish&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'JobVacancyEditEvent.unpublish(id: $id)';
}


}

/// @nodoc
abstract mixin class _$UnpublishCopyWith<$Res> implements $JobVacancyEditEventCopyWith<$Res> {
  factory _$UnpublishCopyWith(_Unpublish value, $Res Function(_Unpublish) _then) = __$UnpublishCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$UnpublishCopyWithImpl<$Res>
    implements _$UnpublishCopyWith<$Res> {
  __$UnpublishCopyWithImpl(this._self, this._then);

  final _Unpublish _self;
  final $Res Function(_Unpublish) _then;

/// Create a copy of JobVacancyEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Unpublish(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$JobVacancyEditState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobVacancyEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditState()';
}


}

/// @nodoc
class $JobVacancyEditStateCopyWith<$Res>  {
$JobVacancyEditStateCopyWith(JobVacancyEditState _, $Res Function(JobVacancyEditState) __);
}


/// Adds pattern-matching-related methods to [JobVacancyEditState].
extension JobVacancyEditStatePatterns on JobVacancyEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Creating value)?  creating,TResult Function( _Updating value)?  updating,TResult Function( _Deleting value)?  deleting,TResult Function( _Publishing value)?  publishing,TResult Function( _Unpublishing value)?  unpublishing,TResult Function( _Created value)?  created,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Published value)?  published,TResult Function( _Unpublished value)?  unpublished,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Creating() when creating != null:
return creating(_that);case _Updating() when updating != null:
return updating(_that);case _Deleting() when deleting != null:
return deleting(_that);case _Publishing() when publishing != null:
return publishing(_that);case _Unpublishing() when unpublishing != null:
return unpublishing(_that);case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Published() when published != null:
return published(_that);case _Unpublished() when unpublished != null:
return unpublished(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Creating value)  creating,required TResult Function( _Updating value)  updating,required TResult Function( _Deleting value)  deleting,required TResult Function( _Publishing value)  publishing,required TResult Function( _Unpublishing value)  unpublishing,required TResult Function( _Created value)  created,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Published value)  published,required TResult Function( _Unpublished value)  unpublished,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Creating():
return creating(_that);case _Updating():
return updating(_that);case _Deleting():
return deleting(_that);case _Publishing():
return publishing(_that);case _Unpublishing():
return unpublishing(_that);case _Created():
return created(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Published():
return published(_that);case _Unpublished():
return unpublished(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Creating value)?  creating,TResult? Function( _Updating value)?  updating,TResult? Function( _Deleting value)?  deleting,TResult? Function( _Publishing value)?  publishing,TResult? Function( _Unpublishing value)?  unpublishing,TResult? Function( _Created value)?  created,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Published value)?  published,TResult? Function( _Unpublished value)?  unpublished,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Creating() when creating != null:
return creating(_that);case _Updating() when updating != null:
return updating(_that);case _Deleting() when deleting != null:
return deleting(_that);case _Publishing() when publishing != null:
return publishing(_that);case _Unpublishing() when unpublishing != null:
return unpublishing(_that);case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Published() when published != null:
return published(_that);case _Unpublished() when unpublished != null:
return unpublished(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  creating,TResult Function()?  updating,TResult Function()?  deleting,TResult Function()?  publishing,TResult Function()?  unpublishing,TResult Function( JobVacancyEntity vacancy)?  created,TResult Function( JobVacancyEntity vacancy)?  updated,TResult Function( int id)?  deleted,TResult Function( JobVacancyEntity vacancy)?  published,TResult Function( JobVacancyEntity vacancy)?  unpublished,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Creating() when creating != null:
return creating();case _Updating() when updating != null:
return updating();case _Deleting() when deleting != null:
return deleting();case _Publishing() when publishing != null:
return publishing();case _Unpublishing() when unpublishing != null:
return unpublishing();case _Created() when created != null:
return created(_that.vacancy);case _Updated() when updated != null:
return updated(_that.vacancy);case _Deleted() when deleted != null:
return deleted(_that.id);case _Published() when published != null:
return published(_that.vacancy);case _Unpublished() when unpublished != null:
return unpublished(_that.vacancy);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  creating,required TResult Function()  updating,required TResult Function()  deleting,required TResult Function()  publishing,required TResult Function()  unpublishing,required TResult Function( JobVacancyEntity vacancy)  created,required TResult Function( JobVacancyEntity vacancy)  updated,required TResult Function( int id)  deleted,required TResult Function( JobVacancyEntity vacancy)  published,required TResult Function( JobVacancyEntity vacancy)  unpublished,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Creating():
return creating();case _Updating():
return updating();case _Deleting():
return deleting();case _Publishing():
return publishing();case _Unpublishing():
return unpublishing();case _Created():
return created(_that.vacancy);case _Updated():
return updated(_that.vacancy);case _Deleted():
return deleted(_that.id);case _Published():
return published(_that.vacancy);case _Unpublished():
return unpublished(_that.vacancy);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  creating,TResult? Function()?  updating,TResult? Function()?  deleting,TResult? Function()?  publishing,TResult? Function()?  unpublishing,TResult? Function( JobVacancyEntity vacancy)?  created,TResult? Function( JobVacancyEntity vacancy)?  updated,TResult? Function( int id)?  deleted,TResult? Function( JobVacancyEntity vacancy)?  published,TResult? Function( JobVacancyEntity vacancy)?  unpublished,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Creating() when creating != null:
return creating();case _Updating() when updating != null:
return updating();case _Deleting() when deleting != null:
return deleting();case _Publishing() when publishing != null:
return publishing();case _Unpublishing() when unpublishing != null:
return unpublishing();case _Created() when created != null:
return created(_that.vacancy);case _Updated() when updated != null:
return updated(_that.vacancy);case _Deleted() when deleted != null:
return deleted(_that.id);case _Published() when published != null:
return published(_that.vacancy);case _Unpublished() when unpublished != null:
return unpublished(_that.vacancy);case _Error() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements JobVacancyEditState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditState.initial()';
}


}




/// @nodoc


class _Creating implements JobVacancyEditState {
  const _Creating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Creating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditState.creating()';
}


}




/// @nodoc


class _Updating implements JobVacancyEditState {
  const _Updating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditState.updating()';
}


}




/// @nodoc


class _Deleting implements JobVacancyEditState {
  const _Deleting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditState.deleting()';
}


}




/// @nodoc


class _Publishing implements JobVacancyEditState {
  const _Publishing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Publishing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditState.publishing()';
}


}




/// @nodoc


class _Unpublishing implements JobVacancyEditState {
  const _Unpublishing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unpublishing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobVacancyEditState.unpublishing()';
}


}




/// @nodoc


class _Created implements JobVacancyEditState {
  const _Created({required this.vacancy});
  

 final  JobVacancyEntity vacancy;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy));
}


@override
int get hashCode => Object.hash(runtimeType,vacancy);

@override
String toString() {
  return 'JobVacancyEditState.created(vacancy: $vacancy)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $JobVacancyEditStateCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 JobVacancyEntity vacancy
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancy = null,}) {
  return _then(_Created(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as JobVacancyEntity,
  ));
}


}

/// @nodoc


class _Updated implements JobVacancyEditState {
  const _Updated({required this.vacancy});
  

 final  JobVacancyEntity vacancy;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy));
}


@override
int get hashCode => Object.hash(runtimeType,vacancy);

@override
String toString() {
  return 'JobVacancyEditState.updated(vacancy: $vacancy)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $JobVacancyEditStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 JobVacancyEntity vacancy
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancy = null,}) {
  return _then(_Updated(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as JobVacancyEntity,
  ));
}


}

/// @nodoc


class _Deleted implements JobVacancyEditState {
  const _Deleted({required this.id});
  

 final  int id;

/// Create a copy of JobVacancyEditState
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
  return 'JobVacancyEditState.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $JobVacancyEditStateCopyWith<$Res> {
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

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Deleted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Published implements JobVacancyEditState {
  const _Published({required this.vacancy});
  

 final  JobVacancyEntity vacancy;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishedCopyWith<_Published> get copyWith => __$PublishedCopyWithImpl<_Published>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Published&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy));
}


@override
int get hashCode => Object.hash(runtimeType,vacancy);

@override
String toString() {
  return 'JobVacancyEditState.published(vacancy: $vacancy)';
}


}

/// @nodoc
abstract mixin class _$PublishedCopyWith<$Res> implements $JobVacancyEditStateCopyWith<$Res> {
  factory _$PublishedCopyWith(_Published value, $Res Function(_Published) _then) = __$PublishedCopyWithImpl;
@useResult
$Res call({
 JobVacancyEntity vacancy
});




}
/// @nodoc
class __$PublishedCopyWithImpl<$Res>
    implements _$PublishedCopyWith<$Res> {
  __$PublishedCopyWithImpl(this._self, this._then);

  final _Published _self;
  final $Res Function(_Published) _then;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancy = null,}) {
  return _then(_Published(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as JobVacancyEntity,
  ));
}


}

/// @nodoc


class _Unpublished implements JobVacancyEditState {
  const _Unpublished({required this.vacancy});
  

 final  JobVacancyEntity vacancy;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnpublishedCopyWith<_Unpublished> get copyWith => __$UnpublishedCopyWithImpl<_Unpublished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unpublished&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy));
}


@override
int get hashCode => Object.hash(runtimeType,vacancy);

@override
String toString() {
  return 'JobVacancyEditState.unpublished(vacancy: $vacancy)';
}


}

/// @nodoc
abstract mixin class _$UnpublishedCopyWith<$Res> implements $JobVacancyEditStateCopyWith<$Res> {
  factory _$UnpublishedCopyWith(_Unpublished value, $Res Function(_Unpublished) _then) = __$UnpublishedCopyWithImpl;
@useResult
$Res call({
 JobVacancyEntity vacancy
});




}
/// @nodoc
class __$UnpublishedCopyWithImpl<$Res>
    implements _$UnpublishedCopyWith<$Res> {
  __$UnpublishedCopyWithImpl(this._self, this._then);

  final _Unpublished _self;
  final $Res Function(_Unpublished) _then;

/// Create a copy of JobVacancyEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vacancy = null,}) {
  return _then(_Unpublished(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as JobVacancyEntity,
  ));
}


}

/// @nodoc


class _Error implements JobVacancyEditState {
  const _Error({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of JobVacancyEditState
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
  return 'JobVacancyEditState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $JobVacancyEditStateCopyWith<$Res> {
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

/// Create a copy of JobVacancyEditState
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
