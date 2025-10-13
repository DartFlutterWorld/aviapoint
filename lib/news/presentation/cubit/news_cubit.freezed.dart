// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NewsCubitState {
  int get categoryId => throw _privateConstructorUsedError;
  String get titleCategory => throw _privateConstructorUsedError;

  /// Create a copy of NewsCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsCubitStateCopyWith<NewsCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCubitStateCopyWith<$Res> {
  factory $NewsCubitStateCopyWith(
    NewsCubitState value,
    $Res Function(NewsCubitState) then,
  ) = _$NewsCubitStateCopyWithImpl<$Res, NewsCubitState>;
  @useResult
  $Res call({int categoryId, String titleCategory});
}

/// @nodoc
class _$NewsCubitStateCopyWithImpl<$Res, $Val extends NewsCubitState>
    implements $NewsCubitStateCopyWith<$Res> {
  _$NewsCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null, Object? titleCategory = null}) {
    return _then(
      _value.copyWith(
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int,
            titleCategory: null == titleCategory
                ? _value.titleCategory
                : titleCategory // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewsCubitStateImplCopyWith<$Res>
    implements $NewsCubitStateCopyWith<$Res> {
  factory _$$NewsCubitStateImplCopyWith(
    _$NewsCubitStateImpl value,
    $Res Function(_$NewsCubitStateImpl) then,
  ) = __$$NewsCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int categoryId, String titleCategory});
}

/// @nodoc
class __$$NewsCubitStateImplCopyWithImpl<$Res>
    extends _$NewsCubitStateCopyWithImpl<$Res, _$NewsCubitStateImpl>
    implements _$$NewsCubitStateImplCopyWith<$Res> {
  __$$NewsCubitStateImplCopyWithImpl(
    _$NewsCubitStateImpl _value,
    $Res Function(_$NewsCubitStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null, Object? titleCategory = null}) {
    return _then(
      _$NewsCubitStateImpl(
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
        titleCategory: null == titleCategory
            ? _value.titleCategory
            : titleCategory // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NewsCubitStateImpl implements _NewsCubitState {
  const _$NewsCubitStateImpl({this.categoryId = 0, this.titleCategory = ''});

  @override
  @JsonKey()
  final int categoryId;
  @override
  @JsonKey()
  final String titleCategory;

  @override
  String toString() {
    return 'NewsCubitState(categoryId: $categoryId, titleCategory: $titleCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsCubitStateImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.titleCategory, titleCategory) ||
                other.titleCategory == titleCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, titleCategory);

  /// Create a copy of NewsCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsCubitStateImplCopyWith<_$NewsCubitStateImpl> get copyWith =>
      __$$NewsCubitStateImplCopyWithImpl<_$NewsCubitStateImpl>(
        this,
        _$identity,
      );
}

abstract class _NewsCubitState implements NewsCubitState {
  const factory _NewsCubitState({
    final int categoryId,
    final String titleCategory,
  }) = _$NewsCubitStateImpl;

  @override
  int get categoryId;
  @override
  String get titleCategory;

  /// Create a copy of NewsCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsCubitStateImplCopyWith<_$NewsCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
