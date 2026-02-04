// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_market_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AircraftMarketEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEvent()';
}


}

/// @nodoc
class $AircraftMarketEventCopyWith<$Res>  {
$AircraftMarketEventCopyWith(AircraftMarketEvent _, $Res Function(AircraftMarketEvent) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketEvent].
extension AircraftMarketEventPatterns on AircraftMarketEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAircraftMarketEvent value)?  getProducts,TResult Function( LoadMoreAircraftMarketEvent value)?  loadMore,TResult Function( RefreshAircraftMarketEvent value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that);case LoadMoreAircraftMarketEvent() when loadMore != null:
return loadMore(_that);case RefreshAircraftMarketEvent() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAircraftMarketEvent value)  getProducts,required TResult Function( LoadMoreAircraftMarketEvent value)  loadMore,required TResult Function( RefreshAircraftMarketEvent value)  refresh,}){
final _that = this;
switch (_that) {
case GetAircraftMarketEvent():
return getProducts(_that);case LoadMoreAircraftMarketEvent():
return loadMore(_that);case RefreshAircraftMarketEvent():
return refresh(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAircraftMarketEvent value)?  getProducts,TResult? Function( LoadMoreAircraftMarketEvent value)?  loadMore,TResult? Function( RefreshAircraftMarketEvent value)?  refresh,}){
final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that);case LoadMoreAircraftMarketEvent() when loadMore != null:
return loadMore(_that);case RefreshAircraftMarketEvent() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? aircraftSubcategoriesId,  List<int>? aircraftSubcategoriesIds,  int? sellerId,  String? searchQuery,  int? priceFrom,  int? priceTo,  String? brand,  String? sortBy,  bool includeInactive,  int limit,  int offset)?  getProducts,TResult Function()?  loadMore,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that.aircraftSubcategoriesId,_that.aircraftSubcategoriesIds,_that.sellerId,_that.searchQuery,_that.priceFrom,_that.priceTo,_that.brand,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case LoadMoreAircraftMarketEvent() when loadMore != null:
return loadMore();case RefreshAircraftMarketEvent() when refresh != null:
return refresh();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? aircraftSubcategoriesId,  List<int>? aircraftSubcategoriesIds,  int? sellerId,  String? searchQuery,  int? priceFrom,  int? priceTo,  String? brand,  String? sortBy,  bool includeInactive,  int limit,  int offset)  getProducts,required TResult Function()  loadMore,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case GetAircraftMarketEvent():
return getProducts(_that.aircraftSubcategoriesId,_that.aircraftSubcategoriesIds,_that.sellerId,_that.searchQuery,_that.priceFrom,_that.priceTo,_that.brand,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case LoadMoreAircraftMarketEvent():
return loadMore();case RefreshAircraftMarketEvent():
return refresh();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? aircraftSubcategoriesId,  List<int>? aircraftSubcategoriesIds,  int? sellerId,  String? searchQuery,  int? priceFrom,  int? priceTo,  String? brand,  String? sortBy,  bool includeInactive,  int limit,  int offset)?  getProducts,TResult? Function()?  loadMore,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that.aircraftSubcategoriesId,_that.aircraftSubcategoriesIds,_that.sellerId,_that.searchQuery,_that.priceFrom,_that.priceTo,_that.brand,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case LoadMoreAircraftMarketEvent() when loadMore != null:
return loadMore();case RefreshAircraftMarketEvent() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class GetAircraftMarketEvent implements AircraftMarketEvent {
  const GetAircraftMarketEvent({this.aircraftSubcategoriesId, final  List<int>? aircraftSubcategoriesIds, this.sellerId, this.searchQuery, this.priceFrom, this.priceTo, this.brand, this.sortBy, this.includeInactive = false, this.limit = 20, this.offset = 0}): _aircraftSubcategoriesIds = aircraftSubcategoriesIds;
  

 final  int? aircraftSubcategoriesId;
 final  List<int>? _aircraftSubcategoriesIds;
 List<int>? get aircraftSubcategoriesIds {
  final value = _aircraftSubcategoriesIds;
  if (value == null) return null;
  if (_aircraftSubcategoriesIds is EqualUnmodifiableListView) return _aircraftSubcategoriesIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  int? sellerId;
 final  String? searchQuery;
 final  int? priceFrom;
 final  int? priceTo;
 final  String? brand;
 final  String? sortBy;
@JsonKey() final  bool includeInactive;
@JsonKey() final  int limit;
@JsonKey() final  int offset;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAircraftMarketEventCopyWith<GetAircraftMarketEvent> get copyWith => _$GetAircraftMarketEventCopyWithImpl<GetAircraftMarketEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAircraftMarketEvent&&(identical(other.aircraftSubcategoriesId, aircraftSubcategoriesId) || other.aircraftSubcategoriesId == aircraftSubcategoriesId)&&const DeepCollectionEquality().equals(other._aircraftSubcategoriesIds, _aircraftSubcategoriesIds)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.priceFrom, priceFrom) || other.priceFrom == priceFrom)&&(identical(other.priceTo, priceTo) || other.priceTo == priceTo)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.includeInactive, includeInactive) || other.includeInactive == includeInactive)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,aircraftSubcategoriesId,const DeepCollectionEquality().hash(_aircraftSubcategoriesIds),sellerId,searchQuery,priceFrom,priceTo,brand,sortBy,includeInactive,limit,offset);

