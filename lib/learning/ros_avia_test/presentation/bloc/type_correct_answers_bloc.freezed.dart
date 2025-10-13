// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_correct_answers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TypeCorrectAnswersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() get}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? get}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTypeCorrectAnswersEvent value) get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTypeCorrectAnswersEvent value)? get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTypeCorrectAnswersEvent value)? get,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeCorrectAnswersEventCopyWith<$Res> {
  factory $TypeCorrectAnswersEventCopyWith(
    TypeCorrectAnswersEvent value,
    $Res Function(TypeCorrectAnswersEvent) then,
  ) = _$TypeCorrectAnswersEventCopyWithImpl<$Res, TypeCorrectAnswersEvent>;
}

/// @nodoc
class _$TypeCorrectAnswersEventCopyWithImpl<
  $Res,
  $Val extends TypeCorrectAnswersEvent
>
    implements $TypeCorrectAnswersEventCopyWith<$Res> {
  _$TypeCorrectAnswersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeCorrectAnswersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetTypeCorrectAnswersEventImplCopyWith<$Res> {
  factory _$$GetTypeCorrectAnswersEventImplCopyWith(
    _$GetTypeCorrectAnswersEventImpl value,
    $Res Function(_$GetTypeCorrectAnswersEventImpl) then,
  ) = __$$GetTypeCorrectAnswersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTypeCorrectAnswersEventImplCopyWithImpl<$Res>
    extends
        _$TypeCorrectAnswersEventCopyWithImpl<
          $Res,
          _$GetTypeCorrectAnswersEventImpl
        >
    implements _$$GetTypeCorrectAnswersEventImplCopyWith<$Res> {
  __$$GetTypeCorrectAnswersEventImplCopyWithImpl(
    _$GetTypeCorrectAnswersEventImpl _value,
    $Res Function(_$GetTypeCorrectAnswersEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypeCorrectAnswersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTypeCorrectAnswersEventImpl extends GetTypeCorrectAnswersEvent {
  const _$GetTypeCorrectAnswersEventImpl() : super._();

  @override
  String toString() {
    return 'TypeCorrectAnswersEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTypeCorrectAnswersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() get}) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? get}) {
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
    required TResult Function(GetTypeCorrectAnswersEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTypeCorrectAnswersEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTypeCorrectAnswersEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetTypeCorrectAnswersEvent extends TypeCorrectAnswersEvent {
  const factory GetTypeCorrectAnswersEvent() = _$GetTypeCorrectAnswersEventImpl;
  const GetTypeCorrectAnswersEvent._() : super._();
}

/// @nodoc
mixin _$TypeCorrectAnswersState {
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
    required TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)
    success,
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
    TResult? Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
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
    TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingTypeCorrectAnswersState value) loading,
    required TResult Function(ErrorTypeCorrectAnswersState value) error,
    required TResult Function(SuccessTypeCorrectAnswersState value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult? Function(ErrorTypeCorrectAnswersState value)? error,
    TResult? Function(SuccessTypeCorrectAnswersState value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult Function(ErrorTypeCorrectAnswersState value)? error,
    TResult Function(SuccessTypeCorrectAnswersState value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeCorrectAnswersStateCopyWith<$Res> {
  factory $TypeCorrectAnswersStateCopyWith(
    TypeCorrectAnswersState value,
    $Res Function(TypeCorrectAnswersState) then,
  ) = _$TypeCorrectAnswersStateCopyWithImpl<$Res, TypeCorrectAnswersState>;
}

/// @nodoc
class _$TypeCorrectAnswersStateCopyWithImpl<
  $Res,
  $Val extends TypeCorrectAnswersState
>
    implements $TypeCorrectAnswersStateCopyWith<$Res> {
  _$TypeCorrectAnswersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeCorrectAnswersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingTypeCorrectAnswersStateImplCopyWith<$Res> {
  factory _$$LoadingTypeCorrectAnswersStateImplCopyWith(
    _$LoadingTypeCorrectAnswersStateImpl value,
    $Res Function(_$LoadingTypeCorrectAnswersStateImpl) then,
  ) = __$$LoadingTypeCorrectAnswersStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingTypeCorrectAnswersStateImplCopyWithImpl<$Res>
    extends
        _$TypeCorrectAnswersStateCopyWithImpl<
          $Res,
          _$LoadingTypeCorrectAnswersStateImpl
        >
    implements _$$LoadingTypeCorrectAnswersStateImplCopyWith<$Res> {
  __$$LoadingTypeCorrectAnswersStateImplCopyWithImpl(
    _$LoadingTypeCorrectAnswersStateImpl _value,
    $Res Function(_$LoadingTypeCorrectAnswersStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypeCorrectAnswersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingTypeCorrectAnswersStateImpl
    extends LoadingTypeCorrectAnswersState {
  const _$LoadingTypeCorrectAnswersStateImpl() : super._();

  @override
  String toString() {
    return 'TypeCorrectAnswersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingTypeCorrectAnswersStateImpl);
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
    required TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)
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
      String? responseMessage,
    )?
    error,
    TResult? Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
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
    TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
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
    required TResult Function(LoadingTypeCorrectAnswersState value) loading,
    required TResult Function(ErrorTypeCorrectAnswersState value) error,
    required TResult Function(SuccessTypeCorrectAnswersState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult? Function(ErrorTypeCorrectAnswersState value)? error,
    TResult? Function(SuccessTypeCorrectAnswersState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult Function(ErrorTypeCorrectAnswersState value)? error,
    TResult Function(SuccessTypeCorrectAnswersState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingTypeCorrectAnswersState extends TypeCorrectAnswersState {
  const factory LoadingTypeCorrectAnswersState() =
      _$LoadingTypeCorrectAnswersStateImpl;
  const LoadingTypeCorrectAnswersState._() : super._();
}

/// @nodoc
abstract class _$$ErrorTypeCorrectAnswersStateImplCopyWith<$Res> {
  factory _$$ErrorTypeCorrectAnswersStateImplCopyWith(
    _$ErrorTypeCorrectAnswersStateImpl value,
    $Res Function(_$ErrorTypeCorrectAnswersStateImpl) then,
  ) = __$$ErrorTypeCorrectAnswersStateImplCopyWithImpl<$Res>;
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
class __$$ErrorTypeCorrectAnswersStateImplCopyWithImpl<$Res>
    extends
        _$TypeCorrectAnswersStateCopyWithImpl<
          $Res,
          _$ErrorTypeCorrectAnswersStateImpl
        >
    implements _$$ErrorTypeCorrectAnswersStateImplCopyWith<$Res> {
  __$$ErrorTypeCorrectAnswersStateImplCopyWithImpl(
    _$ErrorTypeCorrectAnswersStateImpl _value,
    $Res Function(_$ErrorTypeCorrectAnswersStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypeCorrectAnswersState
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
      _$ErrorTypeCorrectAnswersStateImpl(
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

class _$ErrorTypeCorrectAnswersStateImpl extends ErrorTypeCorrectAnswersState {
  const _$ErrorTypeCorrectAnswersStateImpl({
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
    return 'TypeCorrectAnswersState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorTypeCorrectAnswersStateImpl &&
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

  /// Create a copy of TypeCorrectAnswersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorTypeCorrectAnswersStateImplCopyWith<
    _$ErrorTypeCorrectAnswersStateImpl
  >
  get copyWith =>
      __$$ErrorTypeCorrectAnswersStateImplCopyWithImpl<
        _$ErrorTypeCorrectAnswersStateImpl
      >(this, _$identity);

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
    required TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)
    success,
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
    TResult? Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
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
    TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
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
    required TResult Function(LoadingTypeCorrectAnswersState value) loading,
    required TResult Function(ErrorTypeCorrectAnswersState value) error,
    required TResult Function(SuccessTypeCorrectAnswersState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult? Function(ErrorTypeCorrectAnswersState value)? error,
    TResult? Function(SuccessTypeCorrectAnswersState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult Function(ErrorTypeCorrectAnswersState value)? error,
    TResult Function(SuccessTypeCorrectAnswersState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorTypeCorrectAnswersState extends TypeCorrectAnswersState {
  const factory ErrorTypeCorrectAnswersState({
    final String? errorFromApi,
    required final String errorForUser,
    final String? statusCode,
    final StackTrace? stackTrace,
    final String? responseMessage,
  }) = _$ErrorTypeCorrectAnswersStateImpl;
  const ErrorTypeCorrectAnswersState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of TypeCorrectAnswersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorTypeCorrectAnswersStateImplCopyWith<
    _$ErrorTypeCorrectAnswersStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessTypeCorrectAnswersStateImplCopyWith<$Res> {
  factory _$$SuccessTypeCorrectAnswersStateImplCopyWith(
    _$SuccessTypeCorrectAnswersStateImpl value,
    $Res Function(_$SuccessTypeCorrectAnswersStateImpl) then,
  ) = __$$SuccessTypeCorrectAnswersStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TypeCorrectAnswerEntity> typeCorrectAnswer});
}

/// @nodoc
class __$$SuccessTypeCorrectAnswersStateImplCopyWithImpl<$Res>
    extends
        _$TypeCorrectAnswersStateCopyWithImpl<
          $Res,
          _$SuccessTypeCorrectAnswersStateImpl
        >
    implements _$$SuccessTypeCorrectAnswersStateImplCopyWith<$Res> {
  __$$SuccessTypeCorrectAnswersStateImplCopyWithImpl(
    _$SuccessTypeCorrectAnswersStateImpl _value,
    $Res Function(_$SuccessTypeCorrectAnswersStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypeCorrectAnswersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? typeCorrectAnswer = null}) {
    return _then(
      _$SuccessTypeCorrectAnswersStateImpl(
        typeCorrectAnswer: null == typeCorrectAnswer
            ? _value._typeCorrectAnswer
            : typeCorrectAnswer // ignore: cast_nullable_to_non_nullable
                  as List<TypeCorrectAnswerEntity>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessTypeCorrectAnswersStateImpl
    extends SuccessTypeCorrectAnswersState {
  const _$SuccessTypeCorrectAnswersStateImpl({
    required final List<TypeCorrectAnswerEntity> typeCorrectAnswer,
  }) : _typeCorrectAnswer = typeCorrectAnswer,
       super._();

  final List<TypeCorrectAnswerEntity> _typeCorrectAnswer;
  @override
  List<TypeCorrectAnswerEntity> get typeCorrectAnswer {
    if (_typeCorrectAnswer is EqualUnmodifiableListView)
      return _typeCorrectAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeCorrectAnswer);
  }

  @override
  String toString() {
    return 'TypeCorrectAnswersState.success(typeCorrectAnswer: $typeCorrectAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessTypeCorrectAnswersStateImpl &&
            const DeepCollectionEquality().equals(
              other._typeCorrectAnswer,
              _typeCorrectAnswer,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_typeCorrectAnswer),
  );

  /// Create a copy of TypeCorrectAnswersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessTypeCorrectAnswersStateImplCopyWith<
    _$SuccessTypeCorrectAnswersStateImpl
  >
  get copyWith =>
      __$$SuccessTypeCorrectAnswersStateImplCopyWithImpl<
        _$SuccessTypeCorrectAnswersStateImpl
      >(this, _$identity);

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
    required TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)
    success,
  }) {
    return success(typeCorrectAnswer);
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
    TResult? Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
  }) {
    return success?.call(typeCorrectAnswer);
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
    TResult Function(List<TypeCorrectAnswerEntity> typeCorrectAnswer)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(typeCorrectAnswer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingTypeCorrectAnswersState value) loading,
    required TResult Function(ErrorTypeCorrectAnswersState value) error,
    required TResult Function(SuccessTypeCorrectAnswersState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult? Function(ErrorTypeCorrectAnswersState value)? error,
    TResult? Function(SuccessTypeCorrectAnswersState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingTypeCorrectAnswersState value)? loading,
    TResult Function(ErrorTypeCorrectAnswersState value)? error,
    TResult Function(SuccessTypeCorrectAnswersState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessTypeCorrectAnswersState extends TypeCorrectAnswersState {
  const factory SuccessTypeCorrectAnswersState({
    required final List<TypeCorrectAnswerEntity> typeCorrectAnswer,
  }) = _$SuccessTypeCorrectAnswersStateImpl;
  const SuccessTypeCorrectAnswersState._() : super._();

  List<TypeCorrectAnswerEntity> get typeCorrectAnswer;

  /// Create a copy of TypeCorrectAnswersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessTypeCorrectAnswersStateImplCopyWith<
    _$SuccessTypeCorrectAnswersStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
