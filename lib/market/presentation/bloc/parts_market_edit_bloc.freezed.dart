// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parts_market_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PartsMarketEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartsMarketEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditEvent()';
}


}

/// @nodoc
class $PartsMarketEditEventCopyWith<$Res>  {
$PartsMarketEditEventCopyWith(PartsMarketEditEvent _, $Res Function(PartsMarketEditEvent) __);
}


/// Adds pattern-matching-related methods to [PartsMarketEditEvent].
extension PartsMarketEditEventPatterns on PartsMarketEditEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetPartsMarketEditEvent value)?  getProduct,TResult Function( UpdatePartsMarketEditEvent value)?  updateProduct,TResult Function( DeletePartsMarketEditEvent value)?  deleteProduct,TResult Function( PublishPartsMarketEditEvent value)?  publishProduct,TResult Function( UnpublishPartsMarketEditEvent value)?  unpublishProduct,TResult Function( ResetPartsMarketEditEvent value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetPartsMarketEditEvent() when getProduct != null:
return getProduct(_that);case UpdatePartsMarketEditEvent() when updateProduct != null:
return updateProduct(_that);case DeletePartsMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that);case PublishPartsMarketEditEvent() when publishProduct != null:
return publishProduct(_that);case UnpublishPartsMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that);case ResetPartsMarketEditEvent() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetPartsMarketEditEvent value)  getProduct,required TResult Function( UpdatePartsMarketEditEvent value)  updateProduct,required TResult Function( DeletePartsMarketEditEvent value)  deleteProduct,required TResult Function( PublishPartsMarketEditEvent value)  publishProduct,required TResult Function( UnpublishPartsMarketEditEvent value)  unpublishProduct,required TResult Function( ResetPartsMarketEditEvent value)  reset,}){
final _that = this;
switch (_that) {
case GetPartsMarketEditEvent():
return getProduct(_that);case UpdatePartsMarketEditEvent():
return updateProduct(_that);case DeletePartsMarketEditEvent():
return deleteProduct(_that);case PublishPartsMarketEditEvent():
return publishProduct(_that);case UnpublishPartsMarketEditEvent():
return unpublishProduct(_that);case ResetPartsMarketEditEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetPartsMarketEditEvent value)?  getProduct,TResult? Function( UpdatePartsMarketEditEvent value)?  updateProduct,TResult? Function( DeletePartsMarketEditEvent value)?  deleteProduct,TResult? Function( PublishPartsMarketEditEvent value)?  publishProduct,TResult? Function( UnpublishPartsMarketEditEvent value)?  unpublishProduct,TResult? Function( ResetPartsMarketEditEvent value)?  reset,}){
final _that = this;
switch (_that) {
case GetPartsMarketEditEvent() when getProduct != null:
return getProduct(_that);case UpdatePartsMarketEditEvent() when updateProduct != null:
return updateProduct(_that);case DeletePartsMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that);case PublishPartsMarketEditEvent() when publishProduct != null:
return publishProduct(_that);case UnpublishPartsMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that);case ResetPartsMarketEditEvent() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int productId)?  getProduct,TResult Function( int productId,  String? title,  String? description,  int? price,  String? currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int? quantity,  String? location,  Map<String, dynamic>? address,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  String? mainImageUrl,  List<String>? additionalImageUrls,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updateProduct,TResult Function( int productId)?  deleteProduct,TResult Function( int productId)?  publishProduct,TResult Function( int productId)?  unpublishProduct,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetPartsMarketEditEvent() when getProduct != null:
return getProduct(_that.productId);case UpdatePartsMarketEditEvent() when updateProduct != null:
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.address,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageUrl,_that.additionalImageUrls,_that.mainImageFile,_that.additionalImageFiles);case DeletePartsMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case PublishPartsMarketEditEvent() when publishProduct != null:
return publishProduct(_that.productId);case UnpublishPartsMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that.productId);case ResetPartsMarketEditEvent() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int productId)  getProduct,required TResult Function( int productId,  String? title,  String? description,  int? price,  String? currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int? quantity,  String? location,  Map<String, dynamic>? address,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  String? mainImageUrl,  List<String>? additionalImageUrls,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)  updateProduct,required TResult Function( int productId)  deleteProduct,required TResult Function( int productId)  publishProduct,required TResult Function( int productId)  unpublishProduct,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case GetPartsMarketEditEvent():
return getProduct(_that.productId);case UpdatePartsMarketEditEvent():
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.address,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageUrl,_that.additionalImageUrls,_that.mainImageFile,_that.additionalImageFiles);case DeletePartsMarketEditEvent():
return deleteProduct(_that.productId);case PublishPartsMarketEditEvent():
return publishProduct(_that.productId);case UnpublishPartsMarketEditEvent():
return unpublishProduct(_that.productId);case ResetPartsMarketEditEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int productId)?  getProduct,TResult? Function( int productId,  String? title,  String? description,  int? price,  String? currency,  int? partsMainCategoryId,  int? partsSubcategoryId,  int? manufacturerId,  String? manufacturerName,  String? partNumber,  String? oemNumber,  String? condition,  int? quantity,  String? location,  Map<String, dynamic>? address,  double? weightKg,  double? dimensionsLengthCm,  double? dimensionsWidthCm,  double? dimensionsHeightCm,  String? compatibleAircraftModelsText,  List<int>? compatibleAircraftModelIds,  String? mainImageUrl,  List<String>? additionalImageUrls,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updateProduct,TResult? Function( int productId)?  deleteProduct,TResult? Function( int productId)?  publishProduct,TResult? Function( int productId)?  unpublishProduct,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case GetPartsMarketEditEvent() when getProduct != null:
return getProduct(_that.productId);case UpdatePartsMarketEditEvent() when updateProduct != null:
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.currency,_that.partsMainCategoryId,_that.partsSubcategoryId,_that.manufacturerId,_that.manufacturerName,_that.partNumber,_that.oemNumber,_that.condition,_that.quantity,_that.location,_that.address,_that.weightKg,_that.dimensionsLengthCm,_that.dimensionsWidthCm,_that.dimensionsHeightCm,_that.compatibleAircraftModelsText,_that.compatibleAircraftModelIds,_that.mainImageUrl,_that.additionalImageUrls,_that.mainImageFile,_that.additionalImageFiles);case DeletePartsMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case PublishPartsMarketEditEvent() when publishProduct != null:
return publishProduct(_that.productId);case UnpublishPartsMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that.productId);case ResetPartsMarketEditEvent() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class GetPartsMarketEditEvent implements PartsMarketEditEvent {
  const GetPartsMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPartsMarketEditEventCopyWith<GetPartsMarketEditEvent> get copyWith => _$GetPartsMarketEditEventCopyWithImpl<GetPartsMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPartsMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'PartsMarketEditEvent.getProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $GetPartsMarketEditEventCopyWith<$Res> implements $PartsMarketEditEventCopyWith<$Res> {
  factory $GetPartsMarketEditEventCopyWith(GetPartsMarketEditEvent value, $Res Function(GetPartsMarketEditEvent) _then) = _$GetPartsMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$GetPartsMarketEditEventCopyWithImpl<$Res>
    implements $GetPartsMarketEditEventCopyWith<$Res> {
  _$GetPartsMarketEditEventCopyWithImpl(this._self, this._then);

  final GetPartsMarketEditEvent _self;
  final $Res Function(GetPartsMarketEditEvent) _then;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(GetPartsMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdatePartsMarketEditEvent implements PartsMarketEditEvent {
  const UpdatePartsMarketEditEvent({required this.productId, this.title, this.description, this.price, this.currency, this.partsMainCategoryId, this.partsSubcategoryId, this.manufacturerId, this.manufacturerName, this.partNumber, this.oemNumber, this.condition, this.quantity, this.location, final  Map<String, dynamic>? address, this.weightKg, this.dimensionsLengthCm, this.dimensionsWidthCm, this.dimensionsHeightCm, this.compatibleAircraftModelsText, final  List<int>? compatibleAircraftModelIds, this.mainImageUrl, final  List<String>? additionalImageUrls, this.mainImageFile, final  List<XFile>? additionalImageFiles}): _address = address,_compatibleAircraftModelIds = compatibleAircraftModelIds,_additionalImageUrls = additionalImageUrls,_additionalImageFiles = additionalImageFiles;
  

 final  int productId;
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
 final  Map<String, dynamic>? _address;
 Map<String, dynamic>? get address {
  final value = _address;
  if (value == null) return null;
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

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


/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePartsMarketEditEventCopyWith<UpdatePartsMarketEditEvent> get copyWith => _$UpdatePartsMarketEditEventCopyWithImpl<UpdatePartsMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePartsMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.partsMainCategoryId, partsMainCategoryId) || other.partsMainCategoryId == partsMainCategoryId)&&(identical(other.partsSubcategoryId, partsSubcategoryId) || other.partsSubcategoryId == partsSubcategoryId)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.manufacturerName, manufacturerName) || other.manufacturerName == manufacturerName)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.oemNumber, oemNumber) || other.oemNumber == oemNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.dimensionsLengthCm, dimensionsLengthCm) || other.dimensionsLengthCm == dimensionsLengthCm)&&(identical(other.dimensionsWidthCm, dimensionsWidthCm) || other.dimensionsWidthCm == dimensionsWidthCm)&&(identical(other.dimensionsHeightCm, dimensionsHeightCm) || other.dimensionsHeightCm == dimensionsHeightCm)&&(identical(other.compatibleAircraftModelsText, compatibleAircraftModelsText) || other.compatibleAircraftModelsText == compatibleAircraftModelsText)&&const DeepCollectionEquality().equals(other._compatibleAircraftModelIds, _compatibleAircraftModelIds)&&(identical(other.mainImageUrl, mainImageUrl) || other.mainImageUrl == mainImageUrl)&&const DeepCollectionEquality().equals(other._additionalImageUrls, _additionalImageUrls)&&(identical(other.mainImageFile, mainImageFile) || other.mainImageFile == mainImageFile)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles));
}


