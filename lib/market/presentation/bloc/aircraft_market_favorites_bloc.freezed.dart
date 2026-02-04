// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_market_favorites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AircraftMarketFavoritesEvent {

 int get productId;
/// Create a copy of AircraftMarketFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftMarketFavoritesEventCopyWith<AircraftMarketFavoritesEvent> get copyWith => _$AircraftMarketFavoritesEventCopyWithImpl<AircraftMarketFavoritesEvent>(this as AircraftMarketFavoritesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketFavoritesEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketFavoritesEvent(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AircraftMarketFavoritesEventCopyWith<$Res>  {
  factory $AircraftMarketFavoritesEventCopyWith(AircraftMarketFavoritesEvent value, $Res Function(AircraftMarketFavoritesEvent) _then) = _$AircraftMarketFavoritesEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$AircraftMarketFavoritesEventCopyWithImpl<$Res>
    implements $AircraftMarketFavoritesEventCopyWith<$Res> {
  _$AircraftMarketFavoritesEventCopyWithImpl(this._self, this._then);

  final AircraftMarketFavoritesEvent _self;
  final $Res Function(AircraftMarketFavoritesEvent) _then;

/// Create a copy of AircraftMarketFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AircraftMarketFavoritesEvent].
extension AircraftMarketFavoritesEventPatterns on AircraftMarketFavoritesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddToFavoritesFavoritesEvent value)?  addToFavorites,TResult Function( RemoveFromFavoritesFavoritesEvent value)?  removeFromFavorites,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddToFavoritesFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that);case RemoveFromFavoritesFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddToFavoritesFavoritesEvent value)  addToFavorites,required TResult Function( RemoveFromFavoritesFavoritesEvent value)  removeFromFavorites,}){
final _that = this;
switch (_that) {
case AddToFavoritesFavoritesEvent():
return addToFavorites(_that);case RemoveFromFavoritesFavoritesEvent():
return removeFromFavorites(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddToFavoritesFavoritesEvent value)?  addToFavorites,TResult? Function( RemoveFromFavoritesFavoritesEvent value)?  removeFromFavorites,}){
final _that = this;
switch (_that) {
case AddToFavoritesFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that);case RemoveFromFavoritesFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int productId)?  addToFavorites,TResult Function( int productId)?  removeFromFavorites,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddToFavoritesFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that.productId);case RemoveFromFavoritesFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int productId)  addToFavorites,required TResult Function( int productId)  removeFromFavorites,}) {final _that = this;
switch (_that) {
case AddToFavoritesFavoritesEvent():
return addToFavorites(_that.productId);case RemoveFromFavoritesFavoritesEvent():
return removeFromFavorites(_that.productId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int productId)?  addToFavorites,TResult? Function( int productId)?  removeFromFavorites,}) {final _that = this;
switch (_that) {
case AddToFavoritesFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that.productId);case RemoveFromFavoritesFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class AddToFavoritesFavoritesEvent implements AircraftMarketFavoritesEvent {
  const AddToFavoritesFavoritesEvent(this.productId);
  

@override final  int productId;

/// Create a copy of AircraftMarketFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToFavoritesFavoritesEventCopyWith<AddToFavoritesFavoritesEvent> get copyWith => _$AddToFavoritesFavoritesEventCopyWithImpl<AddToFavoritesFavoritesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToFavoritesFavoritesEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketFavoritesEvent.addToFavorites(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AddToFavoritesFavoritesEventCopyWith<$Res> implements $AircraftMarketFavoritesEventCopyWith<$Res> {
  factory $AddToFavoritesFavoritesEventCopyWith(AddToFavoritesFavoritesEvent value, $Res Function(AddToFavoritesFavoritesEvent) _then) = _$AddToFavoritesFavoritesEventCopyWithImpl;
@override @useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$AddToFavoritesFavoritesEventCopyWithImpl<$Res>
    implements $AddToFavoritesFavoritesEventCopyWith<$Res> {
  _$AddToFavoritesFavoritesEventCopyWithImpl(this._self, this._then);

  final AddToFavoritesFavoritesEvent _self;
  final $Res Function(AddToFavoritesFavoritesEvent) _then;

/// Create a copy of AircraftMarketFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(AddToFavoritesFavoritesEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RemoveFromFavoritesFavoritesEvent implements AircraftMarketFavoritesEvent {
  const RemoveFromFavoritesFavoritesEvent(this.productId);
  

@override final  int productId;

/// Create a copy of AircraftMarketFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFromFavoritesFavoritesEventCopyWith<RemoveFromFavoritesFavoritesEvent> get copyWith => _$RemoveFromFavoritesFavoritesEventCopyWithImpl<RemoveFromFavoritesFavoritesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFromFavoritesFavoritesEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketFavoritesEvent.removeFromFavorites(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $RemoveFromFavoritesFavoritesEventCopyWith<$Res> implements $AircraftMarketFavoritesEventCopyWith<$Res> {
  factory $RemoveFromFavoritesFavoritesEventCopyWith(RemoveFromFavoritesFavoritesEvent value, $Res Function(RemoveFromFavoritesFavoritesEvent) _then) = _$RemoveFromFavoritesFavoritesEventCopyWithImpl;
@override @useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$RemoveFromFavoritesFavoritesEventCopyWithImpl<$Res>
    implements $RemoveFromFavoritesFavoritesEventCopyWith<$Res> {
  _$RemoveFromFavoritesFavoritesEventCopyWithImpl(this._self, this._then);

  final RemoveFromFavoritesFavoritesEvent _self;
  final $Res Function(RemoveFromFavoritesFavoritesEvent) _then;

/// Create a copy of AircraftMarketFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(RemoveFromFavoritesFavoritesEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AircraftMarketFavoritesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketFavoritesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketFavoritesState()';
}


}

/// @nodoc
class $AircraftMarketFavoritesStateCopyWith<$Res>  {
$AircraftMarketFavoritesStateCopyWith(AircraftMarketFavoritesState _, $Res Function(AircraftMarketFavoritesState) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketFavoritesState].
extension AircraftMarketFavoritesStatePatterns on AircraftMarketFavoritesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialAircraftMarketFavoritesState value)?  initial,TResult Function( AddingAircraftMarketFavoritesState value)?  adding,TResult Function( AddedAircraftMarketFavoritesState value)?  added,TResult Function( RemovingAircraftMarketFavoritesState value)?  removing,TResult Function( RemovedAircraftMarketFavoritesState value)?  removed,TResult Function( ErrorAircraftMarketFavoritesState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialAircraftMarketFavoritesState() when initial != null:
return initial(_that);case AddingAircraftMarketFavoritesState() when adding != null:
return adding(_that);case AddedAircraftMarketFavoritesState() when added != null:
return added(_that);case RemovingAircraftMarketFavoritesState() when removing != null:
return removing(_that);case RemovedAircraftMarketFavoritesState() when removed != null:
return removed(_that);case ErrorAircraftMarketFavoritesState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialAircraftMarketFavoritesState value)  initial,required TResult Function( AddingAircraftMarketFavoritesState value)  adding,required TResult Function( AddedAircraftMarketFavoritesState value)  added,required TResult Function( RemovingAircraftMarketFavoritesState value)  removing,required TResult Function( RemovedAircraftMarketFavoritesState value)  removed,required TResult Function( ErrorAircraftMarketFavoritesState value)  error,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketFavoritesState():
return initial(_that);case AddingAircraftMarketFavoritesState():
return adding(_that);case AddedAircraftMarketFavoritesState():
return added(_that);case RemovingAircraftMarketFavoritesState():
return removing(_that);case RemovedAircraftMarketFavoritesState():
return removed(_that);case ErrorAircraftMarketFavoritesState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialAircraftMarketFavoritesState value)?  initial,TResult? Function( AddingAircraftMarketFavoritesState value)?  adding,TResult? Function( AddedAircraftMarketFavoritesState value)?  added,TResult? Function( RemovingAircraftMarketFavoritesState value)?  removing,TResult? Function( RemovedAircraftMarketFavoritesState value)?  removed,TResult? Function( ErrorAircraftMarketFavoritesState value)?  error,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketFavoritesState() when initial != null:
return initial(_that);case AddingAircraftMarketFavoritesState() when adding != null:
return adding(_that);case AddedAircraftMarketFavoritesState() when added != null:
return added(_that);case RemovingAircraftMarketFavoritesState() when removing != null:
return removing(_that);case RemovedAircraftMarketFavoritesState() when removed != null:
return removed(_that);case ErrorAircraftMarketFavoritesState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  adding,TResult Function( AircraftMarketEntity product)?  added,TResult Function()?  removing,TResult Function( AircraftMarketEntity product)?  removed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialAircraftMarketFavoritesState() when initial != null:
return initial();case AddingAircraftMarketFavoritesState() when adding != null:
return adding();case AddedAircraftMarketFavoritesState() when added != null:
return added(_that.product);case RemovingAircraftMarketFavoritesState() when removing != null:
return removing();case RemovedAircraftMarketFavoritesState() when removed != null:
return removed(_that.product);case ErrorAircraftMarketFavoritesState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  adding,required TResult Function( AircraftMarketEntity product)  added,required TResult Function()  removing,required TResult Function( AircraftMarketEntity product)  removed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketFavoritesState():
return initial();case AddingAircraftMarketFavoritesState():
return adding();case AddedAircraftMarketFavoritesState():
return added(_that.product);case RemovingAircraftMarketFavoritesState():
return removing();case RemovedAircraftMarketFavoritesState():
return removed(_that.product);case ErrorAircraftMarketFavoritesState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  adding,TResult? Function( AircraftMarketEntity product)?  added,TResult? Function()?  removing,TResult? Function( AircraftMarketEntity product)?  removed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketFavoritesState() when initial != null:
return initial();case AddingAircraftMarketFavoritesState() when adding != null:
return adding();case AddedAircraftMarketFavoritesState() when added != null:
return added(_that.product);case RemovingAircraftMarketFavoritesState() when removing != null:
return removing();case RemovedAircraftMarketFavoritesState() when removed != null:
return removed(_that.product);case ErrorAircraftMarketFavoritesState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitialAircraftMarketFavoritesState implements AircraftMarketFavoritesState {
  const InitialAircraftMarketFavoritesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAircraftMarketFavoritesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketFavoritesState.initial()';
}


}




