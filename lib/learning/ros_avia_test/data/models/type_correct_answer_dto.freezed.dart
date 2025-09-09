// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_correct_answer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeCorrectAnswerDto _$TypeCorrectAnswerDtoFromJson(Map<String, dynamic> json) {
  return _TypeCorrectAnswerDto.fromJson(json);
}

/// @nodoc
mixin _$TypeCorrectAnswerDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this TypeCorrectAnswerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeCorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeCorrectAnswerDtoCopyWith<TypeCorrectAnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeCorrectAnswerDtoCopyWith<$Res> {
  factory $TypeCorrectAnswerDtoCopyWith(TypeCorrectAnswerDto value,
          $Res Function(TypeCorrectAnswerDto) then) =
      _$TypeCorrectAnswerDtoCopyWithImpl<$Res, TypeCorrectAnswerDto>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$TypeCorrectAnswerDtoCopyWithImpl<$Res,
        $Val extends TypeCorrectAnswerDto>
    implements $TypeCorrectAnswerDtoCopyWith<$Res> {
  _$TypeCorrectAnswerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeCorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeCorrectAnswerDtoImplCopyWith<$Res>
    implements $TypeCorrectAnswerDtoCopyWith<$Res> {
  factory _$$TypeCorrectAnswerDtoImplCopyWith(_$TypeCorrectAnswerDtoImpl value,
          $Res Function(_$TypeCorrectAnswerDtoImpl) then) =
      __$$TypeCorrectAnswerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$TypeCorrectAnswerDtoImplCopyWithImpl<$Res>
    extends _$TypeCorrectAnswerDtoCopyWithImpl<$Res, _$TypeCorrectAnswerDtoImpl>
    implements _$$TypeCorrectAnswerDtoImplCopyWith<$Res> {
  __$$TypeCorrectAnswerDtoImplCopyWithImpl(_$TypeCorrectAnswerDtoImpl _value,
      $Res Function(_$TypeCorrectAnswerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeCorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$TypeCorrectAnswerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TypeCorrectAnswerDtoImpl implements _TypeCorrectAnswerDto {
  const _$TypeCorrectAnswerDtoImpl({required this.id, required this.title});

  factory _$TypeCorrectAnswerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeCorrectAnswerDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'TypeCorrectAnswerDto(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeCorrectAnswerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of TypeCorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeCorrectAnswerDtoImplCopyWith<_$TypeCorrectAnswerDtoImpl>
      get copyWith =>
          __$$TypeCorrectAnswerDtoImplCopyWithImpl<_$TypeCorrectAnswerDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeCorrectAnswerDtoImplToJson(
      this,
    );
  }
}

abstract class _TypeCorrectAnswerDto implements TypeCorrectAnswerDto {
  const factory _TypeCorrectAnswerDto(
      {required final int id,
      required final String title}) = _$TypeCorrectAnswerDtoImpl;

  factory _TypeCorrectAnswerDto.fromJson(Map<String, dynamic> json) =
      _$TypeCorrectAnswerDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;

  /// Create a copy of TypeCorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeCorrectAnswerDtoImplCopyWith<_$TypeCorrectAnswerDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
