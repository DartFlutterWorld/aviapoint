// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesEvent {
  int get typeSsertificatesId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int typeSsertificatesId) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int typeSsertificatesId)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int typeSsertificatesId)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCategoriesEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCategoriesEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCategoriesEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoriesEventCopyWith<CategoriesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesEventCopyWith<$Res> {
  factory $CategoriesEventCopyWith(
          CategoriesEvent value, $Res Function(CategoriesEvent) then) =
      _$CategoriesEventCopyWithImpl<$Res, CategoriesEvent>;
  @useResult
  $Res call({int typeSsertificatesId});
}

/// @nodoc
class _$CategoriesEventCopyWithImpl<$Res, $Val extends CategoriesEvent>
    implements $CategoriesEventCopyWith<$Res> {
  _$CategoriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeSsertificatesId = null,
  }) {
    return _then(_value.copyWith(
      typeSsertificatesId: null == typeSsertificatesId
          ? _value.typeSsertificatesId
          : typeSsertificatesId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCategoriesEventImplCopyWith<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  factory _$$GetCategoriesEventImplCopyWith(_$GetCategoriesEventImpl value,
          $Res Function(_$GetCategoriesEventImpl) then) =
      __$$GetCategoriesEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int typeSsertificatesId});
}

/// @nodoc
class __$$GetCategoriesEventImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$GetCategoriesEventImpl>
    implements _$$GetCategoriesEventImplCopyWith<$Res> {
  __$$GetCategoriesEventImplCopyWithImpl(_$GetCategoriesEventImpl _value,
      $Res Function(_$GetCategoriesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeSsertificatesId = null,
  }) {
    return _then(_$GetCategoriesEventImpl(
      typeSsertificatesId: null == typeSsertificatesId
          ? _value.typeSsertificatesId
          : typeSsertificatesId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetCategoriesEventImpl extends GetCategoriesEvent {
  const _$GetCategoriesEventImpl({required this.typeSsertificatesId})
      : super._();

  @override
  final int typeSsertificatesId;

  @override
  String toString() {
    return 'CategoriesEvent.get(typeSsertificatesId: $typeSsertificatesId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCategoriesEventImpl &&
            (identical(other.typeSsertificatesId, typeSsertificatesId) ||
                other.typeSsertificatesId == typeSsertificatesId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, typeSsertificatesId);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCategoriesEventImplCopyWith<_$GetCategoriesEventImpl> get copyWith =>
      __$$GetCategoriesEventImplCopyWithImpl<_$GetCategoriesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int typeSsertificatesId) get,
  }) {
    return get(typeSsertificatesId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int typeSsertificatesId)? get,
  }) {
    return get?.call(typeSsertificatesId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int typeSsertificatesId)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(typeSsertificatesId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCategoriesEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCategoriesEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCategoriesEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetCategoriesEvent extends CategoriesEvent {
  const factory GetCategoriesEvent({required final int typeSsertificatesId}) =
      _$GetCategoriesEventImpl;
  const GetCategoriesEvent._() : super._();

  @override
  int get typeSsertificatesId;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCategoriesEventImplCopyWith<_$GetCategoriesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<RosAviaTestCategoryEntity> categories)
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
    TResult? Function(List<RosAviaTestCategoryEntity> categories)? success,
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
    TResult Function(List<RosAviaTestCategoryEntity> categories)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCategoriesState value) loading,
    required TResult Function(ErrorCategoriesState value) error,
    required TResult Function(SuccessCategoriesState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoriesState value)? loading,
    TResult? Function(ErrorCategoriesState value)? error,
    TResult? Function(SuccessCategoriesState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoriesState value)? loading,
    TResult Function(ErrorCategoriesState value)? error,
    TResult Function(SuccessCategoriesState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingCategoriesStateImplCopyWith<$Res> {
  factory _$$LoadingCategoriesStateImplCopyWith(
          _$LoadingCategoriesStateImpl value,
          $Res Function(_$LoadingCategoriesStateImpl) then) =
      __$$LoadingCategoriesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCategoriesStateImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$LoadingCategoriesStateImpl>
    implements _$$LoadingCategoriesStateImplCopyWith<$Res> {
  __$$LoadingCategoriesStateImplCopyWithImpl(
      _$LoadingCategoriesStateImpl _value,
      $Res Function(_$LoadingCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingCategoriesStateImpl extends LoadingCategoriesState {
  const _$LoadingCategoriesStateImpl() : super._();

  @override
  String toString() {
    return 'CategoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingCategoriesStateImpl);
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
    required TResult Function(List<RosAviaTestCategoryEntity> categories)
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
    TResult? Function(List<RosAviaTestCategoryEntity> categories)? success,
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
    TResult Function(List<RosAviaTestCategoryEntity> categories)? success,
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
    required TResult Function(LoadingCategoriesState value) loading,
    required TResult Function(ErrorCategoriesState value) error,
    required TResult Function(SuccessCategoriesState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoriesState value)? loading,
    TResult? Function(ErrorCategoriesState value)? error,
    TResult? Function(SuccessCategoriesState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoriesState value)? loading,
    TResult Function(ErrorCategoriesState value)? error,
    TResult Function(SuccessCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCategoriesState extends CategoriesState {
  const factory LoadingCategoriesState() = _$LoadingCategoriesStateImpl;
  const LoadingCategoriesState._() : super._();
}

/// @nodoc
abstract class _$$ErrorCategoriesStateImplCopyWith<$Res> {
  factory _$$ErrorCategoriesStateImplCopyWith(_$ErrorCategoriesStateImpl value,
          $Res Function(_$ErrorCategoriesStateImpl) then) =
      __$$ErrorCategoriesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorCategoriesStateImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$ErrorCategoriesStateImpl>
    implements _$$ErrorCategoriesStateImplCopyWith<$Res> {
  __$$ErrorCategoriesStateImplCopyWithImpl(_$ErrorCategoriesStateImpl _value,
      $Res Function(_$ErrorCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesState
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
    return _then(_$ErrorCategoriesStateImpl(
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

class _$ErrorCategoriesStateImpl extends ErrorCategoriesState {
  const _$ErrorCategoriesStateImpl(
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
    return 'CategoriesState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorCategoriesStateImpl &&
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

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCategoriesStateImplCopyWith<_$ErrorCategoriesStateImpl>
      get copyWith =>
          __$$ErrorCategoriesStateImplCopyWithImpl<_$ErrorCategoriesStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<RosAviaTestCategoryEntity> categories)
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
    TResult? Function(List<RosAviaTestCategoryEntity> categories)? success,
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
    TResult Function(List<RosAviaTestCategoryEntity> categories)? success,
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
    required TResult Function(LoadingCategoriesState value) loading,
    required TResult Function(ErrorCategoriesState value) error,
    required TResult Function(SuccessCategoriesState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoriesState value)? loading,
    TResult? Function(ErrorCategoriesState value)? error,
    TResult? Function(SuccessCategoriesState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoriesState value)? loading,
    TResult Function(ErrorCategoriesState value)? error,
    TResult Function(SuccessCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCategoriesState extends CategoriesState {
  const factory ErrorCategoriesState(
      {final String? errorFromApi,
      required final String errorForUser,
      final String? statusCode,
      final StackTrace? stackTrace,
      final String? responseMessage}) = _$ErrorCategoriesStateImpl;
  const ErrorCategoriesState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorCategoriesStateImplCopyWith<_$ErrorCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCategoriesStateImplCopyWith<$Res> {
  factory _$$SuccessCategoriesStateImplCopyWith(
          _$SuccessCategoriesStateImpl value,
          $Res Function(_$SuccessCategoriesStateImpl) then) =
      __$$SuccessCategoriesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RosAviaTestCategoryEntity> categories});
}

/// @nodoc
class __$$SuccessCategoriesStateImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$SuccessCategoriesStateImpl>
    implements _$$SuccessCategoriesStateImplCopyWith<$Res> {
  __$$SuccessCategoriesStateImplCopyWithImpl(
      _$SuccessCategoriesStateImpl _value,
      $Res Function(_$SuccessCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$SuccessCategoriesStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<RosAviaTestCategoryEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessCategoriesStateImpl extends SuccessCategoriesState {
  const _$SuccessCategoriesStateImpl(
      {required final List<RosAviaTestCategoryEntity> categories})
      : _categories = categories,
        super._();

  final List<RosAviaTestCategoryEntity> _categories;
  @override
  List<RosAviaTestCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoriesState.success(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCategoriesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCategoriesStateImplCopyWith<_$SuccessCategoriesStateImpl>
      get copyWith => __$$SuccessCategoriesStateImplCopyWithImpl<
          _$SuccessCategoriesStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<RosAviaTestCategoryEntity> categories)
        success,
  }) {
    return success(categories);
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
    TResult? Function(List<RosAviaTestCategoryEntity> categories)? success,
  }) {
    return success?.call(categories);
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
    TResult Function(List<RosAviaTestCategoryEntity> categories)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCategoriesState value) loading,
    required TResult Function(ErrorCategoriesState value) error,
    required TResult Function(SuccessCategoriesState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingCategoriesState value)? loading,
    TResult? Function(ErrorCategoriesState value)? error,
    TResult? Function(SuccessCategoriesState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCategoriesState value)? loading,
    TResult Function(ErrorCategoriesState value)? error,
    TResult Function(SuccessCategoriesState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessCategoriesState extends CategoriesState {
  const factory SuccessCategoriesState(
          {required final List<RosAviaTestCategoryEntity> categories}) =
      _$SuccessCategoriesStateImpl;
  const SuccessCategoriesState._() : super._();

  List<RosAviaTestCategoryEntity> get categories;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessCategoriesStateImplCopyWith<_$SuccessCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
