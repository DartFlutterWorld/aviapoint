// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ros_avia_test_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RosAviaTestCategoryDto _$RosAviaTestCategoryDtoFromJson(
    Map<String, dynamic> json) {
  return _RosAviaTestCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$RosAviaTestCategoryDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this RosAviaTestCategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RosAviaTestCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RosAviaTestCategoryDtoCopyWith<RosAviaTestCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RosAviaTestCategoryDtoCopyWith<$Res> {
  factory $RosAviaTestCategoryDtoCopyWith(RosAviaTestCategoryDto value,
          $Res Function(RosAviaTestCategoryDto) then) =
      _$RosAviaTestCategoryDtoCopyWithImpl<$Res, RosAviaTestCategoryDto>;
  @useResult
  $Res call({int id, String title, String image});
}

/// @nodoc
class _$RosAviaTestCategoryDtoCopyWithImpl<$Res,
        $Val extends RosAviaTestCategoryDto>
    implements $RosAviaTestCategoryDtoCopyWith<$Res> {
  _$RosAviaTestCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RosAviaTestCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RosAviaTestCategoryDtoImplCopyWith<$Res>
    implements $RosAviaTestCategoryDtoCopyWith<$Res> {
  factory _$$RosAviaTestCategoryDtoImplCopyWith(
          _$RosAviaTestCategoryDtoImpl value,
          $Res Function(_$RosAviaTestCategoryDtoImpl) then) =
      __$$RosAviaTestCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String image});
}

/// @nodoc
class __$$RosAviaTestCategoryDtoImplCopyWithImpl<$Res>
    extends _$RosAviaTestCategoryDtoCopyWithImpl<$Res,
        _$RosAviaTestCategoryDtoImpl>
    implements _$$RosAviaTestCategoryDtoImplCopyWith<$Res> {
  __$$RosAviaTestCategoryDtoImplCopyWithImpl(
      _$RosAviaTestCategoryDtoImpl _value,
      $Res Function(_$RosAviaTestCategoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RosAviaTestCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_$RosAviaTestCategoryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RosAviaTestCategoryDtoImpl implements _RosAviaTestCategoryDto {
  const _$RosAviaTestCategoryDtoImpl(
      {required this.id, required this.title, required this.image});

  factory _$RosAviaTestCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RosAviaTestCategoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String image;

  @override
  String toString() {
    return 'RosAviaTestCategoryDto(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RosAviaTestCategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image);

  /// Create a copy of RosAviaTestCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RosAviaTestCategoryDtoImplCopyWith<_$RosAviaTestCategoryDtoImpl>
      get copyWith => __$$RosAviaTestCategoryDtoImplCopyWithImpl<
          _$RosAviaTestCategoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RosAviaTestCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _RosAviaTestCategoryDto implements RosAviaTestCategoryDto {
  const factory _RosAviaTestCategoryDto(
      {required final int id,
      required final String title,
      required final String image}) = _$RosAviaTestCategoryDtoImpl;

  factory _RosAviaTestCategoryDto.fromJson(Map<String, dynamic> json) =
      _$RosAviaTestCategoryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get image;

  /// Create a copy of RosAviaTestCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RosAviaTestCategoryDtoImplCopyWith<_$RosAviaTestCategoryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
