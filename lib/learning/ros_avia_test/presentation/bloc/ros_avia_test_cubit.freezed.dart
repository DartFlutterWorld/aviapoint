// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ros_avia_test_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RosAviaTestState {
  String get typeCertificateName => throw _privateConstructorUsedError;
  TypeSertificatesEntity get typeSertificate =>
      throw _privateConstructorUsedError;

  /// Create a copy of RosAviaTestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RosAviaTestStateCopyWith<RosAviaTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RosAviaTestStateCopyWith<$Res> {
  factory $RosAviaTestStateCopyWith(
    RosAviaTestState value,
    $Res Function(RosAviaTestState) then,
  ) = _$RosAviaTestStateCopyWithImpl<$Res, RosAviaTestState>;
  @useResult
  $Res call({
    String typeCertificateName,
    TypeSertificatesEntity typeSertificate,
  });
}

/// @nodoc
class _$RosAviaTestStateCopyWithImpl<$Res, $Val extends RosAviaTestState>
    implements $RosAviaTestStateCopyWith<$Res> {
  _$RosAviaTestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RosAviaTestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeCertificateName = null,
    Object? typeSertificate = null,
  }) {
    return _then(
      _value.copyWith(
            typeCertificateName: null == typeCertificateName
                ? _value.typeCertificateName
                : typeCertificateName // ignore: cast_nullable_to_non_nullable
                      as String,
            typeSertificate: null == typeSertificate
                ? _value.typeSertificate
                : typeSertificate // ignore: cast_nullable_to_non_nullable
                      as TypeSertificatesEntity,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RosAviaTestStateImplCopyWith<$Res>
    implements $RosAviaTestStateCopyWith<$Res> {
  factory _$$RosAviaTestStateImplCopyWith(
    _$RosAviaTestStateImpl value,
    $Res Function(_$RosAviaTestStateImpl) then,
  ) = __$$RosAviaTestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String typeCertificateName,
    TypeSertificatesEntity typeSertificate,
  });
}

/// @nodoc
class __$$RosAviaTestStateImplCopyWithImpl<$Res>
    extends _$RosAviaTestStateCopyWithImpl<$Res, _$RosAviaTestStateImpl>
    implements _$$RosAviaTestStateImplCopyWith<$Res> {
  __$$RosAviaTestStateImplCopyWithImpl(
    _$RosAviaTestStateImpl _value,
    $Res Function(_$RosAviaTestStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RosAviaTestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeCertificateName = null,
    Object? typeSertificate = null,
  }) {
    return _then(
      _$RosAviaTestStateImpl(
        typeCertificateName: null == typeCertificateName
            ? _value.typeCertificateName
            : typeCertificateName // ignore: cast_nullable_to_non_nullable
                  as String,
        typeSertificate: null == typeSertificate
            ? _value.typeSertificate
            : typeSertificate // ignore: cast_nullable_to_non_nullable
                  as TypeSertificatesEntity,
      ),
    );
  }
}

/// @nodoc

class _$RosAviaTestStateImpl implements _RosAviaTestState {
  const _$RosAviaTestStateImpl({
    this.typeCertificateName = 'Частный пилот (самолет)',
    this.typeSertificate = const TypeSertificatesEntity(
      id: 1,
      title: 'Частный пилот (самолет)',
      image: '',
    ),
  });

  @override
  @JsonKey()
  final String typeCertificateName;
  @override
  @JsonKey()
  final TypeSertificatesEntity typeSertificate;

  @override
  String toString() {
    return 'RosAviaTestState(typeCertificateName: $typeCertificateName, typeSertificate: $typeSertificate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RosAviaTestStateImpl &&
            (identical(other.typeCertificateName, typeCertificateName) ||
                other.typeCertificateName == typeCertificateName) &&
            (identical(other.typeSertificate, typeSertificate) ||
                other.typeSertificate == typeSertificate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, typeCertificateName, typeSertificate);

  /// Create a copy of RosAviaTestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RosAviaTestStateImplCopyWith<_$RosAviaTestStateImpl> get copyWith =>
      __$$RosAviaTestStateImplCopyWithImpl<_$RosAviaTestStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RosAviaTestState implements RosAviaTestState {
  const factory _RosAviaTestState({
    final String typeCertificateName,
    final TypeSertificatesEntity typeSertificate,
  }) = _$RosAviaTestStateImpl;

  @override
  String get typeCertificateName;
  @override
  TypeSertificatesEntity get typeSertificate;

  /// Create a copy of RosAviaTestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RosAviaTestStateImplCopyWith<_$RosAviaTestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
