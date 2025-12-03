// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionDto {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'payment_id') String get paymentId;// required как на бэкенде
@JsonKey(name: 'subscription_type_id') int get subscriptionTypeId;// required как на бэкенде
@JsonKey(name: 'period_days') int get periodDays;@JsonKey(name: 'start_date', fromJson: _dateTimeFromJson) DateTime get startDate;@JsonKey(name: 'end_date', fromJson: _dateTimeFromJson) DateTime get endDate;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) DateTime get createdAt; int get amount;
/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionDtoCopyWith<SubscriptionDto> get copyWith => _$SubscriptionDtoCopyWithImpl<SubscriptionDto>(this as SubscriptionDto, _$identity);

  /// Serializes this SubscriptionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.subscriptionTypeId, subscriptionTypeId) || other.subscriptionTypeId == subscriptionTypeId)&&(identical(other.periodDays, periodDays) || other.periodDays == periodDays)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,paymentId,subscriptionTypeId,periodDays,startDate,endDate,isActive,createdAt,amount);

@override
String toString() {
  return 'SubscriptionDto(id: $id, userId: $userId, paymentId: $paymentId, subscriptionTypeId: $subscriptionTypeId, periodDays: $periodDays, startDate: $startDate, endDate: $endDate, isActive: $isActive, createdAt: $createdAt, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SubscriptionDtoCopyWith<$Res>  {
  factory $SubscriptionDtoCopyWith(SubscriptionDto value, $Res Function(SubscriptionDto) _then) = _$SubscriptionDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'payment_id') String paymentId,@JsonKey(name: 'subscription_type_id') int subscriptionTypeId,@JsonKey(name: 'period_days') int periodDays,@JsonKey(name: 'start_date', fromJson: _dateTimeFromJson) DateTime startDate,@JsonKey(name: 'end_date', fromJson: _dateTimeFromJson) DateTime endDate,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) DateTime createdAt, int amount
});




}
/// @nodoc
class _$SubscriptionDtoCopyWithImpl<$Res>
    implements $SubscriptionDtoCopyWith<$Res> {
  _$SubscriptionDtoCopyWithImpl(this._self, this._then);

  final SubscriptionDto _self;
  final $Res Function(SubscriptionDto) _then;

/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? paymentId = null,Object? subscriptionTypeId = null,Object? periodDays = null,Object? startDate = null,Object? endDate = null,Object? isActive = null,Object? createdAt = null,Object? amount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,subscriptionTypeId: null == subscriptionTypeId ? _self.subscriptionTypeId : subscriptionTypeId // ignore: cast_nullable_to_non_nullable
as int,periodDays: null == periodDays ? _self.periodDays : periodDays // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionDto].
extension SubscriptionDtoPatterns on SubscriptionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionDto value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionDto value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'payment_id')  String paymentId, @JsonKey(name: 'subscription_type_id')  int subscriptionTypeId, @JsonKey(name: 'period_days')  int periodDays, @JsonKey(name: 'start_date', fromJson: _dateTimeFromJson)  DateTime startDate, @JsonKey(name: 'end_date', fromJson: _dateTimeFromJson)  DateTime endDate, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson)  DateTime createdAt,  int amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
return $default(_that.id,_that.userId,_that.paymentId,_that.subscriptionTypeId,_that.periodDays,_that.startDate,_that.endDate,_that.isActive,_that.createdAt,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'payment_id')  String paymentId, @JsonKey(name: 'subscription_type_id')  int subscriptionTypeId, @JsonKey(name: 'period_days')  int periodDays, @JsonKey(name: 'start_date', fromJson: _dateTimeFromJson)  DateTime startDate, @JsonKey(name: 'end_date', fromJson: _dateTimeFromJson)  DateTime endDate, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson)  DateTime createdAt,  int amount)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionDto():
return $default(_that.id,_that.userId,_that.paymentId,_that.subscriptionTypeId,_that.periodDays,_that.startDate,_that.endDate,_that.isActive,_that.createdAt,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'payment_id')  String paymentId, @JsonKey(name: 'subscription_type_id')  int subscriptionTypeId, @JsonKey(name: 'period_days')  int periodDays, @JsonKey(name: 'start_date', fromJson: _dateTimeFromJson)  DateTime startDate, @JsonKey(name: 'end_date', fromJson: _dateTimeFromJson)  DateTime endDate, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson)  DateTime createdAt,  int amount)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
return $default(_that.id,_that.userId,_that.paymentId,_that.subscriptionTypeId,_that.periodDays,_that.startDate,_that.endDate,_that.isActive,_that.createdAt,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionDto implements SubscriptionDto {
  const _SubscriptionDto({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'payment_id') required this.paymentId, @JsonKey(name: 'subscription_type_id') required this.subscriptionTypeId, @JsonKey(name: 'period_days') required this.periodDays, @JsonKey(name: 'start_date', fromJson: _dateTimeFromJson) required this.startDate, @JsonKey(name: 'end_date', fromJson: _dateTimeFromJson) required this.endDate, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) required this.createdAt, required this.amount});
  factory _SubscriptionDto.fromJson(Map<String, dynamic> json) => _$SubscriptionDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'payment_id') final  String paymentId;
