// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsCubitState {

 int get categoryId; String get titleCategory;
/// Create a copy of NewsCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsCubitStateCopyWith<NewsCubitState> get copyWith => _$NewsCubitStateCopyWithImpl<NewsCubitState>(this as NewsCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsCubitState&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.titleCategory, titleCategory) || other.titleCategory == titleCategory));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,titleCategory);

@override
String toString() {
  return 'NewsCubitState(categoryId: $categoryId, titleCategory: $titleCategory)';
}


}

/// @nodoc
abstract mixin class $NewsCubitStateCopyWith<$Res>  {
  factory $NewsCubitStateCopyWith(NewsCubitState value, $Res Function(NewsCubitState) _then) = _$NewsCubitStateCopyWithImpl;
@useResult
$Res call({
 int categoryId, String titleCategory
});




}
/// @nodoc
class _$NewsCubitStateCopyWithImpl<$Res>
    implements $NewsCubitStateCopyWith<$Res> {
  _$NewsCubitStateCopyWithImpl(this._self, this._then);

  final NewsCubitState _self;
  final $Res Function(NewsCubitState) _then;

/// Create a copy of NewsCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? titleCategory = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,titleCategory: null == titleCategory ? _self.titleCategory : titleCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsCubitState].
extension NewsCubitStatePatterns on NewsCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsCubitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsCubitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsCubitState value)  $default,){
final _that = this;
switch (_that) {
case _NewsCubitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsCubitState value)?  $default,){
final _that = this;
switch (_that) {
case _NewsCubitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryId,  String titleCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsCubitState() when $default != null:
return $default(_that.categoryId,_that.titleCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryId,  String titleCategory)  $default,) {final _that = this;
switch (_that) {
case _NewsCubitState():
return $default(_that.categoryId,_that.titleCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryId,  String titleCategory)?  $default,) {final _that = this;
switch (_that) {
case _NewsCubitState() when $default != null:
return $default(_that.categoryId,_that.titleCategory);case _:
  return null;

}
}

}

/// @nodoc


class _NewsCubitState implements NewsCubitState {
  const _NewsCubitState({this.categoryId = 0, this.titleCategory = ''});
  

@override@JsonKey() final  int categoryId;
@override@JsonKey() final  String titleCategory;

/// Create a copy of NewsCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsCubitStateCopyWith<_NewsCubitState> get copyWith => __$NewsCubitStateCopyWithImpl<_NewsCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsCubitState&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.titleCategory, titleCategory) || other.titleCategory == titleCategory));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,titleCategory);

@override
String toString() {
  return 'NewsCubitState(categoryId: $categoryId, titleCategory: $titleCategory)';
}


}

/// @nodoc
abstract mixin class _$NewsCubitStateCopyWith<$Res> implements $NewsCubitStateCopyWith<$Res> {
  factory _$NewsCubitStateCopyWith(_NewsCubitState value, $Res Function(_NewsCubitState) _then) = __$NewsCubitStateCopyWithImpl;
@override @useResult
$Res call({
 int categoryId, String titleCategory
});




}
/// @nodoc
class __$NewsCubitStateCopyWithImpl<$Res>
    implements _$NewsCubitStateCopyWith<$Res> {
  __$NewsCubitStateCopyWithImpl(this._self, this._then);

  final _NewsCubitState _self;
  final $Res Function(_NewsCubitState) _then;

/// Create a copy of NewsCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? titleCategory = null,}) {
  return _then(_NewsCubitState(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,titleCategory: null == titleCategory ? _self.titleCategory : titleCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
