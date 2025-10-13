// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) {
  return _AuthDto.fromJson(json);
}

/// @nodoc
mixin _$AuthDto {
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  ProfileDto get profile => throw _privateConstructorUsedError;

  /// Serializes this AuthDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthDtoCopyWith<AuthDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDtoCopyWith<$Res> {
  factory $AuthDtoCopyWith(AuthDto value, $Res Function(AuthDto) then) =
      _$AuthDtoCopyWithImpl<$Res, AuthDto>;
  @useResult
  $Res call({
    String token,
    @JsonKey(name: 'refresh_token') String refreshToken,
    ProfileDto profile,
  });

  $ProfileDtoCopyWith<$Res> get profile;
}

/// @nodoc
class _$AuthDtoCopyWithImpl<$Res, $Val extends AuthDto>
    implements $AuthDtoCopyWith<$Res> {
  _$AuthDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? profile = null,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            profile: null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as ProfileDto,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDtoCopyWith<$Res> get profile {
    return $ProfileDtoCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthDtoImplCopyWith<$Res> implements $AuthDtoCopyWith<$Res> {
  factory _$$AuthDtoImplCopyWith(
    _$AuthDtoImpl value,
    $Res Function(_$AuthDtoImpl) then,
  ) = __$$AuthDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String token,
    @JsonKey(name: 'refresh_token') String refreshToken,
    ProfileDto profile,
  });

  @override
  $ProfileDtoCopyWith<$Res> get profile;
}

/// @nodoc
class __$$AuthDtoImplCopyWithImpl<$Res>
    extends _$AuthDtoCopyWithImpl<$Res, _$AuthDtoImpl>
    implements _$$AuthDtoImplCopyWith<$Res> {
  __$$AuthDtoImplCopyWithImpl(
    _$AuthDtoImpl _value,
    $Res Function(_$AuthDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? profile = null,
  }) {
    return _then(
      _$AuthDtoImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        profile: null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as ProfileDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthDtoImpl implements _AuthDto {
  const _$AuthDtoImpl({
    required this.token,
    @JsonKey(name: 'refresh_token') required this.refreshToken,
    required this.profile,
  });

  factory _$AuthDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthDtoImplFromJson(json);

  @override
  final String token;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  final ProfileDto profile;

  @override
  String toString() {
    return 'AuthDto(token: $token, refreshToken: $refreshToken, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthDtoImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, refreshToken, profile);

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthDtoImplCopyWith<_$AuthDtoImpl> get copyWith =>
      __$$AuthDtoImplCopyWithImpl<_$AuthDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthDtoImplToJson(this);
  }
}

abstract class _AuthDto implements AuthDto {
  const factory _AuthDto({
    required final String token,
    @JsonKey(name: 'refresh_token') required final String refreshToken,
    required final ProfileDto profile,
  }) = _$AuthDtoImpl;

  factory _AuthDto.fromJson(Map<String, dynamic> json) = _$AuthDtoImpl.fromJson;

  @override
  String get token;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  ProfileDto get profile;

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthDtoImplCopyWith<_$AuthDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
