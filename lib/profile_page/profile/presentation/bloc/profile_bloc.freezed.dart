// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
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
    required TResult Function(GetProfileEvent value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProfileEvent value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfileEvent value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetProfileEventImplCopyWith<$Res> {
  factory _$$GetProfileEventImplCopyWith(_$GetProfileEventImpl value,
          $Res Function(_$GetProfileEventImpl) then) =
      __$$GetProfileEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProfileEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetProfileEventImpl>
    implements _$$GetProfileEventImplCopyWith<$Res> {
  __$$GetProfileEventImplCopyWithImpl(
      _$GetProfileEventImpl _value, $Res Function(_$GetProfileEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetProfileEventImpl extends GetProfileEvent {
  const _$GetProfileEventImpl() : super._();

  @override
  String toString() {
    return 'ProfileEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProfileEventImpl);
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
    required TResult Function(GetProfileEvent value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProfileEvent value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProfileEvent value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetProfileEvent extends ProfileEvent {
  const factory GetProfileEvent() = _$GetProfileEventImpl;
  const GetProfileEvent._() : super._();
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<ProfileEntity> profile) success,
    required TResult Function() done,
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
    TResult? Function(List<ProfileEntity> profile)? success,
    TResult? Function()? done,
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
    TResult Function(List<ProfileEntity> profile)? success,
    TResult Function()? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingProfileState value) loading,
    required TResult Function(ErrorProfileState value) error,
    required TResult Function(SuccessProfileState value) success,
    required TResult Function(DoneProfileState value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingProfileState value)? loading,
    TResult? Function(ErrorProfileState value)? error,
    TResult? Function(SuccessProfileState value)? success,
    TResult? Function(DoneProfileState value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingProfileState value)? loading,
    TResult Function(ErrorProfileState value)? error,
    TResult Function(SuccessProfileState value)? success,
    TResult Function(DoneProfileState value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingProfileStateImplCopyWith<$Res> {
  factory _$$LoadingProfileStateImplCopyWith(_$LoadingProfileStateImpl value,
          $Res Function(_$LoadingProfileStateImpl) then) =
      __$$LoadingProfileStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingProfileStateImpl>
    implements _$$LoadingProfileStateImplCopyWith<$Res> {
  __$$LoadingProfileStateImplCopyWithImpl(_$LoadingProfileStateImpl _value,
      $Res Function(_$LoadingProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingProfileStateImpl extends LoadingProfileState {
  const _$LoadingProfileStateImpl() : super._();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingProfileStateImpl);
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
    required TResult Function(List<ProfileEntity> profile) success,
    required TResult Function() done,
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
    TResult? Function(List<ProfileEntity> profile)? success,
    TResult? Function()? done,
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
    TResult Function(List<ProfileEntity> profile)? success,
    TResult Function()? done,
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
    required TResult Function(LoadingProfileState value) loading,
    required TResult Function(ErrorProfileState value) error,
    required TResult Function(SuccessProfileState value) success,
    required TResult Function(DoneProfileState value) done,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingProfileState value)? loading,
    TResult? Function(ErrorProfileState value)? error,
    TResult? Function(SuccessProfileState value)? success,
    TResult? Function(DoneProfileState value)? done,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingProfileState value)? loading,
    TResult Function(ErrorProfileState value)? error,
    TResult Function(SuccessProfileState value)? success,
    TResult Function(DoneProfileState value)? done,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingProfileState extends ProfileState {
  const factory LoadingProfileState() = _$LoadingProfileStateImpl;
  const LoadingProfileState._() : super._();
}

/// @nodoc
abstract class _$$ErrorProfileStateImplCopyWith<$Res> {
  factory _$$ErrorProfileStateImplCopyWith(_$ErrorProfileStateImpl value,
          $Res Function(_$ErrorProfileStateImpl) then) =
      __$$ErrorProfileStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? errorFromApi,
      String errorForUser,
      String? statusCode,
      StackTrace? stackTrace,
      String? responseMessage});
}

/// @nodoc
class __$$ErrorProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ErrorProfileStateImpl>
    implements _$$ErrorProfileStateImplCopyWith<$Res> {
  __$$ErrorProfileStateImplCopyWithImpl(_$ErrorProfileStateImpl _value,
      $Res Function(_$ErrorProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
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
    return _then(_$ErrorProfileStateImpl(
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

class _$ErrorProfileStateImpl extends ErrorProfileState {
  const _$ErrorProfileStateImpl(
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
    return 'ProfileState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProfileStateImpl &&
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

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProfileStateImplCopyWith<_$ErrorProfileStateImpl> get copyWith =>
      __$$ErrorProfileStateImplCopyWithImpl<_$ErrorProfileStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<ProfileEntity> profile) success,
    required TResult Function() done,
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
    TResult? Function(List<ProfileEntity> profile)? success,
    TResult? Function()? done,
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
    TResult Function(List<ProfileEntity> profile)? success,
    TResult Function()? done,
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
    required TResult Function(LoadingProfileState value) loading,
    required TResult Function(ErrorProfileState value) error,
    required TResult Function(SuccessProfileState value) success,
    required TResult Function(DoneProfileState value) done,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingProfileState value)? loading,
    TResult? Function(ErrorProfileState value)? error,
    TResult? Function(SuccessProfileState value)? success,
    TResult? Function(DoneProfileState value)? done,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingProfileState value)? loading,
    TResult Function(ErrorProfileState value)? error,
    TResult Function(SuccessProfileState value)? success,
    TResult Function(DoneProfileState value)? done,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorProfileState extends ProfileState {
  const factory ErrorProfileState(
      {final String? errorFromApi,
      required final String errorForUser,
      final String? statusCode,
      final StackTrace? stackTrace,
      final String? responseMessage}) = _$ErrorProfileStateImpl;
  const ErrorProfileState._() : super._();

  String? get errorFromApi;
  String get errorForUser;
  String? get statusCode;
  StackTrace? get stackTrace;
  String? get responseMessage;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorProfileStateImplCopyWith<_$ErrorProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessProfileStateImplCopyWith<$Res> {
  factory _$$SuccessProfileStateImplCopyWith(_$SuccessProfileStateImpl value,
          $Res Function(_$SuccessProfileStateImpl) then) =
      __$$SuccessProfileStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProfileEntity> profile});
}

/// @nodoc
class __$$SuccessProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$SuccessProfileStateImpl>
    implements _$$SuccessProfileStateImplCopyWith<$Res> {
  __$$SuccessProfileStateImplCopyWithImpl(_$SuccessProfileStateImpl _value,
      $Res Function(_$SuccessProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$SuccessProfileStateImpl(
      profile: null == profile
          ? _value._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<ProfileEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessProfileStateImpl extends SuccessProfileState {
  const _$SuccessProfileStateImpl({required final List<ProfileEntity> profile})
      : _profile = profile,
        super._();

  final List<ProfileEntity> _profile;
  @override
  List<ProfileEntity> get profile {
    if (_profile is EqualUnmodifiableListView) return _profile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profile);
  }

  @override
  String toString() {
    return 'ProfileState.success(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessProfileStateImpl &&
            const DeepCollectionEquality().equals(other._profile, _profile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_profile));

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessProfileStateImplCopyWith<_$SuccessProfileStateImpl> get copyWith =>
      __$$SuccessProfileStateImplCopyWithImpl<_$SuccessProfileStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? errorFromApi, String errorForUser,
            String? statusCode, StackTrace? stackTrace, String? responseMessage)
        error,
    required TResult Function(List<ProfileEntity> profile) success,
    required TResult Function() done,
  }) {
    return success(profile);
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
    TResult? Function(List<ProfileEntity> profile)? success,
    TResult? Function()? done,
  }) {
    return success?.call(profile);
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
    TResult Function(List<ProfileEntity> profile)? success,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingProfileState value) loading,
    required TResult Function(ErrorProfileState value) error,
    required TResult Function(SuccessProfileState value) success,
    required TResult Function(DoneProfileState value) done,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingProfileState value)? loading,
    TResult? Function(ErrorProfileState value)? error,
    TResult? Function(SuccessProfileState value)? success,
    TResult? Function(DoneProfileState value)? done,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingProfileState value)? loading,
    TResult Function(ErrorProfileState value)? error,
    TResult Function(SuccessProfileState value)? success,
    TResult Function(DoneProfileState value)? done,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessProfileState extends ProfileState {
  const factory SuccessProfileState(
      {required final List<ProfileEntity> profile}) = _$SuccessProfileStateImpl;
  const SuccessProfileState._() : super._();

  List<ProfileEntity> get profile;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessProfileStateImplCopyWith<_$SuccessProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoneProfileStateImplCopyWith<$Res> {
  factory _$$DoneProfileStateImplCopyWith(_$DoneProfileStateImpl value,
          $Res Function(_$DoneProfileStateImpl) then) =
      __$$DoneProfileStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DoneProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$DoneProfileStateImpl>
    implements _$$DoneProfileStateImplCopyWith<$Res> {
  __$$DoneProfileStateImplCopyWithImpl(_$DoneProfileStateImpl _value,
      $Res Function(_$DoneProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DoneProfileStateImpl extends DoneProfileState {
  const _$DoneProfileStateImpl() : super._();

  @override
  String toString() {
    return 'ProfileState.done()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DoneProfileStateImpl);
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
    required TResult Function(List<ProfileEntity> profile) success,
    required TResult Function() done,
  }) {
    return done();
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
    TResult? Function(List<ProfileEntity> profile)? success,
    TResult? Function()? done,
  }) {
    return done?.call();
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
    TResult Function(List<ProfileEntity> profile)? success,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingProfileState value) loading,
    required TResult Function(ErrorProfileState value) error,
    required TResult Function(SuccessProfileState value) success,
    required TResult Function(DoneProfileState value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingProfileState value)? loading,
    TResult? Function(ErrorProfileState value)? error,
    TResult? Function(SuccessProfileState value)? success,
    TResult? Function(DoneProfileState value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingProfileState value)? loading,
    TResult Function(ErrorProfileState value)? error,
    TResult Function(SuccessProfileState value)? success,
    TResult Function(DoneProfileState value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class DoneProfileState extends ProfileState {
  const factory DoneProfileState() = _$DoneProfileStateImpl;
  const DoneProfileState._() : super._();
}