@override
int get hashCode => Object.hashAll([runtimeType,productId,title,description,price,currency,partsMainCategoryId,partsSubcategoryId,manufacturerId,manufacturerName,partNumber,oemNumber,condition,quantity,location,const DeepCollectionEquality().hash(_address),weightKg,dimensionsLengthCm,dimensionsWidthCm,dimensionsHeightCm,compatibleAircraftModelsText,const DeepCollectionEquality().hash(_compatibleAircraftModelIds),mainImageUrl,const DeepCollectionEquality().hash(_additionalImageUrls),mainImageFile,const DeepCollectionEquality().hash(_additionalImageFiles)]);

@override
String toString() {
  return 'PartsMarketEditEvent.updateProduct(productId: $productId, title: $title, description: $description, price: $price, currency: $currency, partsMainCategoryId: $partsMainCategoryId, partsSubcategoryId: $partsSubcategoryId, manufacturerId: $manufacturerId, manufacturerName: $manufacturerName, partNumber: $partNumber, oemNumber: $oemNumber, condition: $condition, quantity: $quantity, location: $location, address: $address, weightKg: $weightKg, dimensionsLengthCm: $dimensionsLengthCm, dimensionsWidthCm: $dimensionsWidthCm, dimensionsHeightCm: $dimensionsHeightCm, compatibleAircraftModelsText: $compatibleAircraftModelsText, compatibleAircraftModelIds: $compatibleAircraftModelIds, mainImageUrl: $mainImageUrl, additionalImageUrls: $additionalImageUrls, mainImageFile: $mainImageFile, additionalImageFiles: $additionalImageFiles)';
}


}

