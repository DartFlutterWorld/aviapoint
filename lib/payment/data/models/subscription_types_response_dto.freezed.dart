// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_types_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionTypesResponseDto {

@JsonKey(name: 'subscription_types') List<SubscriptionTypeModel> get subscriptionTypes;
/// Create a copy of SubscriptionTypesResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionTypesResponseDtoCopyWith<SubscriptionTypesResponseDto> get copyWith => _$SubscriptionTypesResponseDtoCopyWithImpl<SubscriptionTypesResponseDto>(this as SubscriptionTypesResponseDto, _$identity);

  /// Serializes this SubscriptionTypesResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionTypesResponseDto&&const DeepCollectionEquality().equals(other.subscriptionTypes, subscriptionTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subscriptionTypes));

@override
String toString() {
  return 'SubscriptionTypesResponseDto(subscriptionTypes: $subscriptionTypes)';
}


}

/// @nodoc
abstract mixin class $SubscriptionTypesResponseDtoCopyWith<$Res>  {
  factory $SubscriptionTypesResponseDtoCopyWith(SubscriptionTypesResponseDto value, $Res Function(SubscriptionTypesResponseDto) _then) = _$SubscriptionTypesResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'subscription_types') List<SubscriptionTypeModel> subscriptionTypes
});




}
/// @nodoc
class _$SubscriptionTypesResponseDtoCopyWithImpl<$Res>
    implements $SubscriptionTypesResponseDtoCopyWith<$Res> {
  _$SubscriptionTypesResponseDtoCopyWithImpl(this._self, this._then);

  final SubscriptionTypesResponseDto _self;
  final $Res Function(SubscriptionTypesResponseDto) _then;

/// Create a copy of SubscriptionTypesResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscriptionTypes = null,}) {
  return _then(_self.copyWith(
subscriptionTypes: null == subscriptionTypes ? _self.subscriptionTypes : subscriptionTypes // ignore: cast_nullable_to_non_nullable
as List<SubscriptionTypeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionTypesResponseDto].
extension SubscriptionTypesResponseDtoPatterns on SubscriptionTypesResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionTypesResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionTypesResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionTypesResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionTypesResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionTypesResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionTypesResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'subscription_types')  List<SubscriptionTypeModel> subscriptionTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionTypesResponseDto() when $default != null:
return $default(_that.subscriptionTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'subscription_types')  List<SubscriptionTypeModel> subscriptionTypes)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionTypesResponseDto():
return $default(_that.subscriptionTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'subscription_types')  List<SubscriptionTypeModel> subscriptionTypes)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionTypesResponseDto() when $default != null:
return $default(_that.subscriptionTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionTypesResponseDto implements SubscriptionTypesResponseDto {
  const _SubscriptionTypesResponseDto({@JsonKey(name: 'subscription_types') required final  List<SubscriptionTypeModel> subscriptionTypes}): _subscriptionTypes = subscriptionTypes;
  factory _SubscriptionTypesResponseDto.fromJson(Map<String, dynamic> json) => _$SubscriptionTypesResponseDtoFromJson(json);

 final  List<SubscriptionTypeModel> _subscriptionTypes;
@override@JsonKey(name: 'subscription_types') List<SubscriptionTypeModel> get subscriptionTypes {
  if (_subscriptionTypes is EqualUnmodifiableListView) return _subscriptionTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subscriptionTypes);
}


/// Create a copy of SubscriptionTypesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionTypesResponseDtoCopyWith<_SubscriptionTypesResponseDto> get copyWith => __$SubscriptionTypesResponseDtoCopyWithImpl<_SubscriptionTypesResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionTypesResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionTypesResponseDto&&const DeepCollectionEquality().equals(other._subscriptionTypes, _subscriptionTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subscriptionTypes));

@override
String toString() {
  return 'SubscriptionTypesResponseDto(subscriptionTypes: $subscriptionTypes)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionTypesResponseDtoCopyWith<$Res> implements $SubscriptionTypesResponseDtoCopyWith<$Res> {
  factory _$SubscriptionTypesResponseDtoCopyWith(_SubscriptionTypesResponseDto value, $Res Function(_SubscriptionTypesResponseDto) _then) = __$SubscriptionTypesResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'subscription_types') List<SubscriptionTypeModel> subscriptionTypes
});




}
/// @nodoc
class __$SubscriptionTypesResponseDtoCopyWithImpl<$Res>
    implements _$SubscriptionTypesResponseDtoCopyWith<$Res> {
  __$SubscriptionTypesResponseDtoCopyWithImpl(this._self, this._then);

  final _SubscriptionTypesResponseDto _self;
  final $Res Function(_SubscriptionTypesResponseDto) _then;

/// Create a copy of SubscriptionTypesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscriptionTypes = null,}) {
  return _then(_SubscriptionTypesResponseDto(
subscriptionTypes: null == subscriptionTypes ? _self._subscriptionTypes : subscriptionTypes // ignore: cast_nullable_to_non_nullable
as List<SubscriptionTypeModel>,
  ));
}


}

// dart format on
