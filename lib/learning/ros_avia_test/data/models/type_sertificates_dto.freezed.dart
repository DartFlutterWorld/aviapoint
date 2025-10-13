// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_sertificates_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TypeSertificatesDto _$TypeSertificatesDtoFromJson(Map<String, dynamic> json) {
  return _TypeSertificatesDto.fromJson(json);
}

/// @nodoc
mixin _$TypeSertificatesDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this TypeSertificatesDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeSertificatesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeSertificatesDtoCopyWith<TypeSertificatesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeSertificatesDtoCopyWith<$Res> {
  factory $TypeSertificatesDtoCopyWith(
    TypeSertificatesDto value,
    $Res Function(TypeSertificatesDto) then,
  ) = _$TypeSertificatesDtoCopyWithImpl<$Res, TypeSertificatesDto>;
  @useResult
  $Res call({int id, String title, String image});
}

/// @nodoc
class _$TypeSertificatesDtoCopyWithImpl<$Res, $Val extends TypeSertificatesDto>
    implements $TypeSertificatesDtoCopyWith<$Res> {
  _$TypeSertificatesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeSertificatesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? title = null, Object? image = null}) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypeSertificatesDtoImplCopyWith<$Res>
    implements $TypeSertificatesDtoCopyWith<$Res> {
  factory _$$TypeSertificatesDtoImplCopyWith(
    _$TypeSertificatesDtoImpl value,
    $Res Function(_$TypeSertificatesDtoImpl) then,
  ) = __$$TypeSertificatesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String image});
}

/// @nodoc
class __$$TypeSertificatesDtoImplCopyWithImpl<$Res>
    extends _$TypeSertificatesDtoCopyWithImpl<$Res, _$TypeSertificatesDtoImpl>
    implements _$$TypeSertificatesDtoImplCopyWith<$Res> {
  __$$TypeSertificatesDtoImplCopyWithImpl(
    _$TypeSertificatesDtoImpl _value,
    $Res Function(_$TypeSertificatesDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypeSertificatesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? title = null, Object? image = null}) {
    return _then(
      _$TypeSertificatesDtoImpl(
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
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TypeSertificatesDtoImpl implements _TypeSertificatesDto {
  const _$TypeSertificatesDtoImpl({
    required this.id,
    required this.title,
    required this.image,
  });

  factory _$TypeSertificatesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeSertificatesDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String image;

  @override
  String toString() {
    return 'TypeSertificatesDto(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeSertificatesDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image);

  /// Create a copy of TypeSertificatesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeSertificatesDtoImplCopyWith<_$TypeSertificatesDtoImpl> get copyWith =>
      __$$TypeSertificatesDtoImplCopyWithImpl<_$TypeSertificatesDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeSertificatesDtoImplToJson(this);
  }
}

abstract class _TypeSertificatesDto implements TypeSertificatesDto {
  const factory _TypeSertificatesDto({
    required final int id,
    required final String title,
    required final String image,
  }) = _$TypeSertificatesDtoImpl;

  factory _TypeSertificatesDto.fromJson(Map<String, dynamic> json) =
      _$TypeSertificatesDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get image;

  /// Create a copy of TypeSertificatesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeSertificatesDtoImplCopyWith<_$TypeSertificatesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
