// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parts_market_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PartsMarketEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartsMarketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent()';
}


}

/// @nodoc
class $PartsMarketEventCopyWith<$Res>  {
$PartsMarketEventCopyWith(PartsMarketEvent _, $Res Function(PartsMarketEvent) __);
}


/// Adds pattern-matching-related methods to [PartsMarketEvent].
extension PartsMarketEventPatterns on PartsMarketEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetPartsMarketEvent value)?  getParts,TResult Function( AddPartToFavoritesEvent value)?  addToFavorites,TResult Function( RemovePartFromFavoritesEvent value)?  removeFromFavorites,TResult Function( DeletePartsMarketEvent value)?  deletePart,TResult Function( CreatePartsMarketEvent value)?  createPart,TResult Function( UpdatePartsMarketEvent value)?  updatePart,TResult Function( LoadMorePartsMarketEvent value)?  loadMore,TResult Function( RefreshPartsMarketEvent value)?  refresh,TResult Function( PublishPartsMarketEvent value)?  publishPart,TResult Function( UnpublishPartsMarketEvent value)?  unpublishPart,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetPartsMarketEvent() when getParts != null:
return getParts(_that);case AddPartToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that);case RemovePartFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that);case DeletePartsMarketEvent() when deletePart != null:
return deletePart(_that);case CreatePartsMarketEvent() when createPart != null:
return createPart(_that);case UpdatePartsMarketEvent() when updatePart != null:
return updatePart(_that);case LoadMorePartsMarketEvent() when loadMore != null:
return loadMore(_that);case RefreshPartsMarketEvent() when refresh != null:
return refresh(_that);case PublishPartsMarketEvent() when publishPart != null:
return publishPart(_that);case UnpublishPartsMarketEvent() when unpublishPart != null:
return unpublishPart(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetPartsMarketEvent value)  getParts,required TResult Function( AddPartToFavoritesEvent value)  addToFavorites,required TResult Function( RemovePartFromFavoritesEvent value)  removeFromFavorites,required TResult Function( DeletePartsMarketEvent value)  deletePart,required TResult Function( CreatePartsMarketEvent value)  createPart,required TResult Function( UpdatePartsMarketEvent value)  updatePart,required TResult Function( LoadMorePartsMarketEvent value)  loadMore,required TResult Function( RefreshPartsMarketEvent value)  refresh,required TResult Function( PublishPartsMarketEvent value)  publishPart,required TResult Function( UnpublishPartsMarketEvent value)  unpublishPart,}){
final _that = this;
switch (_that) {
case GetPartsMarketEvent():
return getParts(_that);case AddPartToFavoritesEvent():
return addToFavorites(_that);case RemovePartFromFavoritesEvent():
return removeFromFavorites(_that);case DeletePartsMarketEvent():
return deletePart(_that);case CreatePartsMarketEvent():
return createPart(_that);case UpdatePartsMarketEvent():
return updatePart(_that);case LoadMorePartsMarketEvent():
return loadMore(_that);case RefreshPartsMarketEvent():
return refresh(_that);case PublishPartsMarketEvent():
return publishPart(_that);case UnpublishPartsMarketEvent():
return unpublishPart(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetPartsMarketEvent value)?  getParts,TResult? Function( AddPartToFavoritesEvent value)?  addToFavorites,TResult? Function( RemovePartFromFavoritesEvent value)?  removeFromFavorites,TResult? Function( DeletePartsMarketEvent value)?  deletePart,TResult? Function( CreatePartsMarketEvent value)?  createPart,TResult? Function( UpdatePartsMarketEvent value)?  updatePart,TResult? Function( LoadMorePartsMarketEvent value)?  loadMore,TResult? Function( RefreshPartsMarketEvent value)?  refresh,TResult? Function( PublishPartsMarketEvent value)?  publishPart,TResult? Function( UnpublishPartsMarketEvent value)?  unpublishPart,}){
final _that = this;
switch (_that) {
case GetPartsMarketEvent() when getParts != null:
return getParts(_that);case AddPartToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that);case RemovePartFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that);case DeletePartsMarketEvent() when deletePart != null:
return deletePart(_that);case CreatePartsMarketEvent() when createPart != null:
return createPart(_that);case UpdatePartsMarketEvent() when updatePart != null:
return updatePart(_that);case LoadMorePartsMarketEvent() when loadMore != null:
return loadMore(_that);case RefreshPartsMarketEvent() when refresh != null:
return refresh(_that);case PublishPartsMarketEvent() when publishPart != null:
return publishPart(_that);case UnpublishPartsMarketEvent() when unpublishPart != null:
return unpublishPart(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? mainCategoryId,  int? subcategoryId,  int? sellerId,  int? manufacturerId,  String? searchQuery,  String? condition,  int? priceFrom,  int? priceTo,  String? sortBy,  bool includeInactive,  int limit,  int offset)?  getParts,TResult Function( int partId)?  addToFavorites,TResult Function( int partId)?  removeFromFavorites,TResult Function( int partId)?  deletePart,TResult Function( String title,  String? description,  int price,  String currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int quantity,  String? location,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  XFile? mainImageFile,  List<XFile>? additionalImageFiles,  bool isPublished)?  createPart,TResult Function( int partId,  String? title,  String? description,  int? price,  String? currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int? quantity,  String? location,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  String? mainImageUrl,  List<String>? additionalImageUrls,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updatePart,TResult Function()?  loadMore,TResult Function()?  refresh,TResult Function( int partId)?  publishPart,TResult Function( int partId)?  unpublishPart,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetPartsMarketEvent() when getParts != null:
return getParts(_that.mainCategoryId,_that.subcategoryId,_that.sellerId,_that.manufacturerId,_that.searchQuery,_that.condition,_that.priceFrom,_that.priceTo,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case AddPartToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that.partId);case RemovePartFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that.partId);case DeletePartsMarketEvent() when deletePart != null:
return deletePart(_that.partId);case CreatePartsMarketEvent() when createPart != null:
return createPart(_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageFile,_that.additionalImageFiles,_that.isPublished);case UpdatePartsMarketEvent() when updatePart != null:
return updatePart(_that.partId,_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageUrl,_that.additionalImageUrls,_that.mainImageFile,_that.additionalImageFiles);case LoadMorePartsMarketEvent() when loadMore != null:
return loadMore();case RefreshPartsMarketEvent() when refresh != null:
return refresh();case PublishPartsMarketEvent() when publishPart != null:
return publishPart(_that.partId);case UnpublishPartsMarketEvent() when unpublishPart != null:
return unpublishPart(_that.partId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? mainCategoryId,  int? subcategoryId,  int? sellerId,  int? manufacturerId,  String? searchQuery,  String? condition,  int? priceFrom,  int? priceTo,  String? sortBy,  bool includeInactive,  int limit,  int offset)  getParts,required TResult Function( int partId)  addToFavorites,required TResult Function( int partId)  removeFromFavorites,required TResult Function( int partId)  deletePart,required TResult Function( String title,  String? description,  int price,  String currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int quantity,  String? location,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  XFile? mainImageFile,  List<XFile>? additionalImageFiles,  bool isPublished)  createPart,required TResult Function( int partId,  String? title,  String? description,  int? price,  String? currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int? quantity,  String? location,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  String? mainImageUrl,  List<String>? additionalImageUrls,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)  updatePart,required TResult Function()  loadMore,required TResult Function()  refresh,required TResult Function( int partId)  publishPart,required TResult Function( int partId)  unpublishPart,}) {final _that = this;
switch (_that) {
case GetPartsMarketEvent():
return getParts(_that.mainCategoryId,_that.subcategoryId,_that.sellerId,_that.manufacturerId,_that.searchQuery,_that.condition,_that.priceFrom,_that.priceTo,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case AddPartToFavoritesEvent():
return addToFavorites(_that.partId);case RemovePartFromFavoritesEvent():
return removeFromFavorites(_that.partId);case DeletePartsMarketEvent():
return deletePart(_that.partId);case CreatePartsMarketEvent():
return createPart(_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageFile,_that.additionalImageFiles,_that.isPublished);case UpdatePartsMarketEvent():
return updatePart(_that.partId,_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageUrl,_that.additionalImageUrls,_that.mainImageFile,_that.additionalImageFiles);case LoadMorePartsMarketEvent():
return loadMore();case RefreshPartsMarketEvent():
return refresh();case PublishPartsMarketEvent():
return publishPart(_that.partId);case UnpublishPartsMarketEvent():
return unpublishPart(_that.partId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? mainCategoryId,  int? subcategoryId,  int? sellerId,  int? manufacturerId,  String? searchQuery,  String? condition,  int? priceFrom,  int? priceTo,  String? sortBy,  bool includeInactive,  int limit,  int offset)?  getParts,TResult? Function( int partId)?  addToFavorites,TResult? Function( int partId)?  removeFromFavorites,TResult? Function( int partId)?  deletePart,TResult? Function( String title,  String? description,  int price,  String currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int quantity,  String? location,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  XFile? mainImageFile,  List<XFile>? additionalImageFiles,  bool isPublished)?  createPart,TResult? Function( int partId,  String? title,  String? description,  int? price,  String? currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int? quantity,  String? location,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  String? mainImageUrl,  List<String>? additionalImageUrls,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updatePart,TResult? Function()?  loadMore,TResult? Function()?  refresh,TResult? Function( int partId)?  publishPart,TResult? Function( int partId)?  unpublishPart,}) {final _that = this;
switch (_that) {
case GetPartsMarketEvent() when getParts != null:
return getParts(_that.mainCategoryId,_that.subcategoryId,_that.sellerId,_that.manufacturerId,_that.searchQuery,_that.condition,_that.priceFrom,_that.priceTo,_that.sortBy,_that.includeInactive,_that.limit,_that.offset);case AddPartToFavoritesEvent() when addToFavorites != null:
return addToFavorites(_that.partId);case RemovePartFromFavoritesEvent() when removeFromFavorites != null:
return removeFromFavorites(_that.partId);case DeletePartsMarketEvent() when deletePart != null:
return deletePart(_that.partId);case CreatePartsMarketEvent() when createPart != null:
return createPart(_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageFile,_that.additionalImageFiles,_that.isPublished);case UpdatePartsMarketEvent() when updatePart != null:
return updatePart(_that.partId,_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageUrl,_that.additionalImageUrls,_that.mainImageFile,_that.additionalImageFiles);case LoadMorePartsMarketEvent() when loadMore != null:
return loadMore();case RefreshPartsMarketEvent() when refresh != null:
return refresh();case PublishPartsMarketEvent() when publishPart != null:
return publishPart(_that.partId);case UnpublishPartsMarketEvent() when unpublishPart != null:
return unpublishPart(_that.partId);case _:
  return null;

}
}

}

/// @nodoc


class GetPartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const GetPartsMarketEvent({this.mainCategoryId, this.subcategoryId, this.sellerId, this.manufacturerId, this.searchQuery, this.condition, this.priceFrom, this.priceTo, this.sortBy, this.includeInactive = false, this.limit = 20, this.offset = 0});
  

 final  int? mainCategoryId;
 final  int? subcategoryId;
 final  int? sellerId;
 final  int? manufacturerId;
 final  String? searchQuery;
 final  String? condition;
 final  int? priceFrom;
 final  int? priceTo;
 final  String? sortBy;
@JsonKey() final  bool includeInactive;
@JsonKey() final  int limit;
@JsonKey() final  int offset;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPartsMarketEventCopyWith<GetPartsMarketEvent> get copyWith => _$GetPartsMarketEventCopyWithImpl<GetPartsMarketEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.getParts'))
    ..add(DiagnosticsProperty('mainCategoryId', mainCategoryId))..add(DiagnosticsProperty('subcategoryId', subcategoryId))..add(DiagnosticsProperty('sellerId', sellerId))..add(DiagnosticsProperty('manufacturerId', manufacturerId))..add(DiagnosticsProperty('searchQuery', searchQuery))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('priceFrom', priceFrom))..add(DiagnosticsProperty('priceTo', priceTo))..add(DiagnosticsProperty('sortBy', sortBy))..add(DiagnosticsProperty('includeInactive', includeInactive))..add(DiagnosticsProperty('limit', limit))..add(DiagnosticsProperty('offset', offset));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPartsMarketEvent&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId)&&(identical(other.subcategoryId, subcategoryId) || other.subcategoryId == subcategoryId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.priceFrom, priceFrom) || other.priceFrom == priceFrom)&&(identical(other.priceTo, priceTo) || other.priceTo == priceTo)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.includeInactive, includeInactive) || other.includeInactive == includeInactive)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,mainCategoryId,subcategoryId,sellerId,manufacturerId,searchQuery,condition,priceFrom,priceTo,sortBy,includeInactive,limit,offset);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.getParts(mainCategoryId: $mainCategoryId, subcategoryId: $subcategoryId, sellerId: $sellerId, manufacturerId: $manufacturerId, searchQuery: $searchQuery, condition: $condition, priceFrom: $priceFrom, priceTo: $priceTo, sortBy: $sortBy, includeInactive: $includeInactive, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $GetPartsMarketEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $GetPartsMarketEventCopyWith(GetPartsMarketEvent value, $Res Function(GetPartsMarketEvent) _then) = _$GetPartsMarketEventCopyWithImpl;
@useResult
$Res call({
 int? mainCategoryId, int? subcategoryId, int? sellerId, int? manufacturerId, String? searchQuery, String? condition, int? priceFrom, int? priceTo, String? sortBy, bool includeInactive, int limit, int offset
});




}
/// @nodoc
class _$GetPartsMarketEventCopyWithImpl<$Res>
    implements $GetPartsMarketEventCopyWith<$Res> {
  _$GetPartsMarketEventCopyWithImpl(this._self, this._then);

  final GetPartsMarketEvent _self;
  final $Res Function(GetPartsMarketEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mainCategoryId = freezed,Object? subcategoryId = freezed,Object? sellerId = freezed,Object? manufacturerId = freezed,Object? searchQuery = freezed,Object? condition = freezed,Object? priceFrom = freezed,Object? priceTo = freezed,Object? sortBy = freezed,Object? includeInactive = null,Object? limit = null,Object? offset = null,}) {
  return _then(GetPartsMarketEvent(
mainCategoryId: freezed == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int?,subcategoryId: freezed == subcategoryId ? _self.subcategoryId : subcategoryId // ignore: cast_nullable_to_non_nullable
as int?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as int?,priceTo: freezed == priceTo ? _self.priceTo : priceTo // ignore: cast_nullable_to_non_nullable
as int?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,includeInactive: null == includeInactive ? _self.includeInactive : includeInactive // ignore: cast_nullable_to_non_nullable
as bool,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AddPartToFavoritesEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const AddPartToFavoritesEvent(this.partId);
  

 final  int partId;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPartToFavoritesEventCopyWith<AddPartToFavoritesEvent> get copyWith => _$AddPartToFavoritesEventCopyWithImpl<AddPartToFavoritesEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.addToFavorites'))
    ..add(DiagnosticsProperty('partId', partId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPartToFavoritesEvent&&(identical(other.partId, partId) || other.partId == partId));
}


@override
int get hashCode => Object.hash(runtimeType,partId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.addToFavorites(partId: $partId)';
}


}

/// @nodoc
abstract mixin class $AddPartToFavoritesEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $AddPartToFavoritesEventCopyWith(AddPartToFavoritesEvent value, $Res Function(AddPartToFavoritesEvent) _then) = _$AddPartToFavoritesEventCopyWithImpl;
@useResult
$Res call({
 int partId
});




}
/// @nodoc
class _$AddPartToFavoritesEventCopyWithImpl<$Res>
    implements $AddPartToFavoritesEventCopyWith<$Res> {
  _$AddPartToFavoritesEventCopyWithImpl(this._self, this._then);

  final AddPartToFavoritesEvent _self;
  final $Res Function(AddPartToFavoritesEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partId = null,}) {
  return _then(AddPartToFavoritesEvent(
null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RemovePartFromFavoritesEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const RemovePartFromFavoritesEvent(this.partId);
  

 final  int partId;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemovePartFromFavoritesEventCopyWith<RemovePartFromFavoritesEvent> get copyWith => _$RemovePartFromFavoritesEventCopyWithImpl<RemovePartFromFavoritesEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.removeFromFavorites'))
    ..add(DiagnosticsProperty('partId', partId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemovePartFromFavoritesEvent&&(identical(other.partId, partId) || other.partId == partId));
}


@override
int get hashCode => Object.hash(runtimeType,partId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.removeFromFavorites(partId: $partId)';
}


}

/// @nodoc
abstract mixin class $RemovePartFromFavoritesEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $RemovePartFromFavoritesEventCopyWith(RemovePartFromFavoritesEvent value, $Res Function(RemovePartFromFavoritesEvent) _then) = _$RemovePartFromFavoritesEventCopyWithImpl;
@useResult
$Res call({
 int partId
});




}
/// @nodoc
class _$RemovePartFromFavoritesEventCopyWithImpl<$Res>
    implements $RemovePartFromFavoritesEventCopyWith<$Res> {
  _$RemovePartFromFavoritesEventCopyWithImpl(this._self, this._then);

  final RemovePartFromFavoritesEvent _self;
  final $Res Function(RemovePartFromFavoritesEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partId = null,}) {
  return _then(RemovePartFromFavoritesEvent(
null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeletePartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const DeletePartsMarketEvent(this.partId);
  

 final  int partId;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePartsMarketEventCopyWith<DeletePartsMarketEvent> get copyWith => _$DeletePartsMarketEventCopyWithImpl<DeletePartsMarketEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.deletePart'))
    ..add(DiagnosticsProperty('partId', partId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePartsMarketEvent&&(identical(other.partId, partId) || other.partId == partId));
}


@override
int get hashCode => Object.hash(runtimeType,partId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.deletePart(partId: $partId)';
}


}

/// @nodoc
abstract mixin class $DeletePartsMarketEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $DeletePartsMarketEventCopyWith(DeletePartsMarketEvent value, $Res Function(DeletePartsMarketEvent) _then) = _$DeletePartsMarketEventCopyWithImpl;
@useResult
$Res call({
 int partId
});




}
/// @nodoc
class _$DeletePartsMarketEventCopyWithImpl<$Res>
    implements $DeletePartsMarketEventCopyWith<$Res> {
  _$DeletePartsMarketEventCopyWithImpl(this._self, this._then);

  final DeletePartsMarketEvent _self;
  final $Res Function(DeletePartsMarketEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partId = null,}) {
  return _then(DeletePartsMarketEvent(
null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CreatePartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const CreatePartsMarketEvent({required this.title, this.description, required this.price, this.currency = 'RUB', this.partsMainCategoryId, this.partsSubcategoryId, this.manufacturerId, this.manufacturerName, this.partNumber, this.oemNumber, this.condition, this.quantity = 1, this.location, this.weightKg, this.dimensionsLengthCm, this.dimensionsWidthCm, this.dimensionsHeightCm, this.compatibleAircraftModelsText, final  List<int>? compatibleAircraftModelIds, this.mainImageFile, final  List<XFile>? additionalImageFiles, this.isPublished = true}): _compatibleAircraftModelIds = compatibleAircraftModelIds,_additionalImageFiles = additionalImageFiles;
  

 final  String title;
 final  String? description;
 final  int price;
@JsonKey() final  String currency;
 final  int? partsMainCategoryId;
 final  int? partsSubcategoryId;
 final  int? manufacturerId;
 final  String? manufacturerName;
 final  String? partNumber;
 final  String? oemNumber;
 final  String? condition;
@JsonKey() final  int quantity;
 final  String? location;
 final  double? weightKg;
 final  double? dimensionsLengthCm;
 final  double? dimensionsWidthCm;
 final  double? dimensionsHeightCm;
 final  String? compatibleAircraftModelsText;
 final  List<int>? _compatibleAircraftModelIds;
 List<int>? get compatibleAircraftModelIds {
  final value = _compatibleAircraftModelIds;
  if (value == null) return null;
  if (_compatibleAircraftModelIds is EqualUnmodifiableListView) return _compatibleAircraftModelIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  XFile? mainImageFile;
 final  List<XFile>? _additionalImageFiles;
 List<XFile>? get additionalImageFiles {
  final value = _additionalImageFiles;
  if (value == null) return null;
  if (_additionalImageFiles is EqualUnmodifiableListView) return _additionalImageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@JsonKey() final  bool isPublished;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePartsMarketEventCopyWith<CreatePartsMarketEvent> get copyWith => _$CreatePartsMarketEventCopyWithImpl<CreatePartsMarketEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.createPart'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('currency', currency))..add(DiagnosticsProperty('partsMainCategoryId', partsMainCategoryId))..add(DiagnosticsProperty('partsSubcategoryId', partsSubcategoryId))..add(DiagnosticsProperty('manufacturerId', manufacturerId))..add(DiagnosticsProperty('manufacturerName', manufacturerName))..add(DiagnosticsProperty('partNumber', partNumber))..add(DiagnosticsProperty('oemNumber', oemNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('quantity', quantity))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('weightKg', weightKg))..add(DiagnosticsProperty('dimensionsLengthCm', dimensionsLengthCm))..add(DiagnosticsProperty('dimensionsWidthCm', dimensionsWidthCm))..add(DiagnosticsProperty('dimensionsHeightCm', dimensionsHeightCm))..add(DiagnosticsProperty('compatibleAircraftModelsText', compatibleAircraftModelsText))..add(DiagnosticsProperty('compatibleAircraftModelIds', compatibleAircraftModelIds))..add(DiagnosticsProperty('mainImageFile', mainImageFile))..add(DiagnosticsProperty('additionalImageFiles', additionalImageFiles))..add(DiagnosticsProperty('isPublished', isPublished));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePartsMarketEvent&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.partsMainCategoryId, partsMainCategoryId) || other.partsMainCategoryId == partsMainCategoryId)&&(identical(other.partsSubcategoryId, partsSubcategoryId) || other.partsSubcategoryId == partsSubcategoryId)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.manufacturerName, manufacturerName) || other.manufacturerName == manufacturerName)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.oemNumber, oemNumber) || other.oemNumber == oemNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.location, location) || other.location == location)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.dimensionsLengthCm, dimensionsLengthCm) || other.dimensionsLengthCm == dimensionsLengthCm)&&(identical(other.dimensionsWidthCm, dimensionsWidthCm) || other.dimensionsWidthCm == dimensionsWidthCm)&&(identical(other.dimensionsHeightCm, dimensionsHeightCm) || other.dimensionsHeightCm == dimensionsHeightCm)&&(identical(other.compatibleAircraftModelsText, compatibleAircraftModelsText) || other.compatibleAircraftModelsText == compatibleAircraftModelsText)&&const DeepCollectionEquality().equals(other._compatibleAircraftModelIds, _compatibleAircraftModelIds)&&(identical(other.mainImageFile, mainImageFile) || other.mainImageFile == mainImageFile)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}


@override
int get hashCode => Object.hashAll([runtimeType,title,description,price,currency,partsMainCategoryId,partsSubcategoryId,manufacturerId,manufacturerName,partNumber,oemNumber,condition,quantity,location,weightKg,dimensionsLengthCm,dimensionsWidthCm,dimensionsHeightCm,compatibleAircraftModelsText,const DeepCollectionEquality().hash(_compatibleAircraftModelIds),mainImageFile,const DeepCollectionEquality().hash(_additionalImageFiles),isPublished]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.createPart(title: $title, description: $description, price: $price, currency: $currency, partsMainCategoryId: $partsMainCategoryId, partsSubcategoryId: $partsSubcategoryId, manufacturerId: $manufacturerId, manufacturerName: $manufacturerName, partNumber: $partNumber, oemNumber: $oemNumber, condition: $condition, quantity: $quantity, location: $location, weightKg: $weightKg, dimensionsLengthCm: $dimensionsLengthCm, dimensionsWidthCm: $dimensionsWidthCm, dimensionsHeightCm: $dimensionsHeightCm, compatibleAircraftModelsText: $compatibleAircraftModelsText, compatibleAircraftModelIds: $compatibleAircraftModelIds, mainImageFile: $mainImageFile, additionalImageFiles: $additionalImageFiles, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class $CreatePartsMarketEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $CreatePartsMarketEventCopyWith(CreatePartsMarketEvent value, $Res Function(CreatePartsMarketEvent) _then) = _$CreatePartsMarketEventCopyWithImpl;
@useResult
$Res call({
 String title, String? description, int price, String currency, int? partsMainCategoryId, int? partsSubcategoryId, int? manufacturerId, String? manufacturerName, String? partNumber, String? oemNumber, String? condition, int quantity, String? location, double? weightKg, double? dimensionsLengthCm, double? dimensionsWidthCm, double? dimensionsHeightCm, String? compatibleAircraftModelsText, List<int>? compatibleAircraftModelIds, XFile? mainImageFile, List<XFile>? additionalImageFiles, bool isPublished
});




}
/// @nodoc
class _$CreatePartsMarketEventCopyWithImpl<$Res>
    implements $CreatePartsMarketEventCopyWith<$Res> {
  _$CreatePartsMarketEventCopyWithImpl(this._self, this._then);

  final CreatePartsMarketEvent _self;
  final $Res Function(CreatePartsMarketEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? price = null,Object? currency = null,Object? partsMainCategoryId = freezed,Object? partsSubcategoryId = freezed,Object? manufacturerId = freezed,Object? manufacturerName = freezed,Object? partNumber = freezed,Object? oemNumber = freezed,Object? condition = freezed,Object? quantity = null,Object? location = freezed,Object? weightKg = freezed,Object? dimensionsLengthCm = freezed,Object? dimensionsWidthCm = freezed,Object? dimensionsHeightCm = freezed,Object? compatibleAircraftModelsText = freezed,Object? compatibleAircraftModelIds = freezed,Object? mainImageFile = freezed,Object? additionalImageFiles = freezed,Object? isPublished = null,}) {
  return _then(CreatePartsMarketEvent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,partsMainCategoryId: freezed == partsMainCategoryId ? _self.partsMainCategoryId : partsMainCategoryId // ignore: cast_nullable_to_non_nullable
as int?,partsSubcategoryId: freezed == partsSubcategoryId ? _self.partsSubcategoryId : partsSubcategoryId // ignore: cast_nullable_to_non_nullable
as int?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,manufacturerName: freezed == manufacturerName ? _self.manufacturerName : manufacturerName // ignore: cast_nullable_to_non_nullable
as String?,partNumber: freezed == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String?,oemNumber: freezed == oemNumber ? _self.oemNumber : oemNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,dimensionsLengthCm: freezed == dimensionsLengthCm ? _self.dimensionsLengthCm : dimensionsLengthCm // ignore: cast_nullable_to_non_nullable
as double?,dimensionsWidthCm: freezed == dimensionsWidthCm ? _self.dimensionsWidthCm : dimensionsWidthCm // ignore: cast_nullable_to_non_nullable
as double?,dimensionsHeightCm: freezed == dimensionsHeightCm ? _self.dimensionsHeightCm : dimensionsHeightCm // ignore: cast_nullable_to_non_nullable
as double?,compatibleAircraftModelsText: freezed == compatibleAircraftModelsText ? _self.compatibleAircraftModelsText : compatibleAircraftModelsText // ignore: cast_nullable_to_non_nullable
as String?,compatibleAircraftModelIds: freezed == compatibleAircraftModelIds ? _self._compatibleAircraftModelIds : compatibleAircraftModelIds // ignore: cast_nullable_to_non_nullable
as List<int>?,mainImageFile: freezed == mainImageFile ? _self.mainImageFile : mainImageFile // ignore: cast_nullable_to_non_nullable
as XFile?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UpdatePartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const UpdatePartsMarketEvent({required this.partId, this.title, this.description, this.price, this.currency, this.partsMainCategoryId, this.partsSubcategoryId, this.manufacturerId, this.manufacturerName, this.partNumber, this.oemNumber, this.condition, this.quantity, this.location, this.weightKg, this.dimensionsLengthCm, this.dimensionsWidthCm, this.dimensionsHeightCm, this.compatibleAircraftModelsText, final  List<int>? compatibleAircraftModelIds, this.mainImageUrl, final  List<String>? additionalImageUrls, this.mainImageFile, final  List<XFile>? additionalImageFiles}): _compatibleAircraftModelIds = compatibleAircraftModelIds,_additionalImageUrls = additionalImageUrls,_additionalImageFiles = additionalImageFiles;
  

 final  int partId;
 final  String? title;
 final  String? description;
 final  int? price;
 final  String? currency;
 final  int? partsMainCategoryId;
 final  int? partsSubcategoryId;
 final  int? manufacturerId;
 final  String? manufacturerName;
 final  String? partNumber;
 final  String? oemNumber;
 final  String? condition;
 final  int? quantity;
 final  String? location;
 final  double? weightKg;
 final  double? dimensionsLengthCm;
 final  double? dimensionsWidthCm;
 final  double? dimensionsHeightCm;
 final  String? compatibleAircraftModelsText;
 final  List<int>? _compatibleAircraftModelIds;
 List<int>? get compatibleAircraftModelIds {
  final value = _compatibleAircraftModelIds;
  if (value == null) return null;
  if (_compatibleAircraftModelIds is EqualUnmodifiableListView) return _compatibleAircraftModelIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? mainImageUrl;
 final  List<String>? _additionalImageUrls;
 List<String>? get additionalImageUrls {
  final value = _additionalImageUrls;
  if (value == null) return null;
  if (_additionalImageUrls is EqualUnmodifiableListView) return _additionalImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  XFile? mainImageFile;
 final  List<XFile>? _additionalImageFiles;
 List<XFile>? get additionalImageFiles {
  final value = _additionalImageFiles;
  if (value == null) return null;
  if (_additionalImageFiles is EqualUnmodifiableListView) return _additionalImageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePartsMarketEventCopyWith<UpdatePartsMarketEvent> get copyWith => _$UpdatePartsMarketEventCopyWithImpl<UpdatePartsMarketEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.updatePart'))
    ..add(DiagnosticsProperty('partId', partId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('currency', currency))..add(DiagnosticsProperty('partsMainCategoryId', partsMainCategoryId))..add(DiagnosticsProperty('partsSubcategoryId', partsSubcategoryId))..add(DiagnosticsProperty('manufacturerId', manufacturerId))..add(DiagnosticsProperty('manufacturerName', manufacturerName))..add(DiagnosticsProperty('partNumber', partNumber))..add(DiagnosticsProperty('oemNumber', oemNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('quantity', quantity))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('weightKg', weightKg))..add(DiagnosticsProperty('dimensionsLengthCm', dimensionsLengthCm))..add(DiagnosticsProperty('dimensionsWidthCm', dimensionsWidthCm))..add(DiagnosticsProperty('dimensionsHeightCm', dimensionsHeightCm))..add(DiagnosticsProperty('compatibleAircraftModelsText', compatibleAircraftModelsText))..add(DiagnosticsProperty('compatibleAircraftModelIds', compatibleAircraftModelIds))..add(DiagnosticsProperty('mainImageUrl', mainImageUrl))..add(DiagnosticsProperty('additionalImageUrls', additionalImageUrls))..add(DiagnosticsProperty('mainImageFile', mainImageFile))..add(DiagnosticsProperty('additionalImageFiles', additionalImageFiles));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePartsMarketEvent&&(identical(other.partId, partId) || other.partId == partId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.partsMainCategoryId, partsMainCategoryId) || other.partsMainCategoryId == partsMainCategoryId)&&(identical(other.partsSubcategoryId, partsSubcategoryId) || other.partsSubcategoryId == partsSubcategoryId)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.manufacturerName, manufacturerName) || other.manufacturerName == manufacturerName)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.oemNumber, oemNumber) || other.oemNumber == oemNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.location, location) || other.location == location)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.dimensionsLengthCm, dimensionsLengthCm) || other.dimensionsLengthCm == dimensionsLengthCm)&&(identical(other.dimensionsWidthCm, dimensionsWidthCm) || other.dimensionsWidthCm == dimensionsWidthCm)&&(identical(other.dimensionsHeightCm, dimensionsHeightCm) || other.dimensionsHeightCm == dimensionsHeightCm)&&(identical(other.compatibleAircraftModelsText, compatibleAircraftModelsText) || other.compatibleAircraftModelsText == compatibleAircraftModelsText)&&const DeepCollectionEquality().equals(other._compatibleAircraftModelIds, _compatibleAircraftModelIds)&&(identical(other.mainImageUrl, mainImageUrl) || other.mainImageUrl == mainImageUrl)&&const DeepCollectionEquality().equals(other._additionalImageUrls, _additionalImageUrls)&&(identical(other.mainImageFile, mainImageFile) || other.mainImageFile == mainImageFile)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles));
}


@override
int get hashCode => Object.hashAll([runtimeType,partId,title,description,price,currency,partsMainCategoryId,partsSubcategoryId,manufacturerId,manufacturerName,partNumber,oemNumber,condition,quantity,location,weightKg,dimensionsLengthCm,dimensionsWidthCm,dimensionsHeightCm,compatibleAircraftModelsText,const DeepCollectionEquality().hash(_compatibleAircraftModelIds),mainImageUrl,const DeepCollectionEquality().hash(_additionalImageUrls),mainImageFile,const DeepCollectionEquality().hash(_additionalImageFiles)]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.updatePart(partId: $partId, title: $title, description: $description, price: $price, currency: $currency, partsMainCategoryId: $partsMainCategoryId, partsSubcategoryId: $partsSubcategoryId, manufacturerId: $manufacturerId, manufacturerName: $manufacturerName, partNumber: $partNumber, oemNumber: $oemNumber, condition: $condition, quantity: $quantity, location: $location, weightKg: $weightKg, dimensionsLengthCm: $dimensionsLengthCm, dimensionsWidthCm: $dimensionsWidthCm, dimensionsHeightCm: $dimensionsHeightCm, compatibleAircraftModelsText: $compatibleAircraftModelsText, compatibleAircraftModelIds: $compatibleAircraftModelIds, mainImageUrl: $mainImageUrl, additionalImageUrls: $additionalImageUrls, mainImageFile: $mainImageFile, additionalImageFiles: $additionalImageFiles)';
}


}

/// @nodoc
abstract mixin class $UpdatePartsMarketEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $UpdatePartsMarketEventCopyWith(UpdatePartsMarketEvent value, $Res Function(UpdatePartsMarketEvent) _then) = _$UpdatePartsMarketEventCopyWithImpl;
@useResult
$Res call({
 int partId, String? title, String? description, int? price, String? currency, int? partsMainCategoryId, int? partsSubcategoryId, int? manufacturerId, String? manufacturerName, String? partNumber, String? oemNumber, String? condition, int? quantity, String? location, double? weightKg, double? dimensionsLengthCm, double? dimensionsWidthCm, double? dimensionsHeightCm, String? compatibleAircraftModelsText, List<int>? compatibleAircraftModelIds, String? mainImageUrl, List<String>? additionalImageUrls, XFile? mainImageFile, List<XFile>? additionalImageFiles
});




}
/// @nodoc
class _$UpdatePartsMarketEventCopyWithImpl<$Res>
    implements $UpdatePartsMarketEventCopyWith<$Res> {
  _$UpdatePartsMarketEventCopyWithImpl(this._self, this._then);

  final UpdatePartsMarketEvent _self;
  final $Res Function(UpdatePartsMarketEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partId = null,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? currency = freezed,Object? partsMainCategoryId = freezed,Object? partsSubcategoryId = freezed,Object? manufacturerId = freezed,Object? manufacturerName = freezed,Object? partNumber = freezed,Object? oemNumber = freezed,Object? condition = freezed,Object? quantity = freezed,Object? location = freezed,Object? weightKg = freezed,Object? dimensionsLengthCm = freezed,Object? dimensionsWidthCm = freezed,Object? dimensionsHeightCm = freezed,Object? compatibleAircraftModelsText = freezed,Object? compatibleAircraftModelIds = freezed,Object? mainImageUrl = freezed,Object? additionalImageUrls = freezed,Object? mainImageFile = freezed,Object? additionalImageFiles = freezed,}) {
  return _then(UpdatePartsMarketEvent(
partId: null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,partsMainCategoryId: freezed == partsMainCategoryId ? _self.partsMainCategoryId : partsMainCategoryId // ignore: cast_nullable_to_non_nullable
as int?,partsSubcategoryId: freezed == partsSubcategoryId ? _self.partsSubcategoryId : partsSubcategoryId // ignore: cast_nullable_to_non_nullable
as int?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,manufacturerName: freezed == manufacturerName ? _self.manufacturerName : manufacturerName // ignore: cast_nullable_to_non_nullable
as String?,partNumber: freezed == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String?,oemNumber: freezed == oemNumber ? _self.oemNumber : oemNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,dimensionsLengthCm: freezed == dimensionsLengthCm ? _self.dimensionsLengthCm : dimensionsLengthCm // ignore: cast_nullable_to_non_nullable
as double?,dimensionsWidthCm: freezed == dimensionsWidthCm ? _self.dimensionsWidthCm : dimensionsWidthCm // ignore: cast_nullable_to_non_nullable
as double?,dimensionsHeightCm: freezed == dimensionsHeightCm ? _self.dimensionsHeightCm : dimensionsHeightCm // ignore: cast_nullable_to_non_nullable
as double?,compatibleAircraftModelsText: freezed == compatibleAircraftModelsText ? _self.compatibleAircraftModelsText : compatibleAircraftModelsText // ignore: cast_nullable_to_non_nullable
as String?,compatibleAircraftModelIds: freezed == compatibleAircraftModelIds ? _self._compatibleAircraftModelIds : compatibleAircraftModelIds // ignore: cast_nullable_to_non_nullable
as List<int>?,mainImageUrl: freezed == mainImageUrl ? _self.mainImageUrl : mainImageUrl // ignore: cast_nullable_to_non_nullable
as String?,additionalImageUrls: freezed == additionalImageUrls ? _self._additionalImageUrls : additionalImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,mainImageFile: freezed == mainImageFile ? _self.mainImageFile : mainImageFile // ignore: cast_nullable_to_non_nullable
as XFile?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,
  ));
}


}

/// @nodoc


class LoadMorePartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const LoadMorePartsMarketEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.loadMore'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMorePartsMarketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.loadMore()';
}


}




