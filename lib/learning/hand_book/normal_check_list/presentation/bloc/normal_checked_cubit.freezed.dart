// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_checked_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NormalCheckedState {
  Set<CheckProgress> get checkProgress => throw _privateConstructorUsedError;

  /// Create a copy of NormalCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NormalCheckedStateCopyWith<NormalCheckedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormalCheckedStateCopyWith<$Res> {
  factory $NormalCheckedStateCopyWith(
    NormalCheckedState value,
    $Res Function(NormalCheckedState) then,
  ) = _$NormalCheckedStateCopyWithImpl<$Res, NormalCheckedState>;
  @useResult
  $Res call({Set<CheckProgress> checkProgress});
}

/// @nodoc
class _$NormalCheckedStateCopyWithImpl<$Res, $Val extends NormalCheckedState>
    implements $NormalCheckedStateCopyWith<$Res> {
  _$NormalCheckedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NormalCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkProgress = null}) {
    return _then(
      _value.copyWith(
            checkProgress: null == checkProgress
                ? _value.checkProgress
                : checkProgress // ignore: cast_nullable_to_non_nullable
                      as Set<CheckProgress>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NormalCheckedStateImplCopyWith<$Res>
    implements $NormalCheckedStateCopyWith<$Res> {
  factory _$$NormalCheckedStateImplCopyWith(
    _$NormalCheckedStateImpl value,
    $Res Function(_$NormalCheckedStateImpl) then,
  ) = __$$NormalCheckedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<CheckProgress> checkProgress});
}

/// @nodoc
class __$$NormalCheckedStateImplCopyWithImpl<$Res>
    extends _$NormalCheckedStateCopyWithImpl<$Res, _$NormalCheckedStateImpl>
    implements _$$NormalCheckedStateImplCopyWith<$Res> {
  __$$NormalCheckedStateImplCopyWithImpl(
    _$NormalCheckedStateImpl _value,
    $Res Function(_$NormalCheckedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkProgress = null}) {
    return _then(
      _$NormalCheckedStateImpl(
        checkProgress: null == checkProgress
            ? _value._checkProgress
            : checkProgress // ignore: cast_nullable_to_non_nullable
                  as Set<CheckProgress>,
      ),
    );
  }
}

/// @nodoc

class _$NormalCheckedStateImpl implements _NormalCheckedState {
  const _$NormalCheckedStateImpl({
    final Set<CheckProgress> checkProgress = const {},
  }) : _checkProgress = checkProgress;

  final Set<CheckProgress> _checkProgress;
  @override
  @JsonKey()
  Set<CheckProgress> get checkProgress {
    if (_checkProgress is EqualUnmodifiableSetView) return _checkProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_checkProgress);
  }

  @override
  String toString() {
    return 'NormalCheckedState(checkProgress: $checkProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalCheckedStateImpl &&
            const DeepCollectionEquality().equals(
              other._checkProgress,
              _checkProgress,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_checkProgress),
  );

  /// Create a copy of NormalCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalCheckedStateImplCopyWith<_$NormalCheckedStateImpl> get copyWith =>
      __$$NormalCheckedStateImplCopyWithImpl<_$NormalCheckedStateImpl>(
        this,
        _$identity,
      );
}

abstract class _NormalCheckedState implements NormalCheckedState {
  const factory _NormalCheckedState({final Set<CheckProgress> checkProgress}) =
      _$NormalCheckedStateImpl;

  @override
  Set<CheckProgress> get checkProgress;

  /// Create a copy of NormalCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NormalCheckedStateImplCopyWith<_$NormalCheckedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
