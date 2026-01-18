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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAircraftMarketEvent value)?  getProducts,TResult Function( AddToFavoritesEvent value)?  addToFavorites,TResult Function( RemoveFromFavoritesEvent value)?  removeFromFavorites,TResult Function( DeleteMarketProductEvent value)?  deleteProduct,TResult Function( CreateAircraftMarketProductEvent value)?  createAirCraft,TResult Function( UpdateMarketProductEvent value)?  updateProduct,TResult Function( LoadMoreAircraftMarketEvent value)?  loadMore,TResult Function( RefreshAircraftMarketEvent value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that);case AddToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that);case RemoveFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that);case DeleteMarketProductEvent() when deleteProduct != null:
return deleteProduct(_that);case CreateAircraftMarketProductEvent() when createAirCraft != null:
return createAirCraft(_that);case UpdateMarketProductEvent() when updateProduct != null:
return updateProduct(_that);case LoadMoreAircraftMarketEvent() when loadMore != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAircraftMarketEvent value)  getProducts,required TResult Function( AddToFavoritesEvent value)  addToFavorites,required TResult Function( RemoveFromFavoritesEvent value)  removeFromFavorites,required TResult Function( DeleteMarketProductEvent value)  deleteProduct,required TResult Function( CreateAircraftMarketProductEvent value)  createAirCraft,required TResult Function( UpdateMarketProductEvent value)  updateProduct,required TResult Function( LoadMoreAircraftMarketEvent value)  loadMore,required TResult Function( RefreshAircraftMarketEvent value)  refresh,}){
final _that = this;
switch (_that) {
case GetAircraftMarketEvent():
return getProducts(_that);case AddToFavoritesEvent():
return addToFavorites(_that);case RemoveFromFavoritesEvent():
return removeFromFavorites(_that);case DeleteMarketProductEvent():
return deleteProduct(_that);case CreateAircraftMarketProductEvent():
return createAirCraft(_that);case UpdateMarketProductEvent():
return updateProduct(_that);case LoadMoreAircraftMarketEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAircraftMarketEvent value)?  getProducts,TResult? Function( AddToFavoritesEvent value)?  addToFavorites,TResult? Function( RemoveFromFavoritesEvent value)?  removeFromFavorites,TResult? Function( DeleteMarketProductEvent value)?  deleteProduct,TResult? Function( CreateAircraftMarketProductEvent value)?  createAirCraft,TResult? Function( UpdateMarketProductEvent value)?  updateProduct,TResult? Function( LoadMoreAircraftMarketEvent value)?  loadMore,TResult? Function( RefreshAircraftMarketEvent value)?  refresh,}){
final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that);case AddToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that);case RemoveFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that);case DeleteMarketProductEvent() when deleteProduct != null:
return deleteProduct(_that);case CreateAircraftMarketProductEvent() when createAirCraft != null:
return createAirCraft(_that);case UpdateMarketProductEvent() when updateProduct != null:
return updateProduct(_that);case LoadMoreAircraftMarketEvent() when loadMore != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? aircraftSubcategoriesId,  List<int>? aircraftSubcategoriesIds,  int? sellerId,  String? searchQuery,  int? priceFrom,  int? priceTo,  String? brand,  String? sortBy,  bool includeInactive,  int limit,  int offset)?  getProducts,TResult Function( int productId)?  addToFavorites,TResult Function( int productId)?  removeFromFavorites,TResult Function( int productId)?  deleteProduct,TResult Function( String title,  String? description,  int price,  int? aircraftSubcategoriesId,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  createAirCraft,TResult Function( int productId,  String? title,  String? description,  int? price,  int? aircraftSubcategoriesId,  String? mainImageUrl,  List<String>? additionalImageUrls,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updateProduct,TResult Function()?  loadMore,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that.aircraftSubcategoriesId,_that.aircraftSubcategoriesIds,_that.sellerId,_that.searchQuery,_that.priceFrom,_that.priceTo,_that.brand,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case AddToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that.productId);case RemoveFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that.productId);case DeleteMarketProductEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case CreateAircraftMarketProductEvent() when createAirCraft != null:
return createAirCraft(_that.title,_that.description,_that.price,_that.aircraftSubcategoriesId,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.mainImageFile,_that.additionalImageFiles);case UpdateMarketProductEvent() when updateProduct != null:
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.aircraftSubcategoriesId,_that.mainImageUrl,_that.additionalImageUrls,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.mainImageFile,_that.additionalImageFiles);case LoadMoreAircraftMarketEvent() when loadMore != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? aircraftSubcategoriesId,  List<int>? aircraftSubcategoriesIds,  int? sellerId,  String? searchQuery,  int? priceFrom,  int? priceTo,  String? brand,  String? sortBy,  bool includeInactive,  int limit,  int offset)  getProducts,required TResult Function( int productId)  addToFavorites,required TResult Function( int productId)  removeFromFavorites,required TResult Function( int productId)  deleteProduct,required TResult Function( String title,  String? description,  int price,  int? aircraftSubcategoriesId,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)  createAirCraft,required TResult Function( int productId,  String? title,  String? description,  int? price,  int? aircraftSubcategoriesId,  String? mainImageUrl,  List<String>? additionalImageUrls,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)  updateProduct,required TResult Function()  loadMore,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case GetAircraftMarketEvent():
return getProducts(_that.aircraftSubcategoriesId,_that.aircraftSubcategoriesIds,_that.sellerId,_that.searchQuery,_that.priceFrom,_that.priceTo,_that.brand,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case AddToFavoritesEvent():
return addToFavorites(_that.productId);case RemoveFromFavoritesEvent():
return removeFromFavorites(_that.productId);case DeleteMarketProductEvent():
return deleteProduct(_that.productId);case CreateAircraftMarketProductEvent():
return createAirCraft(_that.title,_that.description,_that.price,_that.aircraftSubcategoriesId,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.mainImageFile,_that.additionalImageFiles);case UpdateMarketProductEvent():
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.aircraftSubcategoriesId,_that.mainImageUrl,_that.additionalImageUrls,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.mainImageFile,_that.additionalImageFiles);case LoadMoreAircraftMarketEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? aircraftSubcategoriesId,  List<int>? aircraftSubcategoriesIds,  int? sellerId,  String? searchQuery,  int? priceFrom,  int? priceTo,  String? brand,  String? sortBy,  bool includeInactive,  int limit,  int offset)?  getProducts,TResult? Function( int productId)?  addToFavorites,TResult? Function( int productId)?  removeFromFavorites,TResult? Function( int productId)?  deleteProduct,TResult? Function( String title,  String? description,  int price,  int? aircraftSubcategoriesId,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  createAirCraft,TResult? Function( int productId,  String? title,  String? description,  int? price,  int? aircraftSubcategoriesId,  String? mainImageUrl,  List<String>? additionalImageUrls,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updateProduct,TResult? Function()?  loadMore,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case GetAircraftMarketEvent() when getProducts != null:
return getProducts(_that.aircraftSubcategoriesId,_that.aircraftSubcategoriesIds,_that.sellerId,_that.searchQuery,_that.priceFrom,_that.priceTo,_that.brand,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case AddToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that.productId);case RemoveFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that.productId);case DeleteMarketProductEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case CreateAircraftMarketProductEvent() when createAirCraft != null:
return createAirCraft(_that.title,_that.description,_that.price,_that.aircraftSubcategoriesId,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.mainImageFile,_that.additionalImageFiles);case UpdateMarketProductEvent() when updateProduct != null:
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.aircraftSubcategoriesId,_that.mainImageUrl,_that.additionalImageUrls,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.mainImageFile,_that.additionalImageFiles);case LoadMoreAircraftMarketEvent() when loadMore != null:
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


