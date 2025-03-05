// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight_inspection_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreflightInspectionCategoriesEvent {
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
    required TResult Function(GetPreflightInspectionCategoriesEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPreflightInspectionCategoriesEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPreflightInspectionCategoriesEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflightInspectionCategoriesEventCopyWith<$Res> {
  factory $PreflightInspectionCategoriesEventCopyWith(
          PreflightInspectionCategoriesEvent value,
          $Res Function(PreflightInspectionCategoriesEvent) then) =
      _$PreflightInspectionCategoriesEventCopyWithImpl<$Res,
          PreflightInspectionCategoriesEvent>;
}

/// @nodoc
class _$PreflightInspectionCategoriesEventCopyWithImpl<$Res,
        $Val extends PreflightInspectionCategoriesEvent>
    implements $PreflightInspectionCategoriesEventCopyWith<$Res> {
  _$PreflightInspectionCategoriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreflightInspectionCategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetPreflightInspectionCategoriesEventImplCopyWith<$Res> {
  factory _$$GetPreflightInspectionCategoriesEventImplCopyWith(
          _$GetPreflightInspectionCategoriesEventImpl value,
          $Res Function(_$GetPreflightInspectionCategoriesEventImpl) then) =
      __$$GetPreflightInspectionCategoriesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPreflightInspectionCategoriesEventImplCopyWithImpl<$Res>
    extends _$PreflightInspectionCategoriesEventCopyWithImpl<$Res,
        _$GetPreflightInspectionCategoriesEventImpl>
    implements _$$GetPreflightInspectionCategoriesEventImplCopyWith<$Res> {
  __$$GetPreflightInspectionCategoriesEventImplCopyWithImpl(
      _$GetPreflightInspectionCategoriesEventImpl _value,
      $Res Function(_$GetPreflightInspectionCategoriesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreflightInspectionCategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetPreflightInspectionCategoriesEventImpl
    extends GetPreflightInspectionCategoriesEvent {
  const _$GetPreflightInspectionCategoriesEventImpl() : super._();

  @override
  String toString() {
    return 'PreflightInspectionCategoriesEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPreflightInspectionCategoriesEventImpl);
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
    required TResult Function(GetPreflightInspectionCategoriesEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPreflightInspectionCategoriesEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPreflightInspectionCategoriesEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetPreflightInspectionCategoriesEvent
    extends PreflightInspectionCategoriesEvent {
  const factory GetPreflightInspectionCategoriesEvent() =
      _$GetPreflightInspectionCategoriesEventImpl;
  const GetPreflightInspectionCategoriesEvent._() : super._();
}

/// @nodoc
mixin _$PreflightInspectionCategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)
        success,
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
    TResult? Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
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
    TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingPreflightInspectionCategoriesState value)
        loading,
    required TResult Function(ErrorPreflightInspectionCategoriesState value)
        error,
    required TResult Function(SuccessPreflightInspectionCategoriesState value)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult? Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult? Function(SuccessPreflightInspectionCategoriesState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult Function(SuccessPreflightInspectionCategoriesState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreflightInspectionCategoriesStateCopyWith<$Res> {
  factory $PreflightInspectionCategoriesStateCopyWith(
          PreflightInspectionCategoriesState value,
          $Res Function(PreflightInspectionCategoriesState) then) =
      _$PreflightInspectionCategoriesStateCopyWithImpl<$Res,
          PreflightInspectionCategoriesState>;
}

/// @nodoc
class _$PreflightInspectionCategoriesStateCopyWithImpl<$Res,
        $Val extends PreflightInspectionCategoriesState>
    implements $PreflightInspectionCategoriesStateCopyWith<$Res> {
  _$PreflightInspectionCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreflightInspectionCategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingPreflightInspectionCategoriesStateImplCopyWith<$Res> {
  factory _$$LoadingPreflightInspectionCategoriesStateImplCopyWith(
          _$LoadingPreflightInspectionCategoriesStateImpl value,
          $Res Function(_$LoadingPreflightInspectionCategoriesStateImpl) then) =
      __$$LoadingPreflightInspectionCategoriesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingPreflightInspectionCategoriesStateImplCopyWithImpl<$Res>
    extends _$PreflightInspectionCategoriesStateCopyWithImpl<$Res,
        _$LoadingPreflightInspectionCategoriesStateImpl>
    implements _$$LoadingPreflightInspectionCategoriesStateImplCopyWith<$Res> {
  __$$LoadingPreflightInspectionCategoriesStateImplCopyWithImpl(
      _$LoadingPreflightInspectionCategoriesStateImpl _value,
      $Res Function(_$LoadingPreflightInspectionCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreflightInspectionCategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingPreflightInspectionCategoriesStateImpl
    extends LoadingPreflightInspectionCategoriesState {
  const _$LoadingPreflightInspectionCategoriesStateImpl() : super._();

  @override
  String toString() {
    return 'PreflightInspectionCategoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingPreflightInspectionCategoriesStateImpl);
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
    required TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)
        success,
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
    TResult? Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
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
    TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
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
    required TResult Function(LoadingPreflightInspectionCategoriesState value)
        loading,
    required TResult Function(ErrorPreflightInspectionCategoriesState value)
        error,
    required TResult Function(SuccessPreflightInspectionCategoriesState value)
        success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult? Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult? Function(SuccessPreflightInspectionCategoriesState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult Function(SuccessPreflightInspectionCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingPreflightInspectionCategoriesState
    extends PreflightInspectionCategoriesState {
  const factory LoadingPreflightInspectionCategoriesState() =
      _$LoadingPreflightInspectionCategoriesStateImpl;
  const LoadingPreflightInspectionCategoriesState._() : super._();
}

/// @nodoc
abstract class _$$ErrorPreflightInspectionCategoriesStateImplCopyWith<$Res> {
  factory _$$ErrorPreflightInspectionCategoriesStateImplCopyWith(
          _$ErrorPreflightInspectionCategoriesStateImpl value,
          $Res Function(_$ErrorPreflightInspectionCategoriesStateImpl) then) =
      __$$ErrorPreflightInspectionCategoriesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorPreflightInspectionCategoriesStateImplCopyWithImpl<$Res>
    extends _$PreflightInspectionCategoriesStateCopyWithImpl<$Res,
        _$ErrorPreflightInspectionCategoriesStateImpl>
    implements _$$ErrorPreflightInspectionCategoriesStateImplCopyWith<$Res> {
  __$$ErrorPreflightInspectionCategoriesStateImplCopyWithImpl(
      _$ErrorPreflightInspectionCategoriesStateImpl _value,
      $Res Function(_$ErrorPreflightInspectionCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreflightInspectionCategoriesState
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
    return _then(_$ErrorPreflightInspectionCategoriesStateImpl(
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

class _$ErrorPreflightInspectionCategoriesStateImpl
    extends ErrorPreflightInspectionCategoriesState {
  const _$ErrorPreflightInspectionCategoriesStateImpl(
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
    return 'PreflightInspectionCategoriesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorPreflightInspectionCategoriesStateImpl &&
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

  /// Create a copy of PreflightInspectionCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorPreflightInspectionCategoriesStateImplCopyWith<
          _$ErrorPreflightInspectionCategoriesStateImpl>
      get copyWith =>
          __$$ErrorPreflightInspectionCategoriesStateImplCopyWithImpl<
              _$ErrorPreflightInspectionCategoriesStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)
        success,
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
    TResult? Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
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
    TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
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
    required TResult Function(LoadingPreflightInspectionCategoriesState value)
        loading,
    required TResult Function(ErrorPreflightInspectionCategoriesState value)
        error,
    required TResult Function(SuccessPreflightInspectionCategoriesState value)
        success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult? Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult? Function(SuccessPreflightInspectionCategoriesState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult Function(SuccessPreflightInspectionCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorPreflightInspectionCategoriesState
    extends PreflightInspectionCategoriesState {
  const factory ErrorPreflightInspectionCategoriesState(
          {final String? errorFromApi,
          required final String errorForUser,
          final String? statusCode,
          final StackTrace? stackTrace,
          final String? responseMessage}) =
      _$ErrorPreflightInspectionCategoriesStateImpl;
  const ErrorPreflightInspectionCategoriesState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of PreflightInspectionCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorPreflightInspectionCategoriesStateImplCopyWith<
          _$ErrorPreflightInspectionCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessPreflightInspectionCategoriesStateImplCopyWith<$Res> {
  factory _$$SuccessPreflightInspectionCategoriesStateImplCopyWith(
          _$SuccessPreflightInspectionCategoriesStateImpl value,
          $Res Function(_$SuccessPreflightInspectionCategoriesStateImpl) then) =
      __$$SuccessPreflightInspectionCategoriesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PreflightInspectionCategoriesEntity>
          preflightInspectionCategories});
}

/// @nodoc
class __$$SuccessPreflightInspectionCategoriesStateImplCopyWithImpl<$Res>
    extends _$PreflightInspectionCategoriesStateCopyWithImpl<$Res,
        _$SuccessPreflightInspectionCategoriesStateImpl>
    implements _$$SuccessPreflightInspectionCategoriesStateImplCopyWith<$Res> {
  __$$SuccessPreflightInspectionCategoriesStateImplCopyWithImpl(
      _$SuccessPreflightInspectionCategoriesStateImpl _value,
      $Res Function(_$SuccessPreflightInspectionCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreflightInspectionCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preflightInspectionCategories = null,
  }) {
    return _then(_$SuccessPreflightInspectionCategoriesStateImpl(
      preflightInspectionCategories: null == preflightInspectionCategories
          ? _value._preflightInspectionCategories
          : preflightInspectionCategories // ignore: cast_nullable_to_non_nullable
              as List<PreflightInspectionCategoriesEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessPreflightInspectionCategoriesStateImpl
    extends SuccessPreflightInspectionCategoriesState {
  const _$SuccessPreflightInspectionCategoriesStateImpl(
      {required final List<PreflightInspectionCategoriesEntity>
          preflightInspectionCategories})
      : _preflightInspectionCategories = preflightInspectionCategories,
        super._();

  final List<PreflightInspectionCategoriesEntity>
      _preflightInspectionCategories;
  @override
  List<PreflightInspectionCategoriesEntity> get preflightInspectionCategories {
    if (_preflightInspectionCategories is EqualUnmodifiableListView)
      return _preflightInspectionCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preflightInspectionCategories);
  }

  @override
  String toString() {
    return 'PreflightInspectionCategoriesState.success(preflightInspectionCategories: $preflightInspectionCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessPreflightInspectionCategoriesStateImpl &&
            const DeepCollectionEquality().equals(
                other._preflightInspectionCategories,
                _preflightInspectionCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_preflightInspectionCategories));

  /// Create a copy of PreflightInspectionCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessPreflightInspectionCategoriesStateImplCopyWith<
          _$SuccessPreflightInspectionCategoriesStateImpl>
      get copyWith =>
          __$$SuccessPreflightInspectionCategoriesStateImplCopyWithImpl<
                  _$SuccessPreflightInspectionCategoriesStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)
        success,
  }) {
    return success(preflightInspectionCategories);
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
    TResult? Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
  }) {
    return success?.call(preflightInspectionCategories);
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
    TResult Function(
            List<PreflightInspectionCategoriesEntity>
                preflightInspectionCategories)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(preflightInspectionCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingPreflightInspectionCategoriesState value)
        loading,
    required TResult Function(ErrorPreflightInspectionCategoriesState value)
        error,
    required TResult Function(SuccessPreflightInspectionCategoriesState value)
        success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult? Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult? Function(SuccessPreflightInspectionCategoriesState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingPreflightInspectionCategoriesState value)? loading,
    TResult Function(ErrorPreflightInspectionCategoriesState value)? error,
    TResult Function(SuccessPreflightInspectionCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessPreflightInspectionCategoriesState
    extends PreflightInspectionCategoriesState {
  const factory SuccessPreflightInspectionCategoriesState(
          {required final List<PreflightInspectionCategoriesEntity>
              preflightInspectionCategories}) =
      _$SuccessPreflightInspectionCategoriesStateImpl;
  const SuccessPreflightInspectionCategoriesState._() : super._();

  List<PreflightInspectionCategoriesEntity> get preflightInspectionCategories;

  /// Create a copy of PreflightInspectionCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessPreflightInspectionCategoriesStateImplCopyWith<
          _$SuccessPreflightInspectionCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
