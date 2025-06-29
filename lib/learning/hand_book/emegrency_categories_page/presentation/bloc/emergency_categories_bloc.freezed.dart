// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmergencyCategoriesEvent {
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
    required TResult Function(GetEmergencyCategoriesEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetEmergencyCategoriesEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetEmergencyCategoriesEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyCategoriesEventCopyWith<$Res> {
  factory $EmergencyCategoriesEventCopyWith(EmergencyCategoriesEvent value,
          $Res Function(EmergencyCategoriesEvent) then) =
      _$EmergencyCategoriesEventCopyWithImpl<$Res, EmergencyCategoriesEvent>;
}

/// @nodoc
class _$EmergencyCategoriesEventCopyWithImpl<$Res,
        $Val extends EmergencyCategoriesEvent>
    implements $EmergencyCategoriesEventCopyWith<$Res> {
  _$EmergencyCategoriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyCategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetEmergencyCategoriesEventImplCopyWith<$Res> {
  factory _$$GetEmergencyCategoriesEventImplCopyWith(
          _$GetEmergencyCategoriesEventImpl value,
          $Res Function(_$GetEmergencyCategoriesEventImpl) then) =
      __$$GetEmergencyCategoriesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetEmergencyCategoriesEventImplCopyWithImpl<$Res>
    extends _$EmergencyCategoriesEventCopyWithImpl<$Res,
        _$GetEmergencyCategoriesEventImpl>
    implements _$$GetEmergencyCategoriesEventImplCopyWith<$Res> {
  __$$GetEmergencyCategoriesEventImplCopyWithImpl(
      _$GetEmergencyCategoriesEventImpl _value,
      $Res Function(_$GetEmergencyCategoriesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyCategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetEmergencyCategoriesEventImpl extends GetEmergencyCategoriesEvent {
  const _$GetEmergencyCategoriesEventImpl() : super._();

  @override
  String toString() {
    return 'EmergencyCategoriesEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetEmergencyCategoriesEventImpl);
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
    required TResult Function(GetEmergencyCategoriesEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetEmergencyCategoriesEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetEmergencyCategoriesEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetEmergencyCategoriesEvent extends EmergencyCategoriesEvent {
  const factory GetEmergencyCategoriesEvent() =
      _$GetEmergencyCategoriesEventImpl;
  const GetEmergencyCategoriesEvent._() : super._();
}

/// @nodoc
mixin _$EmergencyCategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(
            List<EmergencyCategoriesEntity> emergencyCategories)
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
    TResult? Function(List<EmergencyCategoriesEntity> emergencyCategories)?
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
    TResult Function(List<EmergencyCategoriesEntity> emergencyCategories)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingEmergencyCategoriesState value) loading,
    required TResult Function(ErrorEmergencyCategoriesState value) error,
    required TResult Function(SuccessEmergencyCategoriesState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingEmergencyCategoriesState value)? loading,
    TResult? Function(ErrorEmergencyCategoriesState value)? error,
    TResult? Function(SuccessEmergencyCategoriesState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingEmergencyCategoriesState value)? loading,
    TResult Function(ErrorEmergencyCategoriesState value)? error,
    TResult Function(SuccessEmergencyCategoriesState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyCategoriesStateCopyWith<$Res> {
  factory $EmergencyCategoriesStateCopyWith(EmergencyCategoriesState value,
          $Res Function(EmergencyCategoriesState) then) =
      _$EmergencyCategoriesStateCopyWithImpl<$Res, EmergencyCategoriesState>;
}

/// @nodoc
class _$EmergencyCategoriesStateCopyWithImpl<$Res,
        $Val extends EmergencyCategoriesState>
    implements $EmergencyCategoriesStateCopyWith<$Res> {
  _$EmergencyCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyCategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingEmergencyCategoriesStateImplCopyWith<$Res> {
  factory _$$LoadingEmergencyCategoriesStateImplCopyWith(
          _$LoadingEmergencyCategoriesStateImpl value,
          $Res Function(_$LoadingEmergencyCategoriesStateImpl) then) =
      __$$LoadingEmergencyCategoriesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingEmergencyCategoriesStateImplCopyWithImpl<$Res>
    extends _$EmergencyCategoriesStateCopyWithImpl<$Res,
        _$LoadingEmergencyCategoriesStateImpl>
    implements _$$LoadingEmergencyCategoriesStateImplCopyWith<$Res> {
  __$$LoadingEmergencyCategoriesStateImplCopyWithImpl(
      _$LoadingEmergencyCategoriesStateImpl _value,
      $Res Function(_$LoadingEmergencyCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyCategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingEmergencyCategoriesStateImpl
    extends LoadingEmergencyCategoriesState {
  const _$LoadingEmergencyCategoriesStateImpl() : super._();

  @override
  String toString() {
    return 'EmergencyCategoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingEmergencyCategoriesStateImpl);
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
            List<EmergencyCategoriesEntity> emergencyCategories)
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
    TResult? Function(List<EmergencyCategoriesEntity> emergencyCategories)?
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
    TResult Function(List<EmergencyCategoriesEntity> emergencyCategories)?
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
    required TResult Function(LoadingEmergencyCategoriesState value) loading,
    required TResult Function(ErrorEmergencyCategoriesState value) error,
    required TResult Function(SuccessEmergencyCategoriesState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingEmergencyCategoriesState value)? loading,
    TResult? Function(ErrorEmergencyCategoriesState value)? error,
    TResult? Function(SuccessEmergencyCategoriesState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingEmergencyCategoriesState value)? loading,
    TResult Function(ErrorEmergencyCategoriesState value)? error,
    TResult Function(SuccessEmergencyCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingEmergencyCategoriesState
    extends EmergencyCategoriesState {
  const factory LoadingEmergencyCategoriesState() =
      _$LoadingEmergencyCategoriesStateImpl;
  const LoadingEmergencyCategoriesState._() : super._();
}

/// @nodoc
abstract class _$$ErrorEmergencyCategoriesStateImplCopyWith<$Res> {
  factory _$$ErrorEmergencyCategoriesStateImplCopyWith(
          _$ErrorEmergencyCategoriesStateImpl value,
          $Res Function(_$ErrorEmergencyCategoriesStateImpl) then) =
      __$$ErrorEmergencyCategoriesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorEmergencyCategoriesStateImplCopyWithImpl<$Res>
    extends _$EmergencyCategoriesStateCopyWithImpl<$Res,
        _$ErrorEmergencyCategoriesStateImpl>
    implements _$$ErrorEmergencyCategoriesStateImplCopyWith<$Res> {
  __$$ErrorEmergencyCategoriesStateImplCopyWithImpl(
      _$ErrorEmergencyCategoriesStateImpl _value,
      $Res Function(_$ErrorEmergencyCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyCategoriesState
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
    return _then(_$ErrorEmergencyCategoriesStateImpl(
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

class _$ErrorEmergencyCategoriesStateImpl
    extends ErrorEmergencyCategoriesState {
  const _$ErrorEmergencyCategoriesStateImpl(
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
    return 'EmergencyCategoriesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEmergencyCategoriesStateImpl &&
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

  /// Create a copy of EmergencyCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorEmergencyCategoriesStateImplCopyWith<
          _$ErrorEmergencyCategoriesStateImpl>
      get copyWith => __$$ErrorEmergencyCategoriesStateImplCopyWithImpl<
          _$ErrorEmergencyCategoriesStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(
            List<EmergencyCategoriesEntity> emergencyCategories)
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
    TResult? Function(List<EmergencyCategoriesEntity> emergencyCategories)?
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
    TResult Function(List<EmergencyCategoriesEntity> emergencyCategories)?
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
    required TResult Function(LoadingEmergencyCategoriesState value) loading,
    required TResult Function(ErrorEmergencyCategoriesState value) error,
    required TResult Function(SuccessEmergencyCategoriesState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingEmergencyCategoriesState value)? loading,
    TResult? Function(ErrorEmergencyCategoriesState value)? error,
    TResult? Function(SuccessEmergencyCategoriesState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingEmergencyCategoriesState value)? loading,
    TResult Function(ErrorEmergencyCategoriesState value)? error,
    TResult Function(SuccessEmergencyCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorEmergencyCategoriesState extends EmergencyCategoriesState {
  const factory ErrorEmergencyCategoriesState(
      {final String? errorFromApi,
      required final String errorForUser,
      final String? statusCode,
      final StackTrace? stackTrace,
      final String? responseMessage}) = _$ErrorEmergencyCategoriesStateImpl;
  const ErrorEmergencyCategoriesState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of EmergencyCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorEmergencyCategoriesStateImplCopyWith<
          _$ErrorEmergencyCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessEmergencyCategoriesStateImplCopyWith<$Res> {
  factory _$$SuccessEmergencyCategoriesStateImplCopyWith(
          _$SuccessEmergencyCategoriesStateImpl value,
          $Res Function(_$SuccessEmergencyCategoriesStateImpl) then) =
      __$$SuccessEmergencyCategoriesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EmergencyCategoriesEntity> emergencyCategories});
}

/// @nodoc
class __$$SuccessEmergencyCategoriesStateImplCopyWithImpl<$Res>
    extends _$EmergencyCategoriesStateCopyWithImpl<$Res,
        _$SuccessEmergencyCategoriesStateImpl>
    implements _$$SuccessEmergencyCategoriesStateImplCopyWith<$Res> {
  __$$SuccessEmergencyCategoriesStateImplCopyWithImpl(
      _$SuccessEmergencyCategoriesStateImpl _value,
      $Res Function(_$SuccessEmergencyCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emergencyCategories = null,
  }) {
    return _then(_$SuccessEmergencyCategoriesStateImpl(
      emergencyCategories: null == emergencyCategories
          ? _value._emergencyCategories
          : emergencyCategories // ignore: cast_nullable_to_non_nullable
              as List<EmergencyCategoriesEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessEmergencyCategoriesStateImpl
    extends SuccessEmergencyCategoriesState {
  const _$SuccessEmergencyCategoriesStateImpl(
      {required final List<EmergencyCategoriesEntity> emergencyCategories})
      : _emergencyCategories = emergencyCategories,
        super._();

  final List<EmergencyCategoriesEntity> _emergencyCategories;
  @override
  List<EmergencyCategoriesEntity> get emergencyCategories {
    if (_emergencyCategories is EqualUnmodifiableListView)
      return _emergencyCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emergencyCategories);
  }

  @override
  String toString() {
    return 'EmergencyCategoriesState.success(emergencyCategories: $emergencyCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessEmergencyCategoriesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._emergencyCategories, _emergencyCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_emergencyCategories));

  /// Create a copy of EmergencyCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessEmergencyCategoriesStateImplCopyWith<
          _$SuccessEmergencyCategoriesStateImpl>
      get copyWith => __$$SuccessEmergencyCategoriesStateImplCopyWithImpl<
          _$SuccessEmergencyCategoriesStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(
            List<EmergencyCategoriesEntity> emergencyCategories)
        success,
  }) {
    return success(emergencyCategories);
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
    TResult? Function(List<EmergencyCategoriesEntity> emergencyCategories)?
        success,
  }) {
    return success?.call(emergencyCategories);
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
    TResult Function(List<EmergencyCategoriesEntity> emergencyCategories)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(emergencyCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingEmergencyCategoriesState value) loading,
    required TResult Function(ErrorEmergencyCategoriesState value) error,
    required TResult Function(SuccessEmergencyCategoriesState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingEmergencyCategoriesState value)? loading,
    TResult? Function(ErrorEmergencyCategoriesState value)? error,
    TResult? Function(SuccessEmergencyCategoriesState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingEmergencyCategoriesState value)? loading,
    TResult Function(ErrorEmergencyCategoriesState value)? error,
    TResult Function(SuccessEmergencyCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessEmergencyCategoriesState
    extends EmergencyCategoriesState {
  const factory SuccessEmergencyCategoriesState(
      {required final List<EmergencyCategoriesEntity>
          emergencyCategories}) = _$SuccessEmergencyCategoriesStateImpl;
  const SuccessEmergencyCategoriesState._() : super._();

  List<EmergencyCategoriesEntity> get emergencyCategories;

  /// Create a copy of EmergencyCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessEmergencyCategoriesStateImplCopyWith<
          _$SuccessEmergencyCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
