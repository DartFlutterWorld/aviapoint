// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetProfileEvent value)?  get,TResult Function( InitialProfileEvent value)?  initial,TResult Function( UpdateProfileEvent value)?  update,TResult Function( UploadProfilePhotoEvent value)?  uploadPhoto,TResult Function( DeleteAccountEvent value)?  deleteAccount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetProfileEvent() when get != null:
return get(_that);case InitialProfileEvent() when initial != null:
return initial(_that);case UpdateProfileEvent() when update != null:
return update(_that);case UploadProfilePhotoEvent() when uploadPhoto != null:
return uploadPhoto(_that);case DeleteAccountEvent() when deleteAccount != null:
return deleteAccount(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetProfileEvent value)  get,required TResult Function( InitialProfileEvent value)  initial,required TResult Function( UpdateProfileEvent value)  update,required TResult Function( UploadProfilePhotoEvent value)  uploadPhoto,required TResult Function( DeleteAccountEvent value)  deleteAccount,}){
final _that = this;
switch (_that) {
case GetProfileEvent():
return get(_that);case InitialProfileEvent():
return initial(_that);case UpdateProfileEvent():
return update(_that);case UploadProfilePhotoEvent():
return uploadPhoto(_that);case DeleteAccountEvent():
return deleteAccount(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetProfileEvent value)?  get,TResult? Function( InitialProfileEvent value)?  initial,TResult? Function( UpdateProfileEvent value)?  update,TResult? Function( UploadProfilePhotoEvent value)?  uploadPhoto,TResult? Function( DeleteAccountEvent value)?  deleteAccount,}){
final _that = this;
switch (_that) {
case GetProfileEvent() when get != null:
return get(_that);case InitialProfileEvent() when initial != null:
return initial(_that);case UpdateProfileEvent() when update != null:
return update(_that);case UploadProfilePhotoEvent() when uploadPhoto != null:
return uploadPhoto(_that);case DeleteAccountEvent() when deleteAccount != null:
return deleteAccount(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  get,TResult Function()?  initial,TResult Function( String? email,  String? firstName,  String? lastName,  String? telegram,  String? max)?  update,TResult Function( XFile photo)?  uploadPhoto,TResult Function()?  deleteAccount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetProfileEvent() when get != null:
return get();case InitialProfileEvent() when initial != null:
return initial();case UpdateProfileEvent() when update != null:
return update(_that.email,_that.firstName,_that.lastName,_that.telegram,_that.max);case UploadProfilePhotoEvent() when uploadPhoto != null:
return uploadPhoto(_that.photo);case DeleteAccountEvent() when deleteAccount != null:
return deleteAccount();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  get,required TResult Function()  initial,required TResult Function( String? email,  String? firstName,  String? lastName,  String? telegram,  String? max)  update,required TResult Function( XFile photo)  uploadPhoto,required TResult Function()  deleteAccount,}) {final _that = this;
switch (_that) {
case GetProfileEvent():
return get();case InitialProfileEvent():
return initial();case UpdateProfileEvent():
return update(_that.email,_that.firstName,_that.lastName,_that.telegram,_that.max);case UploadProfilePhotoEvent():
return uploadPhoto(_that.photo);case DeleteAccountEvent():
return deleteAccount();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  get,TResult? Function()?  initial,TResult? Function( String? email,  String? firstName,  String? lastName,  String? telegram,  String? max)?  update,TResult? Function( XFile photo)?  uploadPhoto,TResult? Function()?  deleteAccount,}) {final _that = this;
switch (_that) {
case GetProfileEvent() when get != null:
return get();case InitialProfileEvent() when initial != null:
return initial();case UpdateProfileEvent() when update != null:
return update(_that.email,_that.firstName,_that.lastName,_that.telegram,_that.max);case UploadProfilePhotoEvent() when uploadPhoto != null:
return uploadPhoto(_that.photo);case DeleteAccountEvent() when deleteAccount != null:
return deleteAccount();case _:
  return null;

}
}

}

/// @nodoc


class GetProfileEvent extends ProfileEvent {
  const GetProfileEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.get()';
}


}




