// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_market_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AircraftMarketDetailEvent {

 int get productId;
/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftMarketDetailEventCopyWith<AircraftMarketDetailEvent> get copyWith => _$AircraftMarketDetailEventCopyWithImpl<AircraftMarketDetailEvent>(this as AircraftMarketDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketDetailEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketDetailEvent(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AircraftMarketDetailEventCopyWith<$Res>  {
  factory $AircraftMarketDetailEventCopyWith(AircraftMarketDetailEvent value, $Res Function(AircraftMarketDetailEvent) _then) = _$AircraftMarketDetailEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$AircraftMarketDetailEventCopyWithImpl<$Res>
    implements $AircraftMarketDetailEventCopyWith<$Res> {
  _$AircraftMarketDetailEventCopyWithImpl(this._self, this._then);

  final AircraftMarketDetailEvent _self;
  final $Res Function(AircraftMarketDetailEvent) _then;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AircraftMarketDetailEvent].
extension AircraftMarketDetailEventPatterns on AircraftMarketDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAircraftMarketDetailEvent value)?  getProduct,TResult Function( DeleteAircraftMarketDetailEvent value)?  deleteProduct,TResult Function( AddToFavoritesDetailEvent value)?  addToFavorites,TResult Function( RemoveFromFavoritesDetailEvent value)?  removeFromFavorites,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAircraftMarketDetailEvent() when getProduct != null:
return getProduct(_that);case DeleteAircraftMarketDetailEvent() when deleteProduct != null:
return deleteProduct(_that);case AddToFavoritesDetailEvent() when addToFavorites != null:
return addToFavorites(_that);case RemoveFromFavoritesDetailEvent() when removeFromFavorites != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAircraftMarketDetailEvent value)  getProduct,required TResult Function( DeleteAircraftMarketDetailEvent value)  deleteProduct,required TResult Function( AddToFavoritesDetailEvent value)  addToFavorites,required TResult Function( RemoveFromFavoritesDetailEvent value)  removeFromFavorites,}){
final _that = this;
switch (_that) {
case GetAircraftMarketDetailEvent():
return getProduct(_that);case DeleteAircraftMarketDetailEvent():
return deleteProduct(_that);case AddToFavoritesDetailEvent():
return addToFavorites(_that);case RemoveFromFavoritesDetailEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAircraftMarketDetailEvent value)?  getProduct,TResult? Function( DeleteAircraftMarketDetailEvent value)?  deleteProduct,TResult? Function( AddToFavoritesDetailEvent value)?  addToFavorites,TResult? Function( RemoveFromFavoritesDetailEvent value)?  removeFromFavorites,}){
final _that = this;
switch (_that) {
case GetAircraftMarketDetailEvent() when getProduct != null:
return getProduct(_that);case DeleteAircraftMarketDetailEvent() when deleteProduct != null:
return deleteProduct(_that);case AddToFavoritesDetailEvent() when addToFavorites != null:
return addToFavorites(_that);case RemoveFromFavoritesDetailEvent() when removeFromFavorites != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int productId)?  getProduct,TResult Function( int productId)?  deleteProduct,TResult Function( int productId)?  addToFavorites,TResult Function( int productId)?  removeFromFavorites,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAircraftMarketDetailEvent() when getProduct != null:
return getProduct(_that.productId);case DeleteAircraftMarketDetailEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case AddToFavoritesDetailEvent() when addToFavorites != null:
return addToFavorites(_that.productId);case RemoveFromFavoritesDetailEvent() when removeFromFavorites != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int productId)  getProduct,required TResult Function( int productId)  deleteProduct,required TResult Function( int productId)  addToFavorites,required TResult Function( int productId)  removeFromFavorites,}) {final _that = this;
switch (_that) {
case GetAircraftMarketDetailEvent():
return getProduct(_that.productId);case DeleteAircraftMarketDetailEvent():
return deleteProduct(_that.productId);case AddToFavoritesDetailEvent():
return addToFavorites(_that.productId);case RemoveFromFavoritesDetailEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int productId)?  getProduct,TResult? Function( int productId)?  deleteProduct,TResult? Function( int productId)?  addToFavorites,TResult? Function( int productId)?  removeFromFavorites,}) {final _that = this;
switch (_that) {
case GetAircraftMarketDetailEvent() when getProduct != null:
return getProduct(_that.productId);case DeleteAircraftMarketDetailEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case AddToFavoritesDetailEvent() when addToFavorites != null:
return addToFavorites(_that.productId);case RemoveFromFavoritesDetailEvent() when removeFromFavorites != null:
return removeFromFavorites(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class GetAircraftMarketDetailEvent implements AircraftMarketDetailEvent {
  const GetAircraftMarketDetailEvent(this.productId);
  

@override final  int productId;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAircraftMarketDetailEventCopyWith<GetAircraftMarketDetailEvent> get copyWith => _$GetAircraftMarketDetailEventCopyWithImpl<GetAircraftMarketDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAircraftMarketDetailEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketDetailEvent.getProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $GetAircraftMarketDetailEventCopyWith<$Res> implements $AircraftMarketDetailEventCopyWith<$Res> {
  factory $GetAircraftMarketDetailEventCopyWith(GetAircraftMarketDetailEvent value, $Res Function(GetAircraftMarketDetailEvent) _then) = _$GetAircraftMarketDetailEventCopyWithImpl;
@override @useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$GetAircraftMarketDetailEventCopyWithImpl<$Res>
    implements $GetAircraftMarketDetailEventCopyWith<$Res> {
  _$GetAircraftMarketDetailEventCopyWithImpl(this._self, this._then);

  final GetAircraftMarketDetailEvent _self;
  final $Res Function(GetAircraftMarketDetailEvent) _then;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(GetAircraftMarketDetailEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteAircraftMarketDetailEvent implements AircraftMarketDetailEvent {
  const DeleteAircraftMarketDetailEvent(this.productId);
  

@override final  int productId;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAircraftMarketDetailEventCopyWith<DeleteAircraftMarketDetailEvent> get copyWith => _$DeleteAircraftMarketDetailEventCopyWithImpl<DeleteAircraftMarketDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAircraftMarketDetailEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketDetailEvent.deleteProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DeleteAircraftMarketDetailEventCopyWith<$Res> implements $AircraftMarketDetailEventCopyWith<$Res> {
  factory $DeleteAircraftMarketDetailEventCopyWith(DeleteAircraftMarketDetailEvent value, $Res Function(DeleteAircraftMarketDetailEvent) _then) = _$DeleteAircraftMarketDetailEventCopyWithImpl;
@override @useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DeleteAircraftMarketDetailEventCopyWithImpl<$Res>
    implements $DeleteAircraftMarketDetailEventCopyWith<$Res> {
  _$DeleteAircraftMarketDetailEventCopyWithImpl(this._self, this._then);

  final DeleteAircraftMarketDetailEvent _self;
  final $Res Function(DeleteAircraftMarketDetailEvent) _then;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DeleteAircraftMarketDetailEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AddToFavoritesDetailEvent implements AircraftMarketDetailEvent {
  const AddToFavoritesDetailEvent(this.productId);
  

@override final  int productId;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToFavoritesDetailEventCopyWith<AddToFavoritesDetailEvent> get copyWith => _$AddToFavoritesDetailEventCopyWithImpl<AddToFavoritesDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToFavoritesDetailEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketDetailEvent.addToFavorites(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AddToFavoritesDetailEventCopyWith<$Res> implements $AircraftMarketDetailEventCopyWith<$Res> {
  factory $AddToFavoritesDetailEventCopyWith(AddToFavoritesDetailEvent value, $Res Function(AddToFavoritesDetailEvent) _then) = _$AddToFavoritesDetailEventCopyWithImpl;
@override @useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$AddToFavoritesDetailEventCopyWithImpl<$Res>
    implements $AddToFavoritesDetailEventCopyWith<$Res> {
  _$AddToFavoritesDetailEventCopyWithImpl(this._self, this._then);

  final AddToFavoritesDetailEvent _self;
  final $Res Function(AddToFavoritesDetailEvent) _then;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(AddToFavoritesDetailEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RemoveFromFavoritesDetailEvent implements AircraftMarketDetailEvent {
  const RemoveFromFavoritesDetailEvent(this.productId);
  

@override final  int productId;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFromFavoritesDetailEventCopyWith<RemoveFromFavoritesDetailEvent> get copyWith => _$RemoveFromFavoritesDetailEventCopyWithImpl<RemoveFromFavoritesDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFromFavoritesDetailEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketDetailEvent.removeFromFavorites(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $RemoveFromFavoritesDetailEventCopyWith<$Res> implements $AircraftMarketDetailEventCopyWith<$Res> {
  factory $RemoveFromFavoritesDetailEventCopyWith(RemoveFromFavoritesDetailEvent value, $Res Function(RemoveFromFavoritesDetailEvent) _then) = _$RemoveFromFavoritesDetailEventCopyWithImpl;
@override @useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$RemoveFromFavoritesDetailEventCopyWithImpl<$Res>
    implements $RemoveFromFavoritesDetailEventCopyWith<$Res> {
  _$RemoveFromFavoritesDetailEventCopyWithImpl(this._self, this._then);

  final RemoveFromFavoritesDetailEvent _self;
  final $Res Function(RemoveFromFavoritesDetailEvent) _then;

/// Create a copy of AircraftMarketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(RemoveFromFavoritesDetailEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AircraftMarketDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketDetailState()';
}


}

/// @nodoc
class $AircraftMarketDetailStateCopyWith<$Res>  {
$AircraftMarketDetailStateCopyWith(AircraftMarketDetailState _, $Res Function(AircraftMarketDetailState) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketDetailState].
extension AircraftMarketDetailStatePatterns on AircraftMarketDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialAircraftMarketDetailState value)?  initial,TResult Function( LoadingAircraftMarketDetailState value)?  loading,TResult Function( ErrorAircraftMarketDetailState value)?  error,TResult Function( SuccessAircraftMarketDetailState value)?  success,TResult Function( DeletedAircraftMarketDetailState value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialAircraftMarketDetailState() when initial != null:
return initial(_that);case LoadingAircraftMarketDetailState() when loading != null:
return loading(_that);case ErrorAircraftMarketDetailState() when error != null:
return error(_that);case SuccessAircraftMarketDetailState() when success != null:
return success(_that);case DeletedAircraftMarketDetailState() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialAircraftMarketDetailState value)  initial,required TResult Function( LoadingAircraftMarketDetailState value)  loading,required TResult Function( ErrorAircraftMarketDetailState value)  error,required TResult Function( SuccessAircraftMarketDetailState value)  success,required TResult Function( DeletedAircraftMarketDetailState value)  deleted,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketDetailState():
return initial(_that);case LoadingAircraftMarketDetailState():
return loading(_that);case ErrorAircraftMarketDetailState():
return error(_that);case SuccessAircraftMarketDetailState():
return success(_that);case DeletedAircraftMarketDetailState():
return deleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialAircraftMarketDetailState value)?  initial,TResult? Function( LoadingAircraftMarketDetailState value)?  loading,TResult? Function( ErrorAircraftMarketDetailState value)?  error,TResult? Function( SuccessAircraftMarketDetailState value)?  success,TResult? Function( DeletedAircraftMarketDetailState value)?  deleted,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketDetailState() when initial != null:
return initial(_that);case LoadingAircraftMarketDetailState() when loading != null:
return loading(_that);case ErrorAircraftMarketDetailState() when error != null:
return error(_that);case SuccessAircraftMarketDetailState() when success != null:
return success(_that);case DeletedAircraftMarketDetailState() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( AircraftMarketEntity product)?  success,TResult Function()?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialAircraftMarketDetailState() when initial != null:
return initial();case LoadingAircraftMarketDetailState() when loading != null:
return loading();case ErrorAircraftMarketDetailState() when error != null:
return error(_that.message);case SuccessAircraftMarketDetailState() when success != null:
return success(_that.product);case DeletedAircraftMarketDetailState() when deleted != null:
return deleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( AircraftMarketEntity product)  success,required TResult Function()  deleted,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketDetailState():
return initial();case LoadingAircraftMarketDetailState():
return loading();case ErrorAircraftMarketDetailState():
return error(_that.message);case SuccessAircraftMarketDetailState():
return success(_that.product);case DeletedAircraftMarketDetailState():
return deleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( AircraftMarketEntity product)?  success,TResult? Function()?  deleted,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketDetailState() when initial != null:
return initial();case LoadingAircraftMarketDetailState() when loading != null:
return loading();case ErrorAircraftMarketDetailState() when error != null:
return error(_that.message);case SuccessAircraftMarketDetailState() when success != null:
return success(_that.product);case DeletedAircraftMarketDetailState() when deleted != null:
return deleted();case _:
  return null;

}
}

}

/// @nodoc


class InitialAircraftMarketDetailState implements AircraftMarketDetailState {
  const InitialAircraftMarketDetailState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAircraftMarketDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketDetailState.initial()';
}


}




/// @nodoc


class LoadingAircraftMarketDetailState implements AircraftMarketDetailState {
  const LoadingAircraftMarketDetailState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAircraftMarketDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketDetailState.loading()';
}


}




/// @nodoc


class ErrorAircraftMarketDetailState implements AircraftMarketDetailState {
  const ErrorAircraftMarketDetailState(this.message);
  

 final  String message;

/// Create a copy of AircraftMarketDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAircraftMarketDetailStateCopyWith<ErrorAircraftMarketDetailState> get copyWith => _$ErrorAircraftMarketDetailStateCopyWithImpl<ErrorAircraftMarketDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAircraftMarketDetailState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AircraftMarketDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorAircraftMarketDetailStateCopyWith<$Res> implements $AircraftMarketDetailStateCopyWith<$Res> {
  factory $ErrorAircraftMarketDetailStateCopyWith(ErrorAircraftMarketDetailState value, $Res Function(ErrorAircraftMarketDetailState) _then) = _$ErrorAircraftMarketDetailStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorAircraftMarketDetailStateCopyWithImpl<$Res>
    implements $ErrorAircraftMarketDetailStateCopyWith<$Res> {
  _$ErrorAircraftMarketDetailStateCopyWithImpl(this._self, this._then);

  final ErrorAircraftMarketDetailState _self;
  final $Res Function(ErrorAircraftMarketDetailState) _then;

/// Create a copy of AircraftMarketDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorAircraftMarketDetailState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessAircraftMarketDetailState implements AircraftMarketDetailState {
  const SuccessAircraftMarketDetailState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessAircraftMarketDetailStateCopyWith<SuccessAircraftMarketDetailState> get copyWith => _$SuccessAircraftMarketDetailStateCopyWithImpl<SuccessAircraftMarketDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessAircraftMarketDetailState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketDetailState.success(product: $product)';
}


}

/// @nodoc
abstract mixin class $SuccessAircraftMarketDetailStateCopyWith<$Res> implements $AircraftMarketDetailStateCopyWith<$Res> {
  factory $SuccessAircraftMarketDetailStateCopyWith(SuccessAircraftMarketDetailState value, $Res Function(SuccessAircraftMarketDetailState) _then) = _$SuccessAircraftMarketDetailStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$SuccessAircraftMarketDetailStateCopyWithImpl<$Res>
    implements $SuccessAircraftMarketDetailStateCopyWith<$Res> {
  _$SuccessAircraftMarketDetailStateCopyWithImpl(this._self, this._then);

  final SuccessAircraftMarketDetailState _self;
  final $Res Function(SuccessAircraftMarketDetailState) _then;

/// Create a copy of AircraftMarketDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(SuccessAircraftMarketDetailState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class DeletedAircraftMarketDetailState implements AircraftMarketDetailState {
  const DeletedAircraftMarketDetailState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedAircraftMarketDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketDetailState.deleted()';
}


}




// dart format on