@override
String toString() {
  return 'AircraftMarketEvent.getProducts(aircraftSubcategoriesId: $aircraftSubcategoriesId, aircraftSubcategoriesIds: $aircraftSubcategoriesIds, sellerId: $sellerId, searchQuery: $searchQuery, priceFrom: $priceFrom, priceTo: $priceTo, brand: $brand, sortBy: $sortBy, includeInactive: $includeInactive, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $GetAircraftMarketEventCopyWith<$Res> implements $AircraftMarketEventCopyWith<$Res> {
  factory $GetAircraftMarketEventCopyWith(GetAircraftMarketEvent value, $Res Function(GetAircraftMarketEvent) _then) = _$GetAircraftMarketEventCopyWithImpl;
@useResult
$Res call({
 int? aircraftSubcategoriesId, List<int>? aircraftSubcategoriesIds, int? sellerId, String? searchQuery, int? priceFrom, int? priceTo, String? brand, String? sortBy, bool includeInactive, int limit, int offset
});




}
/// @nodoc
class _$GetAircraftMarketEventCopyWithImpl<$Res>
    implements $GetAircraftMarketEventCopyWith<$Res> {
  _$GetAircraftMarketEventCopyWithImpl(this._self, this._then);

  final GetAircraftMarketEvent _self;
  final $Res Function(GetAircraftMarketEvent) _then;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? aircraftSubcategoriesId = freezed,Object? aircraftSubcategoriesIds = freezed,Object? sellerId = freezed,Object? searchQuery = freezed,Object? priceFrom = freezed,Object? priceTo = freezed,Object? brand = freezed,Object? sortBy = freezed,Object? includeInactive = null,Object? limit = null,Object? offset = null,}) {
  return _then(GetAircraftMarketEvent(
aircraftSubcategoriesId: freezed == aircraftSubcategoriesId ? _self.aircraftSubcategoriesId : aircraftSubcategoriesId // ignore: cast_nullable_to_non_nullable
as int?,aircraftSubcategoriesIds: freezed == aircraftSubcategoriesIds ? _self._aircraftSubcategoriesIds : aircraftSubcategoriesIds // ignore: cast_nullable_to_non_nullable
as List<int>?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as int?,priceTo: freezed == priceTo ? _self.priceTo : priceTo // ignore: cast_nullable_to_non_nullable
as int?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,includeInactive: null == includeInactive ? _self.includeInactive : includeInactive // ignore: cast_nullable_to_non_nullable
as bool,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadMoreAircraftMarketEvent implements AircraftMarketEvent {
  const LoadMoreAircraftMarketEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreAircraftMarketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEvent.loadMore()';
}


}




/// @nodoc


class RefreshAircraftMarketEvent implements AircraftMarketEvent {
  const RefreshAircraftMarketEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshAircraftMarketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEvent.refresh()';
}


}




/// @nodoc
mixin _$AircraftMarketState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketState()';
}


}

/// @nodoc
class $AircraftMarketStateCopyWith<$Res>  {
$AircraftMarketStateCopyWith(AircraftMarketState _, $Res Function(AircraftMarketState) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketState].
extension AircraftMarketStatePatterns on AircraftMarketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingAircraftMarketState value)?  loading,TResult Function( LoadingMoreAircraftMarketState value)?  loadingMore,TResult Function( ErrorAircraftMarketState value)?  error,TResult Function( SuccessAircraftMarketState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading(_that);case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that);case ErrorAircraftMarketState() when error != null:
return error(_that);case SuccessAircraftMarketState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingAircraftMarketState value)  loading,required TResult Function( LoadingMoreAircraftMarketState value)  loadingMore,required TResult Function( ErrorAircraftMarketState value)  error,required TResult Function( SuccessAircraftMarketState value)  success,}){
final _that = this;
switch (_that) {
case LoadingAircraftMarketState():
return loading(_that);case LoadingMoreAircraftMarketState():
return loadingMore(_that);case ErrorAircraftMarketState():
return error(_that);case SuccessAircraftMarketState():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingAircraftMarketState value)?  loading,TResult? Function( LoadingMoreAircraftMarketState value)?  loadingMore,TResult? Function( ErrorAircraftMarketState value)?  error,TResult? Function( SuccessAircraftMarketState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading(_that);case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that);case ErrorAircraftMarketState() when error != null:
return error(_that);case SuccessAircraftMarketState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<AircraftMarketEntity> products)?  loadingMore,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<AircraftMarketEntity> products,  bool hasMore)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading();case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that.products);case ErrorAircraftMarketState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessAircraftMarketState() when success != null:
return success(_that.products,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<AircraftMarketEntity> products)  loadingMore,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<AircraftMarketEntity> products,  bool hasMore)  success,}) {final _that = this;
switch (_that) {
case LoadingAircraftMarketState():
return loading();case LoadingMoreAircraftMarketState():
return loadingMore(_that.products);case ErrorAircraftMarketState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessAircraftMarketState():
return success(_that.products,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<AircraftMarketEntity> products)?  loadingMore,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<AircraftMarketEntity> products,  bool hasMore)?  success,}) {final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading();case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that.products);case ErrorAircraftMarketState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessAircraftMarketState() when success != null:
return success(_that.products,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class LoadingAircraftMarketState implements AircraftMarketState {
  const LoadingAircraftMarketState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAircraftMarketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketState.loading()';
}


}