// required как на бэкенде
@override@JsonKey(name: 'subscription_type_id') final  int subscriptionTypeId;
// required как на бэкенде
@override@JsonKey(name: 'period_days') final  int periodDays;
@override@JsonKey(name: 'start_date', fromJson: _dateTimeFromJson) final  DateTime startDate;
@override@JsonKey(name: 'end_date', fromJson: _dateTimeFromJson) final  DateTime endDate;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) final  DateTime createdAt;
@override final  int amount;

/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionDtoCopyWith<_SubscriptionDto> get copyWith => __$SubscriptionDtoCopyWithImpl<_SubscriptionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.subscriptionTypeId, subscriptionTypeId) || other.subscriptionTypeId == subscriptionTypeId)&&(identical(other.periodDays, periodDays) || other.periodDays == periodDays)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,paymentId,subscriptionTypeId,periodDays,startDate,endDate,isActive,createdAt,amount);

@override
String toString() {
  return 'SubscriptionDto(id: $id, userId: $userId, paymentId: $paymentId, subscriptionTypeId: $subscriptionTypeId, periodDays: $periodDays, startDate: $startDate, endDate: $endDate, isActive: $isActive, createdAt: $createdAt, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionDtoCopyWith<$Res> implements $SubscriptionDtoCopyWith<$Res> {
  factory _$SubscriptionDtoCopyWith(_SubscriptionDto value, $Res Function(_SubscriptionDto) _then) = __$SubscriptionDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'payment_id') String paymentId,@JsonKey(name: 'subscription_type_id') int subscriptionTypeId,@JsonKey(name: 'period_days') int periodDays,@JsonKey(name: 'start_date', fromJson: _dateTimeFromJson) DateTime startDate,@JsonKey(name: 'end_date', fromJson: _dateTimeFromJson) DateTime endDate,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) DateTime createdAt, int amount
});




}
/// @nodoc
class __$SubscriptionDtoCopyWithImpl<$Res>
    implements _$SubscriptionDtoCopyWith<$Res> {
  __$SubscriptionDtoCopyWithImpl(this._self, this._then);

  final _SubscriptionDto _self;
  final $Res Function(_SubscriptionDto) _then;

/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? paymentId = null,Object? subscriptionTypeId = null,Object? periodDays = null,Object? startDate = null,Object? endDate = null,Object? isActive = null,Object? createdAt = null,Object? amount = null,}) {
  return _then(_SubscriptionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,subscriptionTypeId: null == subscriptionTypeId ? _self.subscriptionTypeId : subscriptionTypeId // ignore: cast_nullable_to_non_nullable
as int,periodDays: null == periodDays ? _self.periodDays : periodDays // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
