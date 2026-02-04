// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_market_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AircraftMarketEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditEvent()';
}


}

/// @nodoc
class $AircraftMarketEditEventCopyWith<$Res>  {
$AircraftMarketEditEventCopyWith(AircraftMarketEditEvent _, $Res Function(AircraftMarketEditEvent) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketEditEvent].
extension AircraftMarketEditEventPatterns on AircraftMarketEditEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAircraftMarketEditEvent value)?  getProduct,TResult Function( UpdateAircraftMarketEditEvent value)?  updateProduct,TResult Function( DeleteAircraftMarketEditEvent value)?  deleteProduct,TResult Function( PublishAircraftMarketEditEvent value)?  publishProduct,TResult Function( UnpublishAircraftMarketEditEvent value)?  unpublishProduct,TResult Function( ResetAircraftMarketEditEvent value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAircraftMarketEditEvent() when getProduct != null:
return getProduct(_that);case UpdateAircraftMarketEditEvent() when updateProduct != null:
return updateProduct(_that);case DeleteAircraftMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that);case PublishAircraftMarketEditEvent() when publishProduct != null:
return publishProduct(_that);case UnpublishAircraftMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that);case ResetAircraftMarketEditEvent() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAircraftMarketEditEvent value)  getProduct,required TResult Function( UpdateAircraftMarketEditEvent value)  updateProduct,required TResult Function( DeleteAircraftMarketEditEvent value)  deleteProduct,required TResult Function( PublishAircraftMarketEditEvent value)  publishProduct,required TResult Function( UnpublishAircraftMarketEditEvent value)  unpublishProduct,required TResult Function( ResetAircraftMarketEditEvent value)  reset,}){
final _that = this;
switch (_that) {
case GetAircraftMarketEditEvent():
return getProduct(_that);case UpdateAircraftMarketEditEvent():
return updateProduct(_that);case DeleteAircraftMarketEditEvent():
return deleteProduct(_that);case PublishAircraftMarketEditEvent():
return publishProduct(_that);case UnpublishAircraftMarketEditEvent():
return unpublishProduct(_that);case ResetAircraftMarketEditEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAircraftMarketEditEvent value)?  getProduct,TResult? Function( UpdateAircraftMarketEditEvent value)?  updateProduct,TResult? Function( DeleteAircraftMarketEditEvent value)?  deleteProduct,TResult? Function( PublishAircraftMarketEditEvent value)?  publishProduct,TResult? Function( UnpublishAircraftMarketEditEvent value)?  unpublishProduct,TResult? Function( ResetAircraftMarketEditEvent value)?  reset,}){
final _that = this;
switch (_that) {
case GetAircraftMarketEditEvent() when getProduct != null:
return getProduct(_that);case UpdateAircraftMarketEditEvent() when updateProduct != null:
return updateProduct(_that);case DeleteAircraftMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that);case PublishAircraftMarketEditEvent() when publishProduct != null:
return publishProduct(_that);case UnpublishAircraftMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that);case ResetAircraftMarketEditEvent() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int productId)?  getProduct,TResult Function( int productId,  String? title,  String? description,  int? price,  String? currency,  int? aircraftSubcategoriesId,  String? mainImageUrl,  List<String>? additionalImageUrls,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  bool? isLeasing,  String? leasingConditions,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updateProduct,TResult Function( int productId)?  deleteProduct,TResult Function( int productId)?  publishProduct,TResult Function( int productId)?  unpublishProduct,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAircraftMarketEditEvent() when getProduct != null:
return getProduct(_that.productId);case UpdateAircraftMarketEditEvent() when updateProduct != null:
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.currency,_that.aircraftSubcategoriesId,_that.mainImageUrl,_that.additionalImageUrls,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.isLeasing,_that.leasingConditions,_that.mainImageFile,_that.additionalImageFiles);case DeleteAircraftMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case PublishAircraftMarketEditEvent() when publishProduct != null:
return publishProduct(_that.productId);case UnpublishAircraftMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that.productId);case ResetAircraftMarketEditEvent() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int productId)  getProduct,required TResult Function( int productId,  String? title,  String? description,  int? price,  String? currency,  int? aircraftSubcategoriesId,  String? mainImageUrl,  List<String>? additionalImageUrls,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  bool? isLeasing,  String? leasingConditions,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)  updateProduct,required TResult Function( int productId)  deleteProduct,required TResult Function( int productId)  publishProduct,required TResult Function( int productId)  unpublishProduct,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case GetAircraftMarketEditEvent():
return getProduct(_that.productId);case UpdateAircraftMarketEditEvent():
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.currency,_that.aircraftSubcategoriesId,_that.mainImageUrl,_that.additionalImageUrls,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.isLeasing,_that.leasingConditions,_that.mainImageFile,_that.additionalImageFiles);case DeleteAircraftMarketEditEvent():
return deleteProduct(_that.productId);case PublishAircraftMarketEditEvent():
return publishProduct(_that.productId);case UnpublishAircraftMarketEditEvent():
return unpublishProduct(_that.productId);case ResetAircraftMarketEditEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int productId)?  getProduct,TResult? Function( int productId,  String? title,  String? description,  int? price,  String? currency,  int? aircraftSubcategoriesId,  String? mainImageUrl,  List<String>? additionalImageUrls,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  bool? isLeasing,  String? leasingConditions,  XFile? mainImageFile,  List<XFile>? additionalImageFiles)?  updateProduct,TResult? Function( int productId)?  deleteProduct,TResult? Function( int productId)?  publishProduct,TResult? Function( int productId)?  unpublishProduct,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case GetAircraftMarketEditEvent() when getProduct != null:
return getProduct(_that.productId);case UpdateAircraftMarketEditEvent() when updateProduct != null:
return updateProduct(_that.productId,_that.title,_that.description,_that.price,_that.currency,_that.aircraftSubcategoriesId,_that.mainImageUrl,_that.additionalImageUrls,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.isLeasing,_that.leasingConditions,_that.mainImageFile,_that.additionalImageFiles);case DeleteAircraftMarketEditEvent() when deleteProduct != null:
return deleteProduct(_that.productId);case PublishAircraftMarketEditEvent() when publishProduct != null:
return publishProduct(_that.productId);case UnpublishAircraftMarketEditEvent() when unpublishProduct != null:
return unpublishProduct(_that.productId);case ResetAircraftMarketEditEvent() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class GetAircraftMarketEditEvent implements AircraftMarketEditEvent {
  const GetAircraftMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAircraftMarketEditEventCopyWith<GetAircraftMarketEditEvent> get copyWith => _$GetAircraftMarketEditEventCopyWithImpl<GetAircraftMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAircraftMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEditEvent.getProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $GetAircraftMarketEditEventCopyWith<$Res> implements $AircraftMarketEditEventCopyWith<$Res> {
  factory $GetAircraftMarketEditEventCopyWith(GetAircraftMarketEditEvent value, $Res Function(GetAircraftMarketEditEvent) _then) = _$GetAircraftMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$GetAircraftMarketEditEventCopyWithImpl<$Res>
    implements $GetAircraftMarketEditEventCopyWith<$Res> {
  _$GetAircraftMarketEditEventCopyWithImpl(this._self, this._then);

  final GetAircraftMarketEditEvent _self;
  final $Res Function(GetAircraftMarketEditEvent) _then;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(GetAircraftMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdateAircraftMarketEditEvent implements AircraftMarketEditEvent {
  const UpdateAircraftMarketEditEvent({required this.productId, this.title, this.description, this.price, this.currency, this.aircraftSubcategoriesId, this.mainImageUrl, final  List<String>? additionalImageUrls, this.brand, this.location, this.year, this.totalFlightHours, this.enginePower, this.engineVolume, this.seats, this.condition, this.isShareSale, this.shareNumerator, this.shareDenominator, this.isLeasing, this.leasingConditions, this.mainImageFile, final  List<XFile>? additionalImageFiles}): _additionalImageUrls = additionalImageUrls,_additionalImageFiles = additionalImageFiles;
  

 final  int productId;
 final  String? title;
 final  String? description;
 final  int? price;
 final  String? currency;
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
 final  bool? isLeasing;
 final  String? leasingConditions;
 final  XFile? mainImageFile;
 final  List<XFile>? _additionalImageFiles;
 List<XFile>? get additionalImageFiles {
  final value = _additionalImageFiles;
  if (value == null) return null;
  if (_additionalImageFiles is EqualUnmodifiableListView) return _additionalImageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAircraftMarketEditEventCopyWith<UpdateAircraftMarketEditEvent> get copyWith => _$UpdateAircraftMarketEditEventCopyWithImpl<UpdateAircraftMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAircraftMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.aircraftSubcategoriesId, aircraftSubcategoriesId) || other.aircraftSubcategoriesId == aircraftSubcategoriesId)&&(identical(other.mainImageUrl, mainImageUrl) || other.mainImageUrl == mainImageUrl)&&const DeepCollectionEquality().equals(other._additionalImageUrls, _additionalImageUrls)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.location, location) || other.location == location)&&(identical(other.year, year) || other.year == year)&&(identical(other.totalFlightHours, totalFlightHours) || other.totalFlightHours == totalFlightHours)&&(identical(other.enginePower, enginePower) || other.enginePower == enginePower)&&(identical(other.engineVolume, engineVolume) || other.engineVolume == engineVolume)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.isShareSale, isShareSale) || other.isShareSale == isShareSale)&&(identical(other.shareNumerator, shareNumerator) || other.shareNumerator == shareNumerator)&&(identical(other.shareDenominator, shareDenominator) || other.shareDenominator == shareDenominator)&&(identical(other.isLeasing, isLeasing) || other.isLeasing == isLeasing)&&(identical(other.leasingConditions, leasingConditions) || other.leasingConditions == leasingConditions)&&(identical(other.mainImageFile, mainImageFile) || other.mainImageFile == mainImageFile)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles));
}