class AddToFavoritesEvent implements AircraftMarketEvent {
  const AddToFavoritesEvent(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToFavoritesEventCopyWith<AddToFavoritesEvent> get copyWith => _$AddToFavoritesEventCopyWithImpl<AddToFavoritesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToFavoritesEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEvent.addToFavorites(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AddToFavoritesEventCopyWith<$Res> implements $AircraftMarketEventCopyWith<$Res> {
  factory $AddToFavoritesEventCopyWith(AddToFavoritesEvent value, $Res Function(AddToFavoritesEvent) _then) = _$AddToFavoritesEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$AddToFavoritesEventCopyWithImpl<$Res>
    implements $AddToFavoritesEventCopyWith<$Res> {
  _$AddToFavoritesEventCopyWithImpl(this._self, this._then);

  final AddToFavoritesEvent _self;
  final $Res Function(AddToFavoritesEvent) _then;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(AddToFavoritesEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RemoveFromFavoritesEvent implements AircraftMarketEvent {
  const RemoveFromFavoritesEvent(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFromFavoritesEventCopyWith<RemoveFromFavoritesEvent> get copyWith => _$RemoveFromFavoritesEventCopyWithImpl<RemoveFromFavoritesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFromFavoritesEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEvent.removeFromFavorites(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $RemoveFromFavoritesEventCopyWith<$Res> implements $AircraftMarketEventCopyWith<$Res> {
  factory $RemoveFromFavoritesEventCopyWith(RemoveFromFavoritesEvent value, $Res Function(RemoveFromFavoritesEvent) _then) = _$RemoveFromFavoritesEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$RemoveFromFavoritesEventCopyWithImpl<$Res>
    implements $RemoveFromFavoritesEventCopyWith<$Res> {
  _$RemoveFromFavoritesEventCopyWithImpl(this._self, this._then);

  final RemoveFromFavoritesEvent _self;
  final $Res Function(RemoveFromFavoritesEvent) _then;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(RemoveFromFavoritesEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteMarketProductEvent implements AircraftMarketEvent {
  const DeleteMarketProductEvent(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteMarketProductEventCopyWith<DeleteMarketProductEvent> get copyWith => _$DeleteMarketProductEventCopyWithImpl<DeleteMarketProductEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteMarketProductEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEvent.deleteProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DeleteMarketProductEventCopyWith<$Res> implements $AircraftMarketEventCopyWith<$Res> {
  factory $DeleteMarketProductEventCopyWith(DeleteMarketProductEvent value, $Res Function(DeleteMarketProductEvent) _then) = _$DeleteMarketProductEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DeleteMarketProductEventCopyWithImpl<$Res>
    implements $DeleteMarketProductEventCopyWith<$Res> {
  _$DeleteMarketProductEventCopyWithImpl(this._self, this._then);

  final DeleteMarketProductEvent _self;
  final $Res Function(DeleteMarketProductEvent) _then;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DeleteMarketProductEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CreateAircraftMarketProductEvent implements AircraftMarketEvent {
  const CreateAircraftMarketProductEvent({required this.title, this.description, required this.price, this.aircraftSubcategoriesId, this.brand, this.location, this.year, this.totalFlightHours, this.enginePower, this.engineVolume, this.seats, this.condition, this.isShareSale, this.shareNumerator, this.shareDenominator, this.mainImageFile, final  List<XFile>? additionalImageFiles}): _additionalImageFiles = additionalImageFiles;
  

 final  String title;
 final  String? description;
 final  int price;
 final  int? aircraftSubcategoriesId;
 final  String? brand;
 final  String? location;
 final  int? year;
 final  int? totalFlightHours;
 final  int? enginePower;
 final  int? engineVolume;
 final  int? seats;
 final  String? condition;
 final  bool? isShareSale;
 final  int? shareNumerator;
 final  int? shareDenominator;
// Файлы изображений для загрузки
 final  XFile? mainImageFile;
 final  List<XFile>? _additionalImageFiles;
 List<XFile>? get additionalImageFiles {
  final value = _additionalImageFiles;
  if (value == null) return null;
  if (_additionalImageFiles is EqualUnmodifiableListView) return _additionalImageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAircraftMarketProductEventCopyWith<CreateAircraftMarketProductEvent> get copyWith => _$CreateAircraftMarketProductEventCopyWithImpl<CreateAircraftMarketProductEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAircraftMarketProductEvent&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.aircraftSubcategoriesId, aircraftSubcategoriesId) || other.aircraftSubcategoriesId == aircraftSubcategoriesId)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.location, location) || other.location == location)&&(identical(other.year, year) || other.year == year)&&(identical(other.totalFlightHours, totalFlightHours) || other.totalFlightHours == totalFlightHours)&&(identical(other.enginePower, enginePower) || other.enginePower == enginePower)&&(identical(other.engineVolume, engineVolume) || other.engineVolume == engineVolume)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.isShareSale, isShareSale) || other.isShareSale == isShareSale)&&(identical(other.shareNumerator, shareNumerator) || other.shareNumerator == shareNumerator)&&(identical(other.shareDenominator, shareDenominator) || other.shareDenominator == shareDenominator)&&(identical(other.mainImageFile, mainImageFile) || other.mainImageFile == mainImageFile)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,price,aircraftSubcategoriesId,brand,location,year,totalFlightHours,enginePower,engineVolume,seats,condition,isShareSale,shareNumerator,shareDenominator,mainImageFile,const DeepCollectionEquality().hash(_additionalImageFiles));

@override
String toString() {
  return 'AircraftMarketEvent.createAirCraft(title: $title, description: $description, price: $price, aircraftSubcategoriesId: $aircraftSubcategoriesId, brand: $brand, location: $location, year: $year, totalFlightHours: $totalFlightHours, enginePower: $enginePower, engineVolume: $engineVolume, seats: $seats, condition: $condition, isShareSale: $isShareSale, shareNumerator: $shareNumerator, shareDenominator: $shareDenominator, mainImageFile: $mainImageFile, additionalImageFiles: $additionalImageFiles)';
}


}

/// @nodoc
abstract mixin class $CreateAircraftMarketProductEventCopyWith<$Res> implements $AircraftMarketEventCopyWith<$Res> {
  factory $CreateAircraftMarketProductEventCopyWith(CreateAircraftMarketProductEvent value, $Res Function(CreateAircraftMarketProductEvent) _then) = _$CreateAircraftMarketProductEventCopyWithImpl;
@useResult
$Res call({
 String title, String? description, int price, int? aircraftSubcategoriesId, String? brand, String? location, int? year, int? totalFlightHours, int? enginePower, int? engineVolume, int? seats, String? condition, bool? isShareSale, int? shareNumerator, int? shareDenominator, XFile? mainImageFile, List<XFile>? additionalImageFiles
});




}
/// @nodoc
class _$CreateAircraftMarketProductEventCopyWithImpl<$Res>
    implements $CreateAircraftMarketProductEventCopyWith<$Res> {
  _$CreateAircraftMarketProductEventCopyWithImpl(this._self, this._then);

  final CreateAircraftMarketProductEvent _self;
  final $Res Function(CreateAircraftMarketProductEvent) _then;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? price = null,Object? aircraftSubcategoriesId = freezed,Object? brand = freezed,Object? location = freezed,Object? year = freezed,Object? totalFlightHours = freezed,Object? enginePower = freezed,Object? engineVolume = freezed,Object? seats = freezed,Object? condition = freezed,Object? isShareSale = freezed,Object? shareNumerator = freezed,Object? shareDenominator = freezed,Object? mainImageFile = freezed,Object? additionalImageFiles = freezed,}) {
  return _then(CreateAircraftMarketProductEvent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,aircraftSubcategoriesId: freezed == aircraftSubcategoriesId ? _self.aircraftSubcategoriesId : aircraftSubcategoriesId // ignore: cast_nullable_to_non_nullable
as int?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,totalFlightHours: freezed == totalFlightHours ? _self.totalFlightHours : totalFlightHours // ignore: cast_nullable_to_non_nullable
as int?,enginePower: freezed == enginePower ? _self.enginePower : enginePower // ignore: cast_nullable_to_non_nullable
as int?,engineVolume: freezed == engineVolume ? _self.engineVolume : engineVolume // ignore: cast_nullable_to_non_nullable
as int?,seats: freezed == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,isShareSale: freezed == isShareSale ? _self.isShareSale : isShareSale // ignore: cast_nullable_to_non_nullable
as bool?,shareNumerator: freezed == shareNumerator ? _self.shareNumerator : shareNumerator // ignore: cast_nullable_to_non_nullable
as int?,shareDenominator: freezed == shareDenominator ? _self.shareDenominator : shareDenominator // ignore: cast_nullable_to_non_nullable
as int?,mainImageFile: freezed == mainImageFile ? _self.mainImageFile : mainImageFile // ignore: cast_nullable_to_non_nullable
as XFile?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,
  ));
}


}

/// @nodoc


class UpdateMarketProductEvent implements AircraftMarketEvent {
  const UpdateMarketProductEvent({required this.productId, this.title, this.description, this.price, this.aircraftSubcategoriesId, this.mainImageUrl, final  List<String>? additionalImageUrls, this.brand, this.location, this.year, this.totalFlightHours, this.enginePower, this.engineVolume, this.seats, this.condition, this.isShareSale, this.shareNumerator, this.shareDenominator, this.mainImageFile, final  List<XFile>? additionalImageFiles}): _additionalImageUrls = additionalImageUrls,_additionalImageFiles = additionalImageFiles;
  

 final  int productId;
 final  String? title;
 final  String? description;
 final  int? price;
 final  int? aircraftSubcategoriesId;
 final  String? mainImageUrl;
 final  List<String>? _additionalImageUrls;
 List<String>? get additionalImageUrls {
  final value = _additionalImageUrls;
  if (value == null) return null;
  if (_additionalImageUrls is EqualUnmodifiableListView) return _additionalImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? brand;
 final  String? location;
 final  int? year;
 final  int? totalFlightHours;
 final  int? enginePower;
 final  int? engineVolume;
 final  int? seats;
 final  String? condition;
 final  bool? isShareSale;
 final  int? shareNumerator;
 final  int? shareDenominator;
// Файлы изображений для загрузки
 final  XFile? mainImageFile;
 final  List<XFile>? _additionalImageFiles;
 List<XFile>? get additionalImageFiles {
  final value = _additionalImageFiles;
  if (value == null) return null;
  if (_additionalImageFiles is EqualUnmodifiableListView) return _additionalImageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMarketProductEventCopyWith<UpdateMarketProductEvent> get copyWith => _$UpdateMarketProductEventCopyWithImpl<UpdateMarketProductEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMarketProductEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.aircraftSubcategoriesId, aircraftSubcategoriesId) || other.aircraftSubcategoriesId == aircraftSubcategoriesId)&&(identical(other.mainImageUrl, mainImageUrl) || other.mainImageUrl == mainImageUrl)&&const DeepCollectionEquality().equals(other._additionalImageUrls, _additionalImageUrls)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.location, location) || other.location == location)&&(identical(other.year, year) || other.year == year)&&(identical(other.totalFlightHours, totalFlightHours) || other.totalFlightHours == totalFlightHours)&&(identical(other.enginePower, enginePower) || other.enginePower == enginePower)&&(identical(other.engineVolume, engineVolume) || other.engineVolume == engineVolume)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.isShareSale, isShareSale) || other.isShareSale == isShareSale)&&(identical(other.shareNumerator, shareNumerator) || other.shareNumerator == shareNumerator)&&(identical(other.shareDenominator, shareDenominator) || other.shareDenominator == shareDenominator)&&(identical(other.mainImageFile, mainImageFile) || other.mainImageFile == mainImageFile)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles));
}


@override
int get hashCode => Object.hashAll([runtimeType,productId,title,description,price,aircraftSubcategoriesId,mainImageUrl,const DeepCollectionEquality().hash(_additionalImageUrls),brand,location,year,totalFlightHours,enginePower,engineVolume,seats,condition,isShareSale,shareNumerator,shareDenominator,mainImageFile,const DeepCollectionEquality().hash(_additionalImageFiles)]);

@override
String toString() {
  return 'AircraftMarketEvent.updateProduct(productId: $productId, title: $title, description: $description, price: $price, aircraftSubcategoriesId: $aircraftSubcategoriesId, mainImageUrl: $mainImageUrl, additionalImageUrls: $additionalImageUrls, brand: $brand, location: $location, year: $year, totalFlightHours: $totalFlightHours, enginePower: $enginePower, engineVolume: $engineVolume, seats: $seats, condition: $condition, isShareSale: $isShareSale, shareNumerator: $shareNumerator, shareDenominator: $shareDenominator, mainImageFile: $mainImageFile, additionalImageFiles: $additionalImageFiles)';
}


}