/// @nodoc


class AddingAircraftMarketFavoritesState implements AircraftMarketFavoritesState {
  const AddingAircraftMarketFavoritesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddingAircraftMarketFavoritesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketFavoritesState.adding()';
}


}




/// @nodoc


class AddedAircraftMarketFavoritesState implements AircraftMarketFavoritesState {
  const AddedAircraftMarketFavoritesState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketFavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddedAircraftMarketFavoritesStateCopyWith<AddedAircraftMarketFavoritesState> get copyWith => _$AddedAircraftMarketFavoritesStateCopyWithImpl<AddedAircraftMarketFavoritesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddedAircraftMarketFavoritesState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketFavoritesState.added(product: $product)';
}


}

/// @nodoc
abstract mixin class $AddedAircraftMarketFavoritesStateCopyWith<$Res> implements $AircraftMarketFavoritesStateCopyWith<$Res> {
  factory $AddedAircraftMarketFavoritesStateCopyWith(AddedAircraftMarketFavoritesState value, $Res Function(AddedAircraftMarketFavoritesState) _then) = _$AddedAircraftMarketFavoritesStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$AddedAircraftMarketFavoritesStateCopyWithImpl<$Res>
    implements $AddedAircraftMarketFavoritesStateCopyWith<$Res> {
  _$AddedAircraftMarketFavoritesStateCopyWithImpl(this._self, this._then);

  final AddedAircraftMarketFavoritesState _self;
  final $Res Function(AddedAircraftMarketFavoritesState) _then;

/// Create a copy of AircraftMarketFavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(AddedAircraftMarketFavoritesState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class RemovingAircraftMarketFavoritesState implements AircraftMarketFavoritesState {
  const RemovingAircraftMarketFavoritesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemovingAircraftMarketFavoritesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketFavoritesState.removing()';
}


}