@override
int get hashCode => Object.hashAll([runtimeType,productId,title,description,price,currency,aircraftSubcategoriesId,mainImageUrl,const DeepCollectionEquality().hash(_additionalImageUrls),brand,location,year,totalFlightHours,enginePower,engineVolume,seats,condition,isShareSale,shareNumerator,shareDenominator,isLeasing,leasingConditions,mainImageFile,const DeepCollectionEquality().hash(_additionalImageFiles)]);

@override
String toString() {
  return 'AircraftMarketEditEvent.updateProduct(productId: $productId, title: $title, description: $description, price: $price, currency: $currency, aircraftSubcategoriesId: $aircraftSubcategoriesId, mainImageUrl: $mainImageUrl, additionalImageUrls: $additionalImageUrls, brand: $brand, location: $location, year: $year, totalFlightHours: $totalFlightHours, enginePower: $enginePower, engineVolume: $engineVolume, seats: $seats, condition: $condition, isShareSale: $isShareSale, shareNumerator: $shareNumerator, shareDenominator: $shareDenominator, isLeasing: $isLeasing, leasingConditions: $leasingConditions, mainImageFile: $mainImageFile, additionalImageFiles: $additionalImageFiles)';
}


}

/// @nodoc
abstract mixin class $UpdateAircraftMarketEditEventCopyWith<$Res> implements $AircraftMarketEditEventCopyWith<$Res> {
  factory $UpdateAircraftMarketEditEventCopyWith(UpdateAircraftMarketEditEvent value, $Res Function(UpdateAircraftMarketEditEvent) _then) = _$UpdateAircraftMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId, String? title, String? description, int? price, String? currency, int? aircraftSubcategoriesId, String? mainImageUrl, List<String>? additionalImageUrls, String? brand, String? location, int? year, int? totalFlightHours, int? enginePower, int? engineVolume, int? seats, String? condition, bool? isShareSale, int? shareNumerator, int? shareDenominator, bool? isLeasing, String? leasingConditions, XFile? mainImageFile, List<XFile>? additionalImageFiles
});




}
/// @nodoc
class _$UpdateAircraftMarketEditEventCopyWithImpl<$Res>
    implements $UpdateAircraftMarketEditEventCopyWith<$Res> {
  _$UpdateAircraftMarketEditEventCopyWithImpl(this._self, this._then);

  final UpdateAircraftMarketEditEvent _self;
  final $Res Function(UpdateAircraftMarketEditEvent) _then;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? title = freezed,Object? description = freezed,Object? price = freezed,Object? currency = freezed,Object? aircraftSubcategoriesId = freezed,Object? mainImageUrl = freezed,Object? additionalImageUrls = freezed,Object? brand = freezed,Object? location = freezed,Object? year = freezed,Object? totalFlightHours = freezed,Object? enginePower = freezed,Object? engineVolume = freezed,Object? seats = freezed,Object? condition = freezed,Object? isShareSale = freezed,Object? shareNumerator = freezed,Object? shareDenominator = freezed,Object? isLeasing = freezed,Object? leasingConditions = freezed,Object? mainImageFile = freezed,Object? additionalImageFiles = freezed,}) {
  return _then(UpdateAircraftMarketEditEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,aircraftSubcategoriesId: freezed == aircraftSubcategoriesId ? _self.aircraftSubcategoriesId : aircraftSubcategoriesId // ignore: cast_nullable_to_non_nullable
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
as int?,isLeasing: freezed == isLeasing ? _self.isLeasing : isLeasing // ignore: cast_nullable_to_non_nullable
as bool?,leasingConditions: freezed == leasingConditions ? _self.leasingConditions : leasingConditions // ignore: cast_nullable_to_non_nullable
as String?,mainImageFile: freezed == mainImageFile ? _self.mainImageFile : mainImageFile // ignore: cast_nullable_to_non_nullable
as XFile?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,
  ));
}


}