/// @nodoc
abstract mixin class $UpdatePartsMarketEditEventCopyWith<$Res> implements $PartsMarketEditEventCopyWith<$Res> {
  factory $UpdatePartsMarketEditEventCopyWith(UpdatePartsMarketEditEvent value, $Res Function(UpdatePartsMarketEditEvent) _then) = _$UpdatePartsMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId, String? title, String? description, int? price, String? currency, int? partsMainCategoryId, int? partsSubcategoryId, int? manufacturerId, String? manufacturerName, String? partNumber, String? oemNumber, String? condition, int? quantity, String? location, Map<String, dynamic>? address, double? weightKg, double? dimensionsLengthCm, double? dimensionsWidthCm, double? dimensionsHeightCm, String? compatibleAircraftModelsText, List<int>? compatibleAircraftModelIds, String? mainImageUrl, List<String>? additionalImageUrls, XFile? mainImageFile, List<XFile>? additionalImageFiles
});




}
/// @nodoc
class _$UpdatePartsMarketEditEventCopyWithImpl<$Res>
    implements $UpdatePartsMarketEditEventCopyWith<$Res> {
  _$UpdatePartsMarketEditEventCopyWithImpl(this._self, this._then);

  final UpdatePartsMarketEditEvent _self;
  final $Res Function(UpdatePartsMarketEditEvent) _then;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? currency = freezed,Object? partsMainCategoryId = freezed,Object? partsSubcategoryId = freezed,Object? manufacturerId = freezed,Object? manufacturerName = freezed,Object? partNumber = freezed,Object? oemNumber = freezed,Object? condition = freezed,Object? quantity = freezed,Object? location = freezed,Object? address = freezed,Object? weightKg = freezed,Object? dimensionsLengthCm = freezed,Object? dimensionsWidthCm = freezed,Object? dimensionsHeightCm = freezed,Object? compatibleAircraftModelsText = freezed,Object? compatibleAircraftModelIds = freezed,Object? mainImageUrl = freezed,Object? additionalImageUrls = freezed,Object? mainImageFile = freezed,Object? additionalImageFiles = freezed,}) {
  return _then(UpdatePartsMarketEditEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
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
as String?,address: freezed == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
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


class DeletePartsMarketEditEvent implements PartsMarketEditEvent {
  const DeletePartsMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePartsMarketEditEventCopyWith<DeletePartsMarketEditEvent> get copyWith => _$DeletePartsMarketEditEventCopyWithImpl<DeletePartsMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePartsMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'PartsMarketEditEvent.deleteProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DeletePartsMarketEditEventCopyWith<$Res> implements $PartsMarketEditEventCopyWith<$Res> {
  factory $DeletePartsMarketEditEventCopyWith(DeletePartsMarketEditEvent value, $Res Function(DeletePartsMarketEditEvent) _then) = _$DeletePartsMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DeletePartsMarketEditEventCopyWithImpl<$Res>
    implements $DeletePartsMarketEditEventCopyWith<$Res> {
  _$DeletePartsMarketEditEventCopyWithImpl(this._self, this._then);

  final DeletePartsMarketEditEvent _self;
  final $Res Function(DeletePartsMarketEditEvent) _then;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DeletePartsMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PublishPartsMarketEditEvent implements PartsMarketEditEvent {
  const PublishPartsMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishPartsMarketEditEventCopyWith<PublishPartsMarketEditEvent> get copyWith => _$PublishPartsMarketEditEventCopyWithImpl<PublishPartsMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishPartsMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'PartsMarketEditEvent.publishProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $PublishPartsMarketEditEventCopyWith<$Res> implements $PartsMarketEditEventCopyWith<$Res> {
  factory $PublishPartsMarketEditEventCopyWith(PublishPartsMarketEditEvent value, $Res Function(PublishPartsMarketEditEvent) _then) = _$PublishPartsMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$PublishPartsMarketEditEventCopyWithImpl<$Res>
    implements $PublishPartsMarketEditEventCopyWith<$Res> {
  _$PublishPartsMarketEditEventCopyWithImpl(this._self, this._then);

  final PublishPartsMarketEditEvent _self;
  final $Res Function(PublishPartsMarketEditEvent) _then;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(PublishPartsMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UnpublishPartsMarketEditEvent implements PartsMarketEditEvent {
  const UnpublishPartsMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnpublishPartsMarketEditEventCopyWith<UnpublishPartsMarketEditEvent> get copyWith => _$UnpublishPartsMarketEditEventCopyWithImpl<UnpublishPartsMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnpublishPartsMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'PartsMarketEditEvent.unpublishProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $UnpublishPartsMarketEditEventCopyWith<$Res> implements $PartsMarketEditEventCopyWith<$Res> {
  factory $UnpublishPartsMarketEditEventCopyWith(UnpublishPartsMarketEditEvent value, $Res Function(UnpublishPartsMarketEditEvent) _then) = _$UnpublishPartsMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$UnpublishPartsMarketEditEventCopyWithImpl<$Res>
    implements $UnpublishPartsMarketEditEventCopyWith<$Res> {
  _$UnpublishPartsMarketEditEventCopyWithImpl(this._self, this._then);

  final UnpublishPartsMarketEditEvent _self;
  final $Res Function(UnpublishPartsMarketEditEvent) _then;

/// Create a copy of PartsMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(UnpublishPartsMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ResetPartsMarketEditEvent implements PartsMarketEditEvent {
  const ResetPartsMarketEditEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPartsMarketEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditEvent.reset()';
}


}




/// @nodoc
mixin _$PartsMarketEditState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartsMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditState()';
}


}

/// @nodoc
class $PartsMarketEditStateCopyWith<$Res>  {
$PartsMarketEditStateCopyWith(PartsMarketEditState _, $Res Function(PartsMarketEditState) __);
}


/// Adds pattern-matching-related methods to [PartsMarketEditState].
extension PartsMarketEditStatePatterns on PartsMarketEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialPartsMarketEditState value)?  initial,TResult Function( LoadingPartsMarketEditState value)?  loading,TResult Function( LoadedPartsMarketEditState value)?  loaded,TResult Function( SavingPartsMarketEditState value)?  saving,TResult Function( SavedPartsMarketEditState value)?  saved,TResult Function( DeletingPartsMarketEditState value)?  deleting,TResult Function( DeletedPartsMarketEditState value)?  deleted,TResult Function( PublishingPartsMarketEditState value)?  publishing,TResult Function( PublishedPartsMarketEditState value)?  published,TResult Function( UnpublishingPartsMarketEditState value)?  unpublishing,TResult Function( UnpublishedPartsMarketEditState value)?  unpublished,TResult Function( ErrorPartsMarketEditState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialPartsMarketEditState() when initial != null:
return initial(_that);case LoadingPartsMarketEditState() when loading != null:
return loading(_that);case LoadedPartsMarketEditState() when loaded != null:
return loaded(_that);case SavingPartsMarketEditState() when saving != null:
return saving(_that);case SavedPartsMarketEditState() when saved != null:
return saved(_that);case DeletingPartsMarketEditState() when deleting != null:
return deleting(_that);case DeletedPartsMarketEditState() when deleted != null:
return deleted(_that);case PublishingPartsMarketEditState() when publishing != null:
return publishing(_that);case PublishedPartsMarketEditState() when published != null:
return published(_that);case UnpublishingPartsMarketEditState() when unpublishing != null:
return unpublishing(_that);case UnpublishedPartsMarketEditState() when unpublished != null:
return unpublished(_that);case ErrorPartsMarketEditState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialPartsMarketEditState value)  initial,required TResult Function( LoadingPartsMarketEditState value)  loading,required TResult Function( LoadedPartsMarketEditState value)  loaded,required TResult Function( SavingPartsMarketEditState value)  saving,required TResult Function( SavedPartsMarketEditState value)  saved,required TResult Function( DeletingPartsMarketEditState value)  deleting,required TResult Function( DeletedPartsMarketEditState value)  deleted,required TResult Function( PublishingPartsMarketEditState value)  publishing,required TResult Function( PublishedPartsMarketEditState value)  published,required TResult Function( UnpublishingPartsMarketEditState value)  unpublishing,required TResult Function( UnpublishedPartsMarketEditState value)  unpublished,required TResult Function( ErrorPartsMarketEditState value)  error,}){
final _that = this;
switch (_that) {
case InitialPartsMarketEditState():
return initial(_that);case LoadingPartsMarketEditState():
return loading(_that);case LoadedPartsMarketEditState():
return loaded(_that);case SavingPartsMarketEditState():
return saving(_that);case SavedPartsMarketEditState():
return saved(_that);case DeletingPartsMarketEditState():
return deleting(_that);case DeletedPartsMarketEditState():
return deleted(_that);case PublishingPartsMarketEditState():
return publishing(_that);case PublishedPartsMarketEditState():
return published(_that);case UnpublishingPartsMarketEditState():
return unpublishing(_that);case UnpublishedPartsMarketEditState():
return unpublished(_that);case ErrorPartsMarketEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialPartsMarketEditState value)?  initial,TResult? Function( LoadingPartsMarketEditState value)?  loading,TResult? Function( LoadedPartsMarketEditState value)?  loaded,TResult? Function( SavingPartsMarketEditState value)?  saving,TResult? Function( SavedPartsMarketEditState value)?  saved,TResult? Function( DeletingPartsMarketEditState value)?  deleting,TResult? Function( DeletedPartsMarketEditState value)?  deleted,TResult? Function( PublishingPartsMarketEditState value)?  publishing,TResult? Function( PublishedPartsMarketEditState value)?  published,TResult? Function( UnpublishingPartsMarketEditState value)?  unpublishing,TResult? Function( UnpublishedPartsMarketEditState value)?  unpublished,TResult? Function( ErrorPartsMarketEditState value)?  error,}){
final _that = this;
switch (_that) {
case InitialPartsMarketEditState() when initial != null:
return initial(_that);case LoadingPartsMarketEditState() when loading != null:
return loading(_that);case LoadedPartsMarketEditState() when loaded != null:
return loaded(_that);case SavingPartsMarketEditState() when saving != null:
return saving(_that);case SavedPartsMarketEditState() when saved != null:
return saved(_that);case DeletingPartsMarketEditState() when deleting != null:
return deleting(_that);case DeletedPartsMarketEditState() when deleted != null:
return deleted(_that);case PublishingPartsMarketEditState() when publishing != null:
return publishing(_that);case PublishedPartsMarketEditState() when published != null:
return published(_that);case UnpublishingPartsMarketEditState() when unpublishing != null:
return unpublishing(_that);case UnpublishedPartsMarketEditState() when unpublished != null:
return unpublished(_that);case ErrorPartsMarketEditState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PartsMarketEntity product)?  loaded,TResult Function()?  saving,TResult Function( PartsMarketEntity product)?  saved,TResult Function()?  deleting,TResult Function( int productId)?  deleted,TResult Function()?  publishing,TResult Function( PartsMarketEntity product)?  published,TResult Function()?  unpublishing,TResult Function( PartsMarketEntity product)?  unpublished,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialPartsMarketEditState() when initial != null:
return initial();case LoadingPartsMarketEditState() when loading != null:
return loading();case LoadedPartsMarketEditState() when loaded != null:
return loaded(_that.product);case SavingPartsMarketEditState() when saving != null:
return saving();case SavedPartsMarketEditState() when saved != null:
return saved(_that.product);case DeletingPartsMarketEditState() when deleting != null:
return deleting();case DeletedPartsMarketEditState() when deleted != null:
return deleted(_that.productId);case PublishingPartsMarketEditState() when publishing != null:
return publishing();case PublishedPartsMarketEditState() when published != null:
return published(_that.product);case UnpublishingPartsMarketEditState() when unpublishing != null:
return unpublishing();case UnpublishedPartsMarketEditState() when unpublished != null:
return unpublished(_that.product);case ErrorPartsMarketEditState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PartsMarketEntity product)  loaded,required TResult Function()  saving,required TResult Function( PartsMarketEntity product)  saved,required TResult Function()  deleting,required TResult Function( int productId)  deleted,required TResult Function()  publishing,required TResult Function( PartsMarketEntity product)  published,required TResult Function()  unpublishing,required TResult Function( PartsMarketEntity product)  unpublished,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InitialPartsMarketEditState():
return initial();case LoadingPartsMarketEditState():
return loading();case LoadedPartsMarketEditState():
return loaded(_that.product);case SavingPartsMarketEditState():
return saving();case SavedPartsMarketEditState():
return saved(_that.product);case DeletingPartsMarketEditState():
return deleting();case DeletedPartsMarketEditState():
return deleted(_that.productId);case PublishingPartsMarketEditState():
return publishing();case PublishedPartsMarketEditState():
return published(_that.product);case UnpublishingPartsMarketEditState():
return unpublishing();case UnpublishedPartsMarketEditState():
return unpublished(_that.product);case ErrorPartsMarketEditState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PartsMarketEntity product)?  loaded,TResult? Function()?  saving,TResult? Function( PartsMarketEntity product)?  saved,TResult? Function()?  deleting,TResult? Function( int productId)?  deleted,TResult? Function()?  publishing,TResult? Function( PartsMarketEntity product)?  published,TResult? Function()?  unpublishing,TResult? Function( PartsMarketEntity product)?  unpublished,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InitialPartsMarketEditState() when initial != null:
return initial();case LoadingPartsMarketEditState() when loading != null:
return loading();case LoadedPartsMarketEditState() when loaded != null:
return loaded(_that.product);case SavingPartsMarketEditState() when saving != null:
return saving();case SavedPartsMarketEditState() when saved != null:
return saved(_that.product);case DeletingPartsMarketEditState() when deleting != null:
return deleting();case DeletedPartsMarketEditState() when deleted != null:
return deleted(_that.productId);case PublishingPartsMarketEditState() when publishing != null:
return publishing();case PublishedPartsMarketEditState() when published != null:
return published(_that.product);case UnpublishingPartsMarketEditState() when unpublishing != null:
return unpublishing();case UnpublishedPartsMarketEditState() when unpublished != null:
return unpublished(_that.product);case ErrorPartsMarketEditState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitialPartsMarketEditState implements PartsMarketEditState {
  const InitialPartsMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialPartsMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditState.initial()';
}


}




