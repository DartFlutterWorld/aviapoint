// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionTypeModel {

 int get id; String get code; String get name;@JsonKey(name: 'period_days') int get periodDays; int get price;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) DateTime get createdAt; String get description;
/// Create a copy of SubscriptionTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionTypeModelCopyWith<SubscriptionTypeModel> get copyWith => _$SubscriptionTypeModelCopyWithImpl<SubscriptionTypeModel>(this as SubscriptionTypeModel, _$identity);

  /// Serializes this SubscriptionTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.periodDays, periodDays) || other.periodDays == periodDays)&&(identical(other.price, price) || other.price == price)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,periodDays,price,isActive,createdAt,description);

@override
String toString() {
  return 'SubscriptionTypeModel(id: $id, code: $code, name: $name, periodDays: $periodDays, price: $price, isActive: $isActive, createdAt: $createdAt, description: $description)';
}


}

/// @nodoc
abstract mixin class $SubscriptionTypeModelCopyWith<$Res>  {
  factory $SubscriptionTypeModelCopyWith(SubscriptionTypeModel value, $Res Function(SubscriptionTypeModel) _then) = _$SubscriptionTypeModelCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name,@JsonKey(name: 'period_days') int periodDays, int price,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) DateTime createdAt, String description
});




}
/// @nodoc
class _$SubscriptionTypeModelCopyWithImpl<$Res>
    implements $SubscriptionTypeModelCopyWith<$Res> {
  _$SubscriptionTypeModelCopyWithImpl(this._self, this._then);

  final SubscriptionTypeModel _self;
  final $Res Function(SubscriptionTypeModel) _then;

/// Create a copy of SubscriptionTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? periodDays = null,Object? price = null,Object? isActive = null,Object? createdAt = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,periodDays: null == periodDays ? _self.periodDays : periodDays // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionTypeModel].
extension SubscriptionTypeModelPatterns on SubscriptionTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionTypeModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionTypeModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionTypeModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String name, @JsonKey(name: 'period_days')  int periodDays,  int price, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson)  DateTime createdAt,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionTypeModel() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.periodDays,_that.price,_that.isActive,_that.createdAt,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String name, @JsonKey(name: 'period_days')  int periodDays,  int price, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson)  DateTime createdAt,  String description)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionTypeModel():
return $default(_that.id,_that.code,_that.name,_that.periodDays,_that.price,_that.isActive,_that.createdAt,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String name, @JsonKey(name: 'period_days')  int periodDays,  int price, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson)  DateTime createdAt,  String description)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionTypeModel() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.periodDays,_that.price,_that.isActive,_that.createdAt,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionTypeModel implements SubscriptionTypeModel {
  const _SubscriptionTypeModel({required this.id, required this.code, required this.name, @JsonKey(name: 'period_days') required this.periodDays, required this.price, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) required this.createdAt, required this.description});
  factory _SubscriptionTypeModel.fromJson(Map<String, dynamic> json) => _$SubscriptionTypeModelFromJson(json);

@override final  int id;
@override final  String code;
@override final  String name;
@override@JsonKey(name: 'period_days') final  int periodDays;
@override final  int price;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) final  DateTime createdAt;
@override final  String description;

/// Create a copy of SubscriptionTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionTypeModelCopyWith<_SubscriptionTypeModel> get copyWith => __$SubscriptionTypeModelCopyWithImpl<_SubscriptionTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.periodDays, periodDays) || other.periodDays == periodDays)&&(identical(other.price, price) || other.price == price)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,periodDays,price,isActive,createdAt,description);

@override
String toString() {
  return 'SubscriptionTypeModel(id: $id, code: $code, name: $name, periodDays: $periodDays, price: $price, isActive: $isActive, createdAt: $createdAt, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionTypeModelCopyWith<$Res> implements $SubscriptionTypeModelCopyWith<$Res> {
  factory _$SubscriptionTypeModelCopyWith(_SubscriptionTypeModel value, $Res Function(_SubscriptionTypeModel) _then) = __$SubscriptionTypeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name,@JsonKey(name: 'period_days') int periodDays, int price,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) DateTime createdAt, String description
});




}
/// @nodoc
class __$SubscriptionTypeModelCopyWithImpl<$Res>
    implements _$SubscriptionTypeModelCopyWith<$Res> {
  __$SubscriptionTypeModelCopyWithImpl(this._self, this._then);

  final _SubscriptionTypeModel _self;
  final $Res Function(_SubscriptionTypeModel) _then;

/// Create a copy of SubscriptionTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? periodDays = null,Object? price = null,Object? isActive = null,Object? createdAt = null,Object? description = null,}) {
  return _then(_SubscriptionTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,periodDays: null == periodDays ? _self.periodDays : periodDays // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
