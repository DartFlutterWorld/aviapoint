// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_market_create_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AircraftMarketCreateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketCreateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketCreateEvent()';
}


}

/// @nodoc
class $AircraftMarketCreateEventCopyWith<$Res>  {
$AircraftMarketCreateEventCopyWith(AircraftMarketCreateEvent _, $Res Function(AircraftMarketCreateEvent) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketCreateEvent].
extension AircraftMarketCreateEventPatterns on AircraftMarketCreateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateAircraftMarketCreateEvent value)?  createAirCraft,TResult Function( ResetAircraftMarketCreateEvent value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateAircraftMarketCreateEvent() when createAirCraft != null:
return createAirCraft(_that);case ResetAircraftMarketCreateEvent() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateAircraftMarketCreateEvent value)  createAirCraft,required TResult Function( ResetAircraftMarketCreateEvent value)  reset,}){
final _that = this;
switch (_that) {
case CreateAircraftMarketCreateEvent():
return createAirCraft(_that);case ResetAircraftMarketCreateEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateAircraftMarketCreateEvent value)?  createAirCraft,TResult? Function( ResetAircraftMarketCreateEvent value)?  reset,}){
final _that = this;
switch (_that) {
case CreateAircraftMarketCreateEvent() when createAirCraft != null:
return createAirCraft(_that);case ResetAircraftMarketCreateEvent() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title,  String? description,  int price,  String currency,  int? aircraftSubcategoriesId,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  bool? isLeasing,  String? leasingConditions,  XFile? mainImageFile,  List<XFile>? additionalImageFiles,  bool isPublished)?  createAirCraft,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateAircraftMarketCreateEvent() when createAirCraft != null:
return createAirCraft(_that.title,_that.description,_that.price,_that.currency,_that.aircraftSubcategoriesId,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.isLeasing,_that.leasingConditions,_that.mainImageFile,_that.additionalImageFiles,_that.isPublished);case ResetAircraftMarketCreateEvent() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title,  String? description,  int price,  String currency,  int? aircraftSubcategoriesId,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  bool? isLeasing,  String? leasingConditions,  XFile? mainImageFile,  List<XFile>? additionalImageFiles,  bool isPublished)  createAirCraft,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case CreateAircraftMarketCreateEvent():
return createAirCraft(_that.title,_that.description,_that.price,_that.currency,_that.aircraftSubcategoriesId,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.isLeasing,_that.leasingConditions,_that.mainImageFile,_that.additionalImageFiles,_that.isPublished);case ResetAircraftMarketCreateEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title,  String? description,  int price,  String currency,  int? aircraftSubcategoriesId,  String? brand,  String? location,  int? year,  int? totalFlightHours,  int? enginePower,  int? engineVolume,  int? seats,  String? condition,  bool? isShareSale,  int? shareNumerator,  int? shareDenominator,  bool? isLeasing,  String? leasingConditions,  XFile? mainImageFile,  List<XFile>? additionalImageFiles,  bool isPublished)?  createAirCraft,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case CreateAircraftMarketCreateEvent() when createAirCraft != null:
return createAirCraft(_that.title,_that.description,_that.price,_that.currency,_that.aircraftSubcategoriesId,_that.brand,_that.location,_that.year,_that.totalFlightHours,_that.enginePower,_that.engineVolume,_that.seats,_that.condition,_that.isShareSale,_that.shareNumerator,_that.shareDenominator,_that.isLeasing,_that.leasingConditions,_that.mainImageFile,_that.additionalImageFiles,_that.isPublished);case ResetAircraftMarketCreateEvent() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class CreateAircraftMarketCreateEvent implements AircraftMarketCreateEvent {
  const CreateAircraftMarketCreateEvent({required this.title, this.description, required this.price, this.currency = 'RUB', this.aircraftSubcategoriesId, this.brand, this.location, this.year, this.totalFlightHours, this.enginePower, this.engineVolume, this.seats, this.condition, this.isShareSale, this.shareNumerator, this.shareDenominator, this.isLeasing, this.leasingConditions, this.mainImageFile, final  List<XFile>? additionalImageFiles, this.isPublished = true}): _additionalImageFiles = additionalImageFiles;
  

 final  String title;
 final  String? description;
 final  int price;
@JsonKey() final  String currency;
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

@JsonKey() final  bool isPublished;

/// Create a copy of AircraftMarketCreateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAircraftMarketCreateEventCopyWith<CreateAircraftMarketCreateEvent> get copyWith => _$CreateAircraftMarketCreateEventCopyWithImpl<CreateAircraftMarketCreateEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAircraftMarketCreateEvent&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.aircraftSubcategoriesId, aircraftSubcategoriesId) || other.aircraftSubcategoriesId == aircraftSubcategoriesId)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.location, location) || other.location == location)&&(identical(other.year, year) || other.year == year)&&(identical(other.totalFlightHours, totalFlightHours) || other.totalFlightHours == totalFlightHours)&&(identical(other.enginePower, enginePower) || other.enginePower == enginePower)&&(identical(other.engineVolume, engineVolume) || other.engineVolume == engineVolume)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.isShareSale, isShareSale) || other.isShareSale == isShareSale)&&(identical(other.shareNumerator, shareNumerator) || other.shareNumerator == shareNumerator)&&(identical(other.shareDenominator, shareDenominator) || other.shareDenominator == shareDenominator)&&(identical(other.isLeasing, isLeasing) || other.isLeasing == isLeasing)&&(identical(other.leasingConditions, leasingConditions) || other.leasingConditions == leasingConditions)&&(identical(other.mainImageFile, mainImageFile) || other.mainImageFile == mainImageFile)&&const DeepCollectionEquality().equals(other._additionalImageFiles, _additionalImageFiles)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished));
}