/// @nodoc


class RefreshPartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const RefreshPartsMarketEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.refresh'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshPartsMarketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.refresh()';
}


}




/// @nodoc


class PublishPartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const PublishPartsMarketEvent(this.partId);
  

 final  int partId;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishPartsMarketEventCopyWith<PublishPartsMarketEvent> get copyWith => _$PublishPartsMarketEventCopyWithImpl<PublishPartsMarketEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.publishPart'))
    ..add(DiagnosticsProperty('partId', partId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishPartsMarketEvent&&(identical(other.partId, partId) || other.partId == partId));
}


@override
int get hashCode => Object.hash(runtimeType,partId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.publishPart(partId: $partId)';
}


}

/// @nodoc
abstract mixin class $PublishPartsMarketEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $PublishPartsMarketEventCopyWith(PublishPartsMarketEvent value, $Res Function(PublishPartsMarketEvent) _then) = _$PublishPartsMarketEventCopyWithImpl;
@useResult
$Res call({
 int partId
});




}
/// @nodoc
class _$PublishPartsMarketEventCopyWithImpl<$Res>
    implements $PublishPartsMarketEventCopyWith<$Res> {
  _$PublishPartsMarketEventCopyWithImpl(this._self, this._then);

  final PublishPartsMarketEvent _self;
  final $Res Function(PublishPartsMarketEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partId = null,}) {
  return _then(PublishPartsMarketEvent(
null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UnpublishPartsMarketEvent with DiagnosticableTreeMixin implements PartsMarketEvent {
  const UnpublishPartsMarketEvent(this.partId);
  

 final  int partId;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnpublishPartsMarketEventCopyWith<UnpublishPartsMarketEvent> get copyWith => _$UnpublishPartsMarketEventCopyWithImpl<UnpublishPartsMarketEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketEvent.unpublishPart'))
    ..add(DiagnosticsProperty('partId', partId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnpublishPartsMarketEvent&&(identical(other.partId, partId) || other.partId == partId));
}


@override
int get hashCode => Object.hash(runtimeType,partId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketEvent.unpublishPart(partId: $partId)';
}


}

/// @nodoc
abstract mixin class $UnpublishPartsMarketEventCopyWith<$Res> implements $PartsMarketEventCopyWith<$Res> {
  factory $UnpublishPartsMarketEventCopyWith(UnpublishPartsMarketEvent value, $Res Function(UnpublishPartsMarketEvent) _then) = _$UnpublishPartsMarketEventCopyWithImpl;
@useResult
$Res call({
 int partId
});




}
/// @nodoc
class _$UnpublishPartsMarketEventCopyWithImpl<$Res>
    implements $UnpublishPartsMarketEventCopyWith<$Res> {
  _$UnpublishPartsMarketEventCopyWithImpl(this._self, this._then);

  final UnpublishPartsMarketEvent _self;
  final $Res Function(UnpublishPartsMarketEvent) _then;

/// Create a copy of PartsMarketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partId = null,}) {
  return _then(UnpublishPartsMarketEvent(
null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PartsMarketState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartsMarketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState()';
}


}

/// @nodoc
class $PartsMarketStateCopyWith<$Res>  {
$PartsMarketStateCopyWith(PartsMarketState _, $Res Function(PartsMarketState) __);
}


/// Adds pattern-matching-related methods to [PartsMarketState].
extension PartsMarketStatePatterns on PartsMarketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingPartsMarketState value)?  loading,TResult Function( LoadingMorePartsMarketState value)?  loadingMore,TResult Function( ErrorPartsMarketState value)?  error,TResult Function( SuccessPartsMarketState value)?  success,TResult Function( CreatingPartsMarketState value)?  creatingPart,TResult Function( CreatedPartsMarketState value)?  createdPart,TResult Function( UpdatingPartsMarketState value)?  updating,TResult Function( UpdatedPartsMarketState value)?  updated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingPartsMarketState() when loading != null:
return loading(_that);case LoadingMorePartsMarketState() when loadingMore != null:
return loadingMore(_that);case ErrorPartsMarketState() when error != null:
return error(_that);case SuccessPartsMarketState() when success != null:
return success(_that);case CreatingPartsMarketState() when creatingPart != null:
return creatingPart(_that);case CreatedPartsMarketState() when createdPart != null:
return createdPart(_that);case UpdatingPartsMarketState() when updating != null:
return updating(_that);case UpdatedPartsMarketState() when updated != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingPartsMarketState value)  loading,required TResult Function( LoadingMorePartsMarketState value)  loadingMore,required TResult Function( ErrorPartsMarketState value)  error,required TResult Function( SuccessPartsMarketState value)  success,required TResult Function( CreatingPartsMarketState value)  creatingPart,required TResult Function( CreatedPartsMarketState value)  createdPart,required TResult Function( UpdatingPartsMarketState value)  updating,required TResult Function( UpdatedPartsMarketState value)  updated,}){
final _that = this;
switch (_that) {
case LoadingPartsMarketState():
return loading(_that);case LoadingMorePartsMarketState():
return loadingMore(_that);case ErrorPartsMarketState():
return error(_that);case SuccessPartsMarketState():
return success(_that);case CreatingPartsMarketState():
return creatingPart(_that);case CreatedPartsMarketState():
return createdPart(_that);case UpdatingPartsMarketState():
return updating(_that);case UpdatedPartsMarketState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingPartsMarketState value)?  loading,TResult? Function( LoadingMorePartsMarketState value)?  loadingMore,TResult? Function( ErrorPartsMarketState value)?  error,TResult? Function( SuccessPartsMarketState value)?  success,TResult? Function( CreatingPartsMarketState value)?  creatingPart,TResult? Function( CreatedPartsMarketState value)?  createdPart,TResult? Function( UpdatingPartsMarketState value)?  updating,TResult? Function( UpdatedPartsMarketState value)?  updated,}){
final _that = this;
switch (_that) {
case LoadingPartsMarketState() when loading != null:
return loading(_that);case LoadingMorePartsMarketState() when loadingMore != null:
return loadingMore(_that);case ErrorPartsMarketState() when error != null:
return error(_that);case SuccessPartsMarketState() when success != null:
return success(_that);case CreatingPartsMarketState() when creatingPart != null:
return creatingPart(_that);case CreatedPartsMarketState() when createdPart != null:
return createdPart(_that);case UpdatingPartsMarketState() when updating != null:
return updating(_that);case UpdatedPartsMarketState() when updated != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<PartsMarketEntity> parts)?  loadingMore,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<PartsMarketEntity> parts,  bool hasMore)?  success,TResult Function()?  creatingPart,TResult Function( PartsMarketEntity part)?  createdPart,TResult Function()?  updating,TResult Function( PartsMarketEntity part)?  updated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingPartsMarketState() when loading != null:
return loading();case LoadingMorePartsMarketState() when loadingMore != null:
return loadingMore(_that.parts);case ErrorPartsMarketState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessPartsMarketState() when success != null:
return success(_that.parts,_that.hasMore);case CreatingPartsMarketState() when creatingPart != null:
return creatingPart();case CreatedPartsMarketState() when createdPart != null:
return createdPart(_that.part);case UpdatingPartsMarketState() when updating != null:
return updating();case UpdatedPartsMarketState() when updated != null:
return updated(_that.part);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<PartsMarketEntity> parts)  loadingMore,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<PartsMarketEntity> parts,  bool hasMore)  success,required TResult Function()  creatingPart,required TResult Function( PartsMarketEntity part)  createdPart,required TResult Function()  updating,required TResult Function( PartsMarketEntity part)  updated,}) {final _that = this;
switch (_that) {
case LoadingPartsMarketState():
return loading();case LoadingMorePartsMarketState():
return loadingMore(_that.parts);case ErrorPartsMarketState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessPartsMarketState():
return success(_that.parts,_that.hasMore);case CreatingPartsMarketState():
return creatingPart();case CreatedPartsMarketState():
return createdPart(_that.part);case UpdatingPartsMarketState():
return updating();case UpdatedPartsMarketState():
return updated(_that.part);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<PartsMarketEntity> parts)?  loadingMore,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<PartsMarketEntity> parts,  bool hasMore)?  success,TResult? Function()?  creatingPart,TResult? Function( PartsMarketEntity part)?  createdPart,TResult? Function()?  updating,TResult? Function( PartsMarketEntity part)?  updated,}) {final _that = this;
switch (_that) {
case LoadingPartsMarketState() when loading != null:
return loading();case LoadingMorePartsMarketState() when loadingMore != null:
return loadingMore(_that.parts);case ErrorPartsMarketState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessPartsMarketState() when success != null:
return success(_that.parts,_that.hasMore);case CreatingPartsMarketState() when creatingPart != null:
return creatingPart();case CreatedPartsMarketState() when createdPart != null:
return createdPart(_that.part);case UpdatingPartsMarketState() when updating != null:
return updating();case UpdatedPartsMarketState() when updated != null:
return updated(_that.part);case _:
  return null;

}
}

}

