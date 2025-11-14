// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_checked_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NormalCheckedState {

 Set<CheckProgress> get checkProgress;
/// Create a copy of NormalCheckedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NormalCheckedStateCopyWith<NormalCheckedState> get copyWith => _$NormalCheckedStateCopyWithImpl<NormalCheckedState>(this as NormalCheckedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NormalCheckedState&&const DeepCollectionEquality().equals(other.checkProgress, checkProgress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(checkProgress));

@override
String toString() {
  return 'NormalCheckedState(checkProgress: $checkProgress)';
}


}

/// @nodoc
abstract mixin class $NormalCheckedStateCopyWith<$Res>  {
  factory $NormalCheckedStateCopyWith(NormalCheckedState value, $Res Function(NormalCheckedState) _then) = _$NormalCheckedStateCopyWithImpl;
@useResult
$Res call({
 Set<CheckProgress> checkProgress
});




}
/// @nodoc
class _$NormalCheckedStateCopyWithImpl<$Res>
    implements $NormalCheckedStateCopyWith<$Res> {
  _$NormalCheckedStateCopyWithImpl(this._self, this._then);

  final NormalCheckedState _self;
  final $Res Function(NormalCheckedState) _then;

/// Create a copy of NormalCheckedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkProgress = null,}) {
  return _then(_self.copyWith(
checkProgress: null == checkProgress ? _self.checkProgress : checkProgress // ignore: cast_nullable_to_non_nullable
as Set<CheckProgress>,
  ));
}

}


/// Adds pattern-matching-related methods to [NormalCheckedState].
extension NormalCheckedStatePatterns on NormalCheckedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NormalCheckedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NormalCheckedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NormalCheckedState value)  $default,){
final _that = this;
switch (_that) {
case _NormalCheckedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NormalCheckedState value)?  $default,){
final _that = this;
switch (_that) {
case _NormalCheckedState() when $default != null:
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
case _NormalCheckedState() when $default != null:
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
case _NormalCheckedState():
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
case _NormalCheckedState() when $default != null:
return $default(_that.checkProgress);case _:
  return null;

}
}

}

/// @nodoc


class _NormalCheckedState implements NormalCheckedState {
  const _NormalCheckedState({final  Set<CheckProgress> checkProgress = const {}}): _checkProgress = checkProgress;
  

 final  Set<CheckProgress> _checkProgress;
@override@JsonKey() Set<CheckProgress> get checkProgress {
  if (_checkProgress is EqualUnmodifiableSetView) return _checkProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_checkProgress);
}


/// Create a copy of NormalCheckedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NormalCheckedStateCopyWith<_NormalCheckedState> get copyWith => __$NormalCheckedStateCopyWithImpl<_NormalCheckedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NormalCheckedState&&const DeepCollectionEquality().equals(other._checkProgress, _checkProgress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_checkProgress));

@override
String toString() {
  return 'NormalCheckedState(checkProgress: $checkProgress)';
}


}

/// @nodoc
abstract mixin class _$NormalCheckedStateCopyWith<$Res> implements $NormalCheckedStateCopyWith<$Res> {
  factory _$NormalCheckedStateCopyWith(_NormalCheckedState value, $Res Function(_NormalCheckedState) _then) = __$NormalCheckedStateCopyWithImpl;
@override @useResult
$Res call({
 Set<CheckProgress> checkProgress
});




}
/// @nodoc
class __$NormalCheckedStateCopyWithImpl<$Res>
    implements _$NormalCheckedStateCopyWith<$Res> {
  __$NormalCheckedStateCopyWithImpl(this._self, this._then);

  final _NormalCheckedState _self;
  final $Res Function(_NormalCheckedState) _then;

/// Create a copy of NormalCheckedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkProgress = null,}) {
  return _then(_NormalCheckedState(
checkProgress: null == checkProgress ? _self._checkProgress : checkProgress // ignore: cast_nullable_to_non_nullable
as Set<CheckProgress>,
  ));
}


}

// dart format on