@override
int get hashCode => Object.hashAll([runtimeType,title,description,price,currency,aircraftSubcategoriesId,brand,location,year,totalFlightHours,enginePower,engineVolume,seats,condition,isShareSale,shareNumerator,shareDenominator,isLeasing,leasingConditions,mainImageFile,const DeepCollectionEquality().hash(_additionalImageFiles),isPublished]);

@override
String toString() {
  return 'AircraftMarketCreateEvent.createAirCraft(title: $title, description: $description, price: $price, currency: $currency, aircraftSubcategoriesId: $aircraftSubcategoriesId, brand: $brand, location: $location, year: $year, totalFlightHours: $totalFlightHours, enginePower: $enginePower, engineVolume: $engineVolume, seats: $seats, condition: $condition, isShareSale: $isShareSale, shareNumerator: $shareNumerator, shareDenominator: $shareDenominator, isLeasing: $isLeasing, leasingConditions: $leasingConditions, mainImageFile: $mainImageFile, additionalImageFiles: $additionalImageFiles, isPublished: $isPublished)';
}


}

/// @nodoc
abstract mixin class $CreateAircraftMarketCreateEventCopyWith<$Res> implements $AircraftMarketCreateEventCopyWith<$Res> {
  factory $CreateAircraftMarketCreateEventCopyWith(CreateAircraftMarketCreateEvent value, $Res Function(CreateAircraftMarketCreateEvent) _then) = _$CreateAircraftMarketCreateEventCopyWithImpl;
@useResult
$Res call({
 String title, String? description, int price, String currency, int? aircraftSubcategoriesId, String? brand, String? location, int? year, int? totalFlightHours, int? enginePower, int? engineVolume, int? seats, String? condition, bool? isShareSale, int? shareNumerator, int? shareDenominator, bool? isLeasing, String? leasingConditions, XFile? mainImageFile, List<XFile>? additionalImageFiles, bool isPublished
});




}
/// @nodoc
class _$CreateAircraftMarketCreateEventCopyWithImpl<$Res>
    implements $CreateAircraftMarketCreateEventCopyWith<$Res> {
  _$CreateAircraftMarketCreateEventCopyWithImpl(this._self, this._then);

  final CreateAircraftMarketCreateEvent _self;
  final $Res Function(CreateAircraftMarketCreateEvent) _then;

/// Create a copy of AircraftMarketCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? price = null,Object? currency = null,Object? aircraftSubcategoriesId = freezed,Object? brand = freezed,Object? location = freezed,Object? year = freezed,Object? totalFlightHours = freezed,Object? enginePower = freezed,Object? engineVolume = freezed,Object? seats = freezed,Object? condition = freezed,Object? isShareSale = freezed,Object? shareNumerator = freezed,Object? shareDenominator = freezed,Object? isLeasing = freezed,Object? leasingConditions = freezed,Object? mainImageFile = freezed,Object? additionalImageFiles = freezed,Object? isPublished = null,}) {
  return _then(CreateAircraftMarketCreateEvent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,aircraftSubcategoriesId: freezed == aircraftSubcategoriesId ? _self.aircraftSubcategoriesId : aircraftSubcategoriesId // ignore: cast_nullable_to_non_nullable
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
as int?,isLeasing: freezed == isLeasing ? _self.isLeasing : isLeasing // ignore: cast_nullable_to_non_nullable
as bool?,leasingConditions: freezed == leasingConditions ? _self.leasingConditions : leasingConditions // ignore: cast_nullable_to_non_nullable
as String?,mainImageFile: freezed == mainImageFile ? _self.mainImageFile : mainImageFile // ignore: cast_nullable_to_non_nullable
as XFile?,additionalImageFiles: freezed == additionalImageFiles ? _self._additionalImageFiles : additionalImageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ResetAircraftMarketCreateEvent implements AircraftMarketCreateEvent {
  const ResetAircraftMarketCreateEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetAircraftMarketCreateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketCreateEvent.reset()';
}


}




/// @nodoc
mixin _$AircraftMarketCreateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftMarketCreateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketCreateState()';
}


}