/// @nodoc


class LoadingPartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const LoadingPartsMarketState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingPartsMarketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.loading()';
}


}




/// @nodoc


class LoadingMorePartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const LoadingMorePartsMarketState({required final  List<PartsMarketEntity> parts}): _parts = parts;
  

 final  List<PartsMarketEntity> _parts;
 List<PartsMarketEntity> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}


/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingMorePartsMarketStateCopyWith<LoadingMorePartsMarketState> get copyWith => _$LoadingMorePartsMarketStateCopyWithImpl<LoadingMorePartsMarketState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.loadingMore'))
    ..add(DiagnosticsProperty('parts', parts));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMorePartsMarketState&&const DeepCollectionEquality().equals(other._parts, _parts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_parts));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.loadingMore(parts: $parts)';
}


}

/// @nodoc
abstract mixin class $LoadingMorePartsMarketStateCopyWith<$Res> implements $PartsMarketStateCopyWith<$Res> {
  factory $LoadingMorePartsMarketStateCopyWith(LoadingMorePartsMarketState value, $Res Function(LoadingMorePartsMarketState) _then) = _$LoadingMorePartsMarketStateCopyWithImpl;
@useResult
$Res call({
 List<PartsMarketEntity> parts
});




}
/// @nodoc
class _$LoadingMorePartsMarketStateCopyWithImpl<$Res>
    implements $LoadingMorePartsMarketStateCopyWith<$Res> {
  _$LoadingMorePartsMarketStateCopyWithImpl(this._self, this._then);

  final LoadingMorePartsMarketState _self;
  final $Res Function(LoadingMorePartsMarketState) _then;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? parts = null,}) {
  return _then(LoadingMorePartsMarketState(
parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartsMarketEntity>,
  ));
}


}

