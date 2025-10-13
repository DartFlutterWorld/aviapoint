// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DetailNewsEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? get,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailNewsEvent value) get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailNewsEvent value)? get,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailNewsEvent value)? get,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of DetailNewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailNewsEventCopyWith<DetailNewsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailNewsEventCopyWith<$Res> {
  factory $DetailNewsEventCopyWith(
    DetailNewsEvent value,
    $Res Function(DetailNewsEvent) then,
  ) = _$DetailNewsEventCopyWithImpl<$Res, DetailNewsEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DetailNewsEventCopyWithImpl<$Res, $Val extends DetailNewsEvent>
    implements $DetailNewsEventCopyWith<$Res> {
  _$DetailNewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailNewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetDetailNewsEventImplCopyWith<$Res>
    implements $DetailNewsEventCopyWith<$Res> {
  factory _$$GetDetailNewsEventImplCopyWith(
    _$GetDetailNewsEventImpl value,
    $Res Function(_$GetDetailNewsEventImpl) then,
  ) = __$$GetDetailNewsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetDetailNewsEventImplCopyWithImpl<$Res>
    extends _$DetailNewsEventCopyWithImpl<$Res, _$GetDetailNewsEventImpl>
    implements _$$GetDetailNewsEventImplCopyWith<$Res> {
  __$$GetDetailNewsEventImplCopyWithImpl(
    _$GetDetailNewsEventImpl _value,
    $Res Function(_$GetDetailNewsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailNewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$GetDetailNewsEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetDetailNewsEventImpl extends GetDetailNewsEvent {
  const _$GetDetailNewsEventImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'DetailNewsEvent.get(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailNewsEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DetailNewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailNewsEventImplCopyWith<_$GetDetailNewsEventImpl> get copyWith =>
      __$$GetDetailNewsEventImplCopyWithImpl<_$GetDetailNewsEventImpl>(
        this,
        _$identity,
      );

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
    required TResult Function(GetDetailNewsEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailNewsEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailNewsEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetDetailNewsEvent extends DetailNewsEvent {
  const factory GetDetailNewsEvent({required final int id}) =
      _$GetDetailNewsEventImpl;
  const GetDetailNewsEvent._() : super._();

  @override
  int get id;

  /// Create a copy of DetailNewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDetailNewsEventImplCopyWith<_$GetDetailNewsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailNewsState {
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
    required TResult Function(NewsEntity news) success,
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
    TResult? Function(NewsEntity news)? success,
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
    TResult Function(NewsEntity news)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDetailNewsState value) loading,
    required TResult Function(ErrorDetailNewsState value) error,
    required TResult Function(SuccessDetailNewsState value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailNewsState value)? loading,
    TResult? Function(ErrorDetailNewsState value)? error,
    TResult? Function(SuccessDetailNewsState value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailNewsState value)? loading,
    TResult Function(ErrorDetailNewsState value)? error,
    TResult Function(SuccessDetailNewsState value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailNewsStateCopyWith<$Res> {
  factory $DetailNewsStateCopyWith(
    DetailNewsState value,
    $Res Function(DetailNewsState) then,
  ) = _$DetailNewsStateCopyWithImpl<$Res, DetailNewsState>;
}

/// @nodoc
class _$DetailNewsStateCopyWithImpl<$Res, $Val extends DetailNewsState>
    implements $DetailNewsStateCopyWith<$Res> {
  _$DetailNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailNewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingDetailNewsStateImplCopyWith<$Res> {
  factory _$$LoadingDetailNewsStateImplCopyWith(
    _$LoadingDetailNewsStateImpl value,
    $Res Function(_$LoadingDetailNewsStateImpl) then,
  ) = __$$LoadingDetailNewsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingDetailNewsStateImplCopyWithImpl<$Res>
    extends _$DetailNewsStateCopyWithImpl<$Res, _$LoadingDetailNewsStateImpl>
    implements _$$LoadingDetailNewsStateImplCopyWith<$Res> {
  __$$LoadingDetailNewsStateImplCopyWithImpl(
    _$LoadingDetailNewsStateImpl _value,
    $Res Function(_$LoadingDetailNewsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailNewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingDetailNewsStateImpl extends LoadingDetailNewsState {
  const _$LoadingDetailNewsStateImpl() : super._();

  @override
  String toString() {
    return 'DetailNewsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingDetailNewsStateImpl);
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
    required TResult Function(NewsEntity news) success,
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
    TResult? Function(NewsEntity news)? success,
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
    TResult Function(NewsEntity news)? success,
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
    required TResult Function(LoadingDetailNewsState value) loading,
    required TResult Function(ErrorDetailNewsState value) error,
    required TResult Function(SuccessDetailNewsState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailNewsState value)? loading,
    TResult? Function(ErrorDetailNewsState value)? error,
    TResult? Function(SuccessDetailNewsState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailNewsState value)? loading,
    TResult Function(ErrorDetailNewsState value)? error,
    TResult Function(SuccessDetailNewsState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingDetailNewsState extends DetailNewsState {
  const factory LoadingDetailNewsState() = _$LoadingDetailNewsStateImpl;
  const LoadingDetailNewsState._() : super._();
}

/// @nodoc
abstract class _$$ErrorDetailNewsStateImplCopyWith<$Res> {
  factory _$$ErrorDetailNewsStateImplCopyWith(
    _$ErrorDetailNewsStateImpl value,
    $Res Function(_$ErrorDetailNewsStateImpl) then,
  ) = __$$ErrorDetailNewsStateImplCopyWithImpl<$Res>;
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
class __$$ErrorDetailNewsStateImplCopyWithImpl<$Res>
    extends _$DetailNewsStateCopyWithImpl<$Res, _$ErrorDetailNewsStateImpl>
    implements _$$ErrorDetailNewsStateImplCopyWith<$Res> {
  __$$ErrorDetailNewsStateImplCopyWithImpl(
    _$ErrorDetailNewsStateImpl _value,
    $Res Function(_$ErrorDetailNewsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailNewsState
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
      _$ErrorDetailNewsStateImpl(
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

class _$ErrorDetailNewsStateImpl extends ErrorDetailNewsState {
  const _$ErrorDetailNewsStateImpl({
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
    return 'DetailNewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailNewsStateImpl &&
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

  /// Create a copy of DetailNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailNewsStateImplCopyWith<_$ErrorDetailNewsStateImpl>
  get copyWith =>
      __$$ErrorDetailNewsStateImplCopyWithImpl<_$ErrorDetailNewsStateImpl>(
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
    required TResult Function(NewsEntity news) success,
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
    TResult? Function(NewsEntity news)? success,
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
    TResult Function(NewsEntity news)? success,
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
    required TResult Function(LoadingDetailNewsState value) loading,
    required TResult Function(ErrorDetailNewsState value) error,
    required TResult Function(SuccessDetailNewsState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailNewsState value)? loading,
    TResult? Function(ErrorDetailNewsState value)? error,
    TResult? Function(SuccessDetailNewsState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailNewsState value)? loading,
    TResult Function(ErrorDetailNewsState value)? error,
    TResult Function(SuccessDetailNewsState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetailNewsState extends DetailNewsState {
  const factory ErrorDetailNewsState({
    final String? errorFromApi,
    required final String errorForUser,
    final String? statusCode,
    final StackTrace? stackTrace,
    final String? responseMessage,
  }) = _$ErrorDetailNewsStateImpl;
  const ErrorDetailNewsState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of DetailNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorDetailNewsStateImplCopyWith<_$ErrorDetailNewsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessDetailNewsStateImplCopyWith<$Res> {
  factory _$$SuccessDetailNewsStateImplCopyWith(
    _$SuccessDetailNewsStateImpl value,
    $Res Function(_$SuccessDetailNewsStateImpl) then,
  ) = __$$SuccessDetailNewsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NewsEntity news});
}

/// @nodoc
class __$$SuccessDetailNewsStateImplCopyWithImpl<$Res>
    extends _$DetailNewsStateCopyWithImpl<$Res, _$SuccessDetailNewsStateImpl>
    implements _$$SuccessDetailNewsStateImplCopyWith<$Res> {
  __$$SuccessDetailNewsStateImplCopyWithImpl(
    _$SuccessDetailNewsStateImpl _value,
    $Res Function(_$SuccessDetailNewsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailNewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? news = null}) {
    return _then(
      _$SuccessDetailNewsStateImpl(
        news: null == news
            ? _value.news
            : news // ignore: cast_nullable_to_non_nullable
                  as NewsEntity,
      ),
    );
  }
}

/// @nodoc

class _$SuccessDetailNewsStateImpl extends SuccessDetailNewsState {
  const _$SuccessDetailNewsStateImpl({required this.news}) : super._();

  @override
  final NewsEntity news;

  @override
  String toString() {
    return 'DetailNewsState.success(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDetailNewsStateImpl &&
            (identical(other.news, news) || other.news == news));
  }

  @override
  int get hashCode => Object.hash(runtimeType, news);

  /// Create a copy of DetailNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDetailNewsStateImplCopyWith<_$SuccessDetailNewsStateImpl>
  get copyWith =>
      __$$SuccessDetailNewsStateImplCopyWithImpl<_$SuccessDetailNewsStateImpl>(
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
    required TResult Function(NewsEntity news) success,
  }) {
    return success(news);
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
    TResult? Function(NewsEntity news)? success,
  }) {
    return success?.call(news);
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
    TResult Function(NewsEntity news)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDetailNewsState value) loading,
    required TResult Function(ErrorDetailNewsState value) error,
    required TResult Function(SuccessDetailNewsState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDetailNewsState value)? loading,
    TResult? Function(ErrorDetailNewsState value)? error,
    TResult? Function(SuccessDetailNewsState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDetailNewsState value)? loading,
    TResult Function(ErrorDetailNewsState value)? error,
    TResult Function(SuccessDetailNewsState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessDetailNewsState extends DetailNewsState {
  const factory SuccessDetailNewsState({required final NewsEntity news}) =
      _$SuccessDetailNewsStateImpl;
  const SuccessDetailNewsState._() : super._();

  NewsEntity get news;

  /// Create a copy of DetailNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessDetailNewsStateImplCopyWith<_$SuccessDetailNewsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