/// @nodoc


class InitialProfileEvent extends ProfileEvent {
  const InitialProfileEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.initial()';
}


}




/// @nodoc


class UpdateProfileEvent extends ProfileEvent {
  const UpdateProfileEvent({this.email, this.firstName, this.lastName, this.telegram, this.max}): super._();
  

 final  String? email;
 final  String? firstName;
 final  String? lastName;
 final  String? telegram;
 final  String? max;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileEventCopyWith<UpdateProfileEvent> get copyWith => _$UpdateProfileEventCopyWithImpl<UpdateProfileEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.max, max) || other.max == max));
}


@override
int get hashCode => Object.hash(runtimeType,email,firstName,lastName,telegram,max);

@override
String toString() {
  return 'ProfileEvent.update(email: $email, firstName: $firstName, lastName: $lastName, telegram: $telegram, max: $max)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileEventCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileEventCopyWith(UpdateProfileEvent value, $Res Function(UpdateProfileEvent) _then) = _$UpdateProfileEventCopyWithImpl;
@useResult
$Res call({
 String? email, String? firstName, String? lastName, String? telegram, String? max
});




}
/// @nodoc
class _$UpdateProfileEventCopyWithImpl<$Res>
    implements $UpdateProfileEventCopyWith<$Res> {
  _$UpdateProfileEventCopyWithImpl(this._self, this._then);

  final UpdateProfileEvent _self;
  final $Res Function(UpdateProfileEvent) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? telegram = freezed,Object? max = freezed,}) {
  return _then(UpdateProfileEvent(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UploadProfilePhotoEvent extends ProfileEvent {
  const UploadProfilePhotoEvent(this.photo): super._();
  

 final  XFile photo;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadProfilePhotoEventCopyWith<UploadProfilePhotoEvent> get copyWith => _$UploadProfilePhotoEventCopyWithImpl<UploadProfilePhotoEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadProfilePhotoEvent&&(identical(other.photo, photo) || other.photo == photo));
}


@override
int get hashCode => Object.hash(runtimeType,photo);

@override
String toString() {
  return 'ProfileEvent.uploadPhoto(photo: $photo)';
}


}

/// @nodoc
abstract mixin class $UploadProfilePhotoEventCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UploadProfilePhotoEventCopyWith(UploadProfilePhotoEvent value, $Res Function(UploadProfilePhotoEvent) _then) = _$UploadProfilePhotoEventCopyWithImpl;
@useResult
$Res call({
 XFile photo
});




}
/// @nodoc
class _$UploadProfilePhotoEventCopyWithImpl<$Res>
    implements $UploadProfilePhotoEventCopyWith<$Res> {
  _$UploadProfilePhotoEventCopyWithImpl(this._self, this._then);

  final UploadProfilePhotoEvent _self;
  final $Res Function(UploadProfilePhotoEvent) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? photo = null,}) {
  return _then(UploadProfilePhotoEvent(
null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as XFile,
  ));
}


}

/// @nodoc


class DeleteAccountEvent extends ProfileEvent {
  const DeleteAccountEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAccountEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.deleteAccount()';
}


}




