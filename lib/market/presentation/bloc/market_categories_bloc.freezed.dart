// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketCategoriesEvent {

 String get productType;
/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketCategoriesEventCopyWith<MarketCategoriesEvent> get copyWith => _$MarketCategoriesEventCopyWithImpl<MarketCategoriesEvent>(this as MarketCategoriesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketCategoriesEvent&&(identical(other.productType, productType) || other.productType == productType));
}


@override
int get hashCode => Object.hash(runtimeType,productType);

@override
String toString() {
  return 'MarketCategoriesEvent(productType: $productType)';
}


}

/// @nodoc
abstract mixin class $MarketCategoriesEventCopyWith<$Res>  {
  factory $MarketCategoriesEventCopyWith(MarketCategoriesEvent value, $Res Function(MarketCategoriesEvent) _then) = _$MarketCategoriesEventCopyWithImpl;
@useResult
$Res call({
 String productType
});




}
/// @nodoc
class _$MarketCategoriesEventCopyWithImpl<$Res>
    implements $MarketCategoriesEventCopyWith<$Res> {
  _$MarketCategoriesEventCopyWithImpl(this._self, this._then);

  final MarketCategoriesEvent _self;
  final $Res Function(MarketCategoriesEvent) _then;

/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productType = null,}) {
  return _then(_self.copyWith(
productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketCategoriesEvent].
extension MarketCategoriesEventPatterns on MarketCategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetMainMarketCategoriesEvent value)?  getMainCategories,TResult Function( GetAllMarketCategoriesEvent value)?  getAllCategories,TResult Function( GetSubcategoriesEvent value)?  getSubcategories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetMainMarketCategoriesEvent() when getMainCategories != null:
return getMainCategories(_that);case GetAllMarketCategoriesEvent() when getAllCategories != null:
return getAllCategories(_that);case GetSubcategoriesEvent() when getSubcategories != null:
return getSubcategories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetMainMarketCategoriesEvent value)  getMainCategories,required TResult Function( GetAllMarketCategoriesEvent value)  getAllCategories,required TResult Function( GetSubcategoriesEvent value)  getSubcategories,}){
final _that = this;
switch (_that) {
case GetMainMarketCategoriesEvent():
return getMainCategories(_that);case GetAllMarketCategoriesEvent():
return getAllCategories(_that);case GetSubcategoriesEvent():
return getSubcategories(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetMainMarketCategoriesEvent value)?  getMainCategories,TResult? Function( GetAllMarketCategoriesEvent value)?  getAllCategories,TResult? Function( GetSubcategoriesEvent value)?  getSubcategories,}){
final _that = this;
switch (_that) {
case GetMainMarketCategoriesEvent() when getMainCategories != null:
return getMainCategories(_that);case GetAllMarketCategoriesEvent() when getAllCategories != null:
return getAllCategories(_that);case GetSubcategoriesEvent() when getSubcategories != null:
return getSubcategories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String productType)?  getMainCategories,TResult Function( String productType)?  getAllCategories,TResult Function( String productType,  int? parentId,  int? mainCategoryId)?  getSubcategories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetMainMarketCategoriesEvent() when getMainCategories != null:
return getMainCategories(_that.productType);case GetAllMarketCategoriesEvent() when getAllCategories != null:
return getAllCategories(_that.productType);case GetSubcategoriesEvent() when getSubcategories != null:
return getSubcategories(_that.productType,_that.parentId,_that.mainCategoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String productType)  getMainCategories,required TResult Function( String productType)  getAllCategories,required TResult Function( String productType,  int? parentId,  int? mainCategoryId)  getSubcategories,}) {final _that = this;
switch (_that) {
case GetMainMarketCategoriesEvent():
return getMainCategories(_that.productType);case GetAllMarketCategoriesEvent():
return getAllCategories(_that.productType);case GetSubcategoriesEvent():
return getSubcategories(_that.productType,_that.parentId,_that.mainCategoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String productType)?  getMainCategories,TResult? Function( String productType)?  getAllCategories,TResult? Function( String productType,  int? parentId,  int? mainCategoryId)?  getSubcategories,}) {final _that = this;
switch (_that) {
case GetMainMarketCategoriesEvent() when getMainCategories != null:
return getMainCategories(_that.productType);case GetAllMarketCategoriesEvent() when getAllCategories != null:
return getAllCategories(_that.productType);case GetSubcategoriesEvent() when getSubcategories != null:
return getSubcategories(_that.productType,_that.parentId,_that.mainCategoryId);case _:
  return null;

}
}

}

/// @nodoc


class GetMainMarketCategoriesEvent extends MarketCategoriesEvent {
  const GetMainMarketCategoriesEvent({required this.productType}): super._();
  

@override final  String productType;

/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMainMarketCategoriesEventCopyWith<GetMainMarketCategoriesEvent> get copyWith => _$GetMainMarketCategoriesEventCopyWithImpl<GetMainMarketCategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMainMarketCategoriesEvent&&(identical(other.productType, productType) || other.productType == productType));
}


