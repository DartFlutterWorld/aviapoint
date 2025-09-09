// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CacheManagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStoriesCacheManagerEvent value) getStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoriesCacheManagerEvent value)? getStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoriesCacheManagerEvent value)? getStories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheManagerEventCopyWith<$Res> {
  factory $CacheManagerEventCopyWith(
          CacheManagerEvent value, $Res Function(CacheManagerEvent) then) =
      _$CacheManagerEventCopyWithImpl<$Res, CacheManagerEvent>;
}

/// @nodoc
class _$CacheManagerEventCopyWithImpl<$Res, $Val extends CacheManagerEvent>
    implements $CacheManagerEventCopyWith<$Res> {
  _$CacheManagerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CacheManagerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetStoriesCacheManagerEventImplCopyWith<$Res> {
  factory _$$GetStoriesCacheManagerEventImplCopyWith(
          _$GetStoriesCacheManagerEventImpl value,
          $Res Function(_$GetStoriesCacheManagerEventImpl) then) =
      __$$GetStoriesCacheManagerEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetStoriesCacheManagerEventImplCopyWithImpl<$Res>
    extends _$CacheManagerEventCopyWithImpl<$Res,
        _$GetStoriesCacheManagerEventImpl>
    implements _$$GetStoriesCacheManagerEventImplCopyWith<$Res> {
  __$$GetStoriesCacheManagerEventImplCopyWithImpl(
      _$GetStoriesCacheManagerEventImpl _value,
      $Res Function(_$GetStoriesCacheManagerEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CacheManagerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetStoriesCacheManagerEventImpl extends GetStoriesCacheManagerEvent
    with DiagnosticableTreeMixin {
  const _$GetStoriesCacheManagerEventImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CacheManagerEvent.getStories()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CacheManagerEvent.getStories'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStoriesCacheManagerEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStories,
  }) {
    return getStories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStories,
  }) {
    return getStories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStories,
    required TResult orElse(),
  }) {
    if (getStories != null) {
      return getStories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStoriesCacheManagerEvent value) getStories,
  }) {
    return getStories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoriesCacheManagerEvent value)? getStories,
  }) {
    return getStories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoriesCacheManagerEvent value)? getStories,
    required TResult orElse(),
  }) {
    if (getStories != null) {
      return getStories(this);
    }
    return orElse();
  }
}

abstract class GetStoriesCacheManagerEvent extends CacheManagerEvent {
  const factory GetStoriesCacheManagerEvent() =
      _$GetStoriesCacheManagerEventImpl;
  const GetStoriesCacheManagerEvent._() : super._();
}

