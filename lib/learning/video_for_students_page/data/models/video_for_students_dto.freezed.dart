// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_for_students_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoForStudentsDto _$VideoForStudentsDtoFromJson(Map<String, dynamic> json) {
  return _VideoForStudentsDto.fromJson(json);
}

/// @nodoc
mixin _$VideoForStudentsDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this VideoForStudentsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoForStudentsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoForStudentsDtoCopyWith<VideoForStudentsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoForStudentsDtoCopyWith<$Res> {
  factory $VideoForStudentsDtoCopyWith(
          VideoForStudentsDto value, $Res Function(VideoForStudentsDto) then) =
      _$VideoForStudentsDtoCopyWithImpl<$Res, VideoForStudentsDto>;
  @useResult
  $Res call({int id, String title, String fileName, String url});
}

/// @nodoc
class _$VideoForStudentsDtoCopyWithImpl<$Res, $Val extends VideoForStudentsDto>
    implements $VideoForStudentsDtoCopyWith<$Res> {
  _$VideoForStudentsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoForStudentsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? fileName = null,
    Object? url = null,
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
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoForStudentsDtoImplCopyWith<$Res>
    implements $VideoForStudentsDtoCopyWith<$Res> {
  factory _$$VideoForStudentsDtoImplCopyWith(_$VideoForStudentsDtoImpl value,
          $Res Function(_$VideoForStudentsDtoImpl) then) =
      __$$VideoForStudentsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String fileName, String url});
}

/// @nodoc
class __$$VideoForStudentsDtoImplCopyWithImpl<$Res>
    extends _$VideoForStudentsDtoCopyWithImpl<$Res, _$VideoForStudentsDtoImpl>
    implements _$$VideoForStudentsDtoImplCopyWith<$Res> {
  __$$VideoForStudentsDtoImplCopyWithImpl(_$VideoForStudentsDtoImpl _value,
      $Res Function(_$VideoForStudentsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoForStudentsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? fileName = null,
    Object? url = null,
  }) {
    return _then(_$VideoForStudentsDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoForStudentsDtoImpl implements _VideoForStudentsDto {
  const _$VideoForStudentsDtoImpl(
      {required this.id,
      required this.title,
      required this.fileName,
      required this.url});

  factory _$VideoForStudentsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoForStudentsDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String fileName;
  @override
  final String url;

  @override
  String toString() {
    return 'VideoForStudentsDto(id: $id, title: $title, fileName: $fileName, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoForStudentsDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, fileName, url);

  /// Create a copy of VideoForStudentsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoForStudentsDtoImplCopyWith<_$VideoForStudentsDtoImpl> get copyWith =>
      __$$VideoForStudentsDtoImplCopyWithImpl<_$VideoForStudentsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoForStudentsDtoImplToJson(
      this,
    );
  }
}

abstract class _VideoForStudentsDto implements VideoForStudentsDto {
  const factory _VideoForStudentsDto(
      {required final int id,
      required final String title,
      required final String fileName,
      required final String url}) = _$VideoForStudentsDtoImpl;

  factory _VideoForStudentsDto.fromJson(Map<String, dynamic> json) =
      _$VideoForStudentsDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get fileName;
  @override
  String get url;

  /// Create a copy of VideoForStudentsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoForStudentsDtoImplCopyWith<_$VideoForStudentsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
