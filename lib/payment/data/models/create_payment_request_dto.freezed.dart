// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_payment_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePaymentRequestDto {

 double get amount; String get currency; String get description;@JsonKey(name: 'return_url') String? get returnUrl;@JsonKey(name: 'cancel_url') String? get cancelUrl;
/// Create a copy of CreatePaymentRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePaymentRequestDtoCopyWith<CreatePaymentRequestDto> get copyWith => _$CreatePaymentRequestDtoCopyWithImpl<CreatePaymentRequestDto>(this as CreatePaymentRequestDto, _$identity);

  /// Serializes this CreatePaymentRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePaymentRequestDto&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.description, description) || other.description == description)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency,description,returnUrl,cancelUrl);

@override
String toString() {
  return 'CreatePaymentRequestDto(amount: $amount, currency: $currency, description: $description, returnUrl: $returnUrl, cancelUrl: $cancelUrl)';
}


}

/// @nodoc
abstract mixin class $CreatePaymentRequestDtoCopyWith<$Res>  {
  factory $CreatePaymentRequestDtoCopyWith(CreatePaymentRequestDto value, $Res Function(CreatePaymentRequestDto) _then) = _$CreatePaymentRequestDtoCopyWithImpl;
@useResult
$Res call({
 double amount, String currency, String description,@JsonKey(name: 'return_url') String? returnUrl,@JsonKey(name: 'cancel_url') String? cancelUrl
});




}
/// @nodoc
class _$CreatePaymentRequestDtoCopyWithImpl<$Res>
    implements $CreatePaymentRequestDtoCopyWith<$Res> {
  _$CreatePaymentRequestDtoCopyWithImpl(this._self, this._then);

  final CreatePaymentRequestDto _self;
  final $Res Function(CreatePaymentRequestDto) _then;

/// Create a copy of CreatePaymentRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? currency = null,Object? description = null,Object? returnUrl = freezed,Object? cancelUrl = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,cancelUrl: freezed == cancelUrl ? _self.cancelUrl : cancelUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePaymentRequestDto].
extension CreatePaymentRequestDtoPatterns on CreatePaymentRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePaymentRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePaymentRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePaymentRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePaymentRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String currency,  String description, @JsonKey(name: 'return_url')  String? returnUrl, @JsonKey(name: 'cancel_url')  String? cancelUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePaymentRequestDto() when $default != null:
return $default(_that.amount,_that.currency,_that.description,_that.returnUrl,_that.cancelUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String currency,  String description, @JsonKey(name: 'return_url')  String? returnUrl, @JsonKey(name: 'cancel_url')  String? cancelUrl)  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentRequestDto():
return $default(_that.amount,_that.currency,_that.description,_that.returnUrl,_that.cancelUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String currency,  String description, @JsonKey(name: 'return_url')  String? returnUrl, @JsonKey(name: 'cancel_url')  String? cancelUrl)?  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentRequestDto() when $default != null:
return $default(_that.amount,_that.currency,_that.description,_that.returnUrl,_that.cancelUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePaymentRequestDto implements CreatePaymentRequestDto {
  const _CreatePaymentRequestDto({required this.amount, required this.currency, required this.description, @JsonKey(name: 'return_url') this.returnUrl, @JsonKey(name: 'cancel_url') this.cancelUrl});
  factory _CreatePaymentRequestDto.fromJson(Map<String, dynamic> json) => _$CreatePaymentRequestDtoFromJson(json);

@override final  double amount;
@override final  String currency;
@override final  String description;
@override@JsonKey(name: 'return_url') final  String? returnUrl;
@override@JsonKey(name: 'cancel_url') final  String? cancelUrl;

/// Create a copy of CreatePaymentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePaymentRequestDtoCopyWith<_CreatePaymentRequestDto> get copyWith => __$CreatePaymentRequestDtoCopyWithImpl<_CreatePaymentRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePaymentRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePaymentRequestDto&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.description, description) || other.description == description)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency,description,returnUrl,cancelUrl);

@override
String toString() {
  return 'CreatePaymentRequestDto(amount: $amount, currency: $currency, description: $description, returnUrl: $returnUrl, cancelUrl: $cancelUrl)';
}


}

/// @nodoc
abstract mixin class _$CreatePaymentRequestDtoCopyWith<$Res> implements $CreatePaymentRequestDtoCopyWith<$Res> {
  factory _$CreatePaymentRequestDtoCopyWith(_CreatePaymentRequestDto value, $Res Function(_CreatePaymentRequestDto) _then) = __$CreatePaymentRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 double amount, String currency, String description,@JsonKey(name: 'return_url') String? returnUrl,@JsonKey(name: 'cancel_url') String? cancelUrl
});




}
/// @nodoc
class __$CreatePaymentRequestDtoCopyWithImpl<$Res>
    implements _$CreatePaymentRequestDtoCopyWith<$Res> {
  __$CreatePaymentRequestDtoCopyWithImpl(this._self, this._then);

  final _CreatePaymentRequestDto _self;
  final $Res Function(_CreatePaymentRequestDto) _then;

/// Create a copy of CreatePaymentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? currency = null,Object? description = null,Object? returnUrl = freezed,Object? cancelUrl = freezed,}) {
  return _then(_CreatePaymentRequestDto(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,cancelUrl: freezed == cancelUrl ? _self.cancelUrl : cancelUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
