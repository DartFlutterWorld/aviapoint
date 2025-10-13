// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SmsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) getSms,
    required TResult Function() initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? getSms,
    TResult? Function()? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? getSms,
    TResult Function()? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSmsEvent value) getSms,
    required TResult Function(InitialSmsEvent value) initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSmsEvent value)? getSms,
    TResult? Function(InitialSmsEvent value)? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSmsEvent value)? getSms,
    TResult Function(InitialSmsEvent value)? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmsEventCopyWith<$Res> {
  factory $SmsEventCopyWith(SmsEvent value, $Res Function(SmsEvent) then) =
      _$SmsEventCopyWithImpl<$Res, SmsEvent>;
}

/// @nodoc
class _$SmsEventCopyWithImpl<$Res, $Val extends SmsEvent>
    implements $SmsEventCopyWith<$Res> {
  _$SmsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSmsEventImplCopyWith<$Res> {
  factory _$$GetSmsEventImplCopyWith(
    _$GetSmsEventImpl value,
    $Res Function(_$GetSmsEventImpl) then,
  ) = __$$GetSmsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$GetSmsEventImplCopyWithImpl<$Res>
    extends _$SmsEventCopyWithImpl<$Res, _$GetSmsEventImpl>
    implements _$$GetSmsEventImplCopyWith<$Res> {
  __$$GetSmsEventImplCopyWithImpl(
    _$GetSmsEventImpl _value,
    $Res Function(_$GetSmsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SmsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phone = null}) {
    return _then(
      _$GetSmsEventImpl(
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GetSmsEventImpl extends GetSmsEvent {
  const _$GetSmsEventImpl({required this.phone}) : super._();

  @override
  final String phone;

  @override
  String toString() {
    return 'SmsEvent.getSms(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSmsEventImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of SmsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSmsEventImplCopyWith<_$GetSmsEventImpl> get copyWith =>
      __$$GetSmsEventImplCopyWithImpl<_$GetSmsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) getSms,
    required TResult Function() initial,
  }) {
    return getSms(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? getSms,
    TResult? Function()? initial,
  }) {
    return getSms?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? getSms,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (getSms != null) {
      return getSms(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSmsEvent value) getSms,
    required TResult Function(InitialSmsEvent value) initial,
  }) {
    return getSms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSmsEvent value)? getSms,
    TResult? Function(InitialSmsEvent value)? initial,
  }) {
    return getSms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSmsEvent value)? getSms,
    TResult Function(InitialSmsEvent value)? initial,
    required TResult orElse(),
  }) {
    if (getSms != null) {
      return getSms(this);
    }
    return orElse();
  }
}

abstract class GetSmsEvent extends SmsEvent {
  const factory GetSmsEvent({required final String phone}) = _$GetSmsEventImpl;
  const GetSmsEvent._() : super._();

  String get phone;

