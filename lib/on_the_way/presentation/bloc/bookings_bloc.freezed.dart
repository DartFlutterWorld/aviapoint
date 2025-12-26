// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingsState()';
}


}

/// @nodoc
class $BookingsStateCopyWith<$Res>  {
$BookingsStateCopyWith(BookingsState _, $Res Function(BookingsState) __);
}


/// Adds pattern-matching-related methods to [BookingsState].
extension BookingsStatePatterns on BookingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingBookingsState value)?  loading,TResult Function( ErrorBookingsState value)?  error,TResult Function( SuccessBookingsState value)?  success,TResult Function( BookingCreatedState value)?  bookingCreated,TResult Function( BookingConfirmedState value)?  bookingConfirmed,TResult Function( BookingCancelledState value)?  bookingCancelled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingBookingsState() when loading != null:
return loading(_that);case ErrorBookingsState() when error != null:
return error(_that);case SuccessBookingsState() when success != null:
return success(_that);case BookingCreatedState() when bookingCreated != null:
return bookingCreated(_that);case BookingConfirmedState() when bookingConfirmed != null:
return bookingConfirmed(_that);case BookingCancelledState() when bookingCancelled != null:
return bookingCancelled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingBookingsState value)  loading,required TResult Function( ErrorBookingsState value)  error,required TResult Function( SuccessBookingsState value)  success,required TResult Function( BookingCreatedState value)  bookingCreated,required TResult Function( BookingConfirmedState value)  bookingConfirmed,required TResult Function( BookingCancelledState value)  bookingCancelled,}){
final _that = this;
switch (_that) {
case LoadingBookingsState():
return loading(_that);case ErrorBookingsState():
return error(_that);case SuccessBookingsState():
return success(_that);case BookingCreatedState():
return bookingCreated(_that);case BookingConfirmedState():
return bookingConfirmed(_that);case BookingCancelledState():
return bookingCancelled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingBookingsState value)?  loading,TResult? Function( ErrorBookingsState value)?  error,TResult? Function( SuccessBookingsState value)?  success,TResult? Function( BookingCreatedState value)?  bookingCreated,TResult? Function( BookingConfirmedState value)?  bookingConfirmed,TResult? Function( BookingCancelledState value)?  bookingCancelled,}){
final _that = this;
switch (_that) {
case LoadingBookingsState() when loading != null:
return loading(_that);case ErrorBookingsState() when error != null:
return error(_that);case SuccessBookingsState() when success != null:
return success(_that);case BookingCreatedState() when bookingCreated != null:
return bookingCreated(_that);case BookingConfirmedState() when bookingConfirmed != null:
return bookingConfirmed(_that);case BookingCancelledState() when bookingCancelled != null:
return bookingCancelled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<BookingEntity> bookings)?  success,TResult Function( BookingEntity booking)?  bookingCreated,TResult Function( BookingEntity booking)?  bookingConfirmed,TResult Function( BookingEntity booking)?  bookingCancelled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingBookingsState() when loading != null:
return loading();case ErrorBookingsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBookingsState() when success != null:
return success(_that.bookings);case BookingCreatedState() when bookingCreated != null:
return bookingCreated(_that.booking);case BookingConfirmedState() when bookingConfirmed != null:
return bookingConfirmed(_that.booking);case BookingCancelledState() when bookingCancelled != null:
return bookingCancelled(_that.booking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<BookingEntity> bookings)  success,required TResult Function( BookingEntity booking)  bookingCreated,required TResult Function( BookingEntity booking)  bookingConfirmed,required TResult Function( BookingEntity booking)  bookingCancelled,}) {final _that = this;
switch (_that) {
case LoadingBookingsState():
return loading();case ErrorBookingsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBookingsState():
return success(_that.bookings);case BookingCreatedState():
return bookingCreated(_that.booking);case BookingConfirmedState():
return bookingConfirmed(_that.booking);case BookingCancelledState():
return bookingCancelled(_that.booking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<BookingEntity> bookings)?  success,TResult? Function( BookingEntity booking)?  bookingCreated,TResult? Function( BookingEntity booking)?  bookingConfirmed,TResult? Function( BookingEntity booking)?  bookingCancelled,}) {final _that = this;
switch (_that) {
case LoadingBookingsState() when loading != null:
return loading();case ErrorBookingsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessBookingsState() when success != null:
return success(_that.bookings);case BookingCreatedState() when bookingCreated != null:
return bookingCreated(_that.booking);case BookingConfirmedState() when bookingConfirmed != null:
return bookingConfirmed(_that.booking);case BookingCancelledState() when bookingCancelled != null:
return bookingCancelled(_that.booking);case _:
  return null;

}
}

}

/// @nodoc


class LoadingBookingsState extends BookingsState {
  const LoadingBookingsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBookingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingsState.loading()';
}


}




/// @nodoc


