// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(int categoryId) getNewsByCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
    TResult? Function(int categoryId)? getNewsByCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int categoryId)? getNewsByCategory,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNewsEvent value) get,
    required TResult Function(GetNewsByCategoryEvent value) getNewsByCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNewsEvent value)? get,
    TResult? Function(GetNewsByCategoryEvent value)? getNewsByCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNewsEvent value)? get,
    TResult Function(GetNewsByCategoryEvent value)? getNewsByCategory,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res, NewsEvent>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res, $Val extends NewsEvent>
    implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetNewsEventImplCopyWith<$Res> {
  factory _$$GetNewsEventImplCopyWith(
    _$GetNewsEventImpl value,
    $Res Function(_$GetNewsEventImpl) then,
  ) = __$$GetNewsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNewsEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$GetNewsEventImpl>
    implements _$$GetNewsEventImplCopyWith<$Res> {
  __$$GetNewsEventImplCopyWithImpl(
    _$GetNewsEventImpl _value,
    $Res Function(_$GetNewsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNewsEventImpl extends GetNewsEvent {
  const _$GetNewsEventImpl() : super._();

  @override
  String toString() {
    return 'NewsEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNewsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(int categoryId) getNewsByCategory,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
    TResult? Function(int categoryId)? getNewsByCategory,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int categoryId)? getNewsByCategory,
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
    required TResult Function(GetNewsEvent value) get,
    required TResult Function(GetNewsByCategoryEvent value) getNewsByCategory,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNewsEvent value)? get,
    TResult? Function(GetNewsByCategoryEvent value)? getNewsByCategory,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNewsEvent value)? get,
    TResult Function(GetNewsByCategoryEvent value)? getNewsByCategory,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetNewsEvent extends NewsEvent {
  const factory GetNewsEvent() = _$GetNewsEventImpl;
  const GetNewsEvent._() : super._();
}

/// @nodoc
abstract class _$$GetNewsByCategoryEventImplCopyWith<$Res> {
  factory _$$GetNewsByCategoryEventImplCopyWith(
    _$GetNewsByCategoryEventImpl value,
    $Res Function(_$GetNewsByCategoryEventImpl) then,
  ) = __$$GetNewsByCategoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$GetNewsByCategoryEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$GetNewsByCategoryEventImpl>
    implements _$$GetNewsByCategoryEventImplCopyWith<$Res> {
  __$$GetNewsByCategoryEventImplCopyWithImpl(
    _$GetNewsByCategoryEventImpl _value,
    $Res Function(_$GetNewsByCategoryEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null}) {
    return _then(
      _$GetNewsByCategoryEventImpl(
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetNewsByCategoryEventImpl extends GetNewsByCategoryEvent {
  const _$GetNewsByCategoryEventImpl({required this.categoryId}) : super._();

  @override
  final int categoryId;

  @override
  String toString() {
    return 'NewsEvent.getNewsByCategory(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNewsByCategoryEventImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNewsByCategoryEventImplCopyWith<_$GetNewsByCategoryEventImpl>
  get copyWith =>
      __$$GetNewsByCategoryEventImplCopyWithImpl<_$GetNewsByCategoryEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(int categoryId) getNewsByCategory,
  }) {
    return getNewsByCategory(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
    TResult? Function(int categoryId)? getNewsByCategory,
  }) {
    return getNewsByCategory?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int categoryId)? getNewsByCategory,
    required TResult orElse(),
  }) {
    if (getNewsByCategory != null) {
      return getNewsByCategory(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNewsEvent value) get,
    required TResult Function(GetNewsByCategoryEvent value) getNewsByCategory,
  }) {
    return getNewsByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNewsEvent value)? get,
    TResult? Function(GetNewsByCategoryEvent value)? getNewsByCategory,
  }) {
    return getNewsByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNewsEvent value)? get,
    TResult Function(GetNewsByCategoryEvent value)? getNewsByCategory,
    required TResult orElse(),
  }) {
    if (getNewsByCategory != null) {
      return getNewsByCategory(this);
    }
    return orElse();
  }
}

abstract class GetNewsByCategoryEvent extends NewsEvent {
  const factory GetNewsByCategoryEvent({required final int categoryId}) =
      _$GetNewsByCategoryEventImpl;
  const GetNewsByCategoryEvent._() : super._();

  int get categoryId;

  /// Create a copy of NewsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNewsByCategoryEventImplCopyWith<_$GetNewsByCategoryEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewsState {
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
    required TResult Function(List<NewsEntity> news) success,
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
    TResult? Function(List<NewsEntity> news)? success,
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
    TResult Function(List<NewsEntity> news)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNewsState value) loading,
    required TResult Function(ErrorNewsState value) error,
    required TResult Function(SuccessNewsState value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNewsState value)? loading,
    TResult? Function(ErrorNewsState value)? error,
    TResult? Function(SuccessNewsState value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNewsState value)? loading,
    TResult Function(ErrorNewsState value)? error,
    TResult Function(SuccessNewsState value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingNewsStateImplCopyWith<$Res> {
  factory _$$LoadingNewsStateImplCopyWith(
    _$LoadingNewsStateImpl value,
    $Res Function(_$LoadingNewsStateImpl) then,
  ) = __$$LoadingNewsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$LoadingNewsStateImpl>
    implements _$$LoadingNewsStateImplCopyWith<$Res> {
  __$$LoadingNewsStateImplCopyWithImpl(
    _$LoadingNewsStateImpl _value,
    $Res Function(_$LoadingNewsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingNewsStateImpl extends LoadingNewsState {
  const _$LoadingNewsStateImpl() : super._();

  @override
  String toString() {
    return 'NewsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingNewsStateImpl);
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
    required TResult Function(List<NewsEntity> news) success,
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
    TResult? Function(List<NewsEntity> news)? success,
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
    TResult Function(List<NewsEntity> news)? success,
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
    required TResult Function(LoadingNewsState value) loading,
    required TResult Function(ErrorNewsState value) error,
    required TResult Function(SuccessNewsState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNewsState value)? loading,
    TResult? Function(ErrorNewsState value)? error,
    TResult? Function(SuccessNewsState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNewsState value)? loading,
    TResult Function(ErrorNewsState value)? error,
    TResult Function(SuccessNewsState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingNewsState extends NewsState {
  const factory LoadingNewsState() = _$LoadingNewsStateImpl;
  const LoadingNewsState._() : super._();
}

/// @nodoc
abstract class _$$ErrorNewsStateImplCopyWith<$Res> {
  factory _$$ErrorNewsStateImplCopyWith(
    _$ErrorNewsStateImpl value,
    $Res Function(_$ErrorNewsStateImpl) then,
  ) = __$$ErrorNewsStateImplCopyWithImpl<$Res>;
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
class __$$ErrorNewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$ErrorNewsStateImpl>
    implements _$$ErrorNewsStateImplCopyWith<$Res> {
  __$$ErrorNewsStateImplCopyWithImpl(
    _$ErrorNewsStateImpl _value,
    $Res Function(_$ErrorNewsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsState
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
      _$ErrorNewsStateImpl(
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

class _$ErrorNewsStateImpl extends ErrorNewsState {
  const _$ErrorNewsStateImpl({
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
    return 'NewsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorNewsStateImpl &&
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

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorNewsStateImplCopyWith<_$ErrorNewsStateImpl> get copyWith =>
      __$$ErrorNewsStateImplCopyWithImpl<_$ErrorNewsStateImpl>(
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
    required TResult Function(List<NewsEntity> news) success,
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
    TResult? Function(List<NewsEntity> news)? success,
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
    TResult Function(List<NewsEntity> news)? success,
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
    required TResult Function(LoadingNewsState value) loading,
    required TResult Function(ErrorNewsState value) error,
    required TResult Function(SuccessNewsState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNewsState value)? loading,
    TResult? Function(ErrorNewsState value)? error,
    TResult? Function(SuccessNewsState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNewsState value)? loading,
    TResult Function(ErrorNewsState value)? error,
    TResult Function(SuccessNewsState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorNewsState extends NewsState {
  const factory ErrorNewsState({
    final String? errorFromApi,
    required final String errorForUser,
    final String? statusCode,
    final StackTrace? stackTrace,
    final String? responseMessage,
  }) = _$ErrorNewsStateImpl;
  const ErrorNewsState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorNewsStateImplCopyWith<_$ErrorNewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessNewsStateImplCopyWith<$Res> {
  factory _$$SuccessNewsStateImplCopyWith(
    _$SuccessNewsStateImpl value,
    $Res Function(_$SuccessNewsStateImpl) then,
  ) = __$$SuccessNewsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NewsEntity> news});
}

/// @nodoc
class __$$SuccessNewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$SuccessNewsStateImpl>
    implements _$$SuccessNewsStateImplCopyWith<$Res> {
  __$$SuccessNewsStateImplCopyWithImpl(
    _$SuccessNewsStateImpl _value,
    $Res Function(_$SuccessNewsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? news = null}) {
    return _then(
      _$SuccessNewsStateImpl(
        news: null == news
            ? _value._news
            : news // ignore: cast_nullable_to_non_nullable
                  as List<NewsEntity>,
      ),
    );
  }
}

/// @nodoc

class _$SuccessNewsStateImpl extends SuccessNewsState {
  const _$SuccessNewsStateImpl({required final List<NewsEntity> news})
    : _news = news,
      super._();

  final List<NewsEntity> _news;
  @override
  List<NewsEntity> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'NewsState.success(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessNewsStateImpl &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessNewsStateImplCopyWith<_$SuccessNewsStateImpl> get copyWith =>
      __$$SuccessNewsStateImplCopyWithImpl<_$SuccessNewsStateImpl>(
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
    required TResult Function(List<NewsEntity> news) success,
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
    TResult? Function(List<NewsEntity> news)? success,
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
    TResult Function(List<NewsEntity> news)? success,
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
    required TResult Function(LoadingNewsState value) loading,
    required TResult Function(ErrorNewsState value) error,
    required TResult Function(SuccessNewsState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNewsState value)? loading,
    TResult? Function(ErrorNewsState value)? error,
    TResult? Function(SuccessNewsState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNewsState value)? loading,
    TResult Function(ErrorNewsState value)? error,
    TResult Function(SuccessNewsState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessNewsState extends NewsState {
  const factory SuccessNewsState({required final List<NewsEntity> news}) =
      _$SuccessNewsStateImpl;
  const SuccessNewsState._() : super._();

  List<NewsEntity> get news;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessNewsStateImplCopyWith<_$SuccessNewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
