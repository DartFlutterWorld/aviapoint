// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privat_pilot_plane_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrivatPilotPlaneCategoryDto _$PrivatPilotPlaneCategoryDtoFromJson(
  Map<String, dynamic> json,
) {
  return _PrivatPilotPlaneCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$PrivatPilotPlaneCategoryDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get typeCertificatesId => throw _privateConstructorUsedError;

  /// Serializes this PrivatPilotPlaneCategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivatPilotPlaneCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivatPilotPlaneCategoryDtoCopyWith<PrivatPilotPlaneCategoryDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivatPilotPlaneCategoryDtoCopyWith<$Res> {
  factory $PrivatPilotPlaneCategoryDtoCopyWith(
    PrivatPilotPlaneCategoryDto value,
    $Res Function(PrivatPilotPlaneCategoryDto) then,
  ) =
      _$PrivatPilotPlaneCategoryDtoCopyWithImpl<
        $Res,
        PrivatPilotPlaneCategoryDto
      >;
  @useResult
  $Res call({int id, String title, String image, int typeCertificatesId});
}

/// @nodoc
class _$PrivatPilotPlaneCategoryDtoCopyWithImpl<
  $Res,
  $Val extends PrivatPilotPlaneCategoryDto
>
    implements $PrivatPilotPlaneCategoryDtoCopyWith<$Res> {
  _$PrivatPilotPlaneCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivatPilotPlaneCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? typeCertificatesId = null,
  }) {
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
            typeCertificatesId: null == typeCertificatesId
                ? _value.typeCertificatesId
                : typeCertificatesId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrivatPilotPlaneCategoryDtoImplCopyWith<$Res>
    implements $PrivatPilotPlaneCategoryDtoCopyWith<$Res> {
  factory _$$PrivatPilotPlaneCategoryDtoImplCopyWith(
    _$PrivatPilotPlaneCategoryDtoImpl value,
    $Res Function(_$PrivatPilotPlaneCategoryDtoImpl) then,
  ) = __$$PrivatPilotPlaneCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String image, int typeCertificatesId});
}

/// @nodoc
class __$$PrivatPilotPlaneCategoryDtoImplCopyWithImpl<$Res>
    extends
        _$PrivatPilotPlaneCategoryDtoCopyWithImpl<
          $Res,
          _$PrivatPilotPlaneCategoryDtoImpl
        >
    implements _$$PrivatPilotPlaneCategoryDtoImplCopyWith<$Res> {
  __$$PrivatPilotPlaneCategoryDtoImplCopyWithImpl(
    _$PrivatPilotPlaneCategoryDtoImpl _value,
    $Res Function(_$PrivatPilotPlaneCategoryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrivatPilotPlaneCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? typeCertificatesId = null,
  }) {
    return _then(
      _$PrivatPilotPlaneCategoryDtoImpl(
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
        typeCertificatesId: null == typeCertificatesId
            ? _value.typeCertificatesId
            : typeCertificatesId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PrivatPilotPlaneCategoryDtoImpl
    implements _PrivatPilotPlaneCategoryDto {
  const _$PrivatPilotPlaneCategoryDtoImpl({
    required this.id,
    required this.title,
    required this.image,
    required this.typeCertificatesId,
  });

  factory _$PrivatPilotPlaneCategoryDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$PrivatPilotPlaneCategoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String image;
  @override
  final int typeCertificatesId;

  @override
  String toString() {
    return 'PrivatPilotPlaneCategoryDto(id: $id, title: $title, image: $image, typeCertificatesId: $typeCertificatesId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivatPilotPlaneCategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.typeCertificatesId, typeCertificatesId) ||
                other.typeCertificatesId == typeCertificatesId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, typeCertificatesId);

  /// Create a copy of PrivatPilotPlaneCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivatPilotPlaneCategoryDtoImplCopyWith<_$PrivatPilotPlaneCategoryDtoImpl>
  get copyWith =>
      __$$PrivatPilotPlaneCategoryDtoImplCopyWithImpl<
        _$PrivatPilotPlaneCategoryDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivatPilotPlaneCategoryDtoImplToJson(this);
  }
}

abstract class _PrivatPilotPlaneCategoryDto
    implements PrivatPilotPlaneCategoryDto {
  const factory _PrivatPilotPlaneCategoryDto({
    required final int id,
    required final String title,
    required final String image,
    required final int typeCertificatesId,
  }) = _$PrivatPilotPlaneCategoryDtoImpl;

  factory _PrivatPilotPlaneCategoryDto.fromJson(Map<String, dynamic> json) =
      _$PrivatPilotPlaneCategoryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get image;
  @override
  int get typeCertificatesId;

  /// Create a copy of PrivatPilotPlaneCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivatPilotPlaneCategoryDtoImplCopyWith<_$PrivatPilotPlaneCategoryDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