/// @nodoc


class LoadingPartsMarketEditState implements PartsMarketEditState {
  const LoadingPartsMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingPartsMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditState.loading()';
}


}




/// @nodoc


class LoadedPartsMarketEditState implements PartsMarketEditState {
  const LoadedPartsMarketEditState(this.product);
  

 final  PartsMarketEntity product;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedPartsMarketEditStateCopyWith<LoadedPartsMarketEditState> get copyWith => _$LoadedPartsMarketEditStateCopyWithImpl<LoadedPartsMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedPartsMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'PartsMarketEditState.loaded(product: $product)';
}


}

/// @nodoc
abstract mixin class $LoadedPartsMarketEditStateCopyWith<$Res> implements $PartsMarketEditStateCopyWith<$Res> {
  factory $LoadedPartsMarketEditStateCopyWith(LoadedPartsMarketEditState value, $Res Function(LoadedPartsMarketEditState) _then) = _$LoadedPartsMarketEditStateCopyWithImpl;
@useResult
$Res call({
 PartsMarketEntity product
});




}
/// @nodoc
class _$LoadedPartsMarketEditStateCopyWithImpl<$Res>
    implements $LoadedPartsMarketEditStateCopyWith<$Res> {
  _$LoadedPartsMarketEditStateCopyWithImpl(this._self, this._then);

  final LoadedPartsMarketEditState _self;
  final $Res Function(LoadedPartsMarketEditState) _then;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(LoadedPartsMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as PartsMarketEntity,
  ));
}


}

