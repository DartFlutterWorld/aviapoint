// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SmsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SmsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SmsEvent()';
}


}

/// @nodoc
class $SmsEventCopyWith<$Res>  {
$SmsEventCopyWith(SmsEvent _, $Res Function(SmsEvent) __);
}


/// Adds pattern-matching-related methods to [SmsEvent].
extension SmsEventPatterns on SmsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetSmsEvent value)?  getSms,TResult Function( InitialSmsEvent value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetSmsEvent() when getSms != null:
return getSms(_that);case InitialSmsEvent() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetSmsEvent value)  getSms,required TResult Function( InitialSmsEvent value)  initial,}){
final _that = this;
switch (_that) {
case GetSmsEvent():
return getSms(_that);case InitialSmsEvent():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetSmsEvent value)?  getSms,TResult? Function( InitialSmsEvent value)?  initial,}){
final _that = this;
switch (_that) {
case GetSmsEvent() when getSms != null:
return getSms(_that);case InitialSmsEvent() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phone)?  getSms,TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetSmsEvent() when getSms != null:
return getSms(_that.phone);case InitialSmsEvent() when initial != null:
return initial();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phone)  getSms,required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case GetSmsEvent():
return getSms(_that.phone);case InitialSmsEvent():
return initial();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phone)?  getSms,TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case GetSmsEvent() when getSms != null:
return getSms(_that.phone);case InitialSmsEvent() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class GetSmsEvent extends SmsEvent {
  const GetSmsEvent({required this.phone}): super._();
  

 final  String phone;

/// Create a copy of SmsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSmsEventCopyWith<GetSmsEvent> get copyWith => _$GetSmsEventCopyWithImpl<GetSmsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSmsEvent&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'SmsEvent.getSms(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $GetSmsEventCopyWith<$Res> implements $SmsEventCopyWith<$Res> {
  factory $GetSmsEventCopyWith(GetSmsEvent value, $Res Function(GetSmsEvent) _then) = _$GetSmsEventCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$GetSmsEventCopyWithImpl<$Res>
    implements $GetSmsEventCopyWith<$Res> {
  _$GetSmsEventCopyWithImpl(this._self, this._then);

  final GetSmsEvent _self;
  final $Res Function(GetSmsEvent) _then;

/// Create a copy of SmsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(GetSmsEvent(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InitialSmsEvent extends SmsEvent {
  const InitialSmsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialSmsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SmsEvent.initial()';
}


}




/// @nodoc
mixin _$SmsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SmsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SmsState()';
}


}

/// @nodoc
class $SmsStateCopyWith<$Res>  {
$SmsStateCopyWith(SmsState _, $Res Function(SmsState) __);
}


/// Adds pattern-matching-related methods to [SmsState].
extension SmsStatePatterns on SmsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialSmsState value)?  initial,TResult Function( LoadingSmsState value)?  loading,TResult Function( ErrorSmsState value)?  error,TResult Function( SuccessSmsState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialSmsState() when initial != null:
return initial(_that);case LoadingSmsState() when loading != null:
return loading(_that);case ErrorSmsState() when error != null:
return error(_that);case SuccessSmsState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialSmsState value)  initial,required TResult Function( LoadingSmsState value)  loading,required TResult Function( ErrorSmsState value)  error,required TResult Function( SuccessSmsState value)  success,}){
final _that = this;
switch (_that) {
case InitialSmsState():
return initial(_that);case LoadingSmsState():
return loading(_that);case ErrorSmsState():
return error(_that);case SuccessSmsState():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialSmsState value)?  initial,TResult? Function( LoadingSmsState value)?  loading,TResult? Function( ErrorSmsState value)?  error,TResult? Function( SuccessSmsState value)?  success,}){
final _that = this;
switch (_that) {
case InitialSmsState() when initial != null:
return initial(_that);case LoadingSmsState() when loading != null:
return loading(_that);case ErrorSmsState() when error != null:
return error(_that);case SuccessSmsState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( SmsEntity sms)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialSmsState() when initial != null:
return initial();case LoadingSmsState() when loading != null:
return loading();case ErrorSmsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessSmsState() when success != null:
return success(_that.sms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( SmsEntity sms)  success,}) {final _that = this;
switch (_that) {
case InitialSmsState():
return initial();case LoadingSmsState():
return loading();case ErrorSmsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessSmsState():
return success(_that.sms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( SmsEntity sms)?  success,}) {final _that = this;
switch (_that) {
case InitialSmsState() when initial != null:
return initial();case LoadingSmsState() when loading != null:
return loading();case ErrorSmsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessSmsState() when success != null:
return success(_that.sms);case _:
  return null;

}
}

}

/// @nodoc


class InitialSmsState extends SmsState {
  const InitialSmsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialSmsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SmsState.initial()';
}


}




/// @nodoc


class LoadingSmsState extends SmsState {
  const LoadingSmsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingSmsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SmsState.loading()';
}


}




/// @nodoc


class ErrorSmsState extends SmsState {
  const ErrorSmsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of SmsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorSmsStateCopyWith<ErrorSmsState> get copyWith => _$ErrorSmsStateCopyWithImpl<ErrorSmsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorSmsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'SmsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorSmsStateCopyWith<$Res> implements $SmsStateCopyWith<$Res> {
  factory $ErrorSmsStateCopyWith(ErrorSmsState value, $Res Function(ErrorSmsState) _then) = _$ErrorSmsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorSmsStateCopyWithImpl<$Res>
    implements $ErrorSmsStateCopyWith<$Res> {
  _$ErrorSmsStateCopyWithImpl(this._self, this._then);

  final ErrorSmsState _self;
  final $Res Function(ErrorSmsState) _then;

/// Create a copy of SmsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorSmsState(
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


class SuccessSmsState extends SmsState {
  const SuccessSmsState(this.sms): super._();
  

 final  SmsEntity sms;

/// Create a copy of SmsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessSmsStateCopyWith<SuccessSmsState> get copyWith => _$SuccessSmsStateCopyWithImpl<SuccessSmsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessSmsState&&(identical(other.sms, sms) || other.sms == sms));
}


@override
int get hashCode => Object.hash(runtimeType,sms);

@override
String toString() {
  return 'SmsState.success(sms: $sms)';
}


}

/// @nodoc
abstract mixin class $SuccessSmsStateCopyWith<$Res> implements $SmsStateCopyWith<$Res> {
  factory $SuccessSmsStateCopyWith(SuccessSmsState value, $Res Function(SuccessSmsState) _then) = _$SuccessSmsStateCopyWithImpl;
@useResult
$Res call({
 SmsEntity sms
});




}
/// @nodoc
class _$SuccessSmsStateCopyWithImpl<$Res>
    implements $SuccessSmsStateCopyWith<$Res> {
  _$SuccessSmsStateCopyWithImpl(this._self, this._then);

  final SuccessSmsState _self;
  final $Res Function(SuccessSmsState) _then;

/// Create a copy of SmsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sms = null,}) {
  return _then(SuccessSmsState(
null == sms ? _self.sms : sms // ignore: cast_nullable_to_non_nullable
as SmsEntity,
  ));
}


}

// dart format on