/// @nodoc


class DeleteAircraftMarketEditEvent implements AircraftMarketEditEvent {
  const DeleteAircraftMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAircraftMarketEditEventCopyWith<DeleteAircraftMarketEditEvent> get copyWith => _$DeleteAircraftMarketEditEventCopyWithImpl<DeleteAircraftMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAircraftMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEditEvent.deleteProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DeleteAircraftMarketEditEventCopyWith<$Res> implements $AircraftMarketEditEventCopyWith<$Res> {
  factory $DeleteAircraftMarketEditEventCopyWith(DeleteAircraftMarketEditEvent value, $Res Function(DeleteAircraftMarketEditEvent) _then) = _$DeleteAircraftMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DeleteAircraftMarketEditEventCopyWithImpl<$Res>
    implements $DeleteAircraftMarketEditEventCopyWith<$Res> {
  _$DeleteAircraftMarketEditEventCopyWithImpl(this._self, this._then);

  final DeleteAircraftMarketEditEvent _self;
  final $Res Function(DeleteAircraftMarketEditEvent) _then;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DeleteAircraftMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PublishAircraftMarketEditEvent implements AircraftMarketEditEvent {
  const PublishAircraftMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishAircraftMarketEditEventCopyWith<PublishAircraftMarketEditEvent> get copyWith => _$PublishAircraftMarketEditEventCopyWithImpl<PublishAircraftMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishAircraftMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEditEvent.publishProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $PublishAircraftMarketEditEventCopyWith<$Res> implements $AircraftMarketEditEventCopyWith<$Res> {
  factory $PublishAircraftMarketEditEventCopyWith(PublishAircraftMarketEditEvent value, $Res Function(PublishAircraftMarketEditEvent) _then) = _$PublishAircraftMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$PublishAircraftMarketEditEventCopyWithImpl<$Res>
    implements $PublishAircraftMarketEditEventCopyWith<$Res> {
  _$PublishAircraftMarketEditEventCopyWithImpl(this._self, this._then);

  final PublishAircraftMarketEditEvent _self;
  final $Res Function(PublishAircraftMarketEditEvent) _then;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(PublishAircraftMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UnpublishAircraftMarketEditEvent implements AircraftMarketEditEvent {
  const UnpublishAircraftMarketEditEvent(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnpublishAircraftMarketEditEventCopyWith<UnpublishAircraftMarketEditEvent> get copyWith => _$UnpublishAircraftMarketEditEventCopyWithImpl<UnpublishAircraftMarketEditEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnpublishAircraftMarketEditEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEditEvent.unpublishProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $UnpublishAircraftMarketEditEventCopyWith<$Res> implements $AircraftMarketEditEventCopyWith<$Res> {
  factory $UnpublishAircraftMarketEditEventCopyWith(UnpublishAircraftMarketEditEvent value, $Res Function(UnpublishAircraftMarketEditEvent) _then) = _$UnpublishAircraftMarketEditEventCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$UnpublishAircraftMarketEditEventCopyWithImpl<$Res>
    implements $UnpublishAircraftMarketEditEventCopyWith<$Res> {
  _$UnpublishAircraftMarketEditEventCopyWithImpl(this._self, this._then);

  final UnpublishAircraftMarketEditEvent _self;
  final $Res Function(UnpublishAircraftMarketEditEvent) _then;

/// Create a copy of AircraftMarketEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(UnpublishAircraftMarketEditEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ResetAircraftMarketEditEvent implements AircraftMarketEditEvent {
  const ResetAircraftMarketEditEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetAircraftMarketEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditEvent.reset()';
}


}




/// @nodoc
mixin _$AircraftMarketEditState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditState()';
}


}

/// @nodoc
class $AircraftMarketEditStateCopyWith<$Res>  {
$AircraftMarketEditStateCopyWith(AircraftMarketEditState _, $Res Function(AircraftMarketEditState) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketEditState].
extension AircraftMarketEditStatePatterns on AircraftMarketEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialAircraftMarketEditState value)?  initial,TResult Function( LoadingAircraftMarketEditState value)?  loading,TResult Function( LoadedAircraftMarketEditState value)?  loaded,TResult Function( SavingAircraftMarketEditState value)?  saving,TResult Function( SavedAircraftMarketEditState value)?  saved,TResult Function( DeletingAircraftMarketEditState value)?  deleting,TResult Function( DeletedAircraftMarketEditState value)?  deleted,TResult Function( PublishingAircraftMarketEditState value)?  publishing,TResult Function( PublishedAircraftMarketEditState value)?  published,TResult Function( UnpublishingAircraftMarketEditState value)?  unpublishing,TResult Function( UnpublishedAircraftMarketEditState value)?  unpublished,TResult Function( ErrorAircraftMarketEditState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialAircraftMarketEditState() when initial != null:
return initial(_that);case LoadingAircraftMarketEditState() when loading != null:
return loading(_that);case LoadedAircraftMarketEditState() when loaded != null:
return loaded(_that);case SavingAircraftMarketEditState() when saving != null:
return saving(_that);case SavedAircraftMarketEditState() when saved != null:
return saved(_that);case DeletingAircraftMarketEditState() when deleting != null:
return deleting(_that);case DeletedAircraftMarketEditState() when deleted != null:
return deleted(_that);case PublishingAircraftMarketEditState() when publishing != null:
return publishing(_that);case PublishedAircraftMarketEditState() when published != null:
return published(_that);case UnpublishingAircraftMarketEditState() when unpublishing != null:
return unpublishing(_that);case UnpublishedAircraftMarketEditState() when unpublished != null:
return unpublished(_that);case ErrorAircraftMarketEditState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialAircraftMarketEditState value)  initial,required TResult Function( LoadingAircraftMarketEditState value)  loading,required TResult Function( LoadedAircraftMarketEditState value)  loaded,required TResult Function( SavingAircraftMarketEditState value)  saving,required TResult Function( SavedAircraftMarketEditState value)  saved,required TResult Function( DeletingAircraftMarketEditState value)  deleting,required TResult Function( DeletedAircraftMarketEditState value)  deleted,required TResult Function( PublishingAircraftMarketEditState value)  publishing,required TResult Function( PublishedAircraftMarketEditState value)  published,required TResult Function( UnpublishingAircraftMarketEditState value)  unpublishing,required TResult Function( UnpublishedAircraftMarketEditState value)  unpublished,required TResult Function( ErrorAircraftMarketEditState value)  error,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketEditState():
return initial(_that);case LoadingAircraftMarketEditState():
return loading(_that);case LoadedAircraftMarketEditState():
return loaded(_that);case SavingAircraftMarketEditState():
return saving(_that);case SavedAircraftMarketEditState():
return saved(_that);case DeletingAircraftMarketEditState():
return deleting(_that);case DeletedAircraftMarketEditState():
return deleted(_that);case PublishingAircraftMarketEditState():
return publishing(_that);case PublishedAircraftMarketEditState():
return published(_that);case UnpublishingAircraftMarketEditState():
return unpublishing(_that);case UnpublishedAircraftMarketEditState():
return unpublished(_that);case ErrorAircraftMarketEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialAircraftMarketEditState value)?  initial,TResult? Function( LoadingAircraftMarketEditState value)?  loading,TResult? Function( LoadedAircraftMarketEditState value)?  loaded,TResult? Function( SavingAircraftMarketEditState value)?  saving,TResult? Function( SavedAircraftMarketEditState value)?  saved,TResult? Function( DeletingAircraftMarketEditState value)?  deleting,TResult? Function( DeletedAircraftMarketEditState value)?  deleted,TResult? Function( PublishingAircraftMarketEditState value)?  publishing,TResult? Function( PublishedAircraftMarketEditState value)?  published,TResult? Function( UnpublishingAircraftMarketEditState value)?  unpublishing,TResult? Function( UnpublishedAircraftMarketEditState value)?  unpublished,TResult? Function( ErrorAircraftMarketEditState value)?  error,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketEditState() when initial != null:
return initial(_that);case LoadingAircraftMarketEditState() when loading != null:
return loading(_that);case LoadedAircraftMarketEditState() when loaded != null:
return loaded(_that);case SavingAircraftMarketEditState() when saving != null:
return saving(_that);case SavedAircraftMarketEditState() when saved != null:
return saved(_that);case DeletingAircraftMarketEditState() when deleting != null:
return deleting(_that);case DeletedAircraftMarketEditState() when deleted != null:
return deleted(_that);case PublishingAircraftMarketEditState() when publishing != null:
return publishing(_that);case PublishedAircraftMarketEditState() when published != null:
return published(_that);case UnpublishingAircraftMarketEditState() when unpublishing != null:
return unpublishing(_that);case UnpublishedAircraftMarketEditState() when unpublished != null:
return unpublished(_that);case ErrorAircraftMarketEditState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AircraftMarketEntity product)?  loaded,TResult Function()?  saving,TResult Function( AircraftMarketEntity product)?  saved,TResult Function()?  deleting,TResult Function( int productId)?  deleted,TResult Function()?  publishing,TResult Function( AircraftMarketEntity product)?  published,TResult Function()?  unpublishing,TResult Function( AircraftMarketEntity product)?  unpublished,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialAircraftMarketEditState() when initial != null:
return initial();case LoadingAircraftMarketEditState() when loading != null:
return loading();case LoadedAircraftMarketEditState() when loaded != null:
return loaded(_that.product);case SavingAircraftMarketEditState() when saving != null:
return saving();case SavedAircraftMarketEditState() when saved != null:
return saved(_that.product);case DeletingAircraftMarketEditState() when deleting != null:
return deleting();case DeletedAircraftMarketEditState() when deleted != null:
return deleted(_that.productId);case PublishingAircraftMarketEditState() when publishing != null:
return publishing();case PublishedAircraftMarketEditState() when published != null:
return published(_that.product);case UnpublishingAircraftMarketEditState() when unpublishing != null:
return unpublishing();case UnpublishedAircraftMarketEditState() when unpublished != null:
return unpublished(_that.product);case ErrorAircraftMarketEditState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AircraftMarketEntity product)  loaded,required TResult Function()  saving,required TResult Function( AircraftMarketEntity product)  saved,required TResult Function()  deleting,required TResult Function( int productId)  deleted,required TResult Function()  publishing,required TResult Function( AircraftMarketEntity product)  published,required TResult Function()  unpublishing,required TResult Function( AircraftMarketEntity product)  unpublished,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketEditState():
return initial();case LoadingAircraftMarketEditState():
return loading();case LoadedAircraftMarketEditState():
return loaded(_that.product);case SavingAircraftMarketEditState():
return saving();case SavedAircraftMarketEditState():
return saved(_that.product);case DeletingAircraftMarketEditState():
return deleting();case DeletedAircraftMarketEditState():
return deleted(_that.productId);case PublishingAircraftMarketEditState():
return publishing();case PublishedAircraftMarketEditState():
return published(_that.product);case UnpublishingAircraftMarketEditState():
return unpublishing();case UnpublishedAircraftMarketEditState():
return unpublished(_that.product);case ErrorAircraftMarketEditState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AircraftMarketEntity product)?  loaded,TResult? Function()?  saving,TResult? Function( AircraftMarketEntity product)?  saved,TResult? Function()?  deleting,TResult? Function( int productId)?  deleted,TResult? Function()?  publishing,TResult? Function( AircraftMarketEntity product)?  published,TResult? Function()?  unpublishing,TResult? Function( AircraftMarketEntity product)?  unpublished,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketEditState() when initial != null:
return initial();case LoadingAircraftMarketEditState() when loading != null:
return loading();case LoadedAircraftMarketEditState() when loaded != null:
return loaded(_that.product);case SavingAircraftMarketEditState() when saving != null:
return saving();case SavedAircraftMarketEditState() when saved != null:
return saved(_that.product);case DeletingAircraftMarketEditState() when deleting != null:
return deleting();case DeletedAircraftMarketEditState() when deleted != null:
return deleted(_that.productId);case PublishingAircraftMarketEditState() when publishing != null:
return publishing();case PublishedAircraftMarketEditState() when published != null:
return published(_that.product);case UnpublishingAircraftMarketEditState() when unpublishing != null:
return unpublishing();case UnpublishedAircraftMarketEditState() when unpublished != null:
return unpublished(_that.product);case ErrorAircraftMarketEditState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitialAircraftMarketEditState implements AircraftMarketEditState {
  const InitialAircraftMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAircraftMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditState.initial()';
}


}




/// @nodoc


class LoadingAircraftMarketEditState implements AircraftMarketEditState {
  const LoadingAircraftMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAircraftMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditState.loading()';
}


}




/// @nodoc


class LoadedAircraftMarketEditState implements AircraftMarketEditState {
  const LoadedAircraftMarketEditState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedAircraftMarketEditStateCopyWith<LoadedAircraftMarketEditState> get copyWith => _$LoadedAircraftMarketEditStateCopyWithImpl<LoadedAircraftMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedAircraftMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketEditState.loaded(product: $product)';
}


}