/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingProfileState value)?  loading,TResult Function( ErrorProfileState value)?  error,TResult Function( SuccessProfileState value)?  success,TResult Function( InitialProfileState value)?  initial,TResult Function( DeletingAccountState value)?  deleting,TResult Function( DeletedAccountState value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingProfileState() when loading != null:
return loading(_that);case ErrorProfileState() when error != null:
return error(_that);case SuccessProfileState() when success != null:
return success(_that);case InitialProfileState() when initial != null:
return initial(_that);case DeletingAccountState() when deleting != null:
return deleting(_that);case DeletedAccountState() when deleted != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingProfileState value)  loading,required TResult Function( ErrorProfileState value)  error,required TResult Function( SuccessProfileState value)  success,required TResult Function( InitialProfileState value)  initial,required TResult Function( DeletingAccountState value)  deleting,required TResult Function( DeletedAccountState value)  deleted,}){
final _that = this;
switch (_that) {
case LoadingProfileState():
return loading(_that);case ErrorProfileState():
return error(_that);case SuccessProfileState():
return success(_that);case InitialProfileState():
return initial(_that);case DeletingAccountState():
return deleting(_that);case DeletedAccountState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingProfileState value)?  loading,TResult? Function( ErrorProfileState value)?  error,TResult? Function( SuccessProfileState value)?  success,TResult? Function( InitialProfileState value)?  initial,TResult? Function( DeletingAccountState value)?  deleting,TResult? Function( DeletedAccountState value)?  deleted,}){
final _that = this;
switch (_that) {
case LoadingProfileState() when loading != null:
return loading(_that);case ErrorProfileState() when error != null:
return error(_that);case SuccessProfileState() when success != null:
return success(_that);case InitialProfileState() when initial != null:
return initial(_that);case DeletingAccountState() when deleting != null:
return deleting(_that);case DeletedAccountState() when deleted != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( ProfileEntity profile)?  success,TResult Function()?  initial,TResult Function()?  deleting,TResult Function()?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingProfileState() when loading != null:
return loading();case ErrorProfileState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessProfileState() when success != null:
return success(_that.profile);case InitialProfileState() when initial != null:
return initial();case DeletingAccountState() when deleting != null:
return deleting();case DeletedAccountState() when deleted != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( ProfileEntity profile)  success,required TResult Function()  initial,required TResult Function()  deleting,required TResult Function()  deleted,}) {final _that = this;
switch (_that) {
case LoadingProfileState():
return loading();case ErrorProfileState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessProfileState():
return success(_that.profile);case InitialProfileState():
return initial();case DeletingAccountState():
return deleting();case DeletedAccountState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( ProfileEntity profile)?  success,TResult? Function()?  initial,TResult? Function()?  deleting,TResult? Function()?  deleted,}) {final _that = this;
switch (_that) {
case LoadingProfileState() when loading != null:
return loading();case ErrorProfileState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessProfileState() when success != null:
return success(_that.profile);case InitialProfileState() when initial != null:
return initial();case DeletingAccountState() when deleting != null:
return deleting();case DeletedAccountState() when deleted != null:
return deleted();case _:
  return null;

}
}

}

/// @nodoc


class LoadingProfileState extends ProfileState {
  const LoadingProfileState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class ErrorProfileState extends ProfileState {
  const ErrorProfileState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorProfileStateCopyWith<ErrorProfileState> get copyWith => _$ErrorProfileStateCopyWithImpl<ErrorProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorProfileState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'ProfileState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ErrorProfileStateCopyWith(ErrorProfileState value, $Res Function(ErrorProfileState) _then) = _$ErrorProfileStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorProfileStateCopyWithImpl<$Res>
    implements $ErrorProfileStateCopyWith<$Res> {
  _$ErrorProfileStateCopyWithImpl(this._self, this._then);

  final ErrorProfileState _self;
  final $Res Function(ErrorProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorProfileState(
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


class SuccessProfileState extends ProfileState {
  const SuccessProfileState({required this.profile}): super._();
  

 final  ProfileEntity profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessProfileStateCopyWith<SuccessProfileState> get copyWith => _$SuccessProfileStateCopyWithImpl<SuccessProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessProfileState&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileState.success(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $SuccessProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $SuccessProfileStateCopyWith(SuccessProfileState value, $Res Function(SuccessProfileState) _then) = _$SuccessProfileStateCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile
});




}
/// @nodoc
class _$SuccessProfileStateCopyWithImpl<$Res>
    implements $SuccessProfileStateCopyWith<$Res> {
  _$SuccessProfileStateCopyWithImpl(this._self, this._then);

  final SuccessProfileState _self;
  final $Res Function(SuccessProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(SuccessProfileState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,
  ));
}


}

/// @nodoc


class InitialProfileState extends ProfileState {
  const InitialProfileState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class DeletingAccountState extends ProfileState {
  const DeletingAccountState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletingAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.deleting()';
}


}




/// @nodoc


class DeletedAccountState extends ProfileState {
  const DeletedAccountState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.deleted()';
}


}




// dart format on
