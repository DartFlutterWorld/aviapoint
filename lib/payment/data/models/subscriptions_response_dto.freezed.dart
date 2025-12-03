// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionsResponseDto {

 List<SubscriptionDto> get subscriptions;
/// Create a copy of SubscriptionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionsResponseDtoCopyWith<SubscriptionsResponseDto> get copyWith => _$SubscriptionsResponseDtoCopyWithImpl<SubscriptionsResponseDto>(this as SubscriptionsResponseDto, _$identity);

  /// Serializes this SubscriptionsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionsResponseDto&&const DeepCollectionEquality().equals(other.subscriptions, subscriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subscriptions));

@override
String toString() {
  return 'SubscriptionsResponseDto(subscriptions: $subscriptions)';
}


}

/// @nodoc
abstract mixin class $SubscriptionsResponseDtoCopyWith<$Res>  {
  factory $SubscriptionsResponseDtoCopyWith(SubscriptionsResponseDto value, $Res Function(SubscriptionsResponseDto) _then) = _$SubscriptionsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<SubscriptionDto> subscriptions
});




}
/// @nodoc
class _$SubscriptionsResponseDtoCopyWithImpl<$Res>
    implements $SubscriptionsResponseDtoCopyWith<$Res> {
  _$SubscriptionsResponseDtoCopyWithImpl(this._self, this._then);

  final SubscriptionsResponseDto _self;
  final $Res Function(SubscriptionsResponseDto) _then;

/// Create a copy of SubscriptionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscriptions = null,}) {
  return _then(_self.copyWith(
subscriptions: null == subscriptions ? _self.subscriptions : subscriptions // ignore: cast_nullable_to_non_nullable
as List<SubscriptionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionsResponseDto].
extension SubscriptionsResponseDtoPatterns on SubscriptionsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionsResponseDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionsResponseDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionsResponseDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SubscriptionDto> subscriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionsResponseDto() when $default != null:
return $default(_that.subscriptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SubscriptionDto> subscriptions)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionsResponseDto():
return $default(_that.subscriptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SubscriptionDto> subscriptions)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionsResponseDto() when $default != null:
return $default(_that.subscriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionsResponseDto implements SubscriptionsResponseDto {
  const _SubscriptionsResponseDto({required final  List<SubscriptionDto> subscriptions}): _subscriptions = subscriptions;
  factory _SubscriptionsResponseDto.fromJson(Map<String, dynamic> json) => _$SubscriptionsResponseDtoFromJson(json);

 final  List<SubscriptionDto> _subscriptions;
@override List<SubscriptionDto> get subscriptions {
  if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subscriptions);
}


/// Create a copy of SubscriptionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionsResponseDtoCopyWith<_SubscriptionsResponseDto> get copyWith => __$SubscriptionsResponseDtoCopyWithImpl<_SubscriptionsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionsResponseDto&&const DeepCollectionEquality().equals(other._subscriptions, _subscriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subscriptions));

@override
String toString() {
  return 'SubscriptionsResponseDto(subscriptions: $subscriptions)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionsResponseDtoCopyWith<$Res> implements $SubscriptionsResponseDtoCopyWith<$Res> {
  factory _$SubscriptionsResponseDtoCopyWith(_SubscriptionsResponseDto value, $Res Function(_SubscriptionsResponseDto) _then) = __$SubscriptionsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<SubscriptionDto> subscriptions
});




}
/// @nodoc
class __$SubscriptionsResponseDtoCopyWithImpl<$Res>
    implements _$SubscriptionsResponseDtoCopyWith<$Res> {
  __$SubscriptionsResponseDtoCopyWithImpl(this._self, this._then);

  final _SubscriptionsResponseDto _self;
  final $Res Function(_SubscriptionsResponseDto) _then;

/// Create a copy of SubscriptionsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscriptions = null,}) {
  return _then(_SubscriptionsResponseDto(
subscriptions: null == subscriptions ? _self._subscriptions : subscriptions // ignore: cast_nullable_to_non_nullable
as List<SubscriptionDto>,
  ));
}


}

// dart format on
