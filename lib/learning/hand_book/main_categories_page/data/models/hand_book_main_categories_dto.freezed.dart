// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hand_book_main_categories_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HandBookMainCategoriesDto _$HandBookMainCategoriesDtoFromJson(
    Map<String, dynamic> json) {
  return _HandBookMainCategoriesDto.fromJson(json);
}

/// @nodoc
mixin _$HandBookMainCategoriesDto {
  int get mainCategoryId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;

  /// Serializes this HandBookMainCategoriesDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HandBookMainCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HandBookMainCategoriesDtoCopyWith<HandBookMainCategoriesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandBookMainCategoriesDtoCopyWith<$Res> {
  factory $HandBookMainCategoriesDtoCopyWith(HandBookMainCategoriesDto value,
          $Res Function(HandBookMainCategoriesDto) then) =
      _$HandBookMainCategoriesDtoCopyWithImpl<$Res, HandBookMainCategoriesDto>;
  @useResult
  $Res call(
      {int mainCategoryId, String title, String subTitle, String picture});
}

/// @nodoc
class _$HandBookMainCategoriesDtoCopyWithImpl<$Res,
        $Val extends HandBookMainCategoriesDto>
    implements $HandBookMainCategoriesDtoCopyWith<$Res> {
  _$HandBookMainCategoriesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HandBookMainCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainCategoryId = null,
    Object? title = null,
    Object? subTitle = null,
    Object? picture = null,
  }) {
    return _then(_value.copyWith(
      mainCategoryId: null == mainCategoryId
          ? _value.mainCategoryId
          : mainCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HandBookMainCategoriesDtoImplCopyWith<$Res>
    implements $HandBookMainCategoriesDtoCopyWith<$Res> {
  factory _$$HandBookMainCategoriesDtoImplCopyWith(
          _$HandBookMainCategoriesDtoImpl value,
          $Res Function(_$HandBookMainCategoriesDtoImpl) then) =
      __$$HandBookMainCategoriesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int mainCategoryId, String title, String subTitle, String picture});
}

/// @nodoc
class __$$HandBookMainCategoriesDtoImplCopyWithImpl<$Res>
    extends _$HandBookMainCategoriesDtoCopyWithImpl<$Res,
        _$HandBookMainCategoriesDtoImpl>
    implements _$$HandBookMainCategoriesDtoImplCopyWith<$Res> {
  __$$HandBookMainCategoriesDtoImplCopyWithImpl(
      _$HandBookMainCategoriesDtoImpl _value,
      $Res Function(_$HandBookMainCategoriesDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of HandBookMainCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainCategoryId = null,
    Object? title = null,
    Object? subTitle = null,
    Object? picture = null,
  }) {
    return _then(_$HandBookMainCategoriesDtoImpl(
      mainCategoryId: null == mainCategoryId
          ? _value.mainCategoryId
          : mainCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
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
class _$HandBookMainCategoriesDtoImpl implements _HandBookMainCategoriesDto {
  const _$HandBookMainCategoriesDtoImpl(
      {required this.mainCategoryId,
      required this.title,
      required this.subTitle,
      required this.picture});

  factory _$HandBookMainCategoriesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HandBookMainCategoriesDtoImplFromJson(json);

  @override
  final int mainCategoryId;
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final String picture;

  @override
  String toString() {
    return 'HandBookMainCategoriesDto(mainCategoryId: $mainCategoryId, title: $title, subTitle: $subTitle, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandBookMainCategoriesDtoImpl &&
            (identical(other.mainCategoryId, mainCategoryId) ||
                other.mainCategoryId == mainCategoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mainCategoryId, title, subTitle, picture);

  /// Create a copy of HandBookMainCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HandBookMainCategoriesDtoImplCopyWith<_$HandBookMainCategoriesDtoImpl>
      get copyWith => __$$HandBookMainCategoriesDtoImplCopyWithImpl<
          _$HandBookMainCategoriesDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HandBookMainCategoriesDtoImplToJson(
      this,
    );
  }
}

abstract class _HandBookMainCategoriesDto implements HandBookMainCategoriesDto {
  const factory _HandBookMainCategoriesDto(
      {required final int mainCategoryId,
      required final String title,
      required final String subTitle,
      required final String picture}) = _$HandBookMainCategoriesDtoImpl;

  factory _HandBookMainCategoriesDto.fromJson(Map<String, dynamic> json) =
      _$HandBookMainCategoriesDtoImpl.fromJson;

  @override
  int get mainCategoryId;
  @override
  String get title;
  @override
  String get subTitle;
  @override
  String get picture;

  /// Create a copy of HandBookMainCategoriesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HandBookMainCategoriesDtoImplCopyWith<_$HandBookMainCategoriesDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