/// @nodoc


class RemovedAircraftMarketFavoritesState implements AircraftMarketFavoritesState {
  const RemovedAircraftMarketFavoritesState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketFavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemovedAircraftMarketFavoritesStateCopyWith<RemovedAircraftMarketFavoritesState> get copyWith => _$RemovedAircraftMarketFavoritesStateCopyWithImpl<RemovedAircraftMarketFavoritesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemovedAircraftMarketFavoritesState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketFavoritesState.removed(product: $product)';
}


}

/// @nodoc
abstract mixin class $RemovedAircraftMarketFavoritesStateCopyWith<$Res> implements $AircraftMarketFavoritesStateCopyWith<$Res> {
  factory $RemovedAircraftMarketFavoritesStateCopyWith(RemovedAircraftMarketFavoritesState value, $Res Function(RemovedAircraftMarketFavoritesState) _then) = _$RemovedAircraftMarketFavoritesStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$RemovedAircraftMarketFavoritesStateCopyWithImpl<$Res>
    implements $RemovedAircraftMarketFavoritesStateCopyWith<$Res> {
  _$RemovedAircraftMarketFavoritesStateCopyWithImpl(this._self, this._then);

  final RemovedAircraftMarketFavoritesState _self;
  final $Res Function(RemovedAircraftMarketFavoritesState) _then;

/// Create a copy of AircraftMarketFavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(RemovedAircraftMarketFavoritesState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class ErrorAircraftMarketFavoritesState implements AircraftMarketFavoritesState {
  const ErrorAircraftMarketFavoritesState(this.message);
  

 final  String message;

/// Create a copy of AircraftMarketFavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAircraftMarketFavoritesStateCopyWith<ErrorAircraftMarketFavoritesState> get copyWith => _$ErrorAircraftMarketFavoritesStateCopyWithImpl<ErrorAircraftMarketFavoritesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAircraftMarketFavoritesState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AircraftMarketFavoritesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorAircraftMarketFavoritesStateCopyWith<$Res> implements $AircraftMarketFavoritesStateCopyWith<$Res> {
  factory $ErrorAircraftMarketFavoritesStateCopyWith(ErrorAircraftMarketFavoritesState value, $Res Function(ErrorAircraftMarketFavoritesState) _then) = _$ErrorAircraftMarketFavoritesStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorAircraftMarketFavoritesStateCopyWithImpl<$Res>
    implements $ErrorAircraftMarketFavoritesStateCopyWith<$Res> {
  _$ErrorAircraftMarketFavoritesStateCopyWithImpl(this._self, this._then);

  final ErrorAircraftMarketFavoritesState _self;
  final $Res Function(ErrorAircraftMarketFavoritesState) _then;

/// Create a copy of AircraftMarketFavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorAircraftMarketFavoritesState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
