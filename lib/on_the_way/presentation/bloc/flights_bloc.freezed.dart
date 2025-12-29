// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flights_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightsState()';
}


}

/// @nodoc
class $FlightsStateCopyWith<$Res>  {
$FlightsStateCopyWith(FlightsState _, $Res Function(FlightsState) __);
}


/// Adds pattern-matching-related methods to [FlightsState].
extension FlightsStatePatterns on FlightsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingFlightsState value)?  loading,TResult Function( ErrorFlightsState value)?  error,TResult Function( SuccessFlightsState value)?  success,TResult Function( FlightCreatedState value)?  flightCreated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingFlightsState() when loading != null:
return loading(_that);case ErrorFlightsState() when error != null:
return error(_that);case SuccessFlightsState() when success != null:
return success(_that);case FlightCreatedState() when flightCreated != null:
return flightCreated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingFlightsState value)  loading,required TResult Function( ErrorFlightsState value)  error,required TResult Function( SuccessFlightsState value)  success,required TResult Function( FlightCreatedState value)  flightCreated,}){
final _that = this;
switch (_that) {
case LoadingFlightsState():
return loading(_that);case ErrorFlightsState():
return error(_that);case SuccessFlightsState():
return success(_that);case FlightCreatedState():
return flightCreated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingFlightsState value)?  loading,TResult? Function( ErrorFlightsState value)?  error,TResult? Function( SuccessFlightsState value)?  success,TResult? Function( FlightCreatedState value)?  flightCreated,}){
final _that = this;
switch (_that) {
case LoadingFlightsState() when loading != null:
return loading(_that);case ErrorFlightsState() when error != null:
return error(_that);case SuccessFlightsState() when success != null:
return success(_that);case FlightCreatedState() when flightCreated != null:
return flightCreated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<FlightEntity> flights,  String? airport,  String? departureAirport,  String? arrivalAirport,  DateTime? dateFrom,  DateTime? dateTo)?  success,TResult Function( FlightEntity flight)?  flightCreated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingFlightsState() when loading != null:
return loading();case ErrorFlightsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessFlightsState() when success != null:
return success(_that.flights,_that.airport,_that.departureAirport,_that.arrivalAirport,_that.dateFrom,_that.dateTo);case FlightCreatedState() when flightCreated != null:
return flightCreated(_that.flight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<FlightEntity> flights,  String? airport,  String? departureAirport,  String? arrivalAirport,  DateTime? dateFrom,  DateTime? dateTo)  success,required TResult Function( FlightEntity flight)  flightCreated,}) {final _that = this;
switch (_that) {
case LoadingFlightsState():
return loading();case ErrorFlightsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessFlightsState():
return success(_that.flights,_that.airport,_that.departureAirport,_that.arrivalAirport,_that.dateFrom,_that.dateTo);case FlightCreatedState():
return flightCreated(_that.flight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<FlightEntity> flights,  String? airport,  String? departureAirport,  String? arrivalAirport,  DateTime? dateFrom,  DateTime? dateTo)?  success,TResult? Function( FlightEntity flight)?  flightCreated,}) {final _that = this;
switch (_that) {
case LoadingFlightsState() when loading != null:
return loading();case ErrorFlightsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessFlightsState() when success != null:
return success(_that.flights,_that.airport,_that.departureAirport,_that.arrivalAirport,_that.dateFrom,_that.dateTo);case FlightCreatedState() when flightCreated != null:
return flightCreated(_that.flight);case _:
  return null;

}
}

}

/// @nodoc


class LoadingFlightsState extends FlightsState {
  const LoadingFlightsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingFlightsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightsState.loading()';
}


}




/// @nodoc