/// @nodoc


class SavingPartsMarketEditState implements PartsMarketEditState {
  const SavingPartsMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingPartsMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditState.saving()';
}


}




/// @nodoc


class SavedPartsMarketEditState implements PartsMarketEditState {
  const SavedPartsMarketEditState(this.product);
  

 final  PartsMarketEntity product;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedPartsMarketEditStateCopyWith<SavedPartsMarketEditState> get copyWith => _$SavedPartsMarketEditStateCopyWithImpl<SavedPartsMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedPartsMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'PartsMarketEditState.saved(product: $product)';
}


}

/// @nodoc
abstract mixin class $SavedPartsMarketEditStateCopyWith<$Res> implements $PartsMarketEditStateCopyWith<$Res> {
  factory $SavedPartsMarketEditStateCopyWith(SavedPartsMarketEditState value, $Res Function(SavedPartsMarketEditState) _then) = _$SavedPartsMarketEditStateCopyWithImpl;
@useResult
$Res call({
 PartsMarketEntity product
});




}
/// @nodoc
class _$SavedPartsMarketEditStateCopyWithImpl<$Res>
    implements $SavedPartsMarketEditStateCopyWith<$Res> {
  _$SavedPartsMarketEditStateCopyWithImpl(this._self, this._then);

  final SavedPartsMarketEditState _self;
  final $Res Function(SavedPartsMarketEditState) _then;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(SavedPartsMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as PartsMarketEntity,
  ));
}


}