/// @nodoc
abstract mixin class $UpdateMarketProductEventCopyWith<$Res> implements $AircraftMarketEventCopyWith<$Res> {
  factory $UpdateMarketProductEventCopyWith(UpdateMarketProductEvent value, $Res Function(UpdateMarketProductEvent) _then) = _$UpdateMarketProductEventCopyWithImpl;
@useResult
$Res call({
 int productId, String? title, String? description, int? price, int? aircraftSubcategoriesId, String? mainImageUrl, List<String>? additionalImageUrls, String? brand, String? location, int? year, int? totalFlightHours, int? enginePower, int? engineVolume, int? seats, String? condition, bool? isShareSale, int? shareNumerator, int? shareDenominator, XFile? mainImageFile, List<XFile>? additionalImageFiles
});




}
/// @nodoc
class _$UpdateMarketProductEventCopyWithImpl<$Res>
    implements $UpdateMarketProductEventCopyWith<$Res> {
  _$UpdateMarketProductEventCopyWithImpl(this._self, this._then);

  final UpdateMarketProductEvent _self;
  final $Res Function(UpdateMarketProductEvent) _then;

/// Create a copy of AircraftMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? aircraftSubcategoriesId = freezed,Object? mainImageUrl = freezed,Object? additionalImageUrls = freezed,Object? brand = freezed,Object? location = freezed,Object? year = freezed,Object? totalFlightHours = freezed,Object? enginePower = freezed,Object? engineVolume = freezed,Object? seats = freezed,Object? condition = freezed,Object? isShareSale = freezed,Object? shareNumerator = freezed,Object? shareDenominator = freezed,Object? mainImageFile = freezed,Object? additionalImageFiles = freezed,}) {
  return _then(UpdateMarketProductEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,aircraftSubcategoriesId: freezed == aircraftSubcategoriesId ? _self.aircraftSubcategoriesId : aircraftSubcategoriesId // ignore: cast_nullable_to_non_nullable
as int?,mainImageUrl: freezed == mainImageUrl ? _self.mainImageUrl : mainImageUrl // ignore: cast_nullable_to_non_nullable
as String?,additionalImageUrls: freezed == additionalImageUrls ? _self._additionalImageUrls : additionalImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,totalFlightHours: freezed == totalFlightHours ? _self.totalFlightHours : totalFlightHours // ignore: cast_nullable_to_non_nullable
as int?,enginePower: freezed == enginePower ? _self.enginePower : enginePower // ignore: cast_nullable_to_non_nullable
as int?,engineVolume: freezed == engineVolume ? _self.engineVolume : engineVolume // ignore: cast_nullable_to_non_nullable
as int?,seats: freezed == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,isShareSale: freezed == isShareSale ? _self.isShareSale : isShareSale // ignore: cast_nullable_to_non_nullable
as bool?,shareNumerator: freezed == shareNumerator ? _self.shareNumerator : shareNumerator // ignore: cast_nullable_to_non_nullable
as int?,shareDenominator: freezed == shareDenominator ? _self.shareDenominator : shareDenominator // ignore: cast_nullable_to_non_nullable
as int?,mainImageFile: freezed == mainImageFile ? _self.mainImageFile : mainImageFile // ignore: cast_nullable_to_non_nullable
as XFile?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingAircraftMarketState value)?  loading,TResult Function( LoadingMoreAircraftMarketState value)?  loadingMore,TResult Function( ErrorAircraftMarketState value)?  error,TResult Function( SuccessAircraftMarketState value)?  success,TResult Function( CreatingAircraftMarketProductState value)?  creatingAirCraft,TResult Function( CreatedAircraftMarketProductState value)?  createdAirCraft,TResult Function( UpdatingMarketProductState value)?  updating,TResult Function( UpdatedMarketProductState value)?  updated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading(_that);case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that);case ErrorAircraftMarketState() when error != null:
return error(_that);case SuccessAircraftMarketState() when success != null:
return success(_that);case CreatingAircraftMarketProductState() when creatingAirCraft != null:
return creatingAirCraft(_that);case CreatedAircraftMarketProductState() when createdAirCraft != null:
return createdAirCraft(_that);case UpdatingMarketProductState() when updating != null:
return updating(_that);case UpdatedMarketProductState() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingAircraftMarketState value)  loading,required TResult Function( LoadingMoreAircraftMarketState value)  loadingMore,required TResult Function( ErrorAircraftMarketState value)  error,required TResult Function( SuccessAircraftMarketState value)  success,required TResult Function( CreatingAircraftMarketProductState value)  creatingAirCraft,required TResult Function( CreatedAircraftMarketProductState value)  createdAirCraft,required TResult Function( UpdatingMarketProductState value)  updating,required TResult Function( UpdatedMarketProductState value)  updated,}){
final _that = this;
switch (_that) {
case LoadingAircraftMarketState():
return loading(_that);case LoadingMoreAircraftMarketState():
return loadingMore(_that);case ErrorAircraftMarketState():
return error(_that);case SuccessAircraftMarketState():
return success(_that);case CreatingAircraftMarketProductState():
return creatingAirCraft(_that);case CreatedAircraftMarketProductState():
return createdAirCraft(_that);case UpdatingMarketProductState():
return updating(_that);case UpdatedMarketProductState():
return updated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingAircraftMarketState value)?  loading,TResult? Function( LoadingMoreAircraftMarketState value)?  loadingMore,TResult? Function( ErrorAircraftMarketState value)?  error,TResult? Function( SuccessAircraftMarketState value)?  success,TResult? Function( CreatingAircraftMarketProductState value)?  creatingAirCraft,TResult? Function( CreatedAircraftMarketProductState value)?  createdAirCraft,TResult? Function( UpdatingMarketProductState value)?  updating,TResult? Function( UpdatedMarketProductState value)?  updated,}){
final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading(_that);case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that);case ErrorAircraftMarketState() when error != null:
return error(_that);case SuccessAircraftMarketState() when success != null:
return success(_that);case CreatingAircraftMarketProductState() when creatingAirCraft != null:
return creatingAirCraft(_that);case CreatedAircraftMarketProductState() when createdAirCraft != null:
return createdAirCraft(_that);case UpdatingMarketProductState() when updating != null:
return updating(_that);case UpdatedMarketProductState() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<AircraftMarketEntity> products)?  loadingMore,TResult Function( String message)?  error,TResult Function( List<AircraftMarketEntity> products,  bool hasMore)?  success,TResult Function()?  creatingAirCraft,TResult Function( AircraftMarketEntity product)?  createdAirCraft,TResult Function()?  updating,TResult Function( AircraftMarketEntity product)?  updated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading();case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that.products);case ErrorAircraftMarketState() when error != null:
return error(_that.message);case SuccessAircraftMarketState() when success != null:
return success(_that.products,_that.hasMore);case CreatingAircraftMarketProductState() when creatingAirCraft != null:
return creatingAirCraft();case CreatedAircraftMarketProductState() when createdAirCraft != null:
return createdAirCraft(_that.product);case UpdatingMarketProductState() when updating != null:
return updating();case UpdatedMarketProductState() when updated != null:
return updated(_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<AircraftMarketEntity> products)  loadingMore,required TResult Function( String message)  error,required TResult Function( List<AircraftMarketEntity> products,  bool hasMore)  success,required TResult Function()  creatingAirCraft,required TResult Function( AircraftMarketEntity product)  createdAirCraft,required TResult Function()  updating,required TResult Function( AircraftMarketEntity product)  updated,}) {final _that = this;
switch (_that) {
case LoadingAircraftMarketState():
return loading();case LoadingMoreAircraftMarketState():
return loadingMore(_that.products);case ErrorAircraftMarketState():
return error(_that.message);case SuccessAircraftMarketState():
return success(_that.products,_that.hasMore);case CreatingAircraftMarketProductState():
return creatingAirCraft();case CreatedAircraftMarketProductState():
return createdAirCraft(_that.product);case UpdatingMarketProductState():
return updating();case UpdatedMarketProductState():
return updated(_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<AircraftMarketEntity> products)?  loadingMore,TResult? Function( String message)?  error,TResult? Function( List<AircraftMarketEntity> products,  bool hasMore)?  success,TResult? Function()?  creatingAirCraft,TResult? Function( AircraftMarketEntity product)?  createdAirCraft,TResult? Function()?  updating,TResult? Function( AircraftMarketEntity product)?  updated,}) {final _that = this;
switch (_that) {
case LoadingAircraftMarketState() when loading != null:
return loading();case LoadingMoreAircraftMarketState() when loadingMore != null:
return loadingMore(_that.products);case ErrorAircraftMarketState() when error != null:
return error(_that.message);case SuccessAircraftMarketState() when success != null:
return success(_that.products,_that.hasMore);case CreatingAircraftMarketProductState() when creatingAirCraft != null:
return creatingAirCraft();case CreatedAircraftMarketProductState() when createdAirCraft != null:
return createdAirCraft(_that.product);case UpdatingMarketProductState() when updating != null:
return updating();case UpdatedMarketProductState() when updated != null:
return updated(_that.product);case _:
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
  const ErrorAircraftMarketState(this.message);
  

 final  String message;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAircraftMarketStateCopyWith<ErrorAircraftMarketState> get copyWith => _$ErrorAircraftMarketStateCopyWithImpl<ErrorAircraftMarketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAircraftMarketState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AircraftMarketState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorAircraftMarketStateCopyWith<$Res> implements $AircraftMarketStateCopyWith<$Res> {
  factory $ErrorAircraftMarketStateCopyWith(ErrorAircraftMarketState value, $Res Function(ErrorAircraftMarketState) _then) = _$ErrorAircraftMarketStateCopyWithImpl;
@useResult
$Res call({
 String message
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
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorAircraftMarketState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
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

/// @nodoc


class CreatingAircraftMarketProductState implements AircraftMarketState {
  const CreatingAircraftMarketProductState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingAircraftMarketProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketState.creatingAirCraft()';
}


}




/// @nodoc


class CreatedAircraftMarketProductState implements AircraftMarketState {
  const CreatedAircraftMarketProductState({required this.product});
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedAircraftMarketProductStateCopyWith<CreatedAircraftMarketProductState> get copyWith => _$CreatedAircraftMarketProductStateCopyWithImpl<CreatedAircraftMarketProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedAircraftMarketProductState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketState.createdAirCraft(product: $product)';
}


}

/// @nodoc
abstract mixin class $CreatedAircraftMarketProductStateCopyWith<$Res> implements $AircraftMarketStateCopyWith<$Res> {
  factory $CreatedAircraftMarketProductStateCopyWith(CreatedAircraftMarketProductState value, $Res Function(CreatedAircraftMarketProductState) _then) = _$CreatedAircraftMarketProductStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$CreatedAircraftMarketProductStateCopyWithImpl<$Res>
    implements $CreatedAircraftMarketProductStateCopyWith<$Res> {
  _$CreatedAircraftMarketProductStateCopyWithImpl(this._self, this._then);

  final CreatedAircraftMarketProductState _self;
  final $Res Function(CreatedAircraftMarketProductState) _then;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(CreatedAircraftMarketProductState(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class UpdatingMarketProductState implements AircraftMarketState {
  const UpdatingMarketProductState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatingMarketProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketState.updating()';
}


}




/// @nodoc


class UpdatedMarketProductState implements AircraftMarketState {
  const UpdatedMarketProductState({required this.product});
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedMarketProductStateCopyWith<UpdatedMarketProductState> get copyWith => _$UpdatedMarketProductStateCopyWithImpl<UpdatedMarketProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedMarketProductState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketState.updated(product: $product)';
}


}

/// @nodoc
abstract mixin class $UpdatedMarketProductStateCopyWith<$Res> implements $AircraftMarketStateCopyWith<$Res> {
  factory $UpdatedMarketProductStateCopyWith(UpdatedMarketProductState value, $Res Function(UpdatedMarketProductState) _then) = _$UpdatedMarketProductStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$UpdatedMarketProductStateCopyWithImpl<$Res>
    implements $UpdatedMarketProductStateCopyWith<$Res> {
  _$UpdatedMarketProductStateCopyWithImpl(this._self, this._then);

  final UpdatedMarketProductState _self;
  final $Res Function(UpdatedMarketProductState) _then;

/// Create a copy of AircraftMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(UpdatedMarketProductState(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

// dart format on
