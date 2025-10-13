// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'normal_check_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NormalCheckListEvent {
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
    required TResult Function(GetNormalCheckListEvent value) get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNormalCheckListEvent value)? get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNormalCheckListEvent value)? get,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormalCheckListEventCopyWith<$Res> {
  factory $NormalCheckListEventCopyWith(
    NormalCheckListEvent value,
    $Res Function(NormalCheckListEvent) then,
  ) = _$NormalCheckListEventCopyWithImpl<$Res, NormalCheckListEvent>;
}

/// @nodoc
class _$NormalCheckListEventCopyWithImpl<
  $Res,
  $Val extends NormalCheckListEvent
>
    implements $NormalCheckListEventCopyWith<$Res> {
  _$NormalCheckListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NormalCheckListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetNormalCheckListEventImplCopyWith<$Res> {
  factory _$$GetNormalCheckListEventImplCopyWith(
    _$GetNormalCheckListEventImpl value,
    $Res Function(_$GetNormalCheckListEventImpl) then,
  ) = __$$GetNormalCheckListEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNormalCheckListEventImplCopyWithImpl<$Res>
    extends
        _$NormalCheckListEventCopyWithImpl<$Res, _$GetNormalCheckListEventImpl>
    implements _$$GetNormalCheckListEventImplCopyWith<$Res> {
  __$$GetNormalCheckListEventImplCopyWithImpl(
    _$GetNormalCheckListEventImpl _value,
    $Res Function(_$GetNormalCheckListEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCheckListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNormalCheckListEventImpl extends GetNormalCheckListEvent {
  const _$GetNormalCheckListEventImpl() : super._();

  @override
  String toString() {
    return 'NormalCheckListEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNormalCheckListEventImpl);
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
    required TResult Function(GetNormalCheckListEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNormalCheckListEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNormalCheckListEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetNormalCheckListEvent extends NormalCheckListEvent {
  const factory GetNormalCheckListEvent() = _$GetNormalCheckListEventImpl;
  const GetNormalCheckListEvent._() : super._();
}

/// @nodoc
mixin _$NormalCheckListState {
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
    required TResult Function(List<NormalCheckListEntity> normalCheckList)
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
    TResult? Function(List<NormalCheckListEntity> normalCheckList)? success,
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
    TResult Function(List<NormalCheckListEntity> normalCheckList)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNormalCheckListState value) loading,
    required TResult Function(ErrorNormalCheckListState value) error,
    required TResult Function(SuccessNormalCheckListState value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCheckListState value)? loading,
    TResult? Function(ErrorNormalCheckListState value)? error,
    TResult? Function(SuccessNormalCheckListState value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCheckListState value)? loading,
    TResult Function(ErrorNormalCheckListState value)? error,
    TResult Function(SuccessNormalCheckListState value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormalCheckListStateCopyWith<$Res> {
  factory $NormalCheckListStateCopyWith(
    NormalCheckListState value,
    $Res Function(NormalCheckListState) then,
  ) = _$NormalCheckListStateCopyWithImpl<$Res, NormalCheckListState>;
}

/// @nodoc
class _$NormalCheckListStateCopyWithImpl<
  $Res,
  $Val extends NormalCheckListState
>
    implements $NormalCheckListStateCopyWith<$Res> {
  _$NormalCheckListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NormalCheckListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingNormalCheckListStateImplCopyWith<$Res> {
  factory _$$LoadingNormalCheckListStateImplCopyWith(
    _$LoadingNormalCheckListStateImpl value,
    $Res Function(_$LoadingNormalCheckListStateImpl) then,
  ) = __$$LoadingNormalCheckListStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNormalCheckListStateImplCopyWithImpl<$Res>
    extends
        _$NormalCheckListStateCopyWithImpl<
          $Res,
          _$LoadingNormalCheckListStateImpl
        >
    implements _$$LoadingNormalCheckListStateImplCopyWith<$Res> {
  __$$LoadingNormalCheckListStateImplCopyWithImpl(
    _$LoadingNormalCheckListStateImpl _value,
    $Res Function(_$LoadingNormalCheckListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCheckListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingNormalCheckListStateImpl extends LoadingNormalCheckListState {
  const _$LoadingNormalCheckListStateImpl() : super._();

  @override
  String toString() {
    return 'NormalCheckListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNormalCheckListStateImpl);
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
    required TResult Function(List<NormalCheckListEntity> normalCheckList)
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
    TResult? Function(List<NormalCheckListEntity> normalCheckList)? success,
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
    TResult Function(List<NormalCheckListEntity> normalCheckList)? success,
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
    required TResult Function(LoadingNormalCheckListState value) loading,
    required TResult Function(ErrorNormalCheckListState value) error,
    required TResult Function(SuccessNormalCheckListState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCheckListState value)? loading,
    TResult? Function(ErrorNormalCheckListState value)? error,
    TResult? Function(SuccessNormalCheckListState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCheckListState value)? loading,
    TResult Function(ErrorNormalCheckListState value)? error,
    TResult Function(SuccessNormalCheckListState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingNormalCheckListState extends NormalCheckListState {
  const factory LoadingNormalCheckListState() =
      _$LoadingNormalCheckListStateImpl;
  const LoadingNormalCheckListState._() : super._();
}

/// @nodoc
abstract class _$$ErrorNormalCheckListStateImplCopyWith<$Res> {
  factory _$$ErrorNormalCheckListStateImplCopyWith(
    _$ErrorNormalCheckListStateImpl value,
    $Res Function(_$ErrorNormalCheckListStateImpl) then,
  ) = __$$ErrorNormalCheckListStateImplCopyWithImpl<$Res>;
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
class __$$ErrorNormalCheckListStateImplCopyWithImpl<$Res>
    extends
        _$NormalCheckListStateCopyWithImpl<
          $Res,
          _$ErrorNormalCheckListStateImpl
        >
    implements _$$ErrorNormalCheckListStateImplCopyWith<$Res> {
  __$$ErrorNormalCheckListStateImplCopyWithImpl(
    _$ErrorNormalCheckListStateImpl _value,
    $Res Function(_$ErrorNormalCheckListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCheckListState
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
      _$ErrorNormalCheckListStateImpl(
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

class _$ErrorNormalCheckListStateImpl extends ErrorNormalCheckListState {
  const _$ErrorNormalCheckListStateImpl({
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
    return 'NormalCheckListState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorNormalCheckListStateImpl &&
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

  /// Create a copy of NormalCheckListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorNormalCheckListStateImplCopyWith<_$ErrorNormalCheckListStateImpl>
  get copyWith =>
      __$$ErrorNormalCheckListStateImplCopyWithImpl<
        _$ErrorNormalCheckListStateImpl
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
    required TResult Function(List<NormalCheckListEntity> normalCheckList)
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
    TResult? Function(List<NormalCheckListEntity> normalCheckList)? success,
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
    TResult Function(List<NormalCheckListEntity> normalCheckList)? success,
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
    required TResult Function(LoadingNormalCheckListState value) loading,
    required TResult Function(ErrorNormalCheckListState value) error,
    required TResult Function(SuccessNormalCheckListState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCheckListState value)? loading,
    TResult? Function(ErrorNormalCheckListState value)? error,
    TResult? Function(SuccessNormalCheckListState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCheckListState value)? loading,
    TResult Function(ErrorNormalCheckListState value)? error,
    TResult Function(SuccessNormalCheckListState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorNormalCheckListState extends NormalCheckListState {
  const factory ErrorNormalCheckListState({
    final String? errorFromApi,
    required final String errorForUser,
    final String? statusCode,
    final StackTrace? stackTrace,
    final String? responseMessage,
  }) = _$ErrorNormalCheckListStateImpl;
  const ErrorNormalCheckListState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of NormalCheckListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorNormalCheckListStateImplCopyWith<_$ErrorNormalCheckListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessNormalCheckListStateImplCopyWith<$Res> {
  factory _$$SuccessNormalCheckListStateImplCopyWith(
    _$SuccessNormalCheckListStateImpl value,
    $Res Function(_$SuccessNormalCheckListStateImpl) then,
  ) = __$$SuccessNormalCheckListStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NormalCheckListEntity> normalCheckList});
}

/// @nodoc
class __$$SuccessNormalCheckListStateImplCopyWithImpl<$Res>
    extends
        _$NormalCheckListStateCopyWithImpl<
          $Res,
          _$SuccessNormalCheckListStateImpl
        >
    implements _$$SuccessNormalCheckListStateImplCopyWith<$Res> {
  __$$SuccessNormalCheckListStateImplCopyWithImpl(
    _$SuccessNormalCheckListStateImpl _value,
    $Res Function(_$SuccessNormalCheckListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalCheckListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? normalCheckList = null}) {
    return _then(
      _$SuccessNormalCheckListStateImpl(
        normalCheckList: null == normalCheckList
            ? _value._normalCheckList
            : normalCheckList // ignore: cast_nullable_to_non_nullable
                  as List<NormalCheckListEntity>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessNormalCheckListStateImpl extends SuccessNormalCheckListState {
  const _$SuccessNormalCheckListStateImpl({
    required final List<NormalCheckListEntity> normalCheckList,
  }) : _normalCheckList = normalCheckList,
       super._();

  final List<NormalCheckListEntity> _normalCheckList;
  @override
  List<NormalCheckListEntity> get normalCheckList {
    if (_normalCheckList is EqualUnmodifiableListView) return _normalCheckList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_normalCheckList);
  }

  @override
  String toString() {
    return 'NormalCheckListState.success(normalCheckList: $normalCheckList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessNormalCheckListStateImpl &&
            const DeepCollectionEquality().equals(
              other._normalCheckList,
              _normalCheckList,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_normalCheckList),
  );

  /// Create a copy of NormalCheckListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessNormalCheckListStateImplCopyWith<_$SuccessNormalCheckListStateImpl>
  get copyWith =>
      __$$SuccessNormalCheckListStateImplCopyWithImpl<
        _$SuccessNormalCheckListStateImpl
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
    required TResult Function(List<NormalCheckListEntity> normalCheckList)
    success,
  }) {
    return success(normalCheckList);
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
    TResult? Function(List<NormalCheckListEntity> normalCheckList)? success,
  }) {
    return success?.call(normalCheckList);
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
    TResult Function(List<NormalCheckListEntity> normalCheckList)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(normalCheckList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNormalCheckListState value) loading,
    required TResult Function(ErrorNormalCheckListState value) error,
    required TResult Function(SuccessNormalCheckListState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNormalCheckListState value)? loading,
    TResult? Function(ErrorNormalCheckListState value)? error,
    TResult? Function(SuccessNormalCheckListState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNormalCheckListState value)? loading,
    TResult Function(ErrorNormalCheckListState value)? error,
    TResult Function(SuccessNormalCheckListState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessNormalCheckListState extends NormalCheckListState {
  const factory SuccessNormalCheckListState({
    required final List<NormalCheckListEntity> normalCheckList,
  }) = _$SuccessNormalCheckListStateImpl;
  const SuccessNormalCheckListState._() : super._();

  List<NormalCheckListEntity> get normalCheckList;

  /// Create a copy of NormalCheckListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessNormalCheckListStateImplCopyWith<_$SuccessNormalCheckListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