/// @nodoc


class DeletingPartsMarketEditState implements PartsMarketEditState {
  const DeletingPartsMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletingPartsMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditState.deleting()';
}


}




/// @nodoc


class DeletedPartsMarketEditState implements PartsMarketEditState {
  const DeletedPartsMarketEditState(this.productId);
  

 final  int productId;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedPartsMarketEditStateCopyWith<DeletedPartsMarketEditState> get copyWith => _$DeletedPartsMarketEditStateCopyWithImpl<DeletedPartsMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedPartsMarketEditState&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'PartsMarketEditState.deleted(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DeletedPartsMarketEditStateCopyWith<$Res> implements $PartsMarketEditStateCopyWith<$Res> {
  factory $DeletedPartsMarketEditStateCopyWith(DeletedPartsMarketEditState value, $Res Function(DeletedPartsMarketEditState) _then) = _$DeletedPartsMarketEditStateCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DeletedPartsMarketEditStateCopyWithImpl<$Res>
    implements $DeletedPartsMarketEditStateCopyWith<$Res> {
  _$DeletedPartsMarketEditStateCopyWithImpl(this._self, this._then);

  final DeletedPartsMarketEditState _self;
  final $Res Function(DeletedPartsMarketEditState) _then;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DeletedPartsMarketEditState(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PublishingPartsMarketEditState implements PartsMarketEditState {
  const PublishingPartsMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishingPartsMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditState.publishing()';
}


}




/// @nodoc


class PublishedPartsMarketEditState implements PartsMarketEditState {
  const PublishedPartsMarketEditState(this.product);
  

 final  PartsMarketEntity product;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishedPartsMarketEditStateCopyWith<PublishedPartsMarketEditState> get copyWith => _$PublishedPartsMarketEditStateCopyWithImpl<PublishedPartsMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishedPartsMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'PartsMarketEditState.published(product: $product)';
}


}

/// @nodoc
abstract mixin class $PublishedPartsMarketEditStateCopyWith<$Res> implements $PartsMarketEditStateCopyWith<$Res> {
  factory $PublishedPartsMarketEditStateCopyWith(PublishedPartsMarketEditState value, $Res Function(PublishedPartsMarketEditState) _then) = _$PublishedPartsMarketEditStateCopyWithImpl;
@useResult
$Res call({
 PartsMarketEntity product
});




}
/// @nodoc
class _$PublishedPartsMarketEditStateCopyWithImpl<$Res>
    implements $PublishedPartsMarketEditStateCopyWith<$Res> {
  _$PublishedPartsMarketEditStateCopyWithImpl(this._self, this._then);

  final PublishedPartsMarketEditState _self;
  final $Res Function(PublishedPartsMarketEditState) _then;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(PublishedPartsMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as PartsMarketEntity,
  ));
}


}

