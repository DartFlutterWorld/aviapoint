// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailStoryEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailStoryEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailStoryEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailStoryEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DetailStoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailStoryEventCopyWith<DetailStoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoryEventCopyWith<$Res> {
  factory $DetailStoryEventCopyWith(
          DetailStoryEvent value, $Res Function(DetailStoryEvent) then) =
      _$DetailStoryEventCopyWithImpl<$Res, DetailStoryEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DetailStoryEventCopyWithImpl<$Res, $Val extends DetailStoryEvent>
    implements $DetailStoryEventCopyWith<$Res> {
  _$DetailStoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailStoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetDetailStoryEventImplCopyWith<$Res>
    implements $DetailStoryEventCopyWith<$Res> {
  factory _$$GetDetailStoryEventImplCopyWith(_$GetDetailStoryEventImpl value,
          $Res Function(_$GetDetailStoryEventImpl) then) =
      __$$GetDetailStoryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetDetailStoryEventImplCopyWithImpl<$Res>
    extends _$DetailStoryEventCopyWithImpl<$Res, _$GetDetailStoryEventImpl>
    implements _$$GetDetailStoryEventImplCopyWith<$Res> {
  __$$GetDetailStoryEventImplCopyWithImpl(_$GetDetailStoryEventImpl _value,
      $Res Function(_$GetDetailStoryEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailStoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetDetailStoryEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetDetailStoryEventImpl extends GetDetailStoryEvent {
  const _$GetDetailStoryEventImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'DetailStoryEvent.get(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailStoryEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DetailStoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailStoryEventImplCopyWith<_$GetDetailStoryEventImpl> get copyWith =>
      __$$GetDetailStoryEventImplCopyWithImpl<_$GetDetailStoryEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) get,
  }) {
    return get(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? get,
  }) {
    return get?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailStoryEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailStoryEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailStoryEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetDetailStoryEvent extends DetailStoryEvent {
  const factory GetDetailStoryEvent({required final int id}) =
      _$GetDetailStoryEventImpl;
  const GetDetailStoryEvent._() : super._();

  @override
  int get id;

  /// Create a copy of DetailStoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDetailStoryEventImplCopyWith<_$GetDetailStoryEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailStoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(StoryEntity detailstory) success,
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
    TResult? Function(StoryEntity detailstory)? success,
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
    TResult Function(StoryEntity detailstory)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDetailStoryState value) loading,
    required TResult Function(ErrorDetailStoryState value) error,
    required TResult Function(SuccessDetailStoryState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailStoryState value)? loading,
    TResult? Function(ErrorDetailStoryState value)? error,
    TResult? Function(SuccessDetailStoryState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailStoryState value)? loading,
    TResult Function(ErrorDetailStoryState value)? error,
    TResult Function(SuccessDetailStoryState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoryStateCopyWith<$Res> {
  factory $DetailStoryStateCopyWith(
          DetailStoryState value, $Res Function(DetailStoryState) then) =
      _$DetailStoryStateCopyWithImpl<$Res, DetailStoryState>;
}

/// @nodoc
class _$DetailStoryStateCopyWithImpl<$Res, $Val extends DetailStoryState>
    implements $DetailStoryStateCopyWith<$Res> {
  _$DetailStoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailStoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingDetailStoryStateImplCopyWith<$Res> {
  factory _$$LoadingDetailStoryStateImplCopyWith(
          _$LoadingDetailStoryStateImpl value,
          $Res Function(_$LoadingDetailStoryStateImpl) then) =
      __$$LoadingDetailStoryStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingDetailStoryStateImplCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$LoadingDetailStoryStateImpl>
    implements _$$LoadingDetailStoryStateImplCopyWith<$Res> {
  __$$LoadingDetailStoryStateImplCopyWithImpl(
      _$LoadingDetailStoryStateImpl _value,
      $Res Function(_$LoadingDetailStoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailStoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingDetailStoryStateImpl extends LoadingDetailStoryState {
  const _$LoadingDetailStoryStateImpl() : super._();

  @override
  String toString() {
    return 'DetailStoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingDetailStoryStateImpl);
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
    required TResult Function(StoryEntity detailstory) success,
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
    TResult? Function(StoryEntity detailstory)? success,
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
    TResult Function(StoryEntity detailstory)? success,
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
    required TResult Function(LoadingDetailStoryState value) loading,
    required TResult Function(ErrorDetailStoryState value) error,
    required TResult Function(SuccessDetailStoryState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailStoryState value)? loading,
    TResult? Function(ErrorDetailStoryState value)? error,
    TResult? Function(SuccessDetailStoryState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailStoryState value)? loading,
    TResult Function(ErrorDetailStoryState value)? error,
    TResult Function(SuccessDetailStoryState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingDetailStoryState extends DetailStoryState {
  const factory LoadingDetailStoryState() = _$LoadingDetailStoryStateImpl;
  const LoadingDetailStoryState._() : super._();
}

/// @nodoc
abstract class _$$ErrorDetailStoryStateImplCopyWith<$Res> {
  factory _$$ErrorDetailStoryStateImplCopyWith(
          _$ErrorDetailStoryStateImpl value,
          $Res Function(_$ErrorDetailStoryStateImpl) then) =
      __$$ErrorDetailStoryStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorDetailStoryStateImplCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$ErrorDetailStoryStateImpl>
    implements _$$ErrorDetailStoryStateImplCopyWith<$Res> {
  __$$ErrorDetailStoryStateImplCopyWithImpl(_$ErrorDetailStoryStateImpl _value,
      $Res Function(_$ErrorDetailStoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailStoryState
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
    return _then(_$ErrorDetailStoryStateImpl(
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

class _$ErrorDetailStoryStateImpl extends ErrorDetailStoryState {
  const _$ErrorDetailStoryStateImpl(
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
    return 'DetailStoryState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailStoryStateImpl &&
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

  /// Create a copy of DetailStoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailStoryStateImplCopyWith<_$ErrorDetailStoryStateImpl>
      get copyWith => __$$ErrorDetailStoryStateImplCopyWithImpl<
          _$ErrorDetailStoryStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(StoryEntity detailstory) success,
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
    TResult? Function(StoryEntity detailstory)? success,
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
    TResult Function(StoryEntity detailstory)? success,
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
    required TResult Function(LoadingDetailStoryState value) loading,
    required TResult Function(ErrorDetailStoryState value) error,
    required TResult Function(SuccessDetailStoryState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailStoryState value)? loading,
    TResult? Function(ErrorDetailStoryState value)? error,
    TResult? Function(SuccessDetailStoryState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailStoryState value)? loading,
    TResult Function(ErrorDetailStoryState value)? error,
    TResult Function(SuccessDetailStoryState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetailStoryState extends DetailStoryState {
  const factory ErrorDetailStoryState(
      {final String? errorFromApi,
      required final String errorForUser,
      final String? statusCode,
      final StackTrace? stackTrace,
      final String? responseMessage}) = _$ErrorDetailStoryStateImpl;
  const ErrorDetailStoryState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of DetailStoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorDetailStoryStateImplCopyWith<_$ErrorDetailStoryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessDetailStoryStateImplCopyWith<$Res> {
  factory _$$SuccessDetailStoryStateImplCopyWith(
          _$SuccessDetailStoryStateImpl value,
          $Res Function(_$SuccessDetailStoryStateImpl) then) =
      __$$SuccessDetailStoryStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoryEntity detailstory});
}

/// @nodoc
class __$$SuccessDetailStoryStateImplCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$SuccessDetailStoryStateImpl>
    implements _$$SuccessDetailStoryStateImplCopyWith<$Res> {
  __$$SuccessDetailStoryStateImplCopyWithImpl(
      _$SuccessDetailStoryStateImpl _value,
      $Res Function(_$SuccessDetailStoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailStoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailstory = null,
  }) {
    return _then(_$SuccessDetailStoryStateImpl(
      detailstory: null == detailstory
          ? _value.detailstory
          : detailstory // ignore: cast_nullable_to_non_nullable
              as StoryEntity,
    ));
  }
}

/// @nodoc

class _$SuccessDetailStoryStateImpl extends SuccessDetailStoryState {
  const _$SuccessDetailStoryStateImpl({required this.detailstory}) : super._();

  @override
  final StoryEntity detailstory;

  @override
  String toString() {
    return 'DetailStoryState.success(detailstory: $detailstory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDetailStoryStateImpl &&
            (identical(other.detailstory, detailstory) ||
                other.detailstory == detailstory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detailstory);

  /// Create a copy of DetailStoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDetailStoryStateImplCopyWith<_$SuccessDetailStoryStateImpl>
      get copyWith => __$$SuccessDetailStoryStateImplCopyWithImpl<
          _$SuccessDetailStoryStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(StoryEntity detailstory) success,
  }) {
    return success(detailstory);
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
    TResult? Function(StoryEntity detailstory)? success,
  }) {
    return success?.call(detailstory);
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
    TResult Function(StoryEntity detailstory)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(detailstory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDetailStoryState value) loading,
    required TResult Function(ErrorDetailStoryState value) error,
    required TResult Function(SuccessDetailStoryState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailStoryState value)? loading,
    TResult? Function(ErrorDetailStoryState value)? error,
    TResult? Function(SuccessDetailStoryState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailStoryState value)? loading,
    TResult Function(ErrorDetailStoryState value)? error,
    TResult Function(SuccessDetailStoryState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessDetailStoryState extends DetailStoryState {
  const factory SuccessDetailStoryState(
      {required final StoryEntity detailstory}) = _$SuccessDetailStoryStateImpl;
  const SuccessDetailStoryState._() : super._();

  StoryEntity get detailstory;

  /// Create a copy of DetailStoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessDetailStoryStateImplCopyWith<_$SuccessDetailStoryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
