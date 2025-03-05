// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight_inspection_categories_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreflightInspectionCategoriesDto _$PreflightInspectionCategoriesDtoFromJson(
    Map<String, dynamic> json) {
  return _PreflightInspectionCategoriesDto.fromJson(json);
}

/// @nodoc
mixin _$PreflightInspectionCategoriesDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get mainCategoryId => throw _privateConstructorUsedError;
  String get titleEng => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;

  /// Serializes this PreflightInspectionCategoriesDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreflightInspectionCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreflightInspectionCategoriesDtoCopyWith<PreflightInspectionCategoriesDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflightInspectionCategoriesDtoCopyWith<$Res> {
  factory $PreflightInspectionCategoriesDtoCopyWith(
          PreflightInspectionCategoriesDto value,
          $Res Function(PreflightInspectionCategoriesDto) then) =
      _$PreflightInspectionCategoriesDtoCopyWithImpl<$Res,
          PreflightInspectionCategoriesDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      int mainCategoryId,
      String titleEng,
      String picture});
}

/// @nodoc
class _$PreflightInspectionCategoriesDtoCopyWithImpl<$Res,
        $Val extends PreflightInspectionCategoriesDto>
    implements $PreflightInspectionCategoriesDtoCopyWith<$Res> {
  _$PreflightInspectionCategoriesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreflightInspectionCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? mainCategoryId = null,
    Object? titleEng = null,
    Object? picture = null,
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
      mainCategoryId: null == mainCategoryId
          ? _value.mainCategoryId
          : mainCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      titleEng: null == titleEng
          ? _value.titleEng
          : titleEng // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreflightInspectionCategoriesDtoImplCopyWith<$Res>
    implements $PreflightInspectionCategoriesDtoCopyWith<$Res> {
  factory _$$PreflightInspectionCategoriesDtoImplCopyWith(
          _$PreflightInspectionCategoriesDtoImpl value,
          $Res Function(_$PreflightInspectionCategoriesDtoImpl) then) =
      __$$PreflightInspectionCategoriesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      int mainCategoryId,
      String titleEng,
      String picture});
}

/// @nodoc
class __$$PreflightInspectionCategoriesDtoImplCopyWithImpl<$Res>
    extends _$PreflightInspectionCategoriesDtoCopyWithImpl<$Res,
        _$PreflightInspectionCategoriesDtoImpl>
    implements _$$PreflightInspectionCategoriesDtoImplCopyWith<$Res> {
  __$$PreflightInspectionCategoriesDtoImplCopyWithImpl(
      _$PreflightInspectionCategoriesDtoImpl _value,
      $Res Function(_$PreflightInspectionCategoriesDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreflightInspectionCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? mainCategoryId = null,
    Object? titleEng = null,
    Object? picture = null,
  }) {
    return _then(_$PreflightInspectionCategoriesDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mainCategoryId: null == mainCategoryId
          ? _value.mainCategoryId
          : mainCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      titleEng: null == titleEng
          ? _value.titleEng
          : titleEng // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreflightInspectionCategoriesDtoImpl
    implements _PreflightInspectionCategoriesDto {
  const _$PreflightInspectionCategoriesDtoImpl(
      {required this.id,
      required this.title,
      required this.mainCategoryId,
      required this.titleEng,
      required this.picture});

  factory _$PreflightInspectionCategoriesDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PreflightInspectionCategoriesDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final int mainCategoryId;
  @override
  final String titleEng;
  @override
  final String picture;

  @override
  String toString() {
    return 'PreflightInspectionCategoriesDto(id: $id, title: $title, mainCategoryId: $mainCategoryId, titleEng: $titleEng, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreflightInspectionCategoriesDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mainCategoryId, mainCategoryId) ||
                other.mainCategoryId == mainCategoryId) &&
            (identical(other.titleEng, titleEng) ||
                other.titleEng == titleEng) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, mainCategoryId, titleEng, picture);

  /// Create a copy of PreflightInspectionCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreflightInspectionCategoriesDtoImplCopyWith<
          _$PreflightInspectionCategoriesDtoImpl>
      get copyWith => __$$PreflightInspectionCategoriesDtoImplCopyWithImpl<
          _$PreflightInspectionCategoriesDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreflightInspectionCategoriesDtoImplToJson(
      this,
    );
  }
}

abstract class _PreflightInspectionCategoriesDto
    implements PreflightInspectionCategoriesDto {
  const factory _PreflightInspectionCategoriesDto(
      {required final int id,
      required final String title,
      required final int mainCategoryId,
      required final String titleEng,
      required final String picture}) = _$PreflightInspectionCategoriesDtoImpl;

  factory _PreflightInspectionCategoriesDto.fromJson(
          Map<String, dynamic> json) =
      _$PreflightInspectionCategoriesDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  int get mainCategoryId;
  @override
  String get titleEng;
  @override
  String get picture;

  /// Create a copy of PreflightInspectionCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreflightInspectionCategoriesDtoImplCopyWith<
          _$PreflightInspectionCategoriesDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