class ErrorFlightsState extends FlightsState {
  const ErrorFlightsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of FlightsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorFlightsStateCopyWith<ErrorFlightsState> get copyWith => _$ErrorFlightsStateCopyWithImpl<ErrorFlightsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorFlightsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'FlightsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorFlightsStateCopyWith<$Res> implements $FlightsStateCopyWith<$Res> {
  factory $ErrorFlightsStateCopyWith(ErrorFlightsState value, $Res Function(ErrorFlightsState) _then) = _$ErrorFlightsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorFlightsStateCopyWithImpl<$Res>
    implements $ErrorFlightsStateCopyWith<$Res> {
  _$ErrorFlightsStateCopyWithImpl(this._self, this._then);

  final ErrorFlightsState _self;
  final $Res Function(ErrorFlightsState) _then;

/// Create a copy of FlightsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorFlightsState(
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


class SuccessFlightsState extends FlightsState {
  const SuccessFlightsState({required final  List<FlightEntity> flights, this.airport, this.departureAirport, this.arrivalAirport, this.dateFrom, this.dateTo}): _flights = flights,super._();
  

 final  List<FlightEntity> _flights;
 List<FlightEntity> get flights {
  if (_flights is EqualUnmodifiableListView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flights);
}

 final  String? airport;
 final  String? departureAirport;
 final  String? arrivalAirport;
 final  DateTime? dateFrom;
 final  DateTime? dateTo;

/// Create a copy of FlightsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessFlightsStateCopyWith<SuccessFlightsState> get copyWith => _$SuccessFlightsStateCopyWithImpl<SuccessFlightsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessFlightsState&&const DeepCollectionEquality().equals(other._flights, _flights)&&(identical(other.airport, airport) || other.airport == airport)&&(identical(other.departureAirport, departureAirport) || other.departureAirport == departureAirport)&&(identical(other.arrivalAirport, arrivalAirport) || other.arrivalAirport == arrivalAirport)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_flights),airport,departureAirport,arrivalAirport,dateFrom,dateTo);

@override
String toString() {
  return 'FlightsState.success(flights: $flights, airport: $airport, departureAirport: $departureAirport, arrivalAirport: $arrivalAirport, dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class $SuccessFlightsStateCopyWith<$Res> implements $FlightsStateCopyWith<$Res> {
  factory $SuccessFlightsStateCopyWith(SuccessFlightsState value, $Res Function(SuccessFlightsState) _then) = _$SuccessFlightsStateCopyWithImpl;
@useResult
$Res call({
 List<FlightEntity> flights, String? airport, String? departureAirport, String? arrivalAirport, DateTime? dateFrom, DateTime? dateTo
});




}
/// @nodoc
class _$SuccessFlightsStateCopyWithImpl<$Res>
    implements $SuccessFlightsStateCopyWith<$Res> {
  _$SuccessFlightsStateCopyWithImpl(this._self, this._then);

  final SuccessFlightsState _self;
  final $Res Function(SuccessFlightsState) _then;

/// Create a copy of FlightsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flights = null,Object? airport = freezed,Object? departureAirport = freezed,Object? arrivalAirport = freezed,Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(SuccessFlightsState(
flights: null == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as List<FlightEntity>,airport: freezed == airport ? _self.airport : airport // ignore: cast_nullable_to_non_nullable
as String?,departureAirport: freezed == departureAirport ? _self.departureAirport : departureAirport // ignore: cast_nullable_to_non_nullable
as String?,arrivalAirport: freezed == arrivalAirport ? _self.arrivalAirport : arrivalAirport // ignore: cast_nullable_to_non_nullable
as String?,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class FlightCreatedState extends FlightsState {
  const FlightCreatedState({required this.flight}): super._();
  

 final  FlightEntity flight;

/// Create a copy of FlightsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightCreatedStateCopyWith<FlightCreatedState> get copyWith => _$FlightCreatedStateCopyWithImpl<FlightCreatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightCreatedState&&(identical(other.flight, flight) || other.flight == flight));
}


@override
int get hashCode => Object.hash(runtimeType,flight);

@override
String toString() {
  return 'FlightsState.flightCreated(flight: $flight)';
}


}

/// @nodoc
abstract mixin class $FlightCreatedStateCopyWith<$Res> implements $FlightsStateCopyWith<$Res> {
  factory $FlightCreatedStateCopyWith(FlightCreatedState value, $Res Function(FlightCreatedState) _then) = _$FlightCreatedStateCopyWithImpl;
@useResult
$Res call({
 FlightEntity flight
});




}
/// @nodoc
class _$FlightCreatedStateCopyWithImpl<$Res>
    implements $FlightCreatedStateCopyWith<$Res> {
  _$FlightCreatedStateCopyWithImpl(this._self, this._then);

  final FlightCreatedState _self;
  final $Res Function(FlightCreatedState) _then;

/// Create a copy of FlightsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flight = null,}) {
  return _then(FlightCreatedState(
flight: null == flight ? _self.flight : flight // ignore: cast_nullable_to_non_nullable
as FlightEntity,
  ));
}


}

// dart format on
