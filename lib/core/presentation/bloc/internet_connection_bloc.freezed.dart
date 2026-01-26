// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internet_connection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InternetConnectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternetConnectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionEvent()';
}


}

/// @nodoc
class $InternetConnectionEventCopyWith<$Res>  {
$InternetConnectionEventCopyWith(InternetConnectionEvent _, $Res Function(InternetConnectionEvent) __);
}


/// Adds pattern-matching-related methods to [InternetConnectionEvent].
extension InternetConnectionEventPatterns on InternetConnectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StartMonitoringEvent value)?  startMonitoring,TResult Function( StopMonitoringEvent value)?  stopMonitoring,TResult Function( StatusChangedEvent value)?  statusChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StartMonitoringEvent() when startMonitoring != null:
return startMonitoring(_that);case StopMonitoringEvent() when stopMonitoring != null:
return stopMonitoring(_that);case StatusChangedEvent() when statusChanged != null:
return statusChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StartMonitoringEvent value)  startMonitoring,required TResult Function( StopMonitoringEvent value)  stopMonitoring,required TResult Function( StatusChangedEvent value)  statusChanged,}){
final _that = this;
switch (_that) {
case StartMonitoringEvent():
return startMonitoring(_that);case StopMonitoringEvent():
return stopMonitoring(_that);case StatusChangedEvent():
return statusChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StartMonitoringEvent value)?  startMonitoring,TResult? Function( StopMonitoringEvent value)?  stopMonitoring,TResult? Function( StatusChangedEvent value)?  statusChanged,}){
final _that = this;
switch (_that) {
case StartMonitoringEvent() when startMonitoring != null:
return startMonitoring(_that);case StopMonitoringEvent() when stopMonitoring != null:
return stopMonitoring(_that);case StatusChangedEvent() when statusChanged != null:
return statusChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startMonitoring,TResult Function()?  stopMonitoring,TResult Function( InternetStatus status)?  statusChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StartMonitoringEvent() when startMonitoring != null:
return startMonitoring();case StopMonitoringEvent() when stopMonitoring != null:
return stopMonitoring();case StatusChangedEvent() when statusChanged != null:
return statusChanged(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startMonitoring,required TResult Function()  stopMonitoring,required TResult Function( InternetStatus status)  statusChanged,}) {final _that = this;
switch (_that) {
case StartMonitoringEvent():
return startMonitoring();case StopMonitoringEvent():
return stopMonitoring();case StatusChangedEvent():
return statusChanged(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startMonitoring,TResult? Function()?  stopMonitoring,TResult? Function( InternetStatus status)?  statusChanged,}) {final _that = this;
switch (_that) {
case StartMonitoringEvent() when startMonitoring != null:
return startMonitoring();case StopMonitoringEvent() when stopMonitoring != null:
return stopMonitoring();case StatusChangedEvent() when statusChanged != null:
return statusChanged(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class StartMonitoringEvent extends InternetConnectionEvent {
  const StartMonitoringEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartMonitoringEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionEvent.startMonitoring()';
}


}




/// @nodoc


class StopMonitoringEvent extends InternetConnectionEvent {
  const StopMonitoringEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopMonitoringEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionEvent.stopMonitoring()';
}


}




/// @nodoc


class StatusChangedEvent extends InternetConnectionEvent {
  const StatusChangedEvent({required this.status}): super._();
  

 final  InternetStatus status;

/// Create a copy of InternetConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusChangedEventCopyWith<StatusChangedEvent> get copyWith => _$StatusChangedEventCopyWithImpl<StatusChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusChangedEvent&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'InternetConnectionEvent.statusChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class $StatusChangedEventCopyWith<$Res> implements $InternetConnectionEventCopyWith<$Res> {
  factory $StatusChangedEventCopyWith(StatusChangedEvent value, $Res Function(StatusChangedEvent) _then) = _$StatusChangedEventCopyWithImpl;
@useResult
$Res call({
 InternetStatus status
});




}
/// @nodoc
class _$StatusChangedEventCopyWithImpl<$Res>
    implements $StatusChangedEventCopyWith<$Res> {
  _$StatusChangedEventCopyWithImpl(this._self, this._then);

  final StatusChangedEvent _self;
  final $Res Function(StatusChangedEvent) _then;

/// Create a copy of InternetConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(StatusChangedEvent(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InternetStatus,
  ));
}


}

/// @nodoc
mixin _$InternetConnectionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternetConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState()';
}


}

/// @nodoc
class $InternetConnectionStateCopyWith<$Res>  {
$InternetConnectionStateCopyWith(InternetConnectionState _, $Res Function(InternetConnectionState) __);
}


/// Adds pattern-matching-related methods to [InternetConnectionState].
extension InternetConnectionStatePatterns on InternetConnectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialInternetConnectionState value)?  initial,TResult Function( ConnectedInternetConnectionState value)?  connected,TResult Function( DisconnectedInternetConnectionState value)?  disconnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialInternetConnectionState() when initial != null:
return initial(_that);case ConnectedInternetConnectionState() when connected != null:
return connected(_that);case DisconnectedInternetConnectionState() when disconnected != null:
return disconnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialInternetConnectionState value)  initial,required TResult Function( ConnectedInternetConnectionState value)  connected,required TResult Function( DisconnectedInternetConnectionState value)  disconnected,}){
final _that = this;
switch (_that) {
case InitialInternetConnectionState():
return initial(_that);case ConnectedInternetConnectionState():
return connected(_that);case DisconnectedInternetConnectionState():
return disconnected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialInternetConnectionState value)?  initial,TResult? Function( ConnectedInternetConnectionState value)?  connected,TResult? Function( DisconnectedInternetConnectionState value)?  disconnected,}){
final _that = this;
switch (_that) {
case InitialInternetConnectionState() when initial != null:
return initial(_that);case ConnectedInternetConnectionState() when connected != null:
return connected(_that);case DisconnectedInternetConnectionState() when disconnected != null:
return disconnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  connected,TResult Function()?  disconnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialInternetConnectionState() when initial != null:
return initial();case ConnectedInternetConnectionState() when connected != null:
return connected();case DisconnectedInternetConnectionState() when disconnected != null:
return disconnected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  connected,required TResult Function()  disconnected,}) {final _that = this;
switch (_that) {
case InitialInternetConnectionState():
return initial();case ConnectedInternetConnectionState():
return connected();case DisconnectedInternetConnectionState():
return disconnected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  connected,TResult? Function()?  disconnected,}) {final _that = this;
switch (_that) {
case InitialInternetConnectionState() when initial != null:
return initial();case ConnectedInternetConnectionState() when connected != null:
return connected();case DisconnectedInternetConnectionState() when disconnected != null:
return disconnected();case _:
  return null;

}
}

}

/// @nodoc


class InitialInternetConnectionState extends InternetConnectionState {
  const InitialInternetConnectionState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialInternetConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState.initial()';
}


}




/// @nodoc


class ConnectedInternetConnectionState extends InternetConnectionState {
  const ConnectedInternetConnectionState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedInternetConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState.connected()';
}


}




/// @nodoc


class DisconnectedInternetConnectionState extends InternetConnectionState {
  const DisconnectedInternetConnectionState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisconnectedInternetConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState.disconnected()';
}


}




// dart format on