/// @nodoc


class ErrorPartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const ErrorPartsMarketState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage});
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorPartsMarketStateCopyWith<ErrorPartsMarketState> get copyWith => _$ErrorPartsMarketStateCopyWithImpl<ErrorPartsMarketState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.error'))
    ..add(DiagnosticsProperty('errorFromApi', errorFromApi))..add(DiagnosticsProperty('errorForUser', errorForUser))..add(DiagnosticsProperty('statusCode', statusCode))..add(DiagnosticsProperty('stackTrace', stackTrace))..add(DiagnosticsProperty('responseMessage', responseMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorPartsMarketState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorPartsMarketStateCopyWith<$Res> implements $PartsMarketStateCopyWith<$Res> {
  factory $ErrorPartsMarketStateCopyWith(ErrorPartsMarketState value, $Res Function(ErrorPartsMarketState) _then) = _$ErrorPartsMarketStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorPartsMarketStateCopyWithImpl<$Res>
    implements $ErrorPartsMarketStateCopyWith<$Res> {
  _$ErrorPartsMarketStateCopyWithImpl(this._self, this._then);

  final ErrorPartsMarketState _self;
  final $Res Function(ErrorPartsMarketState) _then;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorPartsMarketState(
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


class SuccessPartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const SuccessPartsMarketState({required final  List<PartsMarketEntity> parts, this.hasMore = true}): _parts = parts;
  

 final  List<PartsMarketEntity> _parts;
 List<PartsMarketEntity> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

@JsonKey() final  bool hasMore;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessPartsMarketStateCopyWith<SuccessPartsMarketState> get copyWith => _$SuccessPartsMarketStateCopyWithImpl<SuccessPartsMarketState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.success'))
    ..add(DiagnosticsProperty('parts', parts))..add(DiagnosticsProperty('hasMore', hasMore));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessPartsMarketState&&const DeepCollectionEquality().equals(other._parts, _parts)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_parts),hasMore);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.success(parts: $parts, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SuccessPartsMarketStateCopyWith<$Res> implements $PartsMarketStateCopyWith<$Res> {
  factory $SuccessPartsMarketStateCopyWith(SuccessPartsMarketState value, $Res Function(SuccessPartsMarketState) _then) = _$SuccessPartsMarketStateCopyWithImpl;
@useResult
$Res call({
 List<PartsMarketEntity> parts, bool hasMore
});




}
/// @nodoc
class _$SuccessPartsMarketStateCopyWithImpl<$Res>
    implements $SuccessPartsMarketStateCopyWith<$Res> {
  _$SuccessPartsMarketStateCopyWithImpl(this._self, this._then);

  final SuccessPartsMarketState _self;
  final $Res Function(SuccessPartsMarketState) _then;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? parts = null,Object? hasMore = null,}) {
  return _then(SuccessPartsMarketState(
parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartsMarketEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CreatingPartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const CreatingPartsMarketState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.creatingPart'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingPartsMarketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.creatingPart()';
}


}




/// @nodoc


class CreatedPartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const CreatedPartsMarketState({required this.part});
  

 final  PartsMarketEntity part;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedPartsMarketStateCopyWith<CreatedPartsMarketState> get copyWith => _$CreatedPartsMarketStateCopyWithImpl<CreatedPartsMarketState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.createdPart'))
    ..add(DiagnosticsProperty('part', part));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedPartsMarketState&&(identical(other.part, part) || other.part == part));
}


@override
int get hashCode => Object.hash(runtimeType,part);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.createdPart(part: $part)';
}


}