@override
int get hashCode => Object.hash(runtimeType,productType);

@override
String toString() {
  return 'MarketCategoriesEvent.getMainCategories(productType: $productType)';
}


}

/// @nodoc
abstract mixin class $GetMainMarketCategoriesEventCopyWith<$Res> implements $MarketCategoriesEventCopyWith<$Res> {
  factory $GetMainMarketCategoriesEventCopyWith(GetMainMarketCategoriesEvent value, $Res Function(GetMainMarketCategoriesEvent) _then) = _$GetMainMarketCategoriesEventCopyWithImpl;
@override @useResult
$Res call({
 String productType
});




}
/// @nodoc
class _$GetMainMarketCategoriesEventCopyWithImpl<$Res>
    implements $GetMainMarketCategoriesEventCopyWith<$Res> {
  _$GetMainMarketCategoriesEventCopyWithImpl(this._self, this._then);

  final GetMainMarketCategoriesEvent _self;
  final $Res Function(GetMainMarketCategoriesEvent) _then;

/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productType = null,}) {
  return _then(GetMainMarketCategoriesEvent(
productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetAllMarketCategoriesEvent extends MarketCategoriesEvent {
  const GetAllMarketCategoriesEvent({required this.productType}): super._();
  

@override final  String productType;

/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllMarketCategoriesEventCopyWith<GetAllMarketCategoriesEvent> get copyWith => _$GetAllMarketCategoriesEventCopyWithImpl<GetAllMarketCategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllMarketCategoriesEvent&&(identical(other.productType, productType) || other.productType == productType));
}


@override
int get hashCode => Object.hash(runtimeType,productType);

@override
String toString() {
  return 'MarketCategoriesEvent.getAllCategories(productType: $productType)';
}


}

/// @nodoc
abstract mixin class $GetAllMarketCategoriesEventCopyWith<$Res> implements $MarketCategoriesEventCopyWith<$Res> {
  factory $GetAllMarketCategoriesEventCopyWith(GetAllMarketCategoriesEvent value, $Res Function(GetAllMarketCategoriesEvent) _then) = _$GetAllMarketCategoriesEventCopyWithImpl;
@override @useResult
$Res call({
 String productType
});




}
/// @nodoc
class _$GetAllMarketCategoriesEventCopyWithImpl<$Res>
    implements $GetAllMarketCategoriesEventCopyWith<$Res> {
  _$GetAllMarketCategoriesEventCopyWithImpl(this._self, this._then);

  final GetAllMarketCategoriesEvent _self;
  final $Res Function(GetAllMarketCategoriesEvent) _then;

/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productType = null,}) {
  return _then(GetAllMarketCategoriesEvent(
productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetSubcategoriesEvent extends MarketCategoriesEvent {
  const GetSubcategoriesEvent({required this.productType, this.parentId, this.mainCategoryId}): super._();
  

@override final  String productType;
 final  int? parentId;
 final  int? mainCategoryId;

/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSubcategoriesEventCopyWith<GetSubcategoriesEvent> get copyWith => _$GetSubcategoriesEventCopyWithImpl<GetSubcategoriesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSubcategoriesEvent&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.mainCategoryId, mainCategoryId) || other.mainCategoryId == mainCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,productType,parentId,mainCategoryId);

@override
String toString() {
  return 'MarketCategoriesEvent.getSubcategories(productType: $productType, parentId: $parentId, mainCategoryId: $mainCategoryId)';
}


}

/// @nodoc
abstract mixin class $GetSubcategoriesEventCopyWith<$Res> implements $MarketCategoriesEventCopyWith<$Res> {
  factory $GetSubcategoriesEventCopyWith(GetSubcategoriesEvent value, $Res Function(GetSubcategoriesEvent) _then) = _$GetSubcategoriesEventCopyWithImpl;
@override @useResult
$Res call({
 String productType, int? parentId, int? mainCategoryId
});




}
/// @nodoc
class _$GetSubcategoriesEventCopyWithImpl<$Res>
    implements $GetSubcategoriesEventCopyWith<$Res> {
  _$GetSubcategoriesEventCopyWithImpl(this._self, this._then);

  final GetSubcategoriesEvent _self;
  final $Res Function(GetSubcategoriesEvent) _then;

/// Create a copy of MarketCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productType = null,Object? parentId = freezed,Object? mainCategoryId = freezed,}) {
  return _then(GetSubcategoriesEvent(
productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,mainCategoryId: freezed == mainCategoryId ? _self.mainCategoryId : mainCategoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$MarketCategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketCategoriesState()';
}


}

/// @nodoc
class $MarketCategoriesStateCopyWith<$Res>  {
$MarketCategoriesStateCopyWith(MarketCategoriesState _, $Res Function(MarketCategoriesState) __);
}


/// Adds pattern-matching-related methods to [MarketCategoriesState].
extension MarketCategoriesStatePatterns on MarketCategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingMarketCategoriesState value)?  loading,TResult Function( ErrorMarketCategoriesState value)?  error,TResult Function( SuccessMarketCategoriesState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingMarketCategoriesState() when loading != null:
return loading(_that);case ErrorMarketCategoriesState() when error != null:
return error(_that);case SuccessMarketCategoriesState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingMarketCategoriesState value)  loading,required TResult Function( ErrorMarketCategoriesState value)  error,required TResult Function( SuccessMarketCategoriesState value)  success,}){
final _that = this;
switch (_that) {
case LoadingMarketCategoriesState():
return loading(_that);case ErrorMarketCategoriesState():
return error(_that);case SuccessMarketCategoriesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingMarketCategoriesState value)?  loading,TResult? Function( ErrorMarketCategoriesState value)?  error,TResult? Function( SuccessMarketCategoriesState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingMarketCategoriesState() when loading != null:
return loading(_that);case ErrorMarketCategoriesState() when error != null:
return error(_that);case SuccessMarketCategoriesState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<MarketCategoryEntity> categories)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingMarketCategoriesState() when loading != null:
return loading();case ErrorMarketCategoriesState() when error != null:
return error(_that.message);case SuccessMarketCategoriesState() when success != null:
return success(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<MarketCategoryEntity> categories)  success,}) {final _that = this;
switch (_that) {
case LoadingMarketCategoriesState():
return loading();case ErrorMarketCategoriesState():
return error(_that.message);case SuccessMarketCategoriesState():
return success(_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<MarketCategoryEntity> categories)?  success,}) {final _that = this;
switch (_that) {
case LoadingMarketCategoriesState() when loading != null:
return loading();case ErrorMarketCategoriesState() when error != null:
return error(_that.message);case SuccessMarketCategoriesState() when success != null:
return success(_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class LoadingMarketCategoriesState extends MarketCategoriesState {
  const LoadingMarketCategoriesState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMarketCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketCategoriesState.loading()';
}


}




/// @nodoc


class ErrorMarketCategoriesState extends MarketCategoriesState {
  const ErrorMarketCategoriesState(this.message): super._();
  

 final  String message;

/// Create a copy of MarketCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMarketCategoriesStateCopyWith<ErrorMarketCategoriesState> get copyWith => _$ErrorMarketCategoriesStateCopyWithImpl<ErrorMarketCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorMarketCategoriesState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketCategoriesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorMarketCategoriesStateCopyWith<$Res> implements $MarketCategoriesStateCopyWith<$Res> {
  factory $ErrorMarketCategoriesStateCopyWith(ErrorMarketCategoriesState value, $Res Function(ErrorMarketCategoriesState) _then) = _$ErrorMarketCategoriesStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorMarketCategoriesStateCopyWithImpl<$Res>
    implements $ErrorMarketCategoriesStateCopyWith<$Res> {
  _$ErrorMarketCategoriesStateCopyWithImpl(this._self, this._then);

  final ErrorMarketCategoriesState _self;
  final $Res Function(ErrorMarketCategoriesState) _then;

/// Create a copy of MarketCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorMarketCategoriesState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessMarketCategoriesState extends MarketCategoriesState {
  const SuccessMarketCategoriesState(final  List<MarketCategoryEntity> categories): _categories = categories,super._();
  

 final  List<MarketCategoryEntity> _categories;
 List<MarketCategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of MarketCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessMarketCategoriesStateCopyWith<SuccessMarketCategoriesState> get copyWith => _$SuccessMarketCategoriesStateCopyWithImpl<SuccessMarketCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessMarketCategoriesState&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'MarketCategoriesState.success(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $SuccessMarketCategoriesStateCopyWith<$Res> implements $MarketCategoriesStateCopyWith<$Res> {
  factory $SuccessMarketCategoriesStateCopyWith(SuccessMarketCategoriesState value, $Res Function(SuccessMarketCategoriesState) _then) = _$SuccessMarketCategoriesStateCopyWithImpl;
@useResult
$Res call({
 List<MarketCategoryEntity> categories
});




}
/// @nodoc
class _$SuccessMarketCategoriesStateCopyWithImpl<$Res>
    implements $SuccessMarketCategoriesStateCopyWith<$Res> {
  _$SuccessMarketCategoriesStateCopyWithImpl(this._self, this._then);

  final SuccessMarketCategoriesState _self;
  final $Res Function(SuccessMarketCategoriesState) _then;

/// Create a copy of MarketCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(SuccessMarketCategoriesState(
null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<MarketCategoryEntity>,
  ));
}


}

// dart format on