/// @nodoc


class LoadingMoreAircraftMarketState implements AircraftMarketState {
  const LoadingMoreAircraftMarketState({required final  List<AircraftMarketEntity> products}): _products = products;
  

 final  List<AircraftMarketEntity> _products;
 List<AircraftMarketEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingMoreAircraftMarketStateCopyWith<LoadingMoreAircraftMarketState> get copyWith => _$LoadingMoreAircraftMarketStateCopyWithImpl<LoadingMoreAircraftMarketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMoreAircraftMarketState&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'AircraftMarketState.loadingMore(products: $products)';
}


}

/// @nodoc
abstract mixin class $LoadingMoreAircraftMarketStateCopyWith<$Res> implements $AircraftMarketStateCopyWith<$Res> {
  factory $LoadingMoreAircraftMarketStateCopyWith(LoadingMoreAircraftMarketState value, $Res Function(LoadingMoreAircraftMarketState) _then) = _$LoadingMoreAircraftMarketStateCopyWithImpl;
@useResult
$Res call({
 List<AircraftMarketEntity> products
});




}
/// @nodoc
class _$LoadingMoreAircraftMarketStateCopyWithImpl<$Res>
    implements $LoadingMoreAircraftMarketStateCopyWith<$Res> {
  _$LoadingMoreAircraftMarketStateCopyWithImpl(this._self, this._then);

  final LoadingMoreAircraftMarketState _self;
  final $Res Function(LoadingMoreAircraftMarketState) _then;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(LoadingMoreAircraftMarketState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<AircraftMarketEntity>,
  ));
}


}

/// @nodoc


class ErrorAircraftMarketState implements AircraftMarketState {
  const ErrorAircraftMarketState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAircraftMarketStateCopyWith<ErrorAircraftMarketState> get copyWith => _$ErrorAircraftMarketStateCopyWithImpl<ErrorAircraftMarketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAircraftMarketState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'AircraftMarketState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorAircraftMarketStateCopyWith<$Res> implements $AircraftMarketStateCopyWith<$Res> {
  factory $ErrorAircraftMarketStateCopyWith(ErrorAircraftMarketState value, $Res Function(ErrorAircraftMarketState) _then) = _$ErrorAircraftMarketStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorAircraftMarketStateCopyWithImpl<$Res>
    implements $ErrorAircraftMarketStateCopyWith<$Res> {
  _$ErrorAircraftMarketStateCopyWithImpl(this._self, this._then);

  final ErrorAircraftMarketState _self;
  final $Res Function(ErrorAircraftMarketState) _then;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorAircraftMarketState(
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


class SuccessAircraftMarketState implements AircraftMarketState {
  const SuccessAircraftMarketState({required final  List<AircraftMarketEntity> products, this.hasMore = true}): _products = products;
  

 final  List<AircraftMarketEntity> _products;
 List<AircraftMarketEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@JsonKey() final  bool hasMore;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessAircraftMarketStateCopyWith<SuccessAircraftMarketState> get copyWith => _$SuccessAircraftMarketStateCopyWithImpl<SuccessAircraftMarketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessAircraftMarketState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),hasMore);

@override
String toString() {
  return 'AircraftMarketState.success(products: $products, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SuccessAircraftMarketStateCopyWith<$Res> implements $AircraftMarketStateCopyWith<$Res> {
  factory $SuccessAircraftMarketStateCopyWith(SuccessAircraftMarketState value, $Res Function(SuccessAircraftMarketState) _then) = _$SuccessAircraftMarketStateCopyWithImpl;
@useResult
$Res call({
 List<AircraftMarketEntity> products, bool hasMore
});




}
/// @nodoc
class _$SuccessAircraftMarketStateCopyWithImpl<$Res>
    implements $SuccessAircraftMarketStateCopyWith<$Res> {
  _$SuccessAircraftMarketStateCopyWithImpl(this._self, this._then);

  final SuccessAircraftMarketState _self;
  final $Res Function(SuccessAircraftMarketState) _then;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? hasMore = null,}) {
  return _then(SuccessAircraftMarketState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<AircraftMarketEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