class ErrorBookingsState extends BookingsState {
  const ErrorBookingsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBookingsStateCopyWith<ErrorBookingsState> get copyWith => _$ErrorBookingsStateCopyWithImpl<ErrorBookingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBookingsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'BookingsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorBookingsStateCopyWith<$Res> implements $BookingsStateCopyWith<$Res> {
  factory $ErrorBookingsStateCopyWith(ErrorBookingsState value, $Res Function(ErrorBookingsState) _then) = _$ErrorBookingsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorBookingsStateCopyWithImpl<$Res>
    implements $ErrorBookingsStateCopyWith<$Res> {
  _$ErrorBookingsStateCopyWithImpl(this._self, this._then);

  final ErrorBookingsState _self;
  final $Res Function(ErrorBookingsState) _then;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorBookingsState(
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


class SuccessBookingsState extends BookingsState {
  const SuccessBookingsState({required final  List<BookingEntity> bookings}): _bookings = bookings,super._();
  

 final  List<BookingEntity> _bookings;
 List<BookingEntity> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}


/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessBookingsStateCopyWith<SuccessBookingsState> get copyWith => _$SuccessBookingsStateCopyWithImpl<SuccessBookingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessBookingsState&&const DeepCollectionEquality().equals(other._bookings, _bookings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bookings));

@override
String toString() {
  return 'BookingsState.success(bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class $SuccessBookingsStateCopyWith<$Res> implements $BookingsStateCopyWith<$Res> {
  factory $SuccessBookingsStateCopyWith(SuccessBookingsState value, $Res Function(SuccessBookingsState) _then) = _$SuccessBookingsStateCopyWithImpl;
@useResult
$Res call({
 List<BookingEntity> bookings
});




}
/// @nodoc
class _$SuccessBookingsStateCopyWithImpl<$Res>
    implements $SuccessBookingsStateCopyWith<$Res> {
  _$SuccessBookingsStateCopyWithImpl(this._self, this._then);

  final SuccessBookingsState _self;
  final $Res Function(SuccessBookingsState) _then;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookings = null,}) {
  return _then(SuccessBookingsState(
bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<BookingEntity>,
  ));
}


}

/// @nodoc


class BookingCreatedState extends BookingsState {
  const BookingCreatedState({required this.booking}): super._();
  

 final  BookingEntity booking;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCreatedStateCopyWith<BookingCreatedState> get copyWith => _$BookingCreatedStateCopyWithImpl<BookingCreatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCreatedState&&(identical(other.booking, booking) || other.booking == booking));
}


@override
int get hashCode => Object.hash(runtimeType,booking);

@override
String toString() {
  return 'BookingsState.bookingCreated(booking: $booking)';
}


}

/// @nodoc
abstract mixin class $BookingCreatedStateCopyWith<$Res> implements $BookingsStateCopyWith<$Res> {
  factory $BookingCreatedStateCopyWith(BookingCreatedState value, $Res Function(BookingCreatedState) _then) = _$BookingCreatedStateCopyWithImpl;
@useResult
$Res call({
 BookingEntity booking
});




}
/// @nodoc
class _$BookingCreatedStateCopyWithImpl<$Res>
    implements $BookingCreatedStateCopyWith<$Res> {
  _$BookingCreatedStateCopyWithImpl(this._self, this._then);

  final BookingCreatedState _self;
  final $Res Function(BookingCreatedState) _then;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? booking = null,}) {
  return _then(BookingCreatedState(
booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingEntity,
  ));
}


}

/// @nodoc


class BookingConfirmedState extends BookingsState {
  const BookingConfirmedState({required this.booking}): super._();
  

 final  BookingEntity booking;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingConfirmedStateCopyWith<BookingConfirmedState> get copyWith => _$BookingConfirmedStateCopyWithImpl<BookingConfirmedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingConfirmedState&&(identical(other.booking, booking) || other.booking == booking));
}


@override
int get hashCode => Object.hash(runtimeType,booking);

@override
String toString() {
  return 'BookingsState.bookingConfirmed(booking: $booking)';
}


}

/// @nodoc
abstract mixin class $BookingConfirmedStateCopyWith<$Res> implements $BookingsStateCopyWith<$Res> {
  factory $BookingConfirmedStateCopyWith(BookingConfirmedState value, $Res Function(BookingConfirmedState) _then) = _$BookingConfirmedStateCopyWithImpl;
@useResult
$Res call({
 BookingEntity booking
});




}
/// @nodoc
class _$BookingConfirmedStateCopyWithImpl<$Res>
    implements $BookingConfirmedStateCopyWith<$Res> {
  _$BookingConfirmedStateCopyWithImpl(this._self, this._then);

  final BookingConfirmedState _self;
  final $Res Function(BookingConfirmedState) _then;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? booking = null,}) {
  return _then(BookingConfirmedState(
booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingEntity,
  ));
}


}

/// @nodoc


class BookingCancelledState extends BookingsState {
  const BookingCancelledState({required this.booking}): super._();
  

 final  BookingEntity booking;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCancelledStateCopyWith<BookingCancelledState> get copyWith => _$BookingCancelledStateCopyWithImpl<BookingCancelledState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCancelledState&&(identical(other.booking, booking) || other.booking == booking));
}


@override
int get hashCode => Object.hash(runtimeType,booking);

@override
String toString() {
  return 'BookingsState.bookingCancelled(booking: $booking)';
}


}

/// @nodoc
abstract mixin class $BookingCancelledStateCopyWith<$Res> implements $BookingsStateCopyWith<$Res> {
  factory $BookingCancelledStateCopyWith(BookingCancelledState value, $Res Function(BookingCancelledState) _then) = _$BookingCancelledStateCopyWithImpl;
@useResult
$Res call({
 BookingEntity booking
});




}
/// @nodoc
class _$BookingCancelledStateCopyWithImpl<$Res>
    implements $BookingCancelledStateCopyWith<$Res> {
  _$BookingCancelledStateCopyWithImpl(this._self, this._then);

  final BookingCancelledState _self;
  final $Res Function(BookingCancelledState) _then;

/// Create a copy of BookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? booking = null,}) {
  return _then(BookingCancelledState(
booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingEntity,
  ));
}


}

// dart format on
