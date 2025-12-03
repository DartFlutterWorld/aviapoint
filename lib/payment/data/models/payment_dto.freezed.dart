// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentDto {

 String get id; String get status;@JsonKey(fromJson: _amountFromJson) double get amount; String get currency; String? get description;@JsonKey(name: 'payment_url') String? get paymentUrl;@JsonKey(name: 'confirmation_token') String? get confirmationToken;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'paid') bool? get paid;
/// Create a copy of PaymentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDtoCopyWith<PaymentDto> get copyWith => _$PaymentDtoCopyWithImpl<PaymentDto>(this as PaymentDto, _$identity);

  /// Serializes this PaymentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.description, description) || other.description == description)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.confirmationToken, confirmationToken) || other.confirmationToken == confirmationToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paid, paid) || other.paid == paid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,amount,currency,description,paymentUrl,confirmationToken,createdAt,paid);

@override
String toString() {
  return 'PaymentDto(id: $id, status: $status, amount: $amount, currency: $currency, description: $description, paymentUrl: $paymentUrl, confirmationToken: $confirmationToken, createdAt: $createdAt, paid: $paid)';
}


}

/// @nodoc
abstract mixin class $PaymentDtoCopyWith<$Res>  {
  factory $PaymentDtoCopyWith(PaymentDto value, $Res Function(PaymentDto) _then) = _$PaymentDtoCopyWithImpl;
@useResult
$Res call({
 String id, String status,@JsonKey(fromJson: _amountFromJson) double amount, String currency, String? description,@JsonKey(name: 'payment_url') String? paymentUrl,@JsonKey(name: 'confirmation_token') String? confirmationToken,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'paid') bool? paid
});




}
/// @nodoc
class _$PaymentDtoCopyWithImpl<$Res>
    implements $PaymentDtoCopyWith<$Res> {
  _$PaymentDtoCopyWithImpl(this._self, this._then);

  final PaymentDto _self;
  final $Res Function(PaymentDto) _then;

/// Create a copy of PaymentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? amount = null,Object? currency = null,Object? description = freezed,Object? paymentUrl = freezed,Object? confirmationToken = freezed,Object? createdAt = freezed,Object? paid = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,confirmationToken: freezed == confirmationToken ? _self.confirmationToken : confirmationToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,paid: freezed == paid ? _self.paid : paid // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDto].
extension PaymentDtoPatterns on PaymentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDto value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(fromJson: _amountFromJson)  double amount,  String currency,  String? description, @JsonKey(name: 'payment_url')  String? paymentUrl, @JsonKey(name: 'confirmation_token')  String? confirmationToken, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'paid')  bool? paid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDto() when $default != null:
return $default(_that.id,_that.status,_that.amount,_that.currency,_that.description,_that.paymentUrl,_that.confirmationToken,_that.createdAt,_that.paid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(fromJson: _amountFromJson)  double amount,  String currency,  String? description, @JsonKey(name: 'payment_url')  String? paymentUrl, @JsonKey(name: 'confirmation_token')  String? confirmationToken, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'paid')  bool? paid)  $default,) {final _that = this;
switch (_that) {
case _PaymentDto():
return $default(_that.id,_that.status,_that.amount,_that.currency,_that.description,_that.paymentUrl,_that.confirmationToken,_that.createdAt,_that.paid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status, @JsonKey(fromJson: _amountFromJson)  double amount,  String currency,  String? description, @JsonKey(name: 'payment_url')  String? paymentUrl, @JsonKey(name: 'confirmation_token')  String? confirmationToken, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'paid')  bool? paid)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDto() when $default != null:
return $default(_that.id,_that.status,_that.amount,_that.currency,_that.description,_that.paymentUrl,_that.confirmationToken,_that.createdAt,_that.paid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDto implements PaymentDto {
  const _PaymentDto({required this.id, required this.status, @JsonKey(fromJson: _amountFromJson) required this.amount, required this.currency, this.description, @JsonKey(name: 'payment_url') this.paymentUrl, @JsonKey(name: 'confirmation_token') this.confirmationToken, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'paid') this.paid});
  factory _PaymentDto.fromJson(Map<String, dynamic> json) => _$PaymentDtoFromJson(json);

@override final  String id;
@override final  String status;
@override@JsonKey(fromJson: _amountFromJson) final  double amount;
@override final  String currency;
@override final  String? description;
@override@JsonKey(name: 'payment_url') final  String? paymentUrl;
@override@JsonKey(name: 'confirmation_token') final  String? confirmationToken;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'paid') final  bool? paid;

/// Create a copy of PaymentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDtoCopyWith<_PaymentDto> get copyWith => __$PaymentDtoCopyWithImpl<_PaymentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.description, description) || other.description == description)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.confirmationToken, confirmationToken) || other.confirmationToken == confirmationToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paid, paid) || other.paid == paid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,amount,currency,description,paymentUrl,confirmationToken,createdAt,paid);

@override
String toString() {
  return 'PaymentDto(id: $id, status: $status, amount: $amount, currency: $currency, description: $description, paymentUrl: $paymentUrl, confirmationToken: $confirmationToken, createdAt: $createdAt, paid: $paid)';
}


}

/// @nodoc
abstract mixin class _$PaymentDtoCopyWith<$Res> implements $PaymentDtoCopyWith<$Res> {
  factory _$PaymentDtoCopyWith(_PaymentDto value, $Res Function(_PaymentDto) _then) = __$PaymentDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String status,@JsonKey(fromJson: _amountFromJson) double amount, String currency, String? description,@JsonKey(name: 'payment_url') String? paymentUrl,@JsonKey(name: 'confirmation_token') String? confirmationToken,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'paid') bool? paid
});




}
/// @nodoc
class __$PaymentDtoCopyWithImpl<$Res>
    implements _$PaymentDtoCopyWith<$Res> {
  __$PaymentDtoCopyWithImpl(this._self, this._then);

  final _PaymentDto _self;
  final $Res Function(_PaymentDto) _then;

/// Create a copy of PaymentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? amount = null,Object? currency = null,Object? description = freezed,Object? paymentUrl = freezed,Object? confirmationToken = freezed,Object? createdAt = freezed,Object? paid = freezed,}) {
  return _then(_PaymentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,confirmationToken: freezed == confirmationToken ? _self.confirmationToken : confirmationToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,paid: freezed == paid ? _self.paid : paid // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