/// @nodoc
class $AircraftMarketCreateStateCopyWith<$Res>  {
$AircraftMarketCreateStateCopyWith(AircraftMarketCreateState _, $Res Function(AircraftMarketCreateState) __);
}


/// Adds pattern-matching-related methods to [AircraftMarketCreateState].
extension AircraftMarketCreateStatePatterns on AircraftMarketCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialAircraftMarketCreateState value)?  initial,TResult Function( CreatingAircraftMarketCreateState value)?  creating,TResult Function( CreatedAircraftMarketCreateState value)?  created,TResult Function( ErrorAircraftMarketCreateState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialAircraftMarketCreateState() when initial != null:
return initial(_that);case CreatingAircraftMarketCreateState() when creating != null:
return creating(_that);case CreatedAircraftMarketCreateState() when created != null:
return created(_that);case ErrorAircraftMarketCreateState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialAircraftMarketCreateState value)  initial,required TResult Function( CreatingAircraftMarketCreateState value)  creating,required TResult Function( CreatedAircraftMarketCreateState value)  created,required TResult Function( ErrorAircraftMarketCreateState value)  error,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketCreateState():
return initial(_that);case CreatingAircraftMarketCreateState():
return creating(_that);case CreatedAircraftMarketCreateState():
return created(_that);case ErrorAircraftMarketCreateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialAircraftMarketCreateState value)?  initial,TResult? Function( CreatingAircraftMarketCreateState value)?  creating,TResult? Function( CreatedAircraftMarketCreateState value)?  created,TResult? Function( ErrorAircraftMarketCreateState value)?  error,}){
final _that = this;
switch (_that) {
case InitialAircraftMarketCreateState() when initial != null:
return initial(_that);case CreatingAircraftMarketCreateState() when creating != null:
return creating(_that);case CreatedAircraftMarketCreateState() when created != null:
return created(_that);case ErrorAircraftMarketCreateState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  creating,TResult Function( AircraftMarketEntity product)?  created,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialAircraftMarketCreateState() when initial != null:
return initial();case CreatingAircraftMarketCreateState() when creating != null:
return creating();case CreatedAircraftMarketCreateState() when created != null:
return created(_that.product);case ErrorAircraftMarketCreateState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  creating,required TResult Function( AircraftMarketEntity product)  created,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketCreateState():
return initial();case CreatingAircraftMarketCreateState():
return creating();case CreatedAircraftMarketCreateState():
return created(_that.product);case ErrorAircraftMarketCreateState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  creating,TResult? Function( AircraftMarketEntity product)?  created,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InitialAircraftMarketCreateState() when initial != null:
return initial();case CreatingAircraftMarketCreateState() when creating != null:
return creating();case CreatedAircraftMarketCreateState() when created != null:
return created(_that.product);case ErrorAircraftMarketCreateState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitialAircraftMarketCreateState implements AircraftMarketCreateState {
  const InitialAircraftMarketCreateState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAircraftMarketCreateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketCreateState.initial()';
}


}




/// @nodoc


class CreatingAircraftMarketCreateState implements AircraftMarketCreateState {
  const CreatingAircraftMarketCreateState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatingAircraftMarketCreateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AircraftMarketCreateState.creating()';
}


}




