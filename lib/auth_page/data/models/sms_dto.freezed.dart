// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmsDto _$SmsDtoFromJson(Map<String, dynamic> json) {
  return _SmsDto.fromJson(json);
}

/// @nodoc
mixin _$SmsDto {
  @JsonKey(name: 'err_code')
  dynamic get errCode => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this SmsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmsDtoCopyWith<SmsDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmsDtoCopyWith<$Res> {
  factory $SmsDtoCopyWith(SmsDto value, $Res Function(SmsDto) then) =
      _$SmsDtoCopyWithImpl<$Res, SmsDto>;
  @useResult
  $Res call({@JsonKey(name: 'err_code') dynamic errCode, String text});
}

/// @nodoc
class _$SmsDtoCopyWithImpl<$Res, $Val extends SmsDto>
    implements $SmsDtoCopyWith<$Res> {
  _$SmsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errCode = freezed,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      errCode: freezed == errCode
          ? _value.errCode
          : errCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmsDtoImplCopyWith<$Res> implements $SmsDtoCopyWith<$Res> {
  factory _$$SmsDtoImplCopyWith(
          _$SmsDtoImpl value, $Res Function(_$SmsDtoImpl) then) =
      __$$SmsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'err_code') dynamic errCode, String text});
}

/// @nodoc
class __$$SmsDtoImplCopyWithImpl<$Res>
    extends _$SmsDtoCopyWithImpl<$Res, _$SmsDtoImpl>
    implements _$$SmsDtoImplCopyWith<$Res> {
  __$$SmsDtoImplCopyWithImpl(
      _$SmsDtoImpl _value, $Res Function(_$SmsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errCode = freezed,
    Object? text = null,
  }) {
    return _then(_$SmsDtoImpl(
      errCode: freezed == errCode ? _value.errCode! : errCode,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmsDtoImpl implements _SmsDto {
  const _$SmsDtoImpl(
      {@JsonKey(name: 'err_code') this.errCode, required this.text});

  factory _$SmsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'err_code')
  final dynamic errCode;
  @override
  final String text;

  @override
  String toString() {
    return 'SmsDto(errCode: $errCode, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmsDtoImpl &&
            const DeepCollectionEquality().equals(other.errCode, errCode) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errCode), text);

  /// Create a copy of SmsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmsDtoImplCopyWith<_$SmsDtoImpl> get copyWith =>
      __$$SmsDtoImplCopyWithImpl<_$SmsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmsDtoImplToJson(
      this,
    );
  }
}

abstract class _SmsDto implements SmsDto {
  const factory _SmsDto(
      {@JsonKey(name: 'err_code') final dynamic errCode,
      required final String text}) = _$SmsDtoImpl;

  factory _SmsDto.fromJson(Map<String, dynamic> json) = _$SmsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'err_code')
  dynamic get errCode;
  @override
  String get text;

  /// Create a copy of SmsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmsDtoImplCopyWith<_$SmsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
