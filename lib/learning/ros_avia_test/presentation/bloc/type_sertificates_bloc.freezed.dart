// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_sertificates_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TypeSertificatesEvent {
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
    required TResult Function(GetTypeSertificatesEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTypeSertificatesEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTypeSertificatesEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeSertificatesEventCopyWith<$Res> {
  factory $TypeSertificatesEventCopyWith(TypeSertificatesEvent value,
          $Res Function(TypeSertificatesEvent) then) =
      _$TypeSertificatesEventCopyWithImpl<$Res, TypeSertificatesEvent>;
}

/// @nodoc
class _$TypeSertificatesEventCopyWithImpl<$Res,
        $Val extends TypeSertificatesEvent>
    implements $TypeSertificatesEventCopyWith<$Res> {
  _$TypeSertificatesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeSertificatesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetTypeSertificatesEventImplCopyWith<$Res> {
  factory _$$GetTypeSertificatesEventImplCopyWith(
          _$GetTypeSertificatesEventImpl value,
          $Res Function(_$GetTypeSertificatesEventImpl) then) =
      __$$GetTypeSertificatesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTypeSertificatesEventImplCopyWithImpl<$Res>
    extends _$TypeSertificatesEventCopyWithImpl<$Res,
        _$GetTypeSertificatesEventImpl>
    implements _$$GetTypeSertificatesEventImplCopyWith<$Res> {
  __$$GetTypeSertificatesEventImplCopyWithImpl(
      _$GetTypeSertificatesEventImpl _value,
      $Res Function(_$GetTypeSertificatesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeSertificatesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTypeSertificatesEventImpl extends GetTypeSertificatesEvent {
  const _$GetTypeSertificatesEventImpl() : super._();

  @override
  String toString() {
    return 'TypeSertificatesEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTypeSertificatesEventImpl);
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
    required TResult Function(GetTypeSertificatesEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTypeSertificatesEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTypeSertificatesEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetTypeSertificatesEvent extends TypeSertificatesEvent {
  const factory GetTypeSertificatesEvent() = _$GetTypeSertificatesEventImpl;
  const GetTypeSertificatesEvent._() : super._();
}

/// @nodoc
mixin _$TypeSertificatesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<TypeSertificatesEntity> typeSertificates)
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
    TResult? Function(List<TypeSertificatesEntity> typeSertificates)? success,
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
    TResult Function(List<TypeSertificatesEntity> typeSertificates)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingTypeSertificatesState value) loading,
    required TResult Function(ErrorTypeSertificatesState value) error,
    required TResult Function(SuccessTypeSertificatesState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeSertificatesState value)? loading,
    TResult? Function(ErrorTypeSertificatesState value)? error,
    TResult? Function(SuccessTypeSertificatesState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeSertificatesState value)? loading,
    TResult Function(ErrorTypeSertificatesState value)? error,
    TResult Function(SuccessTypeSertificatesState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeSertificatesStateCopyWith<$Res> {
  factory $TypeSertificatesStateCopyWith(TypeSertificatesState value,
          $Res Function(TypeSertificatesState) then) =
      _$TypeSertificatesStateCopyWithImpl<$Res, TypeSertificatesState>;
}

/// @nodoc
class _$TypeSertificatesStateCopyWithImpl<$Res,
        $Val extends TypeSertificatesState>
    implements $TypeSertificatesStateCopyWith<$Res> {
  _$TypeSertificatesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeSertificatesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingTypeSertificatesStateImplCopyWith<$Res> {
  factory _$$LoadingTypeSertificatesStateImplCopyWith(
          _$LoadingTypeSertificatesStateImpl value,
          $Res Function(_$LoadingTypeSertificatesStateImpl) then) =
      __$$LoadingTypeSertificatesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingTypeSertificatesStateImplCopyWithImpl<$Res>
    extends _$TypeSertificatesStateCopyWithImpl<$Res,
        _$LoadingTypeSertificatesStateImpl>
    implements _$$LoadingTypeSertificatesStateImplCopyWith<$Res> {
  __$$LoadingTypeSertificatesStateImplCopyWithImpl(
      _$LoadingTypeSertificatesStateImpl _value,
      $Res Function(_$LoadingTypeSertificatesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeSertificatesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingTypeSertificatesStateImpl extends LoadingTypeSertificatesState {
  const _$LoadingTypeSertificatesStateImpl() : super._();

  @override
  String toString() {
    return 'TypeSertificatesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingTypeSertificatesStateImpl);
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
    required TResult Function(List<TypeSertificatesEntity> typeSertificates)
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
    TResult? Function(List<TypeSertificatesEntity> typeSertificates)? success,
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
    TResult Function(List<TypeSertificatesEntity> typeSertificates)? success,
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
    required TResult Function(LoadingTypeSertificatesState value) loading,
    required TResult Function(ErrorTypeSertificatesState value) error,
    required TResult Function(SuccessTypeSertificatesState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeSertificatesState value)? loading,
    TResult? Function(ErrorTypeSertificatesState value)? error,
    TResult? Function(SuccessTypeSertificatesState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeSertificatesState value)? loading,
    TResult Function(ErrorTypeSertificatesState value)? error,
    TResult Function(SuccessTypeSertificatesState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingTypeSertificatesState extends TypeSertificatesState {
  const factory LoadingTypeSertificatesState() =
      _$LoadingTypeSertificatesStateImpl;
  const LoadingTypeSertificatesState._() : super._();
}

/// @nodoc
abstract class _$$ErrorTypeSertificatesStateImplCopyWith<$Res> {
  factory _$$ErrorTypeSertificatesStateImplCopyWith(
          _$ErrorTypeSertificatesStateImpl value,
          $Res Function(_$ErrorTypeSertificatesStateImpl) then) =
      __$$ErrorTypeSertificatesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorTypeSertificatesStateImplCopyWithImpl<$Res>
    extends _$TypeSertificatesStateCopyWithImpl<$Res,
        _$ErrorTypeSertificatesStateImpl>
    implements _$$ErrorTypeSertificatesStateImplCopyWith<$Res> {
  __$$ErrorTypeSertificatesStateImplCopyWithImpl(
      _$ErrorTypeSertificatesStateImpl _value,
      $Res Function(_$ErrorTypeSertificatesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeSertificatesState
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
    return _then(_$ErrorTypeSertificatesStateImpl(
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

class _$ErrorTypeSertificatesStateImpl extends ErrorTypeSertificatesState {
  const _$ErrorTypeSertificatesStateImpl(
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
    return 'TypeSertificatesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorTypeSertificatesStateImpl &&
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

  /// Create a copy of TypeSertificatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorTypeSertificatesStateImplCopyWith<_$ErrorTypeSertificatesStateImpl>
      get copyWith => __$$ErrorTypeSertificatesStateImplCopyWithImpl<
          _$ErrorTypeSertificatesStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<TypeSertificatesEntity> typeSertificates)
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
    TResult? Function(List<TypeSertificatesEntity> typeSertificates)? success,
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
    TResult Function(List<TypeSertificatesEntity> typeSertificates)? success,
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
    required TResult Function(LoadingTypeSertificatesState value) loading,
    required TResult Function(ErrorTypeSertificatesState value) error,
    required TResult Function(SuccessTypeSertificatesState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeSertificatesState value)? loading,
    TResult? Function(ErrorTypeSertificatesState value)? error,
    TResult? Function(SuccessTypeSertificatesState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeSertificatesState value)? loading,
    TResult Function(ErrorTypeSertificatesState value)? error,
    TResult Function(SuccessTypeSertificatesState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorTypeSertificatesState extends TypeSertificatesState {
  const factory ErrorTypeSertificatesState(
      {final String? errorFromApi,
      required final String errorForUser,
      final String? statusCode,
      final StackTrace? stackTrace,
      final String? responseMessage}) = _$ErrorTypeSertificatesStateImpl;
  const ErrorTypeSertificatesState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of TypeSertificatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorTypeSertificatesStateImplCopyWith<_$ErrorTypeSertificatesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessTypeSertificatesStateImplCopyWith<$Res> {
  factory _$$SuccessTypeSertificatesStateImplCopyWith(
          _$SuccessTypeSertificatesStateImpl value,
          $Res Function(_$SuccessTypeSertificatesStateImpl) then) =
      __$$SuccessTypeSertificatesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TypeSertificatesEntity> typeSertificates});
}

/// @nodoc
class __$$SuccessTypeSertificatesStateImplCopyWithImpl<$Res>
    extends _$TypeSertificatesStateCopyWithImpl<$Res,
        _$SuccessTypeSertificatesStateImpl>
    implements _$$SuccessTypeSertificatesStateImplCopyWith<$Res> {
  __$$SuccessTypeSertificatesStateImplCopyWithImpl(
      _$SuccessTypeSertificatesStateImpl _value,
      $Res Function(_$SuccessTypeSertificatesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeSertificatesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeSertificates = null,
  }) {
    return _then(_$SuccessTypeSertificatesStateImpl(
      typeSertificates: null == typeSertificates
          ? _value._typeSertificates
          : typeSertificates // ignore: cast_nullable_to_non_nullable
              as List<TypeSertificatesEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessTypeSertificatesStateImpl extends SuccessTypeSertificatesState {
  const _$SuccessTypeSertificatesStateImpl(
      {required final List<TypeSertificatesEntity> typeSertificates})
      : _typeSertificates = typeSertificates,
        super._();

  final List<TypeSertificatesEntity> _typeSertificates;
  @override
  List<TypeSertificatesEntity> get typeSertificates {
    if (_typeSertificates is EqualUnmodifiableListView)
      return _typeSertificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeSertificates);
  }

  @override
  String toString() {
    return 'TypeSertificatesState.success(typeSertificates: $typeSertificates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessTypeSertificatesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._typeSertificates, _typeSertificates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_typeSertificates));

  /// Create a copy of TypeSertificatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessTypeSertificatesStateImplCopyWith<
          _$SuccessTypeSertificatesStateImpl>
      get copyWith => __$$SuccessTypeSertificatesStateImplCopyWithImpl<
          _$SuccessTypeSertificatesStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<TypeSertificatesEntity> typeSertificates)
        success,
  }) {
    return success(typeSertificates);
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
    TResult? Function(List<TypeSertificatesEntity> typeSertificates)? success,
  }) {
    return success?.call(typeSertificates);
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
    TResult Function(List<TypeSertificatesEntity> typeSertificates)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(typeSertificates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingTypeSertificatesState value) loading,
    required TResult Function(ErrorTypeSertificatesState value) error,
    required TResult Function(SuccessTypeSertificatesState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeSertificatesState value)? loading,
    TResult? Function(ErrorTypeSertificatesState value)? error,
    TResult? Function(SuccessTypeSertificatesState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeSertificatesState value)? loading,
    TResult Function(ErrorTypeSertificatesState value)? error,
    TResult Function(SuccessTypeSertificatesState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessTypeSertificatesState extends TypeSertificatesState {
  const factory SuccessTypeSertificatesState(
          {required final List<TypeSertificatesEntity> typeSertificates}) =
      _$SuccessTypeSertificatesStateImpl;
  const SuccessTypeSertificatesState._() : super._();

  List<TypeSertificatesEntity> get typeSertificates;

  /// Create a copy of TypeSertificatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessTypeSertificatesStateImplCopyWith<
          _$SuccessTypeSertificatesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
