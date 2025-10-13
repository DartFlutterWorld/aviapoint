// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight_checked_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PreflightCheckedState {
  Set<CheckProgress> get checkProgress => throw _privateConstructorUsedError;

  /// Create a copy of PreflightCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreflightCheckedStateCopyWith<PreflightCheckedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflightCheckedStateCopyWith<$Res> {
  factory $PreflightCheckedStateCopyWith(
    PreflightCheckedState value,
    $Res Function(PreflightCheckedState) then,
  ) = _$PreflightCheckedStateCopyWithImpl<$Res, PreflightCheckedState>;
  @useResult
  $Res call({Set<CheckProgress> checkProgress});
}

/// @nodoc
class _$PreflightCheckedStateCopyWithImpl<
  $Res,
  $Val extends PreflightCheckedState
>
    implements $PreflightCheckedStateCopyWith<$Res> {
  _$PreflightCheckedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreflightCheckedState
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
abstract class _$$PreflightCheckedStateImplCopyWith<$Res>
    implements $PreflightCheckedStateCopyWith<$Res> {
  factory _$$PreflightCheckedStateImplCopyWith(
    _$PreflightCheckedStateImpl value,
    $Res Function(_$PreflightCheckedStateImpl) then,
  ) = __$$PreflightCheckedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<CheckProgress> checkProgress});
}

/// @nodoc
class __$$PreflightCheckedStateImplCopyWithImpl<$Res>
    extends
        _$PreflightCheckedStateCopyWithImpl<$Res, _$PreflightCheckedStateImpl>
    implements _$$PreflightCheckedStateImplCopyWith<$Res> {
  __$$PreflightCheckedStateImplCopyWithImpl(
    _$PreflightCheckedStateImpl _value,
    $Res Function(_$PreflightCheckedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreflightCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkProgress = null}) {
    return _then(
      _$PreflightCheckedStateImpl(
        checkProgress: null == checkProgress
            ? _value._checkProgress
            : checkProgress // ignore: cast_nullable_to_non_nullable
                  as Set<CheckProgress>,
      ),
    );
  }
}

/// @nodoc

class _$PreflightCheckedStateImpl implements _PreflightCheckedState {
  const _$PreflightCheckedStateImpl({
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
    return 'PreflightCheckedState(checkProgress: $checkProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreflightCheckedStateImpl &&
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

  /// Create a copy of PreflightCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreflightCheckedStateImplCopyWith<_$PreflightCheckedStateImpl>
  get copyWith =>
      __$$PreflightCheckedStateImplCopyWithImpl<_$PreflightCheckedStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PreflightCheckedState implements PreflightCheckedState {
  const factory _PreflightCheckedState({
    final Set<CheckProgress> checkProgress,
  }) = _$PreflightCheckedStateImpl;

  @override
  Set<CheckProgress> get checkProgress;

  /// Create a copy of PreflightCheckedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreflightCheckedStateImplCopyWith<_$PreflightCheckedStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