  /// Create a copy of SmsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSmsEventImplCopyWith<_$GetSmsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialSmsEventImplCopyWith<$Res> {
  factory _$$InitialSmsEventImplCopyWith(
    _$InitialSmsEventImpl value,
    $Res Function(_$InitialSmsEventImpl) then,
  ) = __$$InitialSmsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialSmsEventImplCopyWithImpl<$Res>
    extends _$SmsEventCopyWithImpl<$Res, _$InitialSmsEventImpl>
    implements _$$InitialSmsEventImplCopyWith<$Res> {
  __$$InitialSmsEventImplCopyWithImpl(
    _$InitialSmsEventImpl _value,
    $Res Function(_$InitialSmsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SmsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialSmsEventImpl extends InitialSmsEvent {
  const _$InitialSmsEventImpl() : super._();

  @override
  String toString() {
    return 'SmsEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialSmsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) getSms,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? getSms,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? getSms,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSmsEvent value) getSms,
    required TResult Function(InitialSmsEvent value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSmsEvent value)? getSms,
    TResult? Function(InitialSmsEvent value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSmsEvent value)? getSms,
    TResult Function(InitialSmsEvent value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialSmsEvent extends SmsEvent {
  const factory InitialSmsEvent() = _$InitialSmsEventImpl;
  const InitialSmsEvent._() : super._();
}

/// @nodoc
mixin _$SmsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function(SmsEntity sms) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult? Function(SmsEntity sms)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult Function(SmsEntity sms)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSmsState value) initial,
    required TResult Function(LoadingSmsState value) loading,
    required TResult Function(ErrorSmsState value) error,
    required TResult Function(SuccessSmsState value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSmsState value)? initial,
    TResult? Function(LoadingSmsState value)? loading,
    TResult? Function(ErrorSmsState value)? error,
    TResult? Function(SuccessSmsState value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSmsState value)? initial,
    TResult Function(LoadingSmsState value)? loading,
    TResult Function(ErrorSmsState value)? error,
    TResult Function(SuccessSmsState value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmsStateCopyWith<$Res> {
  factory $SmsStateCopyWith(SmsState value, $Res Function(SmsState) then) =
      _$SmsStateCopyWithImpl<$Res, SmsState>;
}

/// @nodoc
class _$SmsStateCopyWithImpl<$Res, $Val extends SmsState>
    implements $SmsStateCopyWith<$Res> {
  _$SmsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialSmsStateImplCopyWith<$Res> {
  factory _$$InitialSmsStateImplCopyWith(
    _$InitialSmsStateImpl value,
    $Res Function(_$InitialSmsStateImpl) then,
  ) = __$$InitialSmsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialSmsStateImplCopyWithImpl<$Res>
    extends _$SmsStateCopyWithImpl<$Res, _$InitialSmsStateImpl>
    implements _$$InitialSmsStateImplCopyWith<$Res> {
  __$$InitialSmsStateImplCopyWithImpl(
    _$InitialSmsStateImpl _value,
    $Res Function(_$InitialSmsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialSmsStateImpl extends InitialSmsState {
  const _$InitialSmsStateImpl() : super._();

  @override
  String toString() {
    return 'SmsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialSmsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function(SmsEntity sms) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult? Function(SmsEntity sms)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult Function(SmsEntity sms)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSmsState value) initial,
    required TResult Function(LoadingSmsState value) loading,
    required TResult Function(ErrorSmsState value) error,
    required TResult Function(SuccessSmsState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSmsState value)? initial,
    TResult? Function(LoadingSmsState value)? loading,
    TResult? Function(ErrorSmsState value)? error,
    TResult? Function(SuccessSmsState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSmsState value)? initial,
    TResult Function(LoadingSmsState value)? loading,
    TResult Function(ErrorSmsState value)? error,
    TResult Function(SuccessSmsState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialSmsState extends SmsState {
  const factory InitialSmsState() = _$InitialSmsStateImpl;
  const InitialSmsState._() : super._();
}

/// @nodoc
abstract class _$$LoadingSmsStateImplCopyWith<$Res> {
  factory _$$LoadingSmsStateImplCopyWith(
    _$LoadingSmsStateImpl value,
    $Res Function(_$LoadingSmsStateImpl) then,
  ) = __$$LoadingSmsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingSmsStateImplCopyWithImpl<$Res>
    extends _$SmsStateCopyWithImpl<$Res, _$LoadingSmsStateImpl>
    implements _$$LoadingSmsStateImplCopyWith<$Res> {
  __$$LoadingSmsStateImplCopyWithImpl(
    _$LoadingSmsStateImpl _value,
    $Res Function(_$LoadingSmsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingSmsStateImpl extends LoadingSmsState {
  const _$LoadingSmsStateImpl() : super._();

  @override
  String toString() {
    return 'SmsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingSmsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function(SmsEntity sms) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult? Function(SmsEntity sms)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult Function(SmsEntity sms)? success,
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
    required TResult Function(InitialSmsState value) initial,
    required TResult Function(LoadingSmsState value) loading,
    required TResult Function(ErrorSmsState value) error,
    required TResult Function(SuccessSmsState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSmsState value)? initial,
    TResult? Function(LoadingSmsState value)? loading,
    TResult? Function(ErrorSmsState value)? error,
    TResult? Function(SuccessSmsState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSmsState value)? initial,
    TResult Function(LoadingSmsState value)? loading,
    TResult Function(ErrorSmsState value)? error,
    TResult Function(SuccessSmsState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingSmsState extends SmsState {
  const factory LoadingSmsState() = _$LoadingSmsStateImpl;
  const LoadingSmsState._() : super._();
}

/// @nodoc
abstract class _$$ErrorSmsStateImplCopyWith<$Res> {
  factory _$$ErrorSmsStateImplCopyWith(
    _$ErrorSmsStateImpl value,
    $Res Function(_$ErrorSmsStateImpl) then,
  ) = __$$ErrorSmsStateImplCopyWithImpl<$Res>;
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
class __$$ErrorSmsStateImplCopyWithImpl<$Res>
    extends _$SmsStateCopyWithImpl<$Res, _$ErrorSmsStateImpl>
    implements _$$ErrorSmsStateImplCopyWith<$Res> {
  __$$ErrorSmsStateImplCopyWithImpl(
    _$ErrorSmsStateImpl _value,
    $Res Function(_$ErrorSmsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SmsState
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
      _$ErrorSmsStateImpl(
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

class _$ErrorSmsStateImpl extends ErrorSmsState {
  const _$ErrorSmsStateImpl({
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
    return 'SmsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSmsStateImpl &&
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

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSmsStateImplCopyWith<_$ErrorSmsStateImpl> get copyWith =>
      __$$ErrorSmsStateImplCopyWithImpl<_$ErrorSmsStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function(SmsEntity sms) success,
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult? Function(SmsEntity sms)? success,
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult Function(SmsEntity sms)? success,
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
    required TResult Function(InitialSmsState value) initial,
    required TResult Function(LoadingSmsState value) loading,
    required TResult Function(ErrorSmsState value) error,
    required TResult Function(SuccessSmsState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSmsState value)? initial,
    TResult? Function(LoadingSmsState value)? loading,
    TResult? Function(ErrorSmsState value)? error,
    TResult? Function(SuccessSmsState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSmsState value)? initial,
    TResult Function(LoadingSmsState value)? loading,
    TResult Function(ErrorSmsState value)? error,
    TResult Function(SuccessSmsState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorSmsState extends SmsState {
  const factory ErrorSmsState({
    final String? errorFromApi,
    required final String errorForUser,
    final String? statusCode,
    final StackTrace? stackTrace,
    final String? responseMessage,
  }) = _$ErrorSmsStateImpl;
  const ErrorSmsState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSmsStateImplCopyWith<_$ErrorSmsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessSmsStateImplCopyWith<$Res> {
  factory _$$SuccessSmsStateImplCopyWith(
    _$SuccessSmsStateImpl value,
    $Res Function(_$SuccessSmsStateImpl) then,
  ) = __$$SuccessSmsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SmsEntity sms});
}

/// @nodoc
class __$$SuccessSmsStateImplCopyWithImpl<$Res>
    extends _$SmsStateCopyWithImpl<$Res, _$SuccessSmsStateImpl>
    implements _$$SuccessSmsStateImplCopyWith<$Res> {
  __$$SuccessSmsStateImplCopyWithImpl(
    _$SuccessSmsStateImpl _value,
    $Res Function(_$SuccessSmsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sms = null}) {
    return _then(
      _$SuccessSmsStateImpl(
        null == sms
            ? _value.sms
            : sms // ignore: cast_nullable_to_non_nullable
                  as SmsEntity,
      ),
    );
  }
}

/// @nodoc

class _$SuccessSmsStateImpl extends SuccessSmsState {
  const _$SuccessSmsStateImpl(this.sms) : super._();

  @override
  final SmsEntity sms;

  @override
  String toString() {
    return 'SmsState.success(sms: $sms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessSmsStateImpl &&
            (identical(other.sms, sms) || other.sms == sms));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sms);

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessSmsStateImplCopyWith<_$SuccessSmsStateImpl> get copyWith =>
      __$$SuccessSmsStateImplCopyWithImpl<_$SuccessSmsStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )
    error,
    required TResult Function(SmsEntity sms) success,
  }) {
    return success(sms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult? Function(SmsEntity sms)? success,
  }) {
    return success?.call(sms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage,
    )?
    error,
    TResult Function(SmsEntity sms)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(sms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSmsState value) initial,
    required TResult Function(LoadingSmsState value) loading,
    required TResult Function(ErrorSmsState value) error,
    required TResult Function(SuccessSmsState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSmsState value)? initial,
    TResult? Function(LoadingSmsState value)? loading,
    TResult? Function(ErrorSmsState value)? error,
    TResult? Function(SuccessSmsState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSmsState value)? initial,
    TResult Function(LoadingSmsState value)? loading,
    TResult Function(ErrorSmsState value)? error,
    TResult Function(SuccessSmsState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessSmsState extends SmsState {
  const factory SuccessSmsState(final SmsEntity sms) = _$SuccessSmsStateImpl;
  const SuccessSmsState._() : super._();

  SmsEntity get sms;

  /// Create a copy of SmsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessSmsStateImplCopyWith<_$SuccessSmsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
