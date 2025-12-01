// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent()';
}


}

/// @nodoc
class $PaymentEventCopyWith<$Res>  {
$PaymentEventCopyWith(PaymentEvent _, $Res Function(PaymentEvent) __);
}


/// Adds pattern-matching-related methods to [PaymentEvent].
extension PaymentEventPatterns on PaymentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreatePaymentEvent value)?  createPayment,TResult Function( CheckPaymentStatusEvent value)?  checkPaymentStatus,TResult Function( ResetPaymentEvent value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreatePaymentEvent() when createPayment != null:
return createPayment(_that);case CheckPaymentStatusEvent() when checkPaymentStatus != null:
return checkPaymentStatus(_that);case ResetPaymentEvent() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreatePaymentEvent value)  createPayment,required TResult Function( CheckPaymentStatusEvent value)  checkPaymentStatus,required TResult Function( ResetPaymentEvent value)  reset,}){
final _that = this;
switch (_that) {
case CreatePaymentEvent():
return createPayment(_that);case CheckPaymentStatusEvent():
return checkPaymentStatus(_that);case ResetPaymentEvent():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreatePaymentEvent value)?  createPayment,TResult? Function( CheckPaymentStatusEvent value)?  checkPaymentStatus,TResult? Function( ResetPaymentEvent value)?  reset,}){
final _that = this;
switch (_that) {
case CreatePaymentEvent() when createPayment != null:
return createPayment(_that);case CheckPaymentStatusEvent() when checkPaymentStatus != null:
return checkPaymentStatus(_that);case ResetPaymentEvent() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double amount,  String currency,  String description,  int userId,  SubscriptionType subscriptionType,  int periodDays,  String? customerPhone,  String? returnUrl,  String? cancelUrl)?  createPayment,TResult Function( String paymentId)?  checkPaymentStatus,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreatePaymentEvent() when createPayment != null:
return createPayment(_that.amount,_that.currency,_that.description,_that.userId,_that.subscriptionType,_that.periodDays,_that.customerPhone,_that.returnUrl,_that.cancelUrl);case CheckPaymentStatusEvent() when checkPaymentStatus != null:
return checkPaymentStatus(_that.paymentId);case ResetPaymentEvent() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double amount,  String currency,  String description,  int userId,  SubscriptionType subscriptionType,  int periodDays,  String? customerPhone,  String? returnUrl,  String? cancelUrl)  createPayment,required TResult Function( String paymentId)  checkPaymentStatus,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case CreatePaymentEvent():
return createPayment(_that.amount,_that.currency,_that.description,_that.userId,_that.subscriptionType,_that.periodDays,_that.customerPhone,_that.returnUrl,_that.cancelUrl);case CheckPaymentStatusEvent():
return checkPaymentStatus(_that.paymentId);case ResetPaymentEvent():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double amount,  String currency,  String description,  int userId,  SubscriptionType subscriptionType,  int periodDays,  String? customerPhone,  String? returnUrl,  String? cancelUrl)?  createPayment,TResult? Function( String paymentId)?  checkPaymentStatus,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case CreatePaymentEvent() when createPayment != null:
return createPayment(_that.amount,_that.currency,_that.description,_that.userId,_that.subscriptionType,_that.periodDays,_that.customerPhone,_that.returnUrl,_that.cancelUrl);case CheckPaymentStatusEvent() when checkPaymentStatus != null:
return checkPaymentStatus(_that.paymentId);case ResetPaymentEvent() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class CreatePaymentEvent implements PaymentEvent {
  const CreatePaymentEvent({required this.amount, required this.currency, required this.description, required this.userId, required this.subscriptionType, required this.periodDays, this.customerPhone, this.returnUrl, this.cancelUrl});
  

 final  double amount;
 final  String currency;
 final  String description;
 final  int userId;
 final  SubscriptionType subscriptionType;
 final  int periodDays;
 final  String? customerPhone;
 final  String? returnUrl;
 final  String? cancelUrl;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePaymentEventCopyWith<CreatePaymentEvent> get copyWith => _$CreatePaymentEventCopyWithImpl<CreatePaymentEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePaymentEvent&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.description, description) || other.description == description)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.subscriptionType, subscriptionType) || other.subscriptionType == subscriptionType)&&(identical(other.periodDays, periodDays) || other.periodDays == periodDays)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl));
}


@override
int get hashCode => Object.hash(runtimeType,amount,currency,description,userId,subscriptionType,periodDays,customerPhone,returnUrl,cancelUrl);

@override
String toString() {
  return 'PaymentEvent.createPayment(amount: $amount, currency: $currency, description: $description, userId: $userId, subscriptionType: $subscriptionType, periodDays: $periodDays, customerPhone: $customerPhone, returnUrl: $returnUrl, cancelUrl: $cancelUrl)';
}


}

/// @nodoc
abstract mixin class $CreatePaymentEventCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory $CreatePaymentEventCopyWith(CreatePaymentEvent value, $Res Function(CreatePaymentEvent) _then) = _$CreatePaymentEventCopyWithImpl;
@useResult
$Res call({
 double amount, String currency, String description, int userId, SubscriptionType subscriptionType, int periodDays, String? customerPhone, String? returnUrl, String? cancelUrl
});




}
/// @nodoc
class _$CreatePaymentEventCopyWithImpl<$Res>
    implements $CreatePaymentEventCopyWith<$Res> {
  _$CreatePaymentEventCopyWithImpl(this._self, this._then);

  final CreatePaymentEvent _self;
  final $Res Function(CreatePaymentEvent) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? currency = null,Object? description = null,Object? userId = null,Object? subscriptionType = null,Object? periodDays = null,Object? customerPhone = freezed,Object? returnUrl = freezed,Object? cancelUrl = freezed,}) {
  return _then(CreatePaymentEvent(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,subscriptionType: null == subscriptionType ? _self.subscriptionType : subscriptionType // ignore: cast_nullable_to_non_nullable
as SubscriptionType,periodDays: null == periodDays ? _self.periodDays : periodDays // ignore: cast_nullable_to_non_nullable
as int,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,cancelUrl: freezed == cancelUrl ? _self.cancelUrl : cancelUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CheckPaymentStatusEvent implements PaymentEvent {
  const CheckPaymentStatusEvent(this.paymentId);
  

 final  String paymentId;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckPaymentStatusEventCopyWith<CheckPaymentStatusEvent> get copyWith => _$CheckPaymentStatusEventCopyWithImpl<CheckPaymentStatusEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPaymentStatusEvent&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId));
}


@override
int get hashCode => Object.hash(runtimeType,paymentId);

@override
String toString() {
  return 'PaymentEvent.checkPaymentStatus(paymentId: $paymentId)';
}


}

/// @nodoc
abstract mixin class $CheckPaymentStatusEventCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory $CheckPaymentStatusEventCopyWith(CheckPaymentStatusEvent value, $Res Function(CheckPaymentStatusEvent) _then) = _$CheckPaymentStatusEventCopyWithImpl;
@useResult
$Res call({
 String paymentId
});




}
/// @nodoc
class _$CheckPaymentStatusEventCopyWithImpl<$Res>
    implements $CheckPaymentStatusEventCopyWith<$Res> {
  _$CheckPaymentStatusEventCopyWithImpl(this._self, this._then);

  final CheckPaymentStatusEvent _self;
  final $Res Function(CheckPaymentStatusEvent) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentId = null,}) {
  return _then(CheckPaymentStatusEvent(
null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetPaymentEvent implements PaymentEvent {
  const ResetPaymentEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPaymentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.reset()';
}


}




// dart format on
