// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppSettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() set}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? set}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? set,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetAppSettingsEvent value) set,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetAppSettingsEvent value)? set,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetAppSettingsEvent value)? set,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsEventCopyWith<$Res> {
  factory $AppSettingsEventCopyWith(
    AppSettingsEvent value,
    $Res Function(AppSettingsEvent) then,
  ) = _$AppSettingsEventCopyWithImpl<$Res, AppSettingsEvent>;
}

/// @nodoc
class _$AppSettingsEventCopyWithImpl<$Res, $Val extends AppSettingsEvent>
    implements $AppSettingsEventCopyWith<$Res> {
  _$AppSettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SetAppSettingsEventImplCopyWith<$Res> {
  factory _$$SetAppSettingsEventImplCopyWith(
    _$SetAppSettingsEventImpl value,
    $Res Function(_$SetAppSettingsEventImpl) then,
  ) = __$$SetAppSettingsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetAppSettingsEventImplCopyWithImpl<$Res>
    extends _$AppSettingsEventCopyWithImpl<$Res, _$SetAppSettingsEventImpl>
    implements _$$SetAppSettingsEventImplCopyWith<$Res> {
  __$$SetAppSettingsEventImplCopyWithImpl(
    _$SetAppSettingsEventImpl _value,
    $Res Function(_$SetAppSettingsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SetAppSettingsEventImpl extends SetAppSettingsEvent {
  const _$SetAppSettingsEventImpl() : super._();

  @override
  String toString() {
    return 'AppSettingsEvent.set()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAppSettingsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() set}) {
    return set();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? set}) {
    return set?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetAppSettingsEvent value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetAppSettingsEvent value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetAppSettingsEvent value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class SetAppSettingsEvent extends AppSettingsEvent {
  const factory SetAppSettingsEvent() = _$SetAppSettingsEventImpl;
  const SetAppSettingsEvent._() : super._();
}

/// @nodoc
mixin _$AppSettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function() success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult? Function()? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult Function()? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingAppSettingsState value) loading,
    required TResult Function(ErrorAppSettingsState value) error,
    required TResult Function(SuccessAppSettingsState value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingAppSettingsState value)? loading,
    TResult? Function(ErrorAppSettingsState value)? error,
    TResult? Function(SuccessAppSettingsState value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingAppSettingsState value)? loading,
    TResult Function(ErrorAppSettingsState value)? error,
    TResult Function(SuccessAppSettingsState value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsStateCopyWith<$Res> {
  factory $AppSettingsStateCopyWith(
    AppSettingsState value,
    $Res Function(AppSettingsState) then,
  ) = _$AppSettingsStateCopyWithImpl<$Res, AppSettingsState>;
}

/// @nodoc
class _$AppSettingsStateCopyWithImpl<$Res, $Val extends AppSettingsState>
    implements $AppSettingsStateCopyWith<$Res> {
  _$AppSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingAppSettingsStateImplCopyWith<$Res> {
  factory _$$LoadingAppSettingsStateImplCopyWith(
    _$LoadingAppSettingsStateImpl value,
    $Res Function(_$LoadingAppSettingsStateImpl) then,
  ) = __$$LoadingAppSettingsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAppSettingsStateImplCopyWithImpl<$Res>
    extends _$AppSettingsStateCopyWithImpl<$Res, _$LoadingAppSettingsStateImpl>
    implements _$$LoadingAppSettingsStateImplCopyWith<$Res> {
  __$$LoadingAppSettingsStateImplCopyWithImpl(
    _$LoadingAppSettingsStateImpl _value,
    $Res Function(_$LoadingAppSettingsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingAppSettingsStateImpl extends LoadingAppSettingsState {
  const _$LoadingAppSettingsStateImpl() : super._();

  @override
  String toString() {
    return 'AppSettingsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingAppSettingsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function() success,
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
      String? responseMessage,
    )?
    error,
    TResult? Function()? success,
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
      String? responseMessage,
    )?
    error,
    TResult Function()? success,
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
    required TResult Function(LoadingAppSettingsState value) loading,
    required TResult Function(ErrorAppSettingsState value) error,
    required TResult Function(SuccessAppSettingsState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingAppSettingsState value)? loading,
    TResult? Function(ErrorAppSettingsState value)? error,
    TResult? Function(SuccessAppSettingsState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingAppSettingsState value)? loading,
    TResult Function(ErrorAppSettingsState value)? error,
    TResult Function(SuccessAppSettingsState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingAppSettingsState extends AppSettingsState {
  const factory LoadingAppSettingsState() = _$LoadingAppSettingsStateImpl;
  const LoadingAppSettingsState._() : super._();
}

/// @nodoc
abstract class _$$ErrorAppSettingsStateImplCopyWith<$Res> {
  factory _$$ErrorAppSettingsStateImplCopyWith(
    _$ErrorAppSettingsStateImpl value,
    $Res Function(_$ErrorAppSettingsStateImpl) then,
  ) = __$$ErrorAppSettingsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String? errorFromApi,
    String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  });
}

/// @nodoc
class __$$ErrorAppSettingsStateImplCopyWithImpl<$Res>
    extends _$AppSettingsStateCopyWithImpl<$Res, _$ErrorAppSettingsStateImpl>
    implements _$$ErrorAppSettingsStateImplCopyWith<$Res> {
  __$$ErrorAppSettingsStateImplCopyWithImpl(
    _$ErrorAppSettingsStateImpl _value,
    $Res Function(_$ErrorAppSettingsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettingsState
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
    return _then(
      _$ErrorAppSettingsStateImpl(
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
      ),
    );
  }
}

/// @nodoc

class _$ErrorAppSettingsStateImpl extends ErrorAppSettingsState {
  const _$ErrorAppSettingsStateImpl({
    this.errorFromApi,
    required this.errorForUser,
    this.statusCode,
    this.stackTrace,
    this.responseMessage,
  }) : super._();

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
    return 'AppSettingsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAppSettingsStateImpl &&
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
  int get hashCode => Object.hash(
    runtimeType,
    errorFromApi,
    errorForUser,
    statusCode,
    stackTrace,
    responseMessage,
  );

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorAppSettingsStateImplCopyWith<_$ErrorAppSettingsStateImpl>
  get copyWith =>
      __$$ErrorAppSettingsStateImplCopyWithImpl<_$ErrorAppSettingsStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function() success,
  }) {
    return error(
      errorFromApi,
      errorForUser,
      statusCode,
      stackTrace,
      responseMessage,
    );
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
      String? responseMessage,
    )?
    error,
    TResult? Function()? success,
  }) {
    return error?.call(
      errorFromApi,
      errorForUser,
      statusCode,
      stackTrace,
      responseMessage,
    );
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
      String? responseMessage,
    )?
    error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(
        errorFromApi,
        errorForUser,
        statusCode,
        stackTrace,
        responseMessage,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingAppSettingsState value) loading,
    required TResult Function(ErrorAppSettingsState value) error,
    required TResult Function(SuccessAppSettingsState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingAppSettingsState value)? loading,
    TResult? Function(ErrorAppSettingsState value)? error,
    TResult? Function(SuccessAppSettingsState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingAppSettingsState value)? loading,
    TResult Function(ErrorAppSettingsState value)? error,
    TResult Function(SuccessAppSettingsState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAppSettingsState extends AppSettingsState {
  const factory ErrorAppSettingsState({
    final String? errorFromApi,
    required final String errorForUser,
    final String? statusCode,
    final StackTrace? stackTrace,
    final String? responseMessage,
  }) = _$ErrorAppSettingsStateImpl;
  const ErrorAppSettingsState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorAppSettingsStateImplCopyWith<_$ErrorAppSettingsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessAppSettingsStateImplCopyWith<$Res> {
  factory _$$SuccessAppSettingsStateImplCopyWith(
    _$SuccessAppSettingsStateImpl value,
    $Res Function(_$SuccessAppSettingsStateImpl) then,
  ) = __$$SuccessAppSettingsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessAppSettingsStateImplCopyWithImpl<$Res>
    extends _$AppSettingsStateCopyWithImpl<$Res, _$SuccessAppSettingsStateImpl>
    implements _$$SuccessAppSettingsStateImplCopyWith<$Res> {
  __$$SuccessAppSettingsStateImplCopyWithImpl(
    _$SuccessAppSettingsStateImpl _value,
    $Res Function(_$SuccessAppSettingsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessAppSettingsStateImpl extends SuccessAppSettingsState {
  const _$SuccessAppSettingsStateImpl() : super._();

  @override
  String toString() {
    return 'AppSettingsState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessAppSettingsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function() success,
  }) {
    return success();
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
      String? responseMessage,
    )?
    error,
    TResult? Function()? success,
  }) {
    return success?.call();
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
      String? responseMessage,
    )?
    error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingAppSettingsState value) loading,
    required TResult Function(ErrorAppSettingsState value) error,
    required TResult Function(SuccessAppSettingsState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingAppSettingsState value)? loading,
    TResult? Function(ErrorAppSettingsState value)? error,
    TResult? Function(SuccessAppSettingsState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingAppSettingsState value)? loading,
    TResult Function(ErrorAppSettingsState value)? error,
    TResult Function(SuccessAppSettingsState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessAppSettingsState extends AppSettingsState {
  const factory SuccessAppSettingsState() = _$SuccessAppSettingsStateImpl;
  const SuccessAppSettingsState._() : super._();
}