/// @nodoc


class UnpublishingPartsMarketEditState implements PartsMarketEditState {
  const UnpublishingPartsMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnpublishingPartsMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartsMarketEditState.unpublishing()';
}


}




/// @nodoc


class UnpublishedPartsMarketEditState implements PartsMarketEditState {
  const UnpublishedPartsMarketEditState(this.product);
  

 final  PartsMarketEntity product;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnpublishedPartsMarketEditStateCopyWith<UnpublishedPartsMarketEditState> get copyWith => _$UnpublishedPartsMarketEditStateCopyWithImpl<UnpublishedPartsMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnpublishedPartsMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'PartsMarketEditState.unpublished(product: $product)';
}


}

/// @nodoc
abstract mixin class $UnpublishedPartsMarketEditStateCopyWith<$Res> implements $PartsMarketEditStateCopyWith<$Res> {
  factory $UnpublishedPartsMarketEditStateCopyWith(UnpublishedPartsMarketEditState value, $Res Function(UnpublishedPartsMarketEditState) _then) = _$UnpublishedPartsMarketEditStateCopyWithImpl;
@useResult
$Res call({
 PartsMarketEntity product
});




}
/// @nodoc
class _$UnpublishedPartsMarketEditStateCopyWithImpl<$Res>
    implements $UnpublishedPartsMarketEditStateCopyWith<$Res> {
  _$UnpublishedPartsMarketEditStateCopyWithImpl(this._self, this._then);

  final UnpublishedPartsMarketEditState _self;
  final $Res Function(UnpublishedPartsMarketEditState) _then;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(UnpublishedPartsMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as PartsMarketEntity,
  ));
}


}

/// @nodoc


class ErrorPartsMarketEditState implements PartsMarketEditState {
  const ErrorPartsMarketEditState(this.message);
  

 final  String message;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorPartsMarketEditStateCopyWith<ErrorPartsMarketEditState> get copyWith => _$ErrorPartsMarketEditStateCopyWithImpl<ErrorPartsMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorPartsMarketEditState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PartsMarketEditState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorPartsMarketEditStateCopyWith<$Res> implements $PartsMarketEditStateCopyWith<$Res> {
  factory $ErrorPartsMarketEditStateCopyWith(ErrorPartsMarketEditState value, $Res Function(ErrorPartsMarketEditState) _then) = _$ErrorPartsMarketEditStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorPartsMarketEditStateCopyWithImpl<$Res>
    implements $ErrorPartsMarketEditStateCopyWith<$Res> {
  _$ErrorPartsMarketEditStateCopyWithImpl(this._self, this._then);

  final ErrorPartsMarketEditState _self;
  final $Res Function(ErrorPartsMarketEditState) _then;

/// Create a copy of PartsMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorPartsMarketEditState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
