// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_categories_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NormalCategoriesDto _$NormalCategoriesDtoFromJson(Map<String, dynamic> json) {
  return _NormalCategoriesDto.fromJson(json);
}

/// @nodoc
mixin _$NormalCategoriesDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  int get mainCategoryId => throw _privateConstructorUsedError;
  String get titleEng => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;

  /// Serializes this NormalCategoriesDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NormalCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NormalCategoriesDtoCopyWith<NormalCategoriesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormalCategoriesDtoCopyWith<$Res> {
  factory $NormalCategoriesDtoCopyWith(
          NormalCategoriesDto value, $Res Function(NormalCategoriesDto) then) =
      _$NormalCategoriesDtoCopyWithImpl<$Res, NormalCategoriesDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      String subTitle,
      int mainCategoryId,
      String titleEng,
      String picture});
}

/// @nodoc
class _$NormalCategoriesDtoCopyWithImpl<$Res, $Val extends NormalCategoriesDto>
    implements $NormalCategoriesDtoCopyWith<$Res> {
  _$NormalCategoriesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NormalCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subTitle = null,
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
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NormalCategoriesDtoImplCopyWith<$Res>
    implements $NormalCategoriesDtoCopyWith<$Res> {
  factory _$$NormalCategoriesDtoImplCopyWith(_$NormalCategoriesDtoImpl value,
          $Res Function(_$NormalCategoriesDtoImpl) then) =
      __$$NormalCategoriesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String subTitle,
      int mainCategoryId,
      String titleEng,
      String picture});
}

/// @nodoc
class __$$NormalCategoriesDtoImplCopyWithImpl<$Res>
    extends _$NormalCategoriesDtoCopyWithImpl<$Res, _$NormalCategoriesDtoImpl>
    implements _$$NormalCategoriesDtoImplCopyWith<$Res> {
  __$$NormalCategoriesDtoImplCopyWithImpl(_$NormalCategoriesDtoImpl _value,
      $Res Function(_$NormalCategoriesDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NormalCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subTitle = null,
    Object? mainCategoryId = null,
    Object? titleEng = null,
    Object? picture = null,
  }) {
    return _then(_$NormalCategoriesDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
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

@JsonSerializable(fieldRename: FieldRename.snake)
class _$NormalCategoriesDtoImpl implements _NormalCategoriesDto {
  const _$NormalCategoriesDtoImpl(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.mainCategoryId,
      required this.titleEng,
      required this.picture});

  factory _$NormalCategoriesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NormalCategoriesDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final int mainCategoryId;
  @override
  final String titleEng;
  @override
  final String picture;

  @override
  String toString() {
    return 'NormalCategoriesDto(id: $id, title: $title, subTitle: $subTitle, mainCategoryId: $mainCategoryId, titleEng: $titleEng, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalCategoriesDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.mainCategoryId, mainCategoryId) ||
                other.mainCategoryId == mainCategoryId) &&
            (identical(other.titleEng, titleEng) ||
                other.titleEng == titleEng) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, subTitle, mainCategoryId, titleEng, picture);

  /// Create a copy of NormalCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalCategoriesDtoImplCopyWith<_$NormalCategoriesDtoImpl> get copyWith =>
      __$$NormalCategoriesDtoImplCopyWithImpl<_$NormalCategoriesDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NormalCategoriesDtoImplToJson(
      this,
    );
  }
}

abstract class _NormalCategoriesDto implements NormalCategoriesDto {
  const factory _NormalCategoriesDto(
      {required final int id,
      required final String title,
      required final String subTitle,
      required final int mainCategoryId,
      required final String titleEng,
      required final String picture}) = _$NormalCategoriesDtoImpl;

  factory _NormalCategoriesDto.fromJson(Map<String, dynamic> json) =
      _$NormalCategoriesDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get subTitle;
  @override
  int get mainCategoryId;
  @override
  String get titleEng;
  @override
  String get picture;

  /// Create a copy of NormalCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NormalCategoriesDtoImplCopyWith<_$NormalCategoriesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
