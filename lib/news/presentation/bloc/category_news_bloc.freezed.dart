// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryNewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCategoryNewsEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCategoryNewsEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCategoryNewsEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryNewsEventCopyWith<$Res> {
  factory $CategoryNewsEventCopyWith(
          CategoryNewsEvent value, $Res Function(CategoryNewsEvent) then) =
      _$CategoryNewsEventCopyWithImpl<$Res, CategoryNewsEvent>;
}

/// @nodoc
class _$CategoryNewsEventCopyWithImpl<$Res, $Val extends CategoryNewsEvent>
    implements $CategoryNewsEventCopyWith<$Res> {
  _$CategoryNewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryNewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetCategoryNewsEventImplCopyWith<$Res> {
  factory _$$GetCategoryNewsEventImplCopyWith(_$GetCategoryNewsEventImpl value,
          $Res Function(_$GetCategoryNewsEventImpl) then) =
      __$$GetCategoryNewsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCategoryNewsEventImplCopyWithImpl<$Res>
    extends _$CategoryNewsEventCopyWithImpl<$Res, _$GetCategoryNewsEventImpl>
    implements _$$GetCategoryNewsEventImplCopyWith<$Res> {
  __$$GetCategoryNewsEventImplCopyWithImpl(_$GetCategoryNewsEventImpl _value,
      $Res Function(_$GetCategoryNewsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryNewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetCategoryNewsEventImpl extends GetCategoryNewsEvent {
  const _$GetCategoryNewsEventImpl() : super._();

  @override
  String toString() {
    return 'CategoryNewsEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCategoryNewsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCategoryNewsEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCategoryNewsEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCategoryNewsEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetCategoryNewsEvent extends CategoryNewsEvent {
  const factory GetCategoryNewsEvent() = _$GetCategoryNewsEventImpl;
  const GetCategoryNewsEvent._() : super._();
}

/// @nodoc
mixin _$CategoryNewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<CategoryNewsEntity> categoryNews) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult? Function(List<CategoryNewsEntity> categoryNews)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult Function(List<CategoryNewsEntity> categoryNews)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCategoryNewsState value) loading,
    required TResult Function(ErrorCategoryNewsState value) error,
    required TResult Function(SuccessCategoryNewsState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoryNewsState value)? loading,
    TResult? Function(ErrorCategoryNewsState value)? error,
    TResult? Function(SuccessCategoryNewsState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoryNewsState value)? loading,
    TResult Function(ErrorCategoryNewsState value)? error,
    TResult Function(SuccessCategoryNewsState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryNewsStateCopyWith<$Res> {
  factory $CategoryNewsStateCopyWith(
          CategoryNewsState value, $Res Function(CategoryNewsState) then) =
      _$CategoryNewsStateCopyWithImpl<$Res, CategoryNewsState>;
}

/// @nodoc
class _$CategoryNewsStateCopyWithImpl<$Res, $Val extends CategoryNewsState>
    implements $CategoryNewsStateCopyWith<$Res> {
  _$CategoryNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingCategoryNewsStateImplCopyWith<$Res> {
  factory _$$LoadingCategoryNewsStateImplCopyWith(
          _$LoadingCategoryNewsStateImpl value,
          $Res Function(_$LoadingCategoryNewsStateImpl) then) =
      __$$LoadingCategoryNewsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCategoryNewsStateImplCopyWithImpl<$Res>
    extends _$CategoryNewsStateCopyWithImpl<$Res,
        _$LoadingCategoryNewsStateImpl>
    implements _$$LoadingCategoryNewsStateImplCopyWith<$Res> {
  __$$LoadingCategoryNewsStateImplCopyWithImpl(
      _$LoadingCategoryNewsStateImpl _value,
      $Res Function(_$LoadingCategoryNewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingCategoryNewsStateImpl extends LoadingCategoryNewsState {
  const _$LoadingCategoryNewsStateImpl() : super._();

  @override
  String toString() {
    return 'CategoryNewsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingCategoryNewsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<CategoryNewsEntity> categoryNews) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult? Function(List<CategoryNewsEntity> categoryNews)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult Function(List<CategoryNewsEntity> categoryNews)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCategoryNewsState value) loading,
    required TResult Function(ErrorCategoryNewsState value) error,
    required TResult Function(SuccessCategoryNewsState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoryNewsState value)? loading,
    TResult? Function(ErrorCategoryNewsState value)? error,
    TResult? Function(SuccessCategoryNewsState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoryNewsState value)? loading,
    TResult Function(ErrorCategoryNewsState value)? error,
    TResult Function(SuccessCategoryNewsState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCategoryNewsState extends CategoryNewsState {
  const factory LoadingCategoryNewsState() = _$LoadingCategoryNewsStateImpl;
  const LoadingCategoryNewsState._() : super._();
}

/// @nodoc
abstract class _$$ErrorCategoryNewsStateImplCopyWith<$Res> {
  factory _$$ErrorCategoryNewsStateImplCopyWith(
          _$ErrorCategoryNewsStateImpl value,
          $Res Function(_$ErrorCategoryNewsStateImpl) then) =
      __$$ErrorCategoryNewsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorCategoryNewsStateImplCopyWithImpl<$Res>
    extends _$CategoryNewsStateCopyWithImpl<$Res, _$ErrorCategoryNewsStateImpl>
    implements _$$ErrorCategoryNewsStateImplCopyWith<$Res> {
  __$$ErrorCategoryNewsStateImplCopyWithImpl(
      _$ErrorCategoryNewsStateImpl _value,
      $Res Function(_$ErrorCategoryNewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorFromApi = freezed,
    Object? errorForUser = null,
    Object? statusCode = freezed,
    Object? stackTrace = freezed,
    Object? responseMessage = freezed,
  }) {
    return _then(_$ErrorCategoryNewsStateImpl(
      errorFromApi: freezed == errorFromApi
          ? _value.errorFromApi
          : errorFromApi // ignore: cast_nullable_to_non_nullable
              as String?,
      errorForUser: null == errorForUser
          ? _value.errorForUser
          : errorForUser // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorCategoryNewsStateImpl extends ErrorCategoryNewsState {
  const _$ErrorCategoryNewsStateImpl(
      {this.errorFromApi,
      required this.errorForUser,
      this.statusCode,
      this.stackTrace,
      this.responseMessage})
      : super._();

  @override
  final String? errorFromApi;
  @override
  final String errorForUser;
  @override
  final String? statusCode;
  @override
  final StackTrace? stackTrace;
  @override
  final String? responseMessage;

  @override
  String toString() {
    return 'CategoryNewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorCategoryNewsStateImpl &&
            (identical(other.errorFromApi, errorFromApi) ||
                other.errorFromApi == errorFromApi) &&
            (identical(other.errorForUser, errorForUser) ||
                other.errorForUser == errorForUser) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorFromApi, errorForUser,
      statusCode, stackTrace, responseMessage);

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCategoryNewsStateImplCopyWith<_$ErrorCategoryNewsStateImpl>
      get copyWith => __$$ErrorCategoryNewsStateImplCopyWithImpl<
          _$ErrorCategoryNewsStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<CategoryNewsEntity> categoryNews) success,
  }) {
    return error(
        errorFromApi, errorForUser, statusCode, stackTrace, responseMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult? Function(List<CategoryNewsEntity> categoryNews)? success,
  }) {
    return error?.call(
        errorFromApi, errorForUser, statusCode, stackTrace, responseMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult Function(List<CategoryNewsEntity> categoryNews)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(
          errorFromApi, errorForUser, statusCode, stackTrace, responseMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCategoryNewsState value) loading,
    required TResult Function(ErrorCategoryNewsState value) error,
    required TResult Function(SuccessCategoryNewsState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoryNewsState value)? loading,
    TResult? Function(ErrorCategoryNewsState value)? error,
    TResult? Function(SuccessCategoryNewsState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoryNewsState value)? loading,
    TResult Function(ErrorCategoryNewsState value)? error,
    TResult Function(SuccessCategoryNewsState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCategoryNewsState extends CategoryNewsState {
  const factory ErrorCategoryNewsState(
      {final String? errorFromApi,
      required final String errorForUser,
      final String? statusCode,
      final StackTrace? stackTrace,
      final String? responseMessage}) = _$ErrorCategoryNewsStateImpl;
  const ErrorCategoryNewsState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorCategoryNewsStateImplCopyWith<_$ErrorCategoryNewsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCategoryNewsStateImplCopyWith<$Res> {
  factory _$$SuccessCategoryNewsStateImplCopyWith(
          _$SuccessCategoryNewsStateImpl value,
          $Res Function(_$SuccessCategoryNewsStateImpl) then) =
      __$$SuccessCategoryNewsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryNewsEntity> categoryNews});
}

/// @nodoc
class __$$SuccessCategoryNewsStateImplCopyWithImpl<$Res>
    extends _$CategoryNewsStateCopyWithImpl<$Res,
        _$SuccessCategoryNewsStateImpl>
    implements _$$SuccessCategoryNewsStateImplCopyWith<$Res> {
  __$$SuccessCategoryNewsStateImplCopyWithImpl(
      _$SuccessCategoryNewsStateImpl _value,
      $Res Function(_$SuccessCategoryNewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryNews = null,
  }) {
    return _then(_$SuccessCategoryNewsStateImpl(
      categoryNews: null == categoryNews
          ? _value._categoryNews
          : categoryNews // ignore: cast_nullable_to_non_nullable
              as List<CategoryNewsEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessCategoryNewsStateImpl extends SuccessCategoryNewsState {
  const _$SuccessCategoryNewsStateImpl(
      {required final List<CategoryNewsEntity> categoryNews})
      : _categoryNews = categoryNews,
        super._();

  final List<CategoryNewsEntity> _categoryNews;
  @override
  List<CategoryNewsEntity> get categoryNews {
    if (_categoryNews is EqualUnmodifiableListView) return _categoryNews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryNews);
  }

  @override
  String toString() {
    return 'CategoryNewsState.success(categoryNews: $categoryNews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCategoryNewsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryNews, _categoryNews));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoryNews));

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCategoryNewsStateImplCopyWith<_$SuccessCategoryNewsStateImpl>
      get copyWith => __$$SuccessCategoryNewsStateImplCopyWithImpl<
          _$SuccessCategoryNewsStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<CategoryNewsEntity> categoryNews) success,
  }) {
    return success(categoryNews);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult? Function(List<CategoryNewsEntity> categoryNews)? success,
  }) {
    return success?.call(categoryNews);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            String? errorFromApi,
            String errorForUser,
            String? statusCode,
            StackTrace? stackTrace,
            String? responseMessage)?
        error,
    TResult Function(List<CategoryNewsEntity> categoryNews)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categoryNews);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCategoryNewsState value) loading,
    required TResult Function(ErrorCategoryNewsState value) error,
    required TResult Function(SuccessCategoryNewsState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoryNewsState value)? loading,
    TResult? Function(ErrorCategoryNewsState value)? error,
    TResult? Function(SuccessCategoryNewsState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoryNewsState value)? loading,
    TResult Function(ErrorCategoryNewsState value)? error,
    TResult Function(SuccessCategoryNewsState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessCategoryNewsState extends CategoryNewsState {
  const factory SuccessCategoryNewsState(
          {required final List<CategoryNewsEntity> categoryNews}) =
      _$SuccessCategoryNewsStateImpl;
  const SuccessCategoryNewsState._() : super._();

  List<CategoryNewsEntity> get categoryNews;

  /// Create a copy of CategoryNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessCategoryNewsStateImplCopyWith<_$SuccessCategoryNewsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