/// @nodoc
mixin _$CacheManagerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<StoryEntity> story) success,
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
    TResult? Function(List<StoryEntity> story)? success,
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
    TResult Function(List<StoryEntity> story)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCacheManagerState value) loading,
    required TResult Function(ErrorCacheManagerState value) error,
    required TResult Function(SuccessCacheManagerState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCacheManagerState value)? loading,
    TResult? Function(ErrorCacheManagerState value)? error,
    TResult? Function(SuccessCacheManagerState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCacheManagerState value)? loading,
    TResult Function(ErrorCacheManagerState value)? error,
    TResult Function(SuccessCacheManagerState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheManagerStateCopyWith<$Res> {
  factory $CacheManagerStateCopyWith(
          CacheManagerState value, $Res Function(CacheManagerState) then) =
      _$CacheManagerStateCopyWithImpl<$Res, CacheManagerState>;
}

/// @nodoc
class _$CacheManagerStateCopyWithImpl<$Res, $Val extends CacheManagerState>
    implements $CacheManagerStateCopyWith<$Res> {
  _$CacheManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CacheManagerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingCacheManagerStateImplCopyWith<$Res> {
  factory _$$LoadingCacheManagerStateImplCopyWith(
          _$LoadingCacheManagerStateImpl value,
          $Res Function(_$LoadingCacheManagerStateImpl) then) =
      __$$LoadingCacheManagerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCacheManagerStateImplCopyWithImpl<$Res>
    extends _$CacheManagerStateCopyWithImpl<$Res,
        _$LoadingCacheManagerStateImpl>
    implements _$$LoadingCacheManagerStateImplCopyWith<$Res> {
  __$$LoadingCacheManagerStateImplCopyWithImpl(
      _$LoadingCacheManagerStateImpl _value,
      $Res Function(_$LoadingCacheManagerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CacheManagerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingCacheManagerStateImpl extends LoadingCacheManagerState
    with DiagnosticableTreeMixin {
  const _$LoadingCacheManagerStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CacheManagerState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CacheManagerState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingCacheManagerStateImpl);
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
    required TResult Function(List<StoryEntity> story) success,
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
    TResult? Function(List<StoryEntity> story)? success,
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
    TResult Function(List<StoryEntity> story)? success,
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
    required TResult Function(LoadingCacheManagerState value) loading,
    required TResult Function(ErrorCacheManagerState value) error,
    required TResult Function(SuccessCacheManagerState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCacheManagerState value)? loading,
    TResult? Function(ErrorCacheManagerState value)? error,
    TResult? Function(SuccessCacheManagerState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCacheManagerState value)? loading,
    TResult Function(ErrorCacheManagerState value)? error,
    TResult Function(SuccessCacheManagerState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCacheManagerState extends CacheManagerState {
  const factory LoadingCacheManagerState() = _$LoadingCacheManagerStateImpl;
  const LoadingCacheManagerState._() : super._();
}

/// @nodoc
abstract class _$$ErrorCacheManagerStateImplCopyWith<$Res> {
  factory _$$ErrorCacheManagerStateImplCopyWith(
          _$ErrorCacheManagerStateImpl value,
          $Res Function(_$ErrorCacheManagerStateImpl) then) =
      __$$ErrorCacheManagerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorCacheManagerStateImplCopyWithImpl<$Res>
    extends _$CacheManagerStateCopyWithImpl<$Res, _$ErrorCacheManagerStateImpl>
    implements _$$ErrorCacheManagerStateImplCopyWith<$Res> {
  __$$ErrorCacheManagerStateImplCopyWithImpl(
      _$ErrorCacheManagerStateImpl _value,
      $Res Function(_$ErrorCacheManagerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CacheManagerState
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
    return _then(_$ErrorCacheManagerStateImpl(
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

class _$ErrorCacheManagerStateImpl extends ErrorCacheManagerState
    with DiagnosticableTreeMixin {
  const _$ErrorCacheManagerStateImpl(
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CacheManagerState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CacheManagerState.error'))
      ..add(DiagnosticsProperty('errorFromApi', errorFromApi))
      ..add(DiagnosticsProperty('errorForUser', errorForUser))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('stackTrace', stackTrace))
      ..add(DiagnosticsProperty('responseMessage', responseMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorCacheManagerStateImpl &&
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

  /// Create a copy of CacheManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCacheManagerStateImplCopyWith<_$ErrorCacheManagerStateImpl>
      get copyWith => __$$ErrorCacheManagerStateImplCopyWithImpl<
          _$ErrorCacheManagerStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<StoryEntity> story) success,
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
    TResult? Function(List<StoryEntity> story)? success,
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
    TResult Function(List<StoryEntity> story)? success,
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
    required TResult Function(LoadingCacheManagerState value) loading,
    required TResult Function(ErrorCacheManagerState value) error,
    required TResult Function(SuccessCacheManagerState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCacheManagerState value)? loading,
    TResult? Function(ErrorCacheManagerState value)? error,
    TResult? Function(SuccessCacheManagerState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCacheManagerState value)? loading,
    TResult Function(ErrorCacheManagerState value)? error,
    TResult Function(SuccessCacheManagerState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCacheManagerState extends CacheManagerState {
  const factory ErrorCacheManagerState(
      {final String? errorFromApi,
      required final String errorForUser,
      final String? statusCode,
      final StackTrace? stackTrace,
      final String? responseMessage}) = _$ErrorCacheManagerStateImpl;
  const ErrorCacheManagerState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of CacheManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorCacheManagerStateImplCopyWith<_$ErrorCacheManagerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCacheManagerStateImplCopyWith<$Res> {
  factory _$$SuccessCacheManagerStateImplCopyWith(
          _$SuccessCacheManagerStateImpl value,
          $Res Function(_$SuccessCacheManagerStateImpl) then) =
      __$$SuccessCacheManagerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StoryEntity> story});
}

/// @nodoc
class __$$SuccessCacheManagerStateImplCopyWithImpl<$Res>
    extends _$CacheManagerStateCopyWithImpl<$Res,
        _$SuccessCacheManagerStateImpl>
    implements _$$SuccessCacheManagerStateImplCopyWith<$Res> {
  __$$SuccessCacheManagerStateImplCopyWithImpl(
      _$SuccessCacheManagerStateImpl _value,
      $Res Function(_$SuccessCacheManagerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CacheManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story = null,
  }) {
    return _then(_$SuccessCacheManagerStateImpl(
      story: null == story
          ? _value._story
          : story // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessCacheManagerStateImpl extends SuccessCacheManagerState
    with DiagnosticableTreeMixin {
  const _$SuccessCacheManagerStateImpl({required final List<StoryEntity> story})
      : _story = story,
        super._();

  final List<StoryEntity> _story;
  @override
  List<StoryEntity> get story {
    if (_story is EqualUnmodifiableListView) return _story;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_story);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CacheManagerState.success(story: $story)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CacheManagerState.success'))
      ..add(DiagnosticsProperty('story', story));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCacheManagerStateImpl &&
            const DeepCollectionEquality().equals(other._story, _story));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_story));

  /// Create a copy of CacheManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCacheManagerStateImplCopyWith<_$SuccessCacheManagerStateImpl>
      get copyWith => __$$SuccessCacheManagerStateImplCopyWithImpl<
          _$SuccessCacheManagerStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<StoryEntity> story) success,
  }) {
    return success(story);
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
    TResult? Function(List<StoryEntity> story)? success,
  }) {
    return success?.call(story);
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
    TResult Function(List<StoryEntity> story)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(story);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCacheManagerState value) loading,
    required TResult Function(ErrorCacheManagerState value) error,
    required TResult Function(SuccessCacheManagerState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCacheManagerState value)? loading,
    TResult? Function(ErrorCacheManagerState value)? error,
    TResult? Function(SuccessCacheManagerState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCacheManagerState value)? loading,
    TResult Function(ErrorCacheManagerState value)? error,
    TResult Function(SuccessCacheManagerState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessCacheManagerState extends CacheManagerState {
  const factory SuccessCacheManagerState(
          {required final List<StoryEntity> story}) =
      _$SuccessCacheManagerStateImpl;
  const SuccessCacheManagerState._() : super._();

  List<StoryEntity> get story;

  /// Create a copy of CacheManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessCacheManagerStateImplCopyWith<_$SuccessCacheManagerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
