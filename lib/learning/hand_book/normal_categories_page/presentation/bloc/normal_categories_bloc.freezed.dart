// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NormalCategoriesEvent {
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
    required TResult Function(GetNormalCategoriesEvent value) get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNormalCategoriesEvent value)? get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNormalCategoriesEvent value)? get,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormalCategoriesEventCopyWith<$Res> {
  factory $NormalCategoriesEventCopyWith(
    NormalCategoriesEvent value,
    $Res Function(NormalCategoriesEvent) then,
  ) = _$NormalCategoriesEventCopyWithImpl<$Res, NormalCategoriesEvent>;
}

/// @nodoc
class _$NormalCategoriesEventCopyWithImpl<
  $Res,
  $Val extends NormalCategoriesEvent
>
    implements $NormalCategoriesEventCopyWith<$Res> {
  _$NormalCategoriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NormalCategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetNormalCategoriesEventImplCopyWith<$Res> {
  factory _$$GetNormalCategoriesEventImplCopyWith(
    _$GetNormalCategoriesEventImpl value,
    $Res Function(_$GetNormalCategoriesEventImpl) then,
  ) = __$$GetNormalCategoriesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNormalCategoriesEventImplCopyWithImpl<$Res>
    extends
        _$NormalCategoriesEventCopyWithImpl<
          $Res,
          _$GetNormalCategoriesEventImpl
        >
    implements _$$GetNormalCategoriesEventImplCopyWith<$Res> {
  __$$GetNormalCategoriesEventImplCopyWithImpl(
    _$GetNormalCategoriesEventImpl _value,
    $Res Function(_$GetNormalCategoriesEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNormalCategoriesEventImpl extends GetNormalCategoriesEvent {
  const _$GetNormalCategoriesEventImpl() : super._();

  @override
  String toString() {
    return 'NormalCategoriesEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNormalCategoriesEventImpl);
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
    required TResult Function(GetNormalCategoriesEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNormalCategoriesEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNormalCategoriesEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetNormalCategoriesEvent extends NormalCategoriesEvent {
  const factory GetNormalCategoriesEvent() = _$GetNormalCategoriesEventImpl;
  const GetNormalCategoriesEvent._() : super._();
}

/// @nodoc
mixin _$NormalCategoriesState {
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
    required TResult Function(List<NormalCategoriesEntity> normalCategories)
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
    TResult? Function(List<NormalCategoriesEntity> normalCategories)? success,
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
    TResult Function(List<NormalCategoriesEntity> normalCategories)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNormalCategoriesState value) loading,
    required TResult Function(ErrorNormalCategoriesState value) error,
    required TResult Function(SuccessNormalCategoriesState value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCategoriesState value)? loading,
    TResult? Function(ErrorNormalCategoriesState value)? error,
    TResult? Function(SuccessNormalCategoriesState value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCategoriesState value)? loading,
    TResult Function(ErrorNormalCategoriesState value)? error,
    TResult Function(SuccessNormalCategoriesState value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormalCategoriesStateCopyWith<$Res> {
  factory $NormalCategoriesStateCopyWith(
    NormalCategoriesState value,
    $Res Function(NormalCategoriesState) then,
  ) = _$NormalCategoriesStateCopyWithImpl<$Res, NormalCategoriesState>;
}

/// @nodoc
class _$NormalCategoriesStateCopyWithImpl<
  $Res,
  $Val extends NormalCategoriesState
>
    implements $NormalCategoriesStateCopyWith<$Res> {
  _$NormalCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NormalCategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingNormalCategoriesStateImplCopyWith<$Res> {
  factory _$$LoadingNormalCategoriesStateImplCopyWith(
    _$LoadingNormalCategoriesStateImpl value,
    $Res Function(_$LoadingNormalCategoriesStateImpl) then,
  ) = __$$LoadingNormalCategoriesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNormalCategoriesStateImplCopyWithImpl<$Res>
    extends
        _$NormalCategoriesStateCopyWithImpl<
          $Res,
          _$LoadingNormalCategoriesStateImpl
        >
    implements _$$LoadingNormalCategoriesStateImplCopyWith<$Res> {
  __$$LoadingNormalCategoriesStateImplCopyWithImpl(
    _$LoadingNormalCategoriesStateImpl _value,
    $Res Function(_$LoadingNormalCategoriesStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingNormalCategoriesStateImpl extends LoadingNormalCategoriesState {
  const _$LoadingNormalCategoriesStateImpl() : super._();

  @override
  String toString() {
    return 'NormalCategoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNormalCategoriesStateImpl);
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
    required TResult Function(List<NormalCategoriesEntity> normalCategories)
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
    TResult? Function(List<NormalCategoriesEntity> normalCategories)? success,
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
    TResult Function(List<NormalCategoriesEntity> normalCategories)? success,
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
    required TResult Function(LoadingNormalCategoriesState value) loading,
    required TResult Function(ErrorNormalCategoriesState value) error,
    required TResult Function(SuccessNormalCategoriesState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCategoriesState value)? loading,
    TResult? Function(ErrorNormalCategoriesState value)? error,
    TResult? Function(SuccessNormalCategoriesState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCategoriesState value)? loading,
    TResult Function(ErrorNormalCategoriesState value)? error,
    TResult Function(SuccessNormalCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingNormalCategoriesState extends NormalCategoriesState {
  const factory LoadingNormalCategoriesState() =
      _$LoadingNormalCategoriesStateImpl;
  const LoadingNormalCategoriesState._() : super._();
}

/// @nodoc
abstract class _$$ErrorNormalCategoriesStateImplCopyWith<$Res> {
  factory _$$ErrorNormalCategoriesStateImplCopyWith(
    _$ErrorNormalCategoriesStateImpl value,
    $Res Function(_$ErrorNormalCategoriesStateImpl) then,
  ) = __$$ErrorNormalCategoriesStateImplCopyWithImpl<$Res>;
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
class __$$ErrorNormalCategoriesStateImplCopyWithImpl<$Res>
    extends
        _$NormalCategoriesStateCopyWithImpl<
          $Res,
          _$ErrorNormalCategoriesStateImpl
        >
    implements _$$ErrorNormalCategoriesStateImplCopyWith<$Res> {
  __$$ErrorNormalCategoriesStateImplCopyWithImpl(
    _$ErrorNormalCategoriesStateImpl _value,
    $Res Function(_$ErrorNormalCategoriesStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCategoriesState
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
      _$ErrorNormalCategoriesStateImpl(
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

class _$ErrorNormalCategoriesStateImpl extends ErrorNormalCategoriesState {
  const _$ErrorNormalCategoriesStateImpl({
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
    return 'NormalCategoriesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorNormalCategoriesStateImpl &&
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

  /// Create a copy of NormalCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorNormalCategoriesStateImplCopyWith<_$ErrorNormalCategoriesStateImpl>
  get copyWith =>
      __$$ErrorNormalCategoriesStateImplCopyWithImpl<
        _$ErrorNormalCategoriesStateImpl
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
    required TResult Function(List<NormalCategoriesEntity> normalCategories)
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
    TResult? Function(List<NormalCategoriesEntity> normalCategories)? success,
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
    TResult Function(List<NormalCategoriesEntity> normalCategories)? success,
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
    required TResult Function(LoadingNormalCategoriesState value) loading,
    required TResult Function(ErrorNormalCategoriesState value) error,
    required TResult Function(SuccessNormalCategoriesState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCategoriesState value)? loading,
    TResult? Function(ErrorNormalCategoriesState value)? error,
    TResult? Function(SuccessNormalCategoriesState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCategoriesState value)? loading,
    TResult Function(ErrorNormalCategoriesState value)? error,
    TResult Function(SuccessNormalCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorNormalCategoriesState extends NormalCategoriesState {
  const factory ErrorNormalCategoriesState({
    final String? errorFromApi,
    required final String errorForUser,
    final String? statusCode,
    final StackTrace? stackTrace,
    final String? responseMessage,
  }) = _$ErrorNormalCategoriesStateImpl;
  const ErrorNormalCategoriesState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of NormalCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorNormalCategoriesStateImplCopyWith<_$ErrorNormalCategoriesStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessNormalCategoriesStateImplCopyWith<$Res> {
  factory _$$SuccessNormalCategoriesStateImplCopyWith(
    _$SuccessNormalCategoriesStateImpl value,
    $Res Function(_$SuccessNormalCategoriesStateImpl) then,
  ) = __$$SuccessNormalCategoriesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NormalCategoriesEntity> normalCategories});
}

/// @nodoc
class __$$SuccessNormalCategoriesStateImplCopyWithImpl<$Res>
    extends
        _$NormalCategoriesStateCopyWithImpl<
          $Res,
          _$SuccessNormalCategoriesStateImpl
        >
    implements _$$SuccessNormalCategoriesStateImplCopyWith<$Res> {
  __$$SuccessNormalCategoriesStateImplCopyWithImpl(
    _$SuccessNormalCategoriesStateImpl _value,
    $Res Function(_$SuccessNormalCategoriesStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? normalCategories = null}) {
    return _then(
      _$SuccessNormalCategoriesStateImpl(
        normalCategories: null == normalCategories
            ? _value._normalCategories
            : normalCategories // ignore: cast_nullable_to_non_nullable
                  as List<NormalCategoriesEntity>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessNormalCategoriesStateImpl extends SuccessNormalCategoriesState {
  const _$SuccessNormalCategoriesStateImpl({
    required final List<NormalCategoriesEntity> normalCategories,
  }) : _normalCategories = normalCategories,
       super._();

  final List<NormalCategoriesEntity> _normalCategories;
  @override
  List<NormalCategoriesEntity> get normalCategories {
    if (_normalCategories is EqualUnmodifiableListView)
      return _normalCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_normalCategories);
  }

  @override
  String toString() {
    return 'NormalCategoriesState.success(normalCategories: $normalCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessNormalCategoriesStateImpl &&
            const DeepCollectionEquality().equals(
              other._normalCategories,
              _normalCategories,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_normalCategories),
  );

  /// Create a copy of NormalCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessNormalCategoriesStateImplCopyWith<
    _$SuccessNormalCategoriesStateImpl
  >
  get copyWith =>
      __$$SuccessNormalCategoriesStateImplCopyWithImpl<
        _$SuccessNormalCategoriesStateImpl
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
    required TResult Function(List<NormalCategoriesEntity> normalCategories)
    success,
  }) {
    return success(normalCategories);
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
    TResult? Function(List<NormalCategoriesEntity> normalCategories)? success,
  }) {
    return success?.call(normalCategories);
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
    TResult Function(List<NormalCategoriesEntity> normalCategories)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(normalCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNormalCategoriesState value) loading,
    required TResult Function(ErrorNormalCategoriesState value) error,
    required TResult Function(SuccessNormalCategoriesState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCategoriesState value)? loading,
    TResult? Function(ErrorNormalCategoriesState value)? error,
    TResult? Function(SuccessNormalCategoriesState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCategoriesState value)? loading,
    TResult Function(ErrorNormalCategoriesState value)? error,
    TResult Function(SuccessNormalCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessNormalCategoriesState extends NormalCategoriesState {
  const factory SuccessNormalCategoriesState({
    required final List<NormalCategoriesEntity> normalCategories,
  }) = _$SuccessNormalCategoriesStateImpl;
  const SuccessNormalCategoriesState._() : super._();

  List<NormalCategoriesEntity> get normalCategories;

  /// Create a copy of NormalCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessNormalCategoriesStateImplCopyWith<
    _$SuccessNormalCategoriesStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