/// @nodoc


class CreatedAircraftMarketCreateState implements AircraftMarketCreateState {
  const CreatedAircraftMarketCreateState(this.product);
  

 final  AircraftMarketEntity product;

/// Create a copy of AircraftMarketCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedAircraftMarketCreateStateCopyWith<CreatedAircraftMarketCreateState> get copyWith => _$CreatedAircraftMarketCreateStateCopyWithImpl<CreatedAircraftMarketCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedAircraftMarketCreateState&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'AircraftMarketCreateState.created(product: $product)';
}


}

/// @nodoc
abstract mixin class $CreatedAircraftMarketCreateStateCopyWith<$Res> implements $AircraftMarketCreateStateCopyWith<$Res> {
  factory $CreatedAircraftMarketCreateStateCopyWith(CreatedAircraftMarketCreateState value, $Res Function(CreatedAircraftMarketCreateState) _then) = _$CreatedAircraftMarketCreateStateCopyWithImpl;
@useResult
$Res call({
 AircraftMarketEntity product
});




}
/// @nodoc
class _$CreatedAircraftMarketCreateStateCopyWithImpl<$Res>
    implements $CreatedAircraftMarketCreateStateCopyWith<$Res> {
  _$CreatedAircraftMarketCreateStateCopyWithImpl(this._self, this._then);

  final CreatedAircraftMarketCreateState _self;
  final $Res Function(CreatedAircraftMarketCreateState) _then;

/// Create a copy of AircraftMarketCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(CreatedAircraftMarketCreateState(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as AircraftMarketEntity,
  ));
}


}

/// @nodoc


class ErrorAircraftMarketCreateState implements AircraftMarketCreateState {
  const ErrorAircraftMarketCreateState(this.message);
  

 final  String message;

/// Create a copy of AircraftMarketCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAircraftMarketCreateStateCopyWith<ErrorAircraftMarketCreateState> get copyWith => _$ErrorAircraftMarketCreateStateCopyWithImpl<ErrorAircraftMarketCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAircraftMarketCreateState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AircraftMarketCreateState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorAircraftMarketCreateStateCopyWith<$Res> implements $AircraftMarketCreateStateCopyWith<$Res> {
  factory $ErrorAircraftMarketCreateStateCopyWith(ErrorAircraftMarketCreateState value, $Res Function(ErrorAircraftMarketCreateState) _then) = _$ErrorAircraftMarketCreateStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorAircraftMarketCreateStateCopyWithImpl<$Res>
    implements $ErrorAircraftMarketCreateStateCopyWith<$Res> {
  _$ErrorAircraftMarketCreateStateCopyWithImpl(this._self, this._then);

  final ErrorAircraftMarketCreateState _self;
  final $Res Function(ErrorAircraftMarketCreateState) _then;

/// Create a copy of AircraftMarketCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorAircraftMarketCreateState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