/// @nodoc
abstract mixin class $LoadedAircraftMarketEditStateCopyWith<$Res> implements $AircraftMarketEditStateCopyWith<$Res> {
  factory $LoadedAircraftMarketEditStateCopyWith(LoadedAircraftMarketEditState value, $Res Function(LoadedAircraftMarketEditState) _then) = _$LoadedAircraftMarketEditStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$LoadedAircraftMarketEditStateCopyWithImpl<$Res>
    implements $LoadedAircraftMarketEditStateCopyWith<$Res> {
  _$LoadedAircraftMarketEditStateCopyWithImpl(this._self, this._then);

  final LoadedAircraftMarketEditState _self;
  final $Res Function(LoadedAircraftMarketEditState) _then;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(LoadedAircraftMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class SavingAircraftMarketEditState implements AircraftMarketEditState {
  const SavingAircraftMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingAircraftMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditState.saving()';
}


}




/// @nodoc


class SavedAircraftMarketEditState implements AircraftMarketEditState {
  const SavedAircraftMarketEditState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedAircraftMarketEditStateCopyWith<SavedAircraftMarketEditState> get copyWith => _$SavedAircraftMarketEditStateCopyWithImpl<SavedAircraftMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedAircraftMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketEditState.saved(product: $product)';
}


}

/// @nodoc
abstract mixin class $SavedAircraftMarketEditStateCopyWith<$Res> implements $AircraftMarketEditStateCopyWith<$Res> {
  factory $SavedAircraftMarketEditStateCopyWith(SavedAircraftMarketEditState value, $Res Function(SavedAircraftMarketEditState) _then) = _$SavedAircraftMarketEditStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$SavedAircraftMarketEditStateCopyWithImpl<$Res>
    implements $SavedAircraftMarketEditStateCopyWith<$Res> {
  _$SavedAircraftMarketEditStateCopyWithImpl(this._self, this._then);

  final SavedAircraftMarketEditState _self;
  final $Res Function(SavedAircraftMarketEditState) _then;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(SavedAircraftMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class DeletingAircraftMarketEditState implements AircraftMarketEditState {
  const DeletingAircraftMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletingAircraftMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditState.deleting()';
}


}




/// @nodoc


class DeletedAircraftMarketEditState implements AircraftMarketEditState {
  const DeletedAircraftMarketEditState(this.productId);
  

 final  int productId;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedAircraftMarketEditStateCopyWith<DeletedAircraftMarketEditState> get copyWith => _$DeletedAircraftMarketEditStateCopyWithImpl<DeletedAircraftMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedAircraftMarketEditState&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'AircraftMarketEditState.deleted(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DeletedAircraftMarketEditStateCopyWith<$Res> implements $AircraftMarketEditStateCopyWith<$Res> {
  factory $DeletedAircraftMarketEditStateCopyWith(DeletedAircraftMarketEditState value, $Res Function(DeletedAircraftMarketEditState) _then) = _$DeletedAircraftMarketEditStateCopyWithImpl;
@useResult
$Res call({
 int productId
});




}
/// @nodoc
class _$DeletedAircraftMarketEditStateCopyWithImpl<$Res>
    implements $DeletedAircraftMarketEditStateCopyWith<$Res> {
  _$DeletedAircraftMarketEditStateCopyWithImpl(this._self, this._then);

  final DeletedAircraftMarketEditState _self;
  final $Res Function(DeletedAircraftMarketEditState) _then;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DeletedAircraftMarketEditState(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PublishingAircraftMarketEditState implements AircraftMarketEditState {
  const PublishingAircraftMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishingAircraftMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditState.publishing()';
}


}




/// @nodoc


class PublishedAircraftMarketEditState implements AircraftMarketEditState {
  const PublishedAircraftMarketEditState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishedAircraftMarketEditStateCopyWith<PublishedAircraftMarketEditState> get copyWith => _$PublishedAircraftMarketEditStateCopyWithImpl<PublishedAircraftMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishedAircraftMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketEditState.published(product: $product)';
}


}

/// @nodoc
abstract mixin class $PublishedAircraftMarketEditStateCopyWith<$Res> implements $AircraftMarketEditStateCopyWith<$Res> {
  factory $PublishedAircraftMarketEditStateCopyWith(PublishedAircraftMarketEditState value, $Res Function(PublishedAircraftMarketEditState) _then) = _$PublishedAircraftMarketEditStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$PublishedAircraftMarketEditStateCopyWithImpl<$Res>
    implements $PublishedAircraftMarketEditStateCopyWith<$Res> {
  _$PublishedAircraftMarketEditStateCopyWithImpl(this._self, this._then);

  final PublishedAircraftMarketEditState _self;
  final $Res Function(PublishedAircraftMarketEditState) _then;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(PublishedAircraftMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class UnpublishingAircraftMarketEditState implements AircraftMarketEditState {
  const UnpublishingAircraftMarketEditState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnpublishingAircraftMarketEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketEditState.unpublishing()';
}


}




/// @nodoc


class UnpublishedAircraftMarketEditState implements AircraftMarketEditState {
  const UnpublishedAircraftMarketEditState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnpublishedAircraftMarketEditStateCopyWith<UnpublishedAircraftMarketEditState> get copyWith => _$UnpublishedAircraftMarketEditStateCopyWithImpl<UnpublishedAircraftMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnpublishedAircraftMarketEditState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketEditState.unpublished(product: $product)';
}


}

/// @nodoc
abstract mixin class $UnpublishedAircraftMarketEditStateCopyWith<$Res> implements $AircraftMarketEditStateCopyWith<$Res> {
  factory $UnpublishedAircraftMarketEditStateCopyWith(UnpublishedAircraftMarketEditState value, $Res Function(UnpublishedAircraftMarketEditState) _then) = _$UnpublishedAircraftMarketEditStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$UnpublishedAircraftMarketEditStateCopyWithImpl<$Res>
    implements $UnpublishedAircraftMarketEditStateCopyWith<$Res> {
  _$UnpublishedAircraftMarketEditStateCopyWithImpl(this._self, this._then);

  final UnpublishedAircraftMarketEditState _self;
  final $Res Function(UnpublishedAircraftMarketEditState) _then;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(UnpublishedAircraftMarketEditState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class ErrorAircraftMarketEditState implements AircraftMarketEditState {
  const ErrorAircraftMarketEditState(this.message);
  

 final  String message;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAircraftMarketEditStateCopyWith<ErrorAircraftMarketEditState> get copyWith => _$ErrorAircraftMarketEditStateCopyWithImpl<ErrorAircraftMarketEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAircraftMarketEditState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AircraftMarketEditState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorAircraftMarketEditStateCopyWith<$Res> implements $AircraftMarketEditStateCopyWith<$Res> {
  factory $ErrorAircraftMarketEditStateCopyWith(ErrorAircraftMarketEditState value, $Res Function(ErrorAircraftMarketEditState) _then) = _$ErrorAircraftMarketEditStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorAircraftMarketEditStateCopyWithImpl<$Res>
    implements $ErrorAircraftMarketEditStateCopyWith<$Res> {
  _$ErrorAircraftMarketEditStateCopyWithImpl(this._self, this._then);

  final ErrorAircraftMarketEditState _self;
  final $Res Function(ErrorAircraftMarketEditState) _then;

/// Create a copy of AircraftMarketEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorAircraftMarketEditState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
