// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SmsDto {

@JsonKey(name: 'err_code') dynamic get errCode; String get text;
/// Create a copy of SmsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SmsDtoCopyWith<SmsDto> get copyWith => _$SmsDtoCopyWithImpl<SmsDto>(this as SmsDto, _$identity);

  /// Serializes this SmsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SmsDto&&const DeepCollectionEquality().equals(other.errCode, errCode)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(errCode),text);

@override
String toString() {
  return 'SmsDto(errCode: $errCode, text: $text)';
}


}

/// @nodoc
abstract mixin class $SmsDtoCopyWith<$Res>  {
  factory $SmsDtoCopyWith(SmsDto value, $Res Function(SmsDto) _then) = _$SmsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'err_code') dynamic errCode, String text
});




}
/// @nodoc
class _$SmsDtoCopyWithImpl<$Res>
    implements $SmsDtoCopyWith<$Res> {
  _$SmsDtoCopyWithImpl(this._self, this._then);

  final SmsDto _self;
  final $Res Function(SmsDto) _then;

/// Create a copy of SmsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errCode = freezed,Object? text = null,}) {
  return _then(_self.copyWith(
errCode: freezed == errCode ? _self.errCode : errCode // ignore: cast_nullable_to_non_nullable
as dynamic,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SmsDto].
extension SmsDtoPatterns on SmsDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SmsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SmsDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SmsDto value)  $default,){
final _that = this;
switch (_that) {
case _SmsDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SmsDto value)?  $default,){
final _that = this;
switch (_that) {
case _SmsDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'err_code')  dynamic errCode,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SmsDto() when $default != null:
return $default(_that.errCode,_that.text);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'err_code')  dynamic errCode,  String text)  $default,) {final _that = this;
switch (_that) {
case _SmsDto():
return $default(_that.errCode,_that.text);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'err_code')  dynamic errCode,  String text)?  $default,) {final _that = this;
switch (_that) {
case _SmsDto() when $default != null:
return $default(_that.errCode,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SmsDto implements SmsDto {
  const _SmsDto({@JsonKey(name: 'err_code') this.errCode, required this.text});
  factory _SmsDto.fromJson(Map<String, dynamic> json) => _$SmsDtoFromJson(json);

@override@JsonKey(name: 'err_code') final  dynamic errCode;
@override final  String text;

/// Create a copy of SmsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SmsDtoCopyWith<_SmsDto> get copyWith => __$SmsDtoCopyWithImpl<_SmsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SmsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SmsDto&&const DeepCollectionEquality().equals(other.errCode, errCode)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(errCode),text);

@override
String toString() {
  return 'SmsDto(errCode: $errCode, text: $text)';
}


}

/// @nodoc
abstract mixin class _$SmsDtoCopyWith<$Res> implements $SmsDtoCopyWith<$Res> {
  factory _$SmsDtoCopyWith(_SmsDto value, $Res Function(_SmsDto) _then) = __$SmsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'err_code') dynamic errCode, String text
});




}
/// @nodoc
class __$SmsDtoCopyWithImpl<$Res>
    implements _$SmsDtoCopyWith<$Res> {
  __$SmsDtoCopyWithImpl(this._self, this._then);

  final _SmsDto _self;
  final $Res Function(_SmsDto) _then;

/// Create a copy of SmsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errCode = freezed,Object? text = null,}) {
  return _then(_SmsDto(
errCode: freezed == errCode ? _self.errCode : errCode // ignore: cast_nullable_to_non_nullable
as dynamic,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
