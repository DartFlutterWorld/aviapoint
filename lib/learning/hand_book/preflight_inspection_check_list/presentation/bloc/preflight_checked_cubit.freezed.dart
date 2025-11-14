// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight_checked_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreflightCheckedState {

 Set<CheckProgress> get checkProgress;
/// Create a copy of PreflightCheckedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreflightCheckedStateCopyWith<PreflightCheckedState> get copyWith => _$PreflightCheckedStateCopyWithImpl<PreflightCheckedState>(this as PreflightCheckedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightCheckedState&&const DeepCollectionEquality().equals(other.checkProgress, checkProgress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(checkProgress));

@override
String toString() {
  return 'PreflightCheckedState(checkProgress: $checkProgress)';
}


}

/// @nodoc
abstract mixin class $PreflightCheckedStateCopyWith<$Res>  {
  factory $PreflightCheckedStateCopyWith(PreflightCheckedState value, $Res Function(PreflightCheckedState) _then) = _$PreflightCheckedStateCopyWithImpl;
@useResult
$Res call({
 Set<CheckProgress> checkProgress
});




}
/// @nodoc
class _$PreflightCheckedStateCopyWithImpl<$Res>
    implements $PreflightCheckedStateCopyWith<$Res> {
  _$PreflightCheckedStateCopyWithImpl(this._self, this._then);

  final PreflightCheckedState _self;
  final $Res Function(PreflightCheckedState) _then;

/// Create a copy of PreflightCheckedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkProgress = null,}) {
  return _then(_self.copyWith(
checkProgress: null == checkProgress ? _self.checkProgress : checkProgress // ignore: cast_nullable_to_non_nullable
as Set<CheckProgress>,
  ));
}

}


/// Adds pattern-matching-related methods to [PreflightCheckedState].
extension PreflightCheckedStatePatterns on PreflightCheckedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreflightCheckedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreflightCheckedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreflightCheckedState value)  $default,){
final _that = this;
switch (_that) {
case _PreflightCheckedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreflightCheckedState value)?  $default,){
final _that = this;
switch (_that) {
case _PreflightCheckedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<CheckProgress> checkProgress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreflightCheckedState() when $default != null:
return $default(_that.checkProgress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<CheckProgress> checkProgress)  $default,) {final _that = this;
switch (_that) {
case _PreflightCheckedState():
return $default(_that.checkProgress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<CheckProgress> checkProgress)?  $default,) {final _that = this;
switch (_that) {
case _PreflightCheckedState() when $default != null:
return $default(_that.checkProgress);case _:
  return null;

}
}

}

/// @nodoc


class _PreflightCheckedState implements PreflightCheckedState {
  const _PreflightCheckedState({final  Set<CheckProgress> checkProgress = const {}}): _checkProgress = checkProgress;
  

 final  Set<CheckProgress> _checkProgress;
@override@JsonKey() Set<CheckProgress> get checkProgress {
  if (_checkProgress is EqualUnmodifiableSetView) return _checkProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_checkProgress);
}


/// Create a copy of PreflightCheckedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreflightCheckedStateCopyWith<_PreflightCheckedState> get copyWith => __$PreflightCheckedStateCopyWithImpl<_PreflightCheckedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreflightCheckedState&&const DeepCollectionEquality().equals(other._checkProgress, _checkProgress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_checkProgress));

@override
String toString() {
  return 'PreflightCheckedState(checkProgress: $checkProgress)';
}


}

/// @nodoc
abstract mixin class _$PreflightCheckedStateCopyWith<$Res> implements $PreflightCheckedStateCopyWith<$Res> {
  factory _$PreflightCheckedStateCopyWith(_PreflightCheckedState value, $Res Function(_PreflightCheckedState) _then) = __$PreflightCheckedStateCopyWithImpl;
@override @useResult
$Res call({
 Set<CheckProgress> checkProgress
});




}
/// @nodoc
class __$PreflightCheckedStateCopyWithImpl<$Res>
    implements _$PreflightCheckedStateCopyWith<$Res> {
  __$PreflightCheckedStateCopyWithImpl(this._self, this._then);

  final _PreflightCheckedState _self;
  final $Res Function(_PreflightCheckedState) _then;

/// Create a copy of PreflightCheckedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkProgress = null,}) {
  return _then(_PreflightCheckedState(
checkProgress: null == checkProgress ? _self._checkProgress : checkProgress // ignore: cast_nullable_to_non_nullable
as Set<CheckProgress>,
  ));
}


}

// dart format on