/// @nodoc
abstract mixin class $CreatedPartsMarketStateCopyWith<$Res> implements $PartsMarketStateCopyWith<$Res> {
  factory $CreatedPartsMarketStateCopyWith(CreatedPartsMarketState value, $Res Function(CreatedPartsMarketState) _then) = _$CreatedPartsMarketStateCopyWithImpl;
@useResult
$Res call({
 PartsMarketEntity part
});




}
/// @nodoc
class _$CreatedPartsMarketStateCopyWithImpl<$Res>
    implements $CreatedPartsMarketStateCopyWith<$Res> {
  _$CreatedPartsMarketStateCopyWithImpl(this._self, this._then);

  final CreatedPartsMarketState _self;
  final $Res Function(CreatedPartsMarketState) _then;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? part = null,}) {
  return _then(CreatedPartsMarketState(
part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as PartsMarketEntity,
  ));
}


}

/// @nodoc


class UpdatingPartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const UpdatingPartsMarketState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.updating'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatingPartsMarketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.updating()';
}


}




/// @nodoc


class UpdatedPartsMarketState with DiagnosticableTreeMixin implements PartsMarketState {
  const UpdatedPartsMarketState({required this.part});
  

 final  PartsMarketEntity part;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedPartsMarketStateCopyWith<UpdatedPartsMarketState> get copyWith => _$UpdatedPartsMarketStateCopyWithImpl<UpdatedPartsMarketState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PartsMarketState.updated'))
    ..add(DiagnosticsProperty('part', part));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedPartsMarketState&&(identical(other.part, part) || other.part == part));
}


@override
int get hashCode => Object.hash(runtimeType,part);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PartsMarketState.updated(part: $part)';
}


}

/// @nodoc
abstract mixin class $UpdatedPartsMarketStateCopyWith<$Res> implements $PartsMarketStateCopyWith<$Res> {
  factory $UpdatedPartsMarketStateCopyWith(UpdatedPartsMarketState value, $Res Function(UpdatedPartsMarketState) _then) = _$UpdatedPartsMarketStateCopyWithImpl;
@useResult
$Res call({
 PartsMarketEntity part
});




}
/// @nodoc
class _$UpdatedPartsMarketStateCopyWithImpl<$Res>
    implements $UpdatedPartsMarketStateCopyWith<$Res> {
  _$UpdatedPartsMarketStateCopyWithImpl(this._self, this._then);

  final UpdatedPartsMarketState _self;
  final $Res Function(UpdatedPartsMarketState) _then;

/// Create a copy of PartsMarketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? part = null,}) {
  return _then(UpdatedPartsMarketState(
part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as PartsMarketEntity,
  ));
}


}

// dart format on
