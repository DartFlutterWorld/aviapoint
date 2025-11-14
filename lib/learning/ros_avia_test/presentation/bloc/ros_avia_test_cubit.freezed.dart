// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ros_avia_test_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RosAviaTestState {

 String get typeCertificateName; TypeSertificatesEntity get typeSertificate; TestMode get testMode;
/// Create a copy of RosAviaTestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosAviaTestStateCopyWith<RosAviaTestState> get copyWith => _$RosAviaTestStateCopyWithImpl<RosAviaTestState>(this as RosAviaTestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosAviaTestState&&(identical(other.typeCertificateName, typeCertificateName) || other.typeCertificateName == typeCertificateName)&&(identical(other.typeSertificate, typeSertificate) || other.typeSertificate == typeSertificate)&&(identical(other.testMode, testMode) || other.testMode == testMode));
}


@override
int get hashCode => Object.hash(runtimeType,typeCertificateName,typeSertificate,testMode);

@override
String toString() {
  return 'RosAviaTestState(typeCertificateName: $typeCertificateName, typeSertificate: $typeSertificate, testMode: $testMode)';
}


}

/// @nodoc
abstract mixin class $RosAviaTestStateCopyWith<$Res>  {
  factory $RosAviaTestStateCopyWith(RosAviaTestState value, $Res Function(RosAviaTestState) _then) = _$RosAviaTestStateCopyWithImpl;
@useResult
$Res call({
 String typeCertificateName, TypeSertificatesEntity typeSertificate, TestMode testMode
});




}
/// @nodoc
class _$RosAviaTestStateCopyWithImpl<$Res>
    implements $RosAviaTestStateCopyWith<$Res> {
  _$RosAviaTestStateCopyWithImpl(this._self, this._then);

  final RosAviaTestState _self;
  final $Res Function(RosAviaTestState) _then;

/// Create a copy of RosAviaTestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? typeCertificateName = null,Object? typeSertificate = null,Object? testMode = null,}) {
  return _then(_self.copyWith(
typeCertificateName: null == typeCertificateName ? _self.typeCertificateName : typeCertificateName // ignore: cast_nullable_to_non_nullable
as String,typeSertificate: null == typeSertificate ? _self.typeSertificate : typeSertificate // ignore: cast_nullable_to_non_nullable
as TypeSertificatesEntity,testMode: null == testMode ? _self.testMode : testMode // ignore: cast_nullable_to_non_nullable
as TestMode,
  ));
}

}


/// Adds pattern-matching-related methods to [RosAviaTestState].
extension RosAviaTestStatePatterns on RosAviaTestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RosAviaTestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RosAviaTestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RosAviaTestState value)  $default,){
final _that = this;
switch (_that) {
case _RosAviaTestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RosAviaTestState value)?  $default,){
final _that = this;
switch (_that) {
case _RosAviaTestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String typeCertificateName,  TypeSertificatesEntity typeSertificate,  TestMode testMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RosAviaTestState() when $default != null:
return $default(_that.typeCertificateName,_that.typeSertificate,_that.testMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String typeCertificateName,  TypeSertificatesEntity typeSertificate,  TestMode testMode)  $default,) {final _that = this;
switch (_that) {
case _RosAviaTestState():
return $default(_that.typeCertificateName,_that.typeSertificate,_that.testMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String typeCertificateName,  TypeSertificatesEntity typeSertificate,  TestMode testMode)?  $default,) {final _that = this;
switch (_that) {
case _RosAviaTestState() when $default != null:
return $default(_that.typeCertificateName,_that.typeSertificate,_that.testMode);case _:
  return null;

}
}

}

/// @nodoc


class _RosAviaTestState implements RosAviaTestState {
  const _RosAviaTestState({this.typeCertificateName = 'Частный пилот (самолет)', this.typeSertificate = const TypeSertificatesEntity(id: 1, title: 'Частный пилот (самолет)', image: ''), this.testMode = TestMode.training});
  

@override@JsonKey() final  String typeCertificateName;
@override@JsonKey() final  TypeSertificatesEntity typeSertificate;
@override@JsonKey() final  TestMode testMode;

/// Create a copy of RosAviaTestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RosAviaTestStateCopyWith<_RosAviaTestState> get copyWith => __$RosAviaTestStateCopyWithImpl<_RosAviaTestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RosAviaTestState&&(identical(other.typeCertificateName, typeCertificateName) || other.typeCertificateName == typeCertificateName)&&(identical(other.typeSertificate, typeSertificate) || other.typeSertificate == typeSertificate)&&(identical(other.testMode, testMode) || other.testMode == testMode));
}


@override
int get hashCode => Object.hash(runtimeType,typeCertificateName,typeSertificate,testMode);

@override
String toString() {
  return 'RosAviaTestState(typeCertificateName: $typeCertificateName, typeSertificate: $typeSertificate, testMode: $testMode)';
}


}

/// @nodoc
abstract mixin class _$RosAviaTestStateCopyWith<$Res> implements $RosAviaTestStateCopyWith<$Res> {
  factory _$RosAviaTestStateCopyWith(_RosAviaTestState value, $Res Function(_RosAviaTestState) _then) = __$RosAviaTestStateCopyWithImpl;
@override @useResult
$Res call({
 String typeCertificateName, TypeSertificatesEntity typeSertificate, TestMode testMode
});




}
/// @nodoc
class __$RosAviaTestStateCopyWithImpl<$Res>
    implements _$RosAviaTestStateCopyWith<$Res> {
  __$RosAviaTestStateCopyWithImpl(this._self, this._then);

  final _RosAviaTestState _self;
  final $Res Function(_RosAviaTestState) _then;

/// Create a copy of RosAviaTestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? typeCertificateName = null,Object? typeSertificate = null,Object? testMode = null,}) {
  return _then(_RosAviaTestState(
typeCertificateName: null == typeCertificateName ? _self.typeCertificateName : typeCertificateName // ignore: cast_nullable_to_non_nullable
as String,typeSertificate: null == typeSertificate ? _self.typeSertificate : typeSertificate // ignore: cast_nullable_to_non_nullable
as TypeSertificatesEntity,testMode: null == testMode ? _self.testMode : testMode // ignore: cast_nullable_to_non_nullable
as TestMode,
  ));
}


}

// dart format on
