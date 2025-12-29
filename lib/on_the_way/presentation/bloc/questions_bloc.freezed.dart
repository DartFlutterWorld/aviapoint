// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionsState()';
}


}

/// @nodoc
class $QuestionsStateCopyWith<$Res>  {
$QuestionsStateCopyWith(QuestionsState _, $Res Function(QuestionsState) __);
}


/// Adds pattern-matching-related methods to [QuestionsState].
extension QuestionsStatePatterns on QuestionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialQuestionsState value)?  initial,TResult Function( LoadingQuestionsState value)?  loading,TResult Function( ErrorQuestionsState value)?  error,TResult Function( SuccessQuestionsState value)?  success,TResult Function( QuestionCreatedState value)?  questionCreated,TResult Function( QuestionUpdatedState value)?  questionUpdated,TResult Function( QuestionDeletedState value)?  questionDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialQuestionsState() when initial != null:
return initial(_that);case LoadingQuestionsState() when loading != null:
return loading(_that);case ErrorQuestionsState() when error != null:
return error(_that);case SuccessQuestionsState() when success != null:
return success(_that);case QuestionCreatedState() when questionCreated != null:
return questionCreated(_that);case QuestionUpdatedState() when questionUpdated != null:
return questionUpdated(_that);case QuestionDeletedState() when questionDeleted != null:
return questionDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialQuestionsState value)  initial,required TResult Function( LoadingQuestionsState value)  loading,required TResult Function( ErrorQuestionsState value)  error,required TResult Function( SuccessQuestionsState value)  success,required TResult Function( QuestionCreatedState value)  questionCreated,required TResult Function( QuestionUpdatedState value)  questionUpdated,required TResult Function( QuestionDeletedState value)  questionDeleted,}){
final _that = this;
switch (_that) {
case InitialQuestionsState():
return initial(_that);case LoadingQuestionsState():
return loading(_that);case ErrorQuestionsState():
return error(_that);case SuccessQuestionsState():
return success(_that);case QuestionCreatedState():
return questionCreated(_that);case QuestionUpdatedState():
return questionUpdated(_that);case QuestionDeletedState():
return questionDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialQuestionsState value)?  initial,TResult? Function( LoadingQuestionsState value)?  loading,TResult? Function( ErrorQuestionsState value)?  error,TResult? Function( SuccessQuestionsState value)?  success,TResult? Function( QuestionCreatedState value)?  questionCreated,TResult? Function( QuestionUpdatedState value)?  questionUpdated,TResult? Function( QuestionDeletedState value)?  questionDeleted,}){
final _that = this;
switch (_that) {
case InitialQuestionsState() when initial != null:
return initial(_that);case LoadingQuestionsState() when loading != null:
return loading(_that);case ErrorQuestionsState() when error != null:
return error(_that);case SuccessQuestionsState() when success != null:
return success(_that);case QuestionCreatedState() when questionCreated != null:
return questionCreated(_that);case QuestionUpdatedState() when questionUpdated != null:
return questionUpdated(_that);case QuestionDeletedState() when questionDeleted != null:
return questionDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult Function( List<FlightQuestionEntity> questions)?  success,TResult Function( FlightQuestionEntity question)?  questionCreated,TResult Function( FlightQuestionEntity question)?  questionUpdated,TResult Function()?  questionDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialQuestionsState() when initial != null:
return initial();case LoadingQuestionsState() when loading != null:
return loading();case ErrorQuestionsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessQuestionsState() when success != null:
return success(_that.questions);case QuestionCreatedState() when questionCreated != null:
return questionCreated(_that.question);case QuestionUpdatedState() when questionUpdated != null:
return questionUpdated(_that.question);case QuestionDeletedState() when questionDeleted != null:
return questionDeleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)  error,required TResult Function( List<FlightQuestionEntity> questions)  success,required TResult Function( FlightQuestionEntity question)  questionCreated,required TResult Function( FlightQuestionEntity question)  questionUpdated,required TResult Function()  questionDeleted,}) {final _that = this;
switch (_that) {
case InitialQuestionsState():
return initial();case LoadingQuestionsState():
return loading();case ErrorQuestionsState():
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessQuestionsState():
return success(_that.questions);case QuestionCreatedState():
return questionCreated(_that.question);case QuestionUpdatedState():
return questionUpdated(_that.question);case QuestionDeletedState():
return questionDeleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? errorFromApi,  String errorForUser,  String? statusCode,  StackTrace? stackTrace,  String? responseMessage)?  error,TResult? Function( List<FlightQuestionEntity> questions)?  success,TResult? Function( FlightQuestionEntity question)?  questionCreated,TResult? Function( FlightQuestionEntity question)?  questionUpdated,TResult? Function()?  questionDeleted,}) {final _that = this;
switch (_that) {
case InitialQuestionsState() when initial != null:
return initial();case LoadingQuestionsState() when loading != null:
return loading();case ErrorQuestionsState() when error != null:
return error(_that.errorFromApi,_that.errorForUser,_that.statusCode,_that.stackTrace,_that.responseMessage);case SuccessQuestionsState() when success != null:
return success(_that.questions);case QuestionCreatedState() when questionCreated != null:
return questionCreated(_that.question);case QuestionUpdatedState() when questionUpdated != null:
return questionUpdated(_that.question);case QuestionDeletedState() when questionDeleted != null:
return questionDeleted();case _:
  return null;

}
}

}

/// @nodoc


class InitialQuestionsState extends QuestionsState {
  const InitialQuestionsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialQuestionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionsState.initial()';
}


}




/// @nodoc


class LoadingQuestionsState extends QuestionsState {
  const LoadingQuestionsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingQuestionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionsState.loading()';
}


}




/// @nodoc


class ErrorQuestionsState extends QuestionsState {
  const ErrorQuestionsState({this.errorFromApi, required this.errorForUser, this.statusCode, this.stackTrace, this.responseMessage}): super._();
  

 final  String? errorFromApi;
 final  String errorForUser;
 final  String? statusCode;
 final  StackTrace? stackTrace;
 final  String? responseMessage;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorQuestionsStateCopyWith<ErrorQuestionsState> get copyWith => _$ErrorQuestionsStateCopyWithImpl<ErrorQuestionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorQuestionsState&&(identical(other.errorFromApi, errorFromApi) || other.errorFromApi == errorFromApi)&&(identical(other.errorForUser, errorForUser) || other.errorForUser == errorForUser)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorFromApi,errorForUser,statusCode,stackTrace,responseMessage);

@override
String toString() {
  return 'QuestionsState.error(errorFromApi: $errorFromApi, errorForUser: $errorForUser, statusCode: $statusCode, stackTrace: $stackTrace, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorQuestionsStateCopyWith<$Res> implements $QuestionsStateCopyWith<$Res> {
  factory $ErrorQuestionsStateCopyWith(ErrorQuestionsState value, $Res Function(ErrorQuestionsState) _then) = _$ErrorQuestionsStateCopyWithImpl;
@useResult
$Res call({
 String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage
});




}
/// @nodoc
class _$ErrorQuestionsStateCopyWithImpl<$Res>
    implements $ErrorQuestionsStateCopyWith<$Res> {
  _$ErrorQuestionsStateCopyWithImpl(this._self, this._then);

  final ErrorQuestionsState _self;
  final $Res Function(ErrorQuestionsState) _then;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorFromApi = freezed,Object? errorForUser = null,Object? statusCode = freezed,Object? stackTrace = freezed,Object? responseMessage = freezed,}) {
  return _then(ErrorQuestionsState(
errorFromApi: freezed == errorFromApi ? _self.errorFromApi : errorFromApi // ignore: cast_nullable_to_non_nullable
as String?,errorForUser: null == errorForUser ? _self.errorForUser : errorForUser // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SuccessQuestionsState extends QuestionsState {
  const SuccessQuestionsState({required final  List<FlightQuestionEntity> questions}): _questions = questions,super._();
  

 final  List<FlightQuestionEntity> _questions;
 List<FlightQuestionEntity> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessQuestionsStateCopyWith<SuccessQuestionsState> get copyWith => _$SuccessQuestionsStateCopyWithImpl<SuccessQuestionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessQuestionsState&&const DeepCollectionEquality().equals(other._questions, _questions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'QuestionsState.success(questions: $questions)';
}


}

/// @nodoc
abstract mixin class $SuccessQuestionsStateCopyWith<$Res> implements $QuestionsStateCopyWith<$Res> {
  factory $SuccessQuestionsStateCopyWith(SuccessQuestionsState value, $Res Function(SuccessQuestionsState) _then) = _$SuccessQuestionsStateCopyWithImpl;
@useResult
$Res call({
 List<FlightQuestionEntity> questions
});




}
/// @nodoc
class _$SuccessQuestionsStateCopyWithImpl<$Res>
    implements $SuccessQuestionsStateCopyWith<$Res> {
  _$SuccessQuestionsStateCopyWithImpl(this._self, this._then);

  final SuccessQuestionsState _self;
  final $Res Function(SuccessQuestionsState) _then;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? questions = null,}) {
  return _then(SuccessQuestionsState(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<FlightQuestionEntity>,
  ));
}


}

/// @nodoc


class QuestionCreatedState extends QuestionsState {
  const QuestionCreatedState({required this.question}): super._();
  

 final  FlightQuestionEntity question;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCreatedStateCopyWith<QuestionCreatedState> get copyWith => _$QuestionCreatedStateCopyWithImpl<QuestionCreatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionCreatedState&&(identical(other.question, question) || other.question == question));
}


@override
int get hashCode => Object.hash(runtimeType,question);

@override
String toString() {
  return 'QuestionsState.questionCreated(question: $question)';
}


}

/// @nodoc
abstract mixin class $QuestionCreatedStateCopyWith<$Res> implements $QuestionsStateCopyWith<$Res> {
  factory $QuestionCreatedStateCopyWith(QuestionCreatedState value, $Res Function(QuestionCreatedState) _then) = _$QuestionCreatedStateCopyWithImpl;
@useResult
$Res call({
 FlightQuestionEntity question
});




}
/// @nodoc
class _$QuestionCreatedStateCopyWithImpl<$Res>
    implements $QuestionCreatedStateCopyWith<$Res> {
  _$QuestionCreatedStateCopyWithImpl(this._self, this._then);

  final QuestionCreatedState _self;
  final $Res Function(QuestionCreatedState) _then;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,}) {
  return _then(QuestionCreatedState(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as FlightQuestionEntity,
  ));
}


}

/// @nodoc


class QuestionUpdatedState extends QuestionsState {
  const QuestionUpdatedState({required this.question}): super._();
  

 final  FlightQuestionEntity question;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionUpdatedStateCopyWith<QuestionUpdatedState> get copyWith => _$QuestionUpdatedStateCopyWithImpl<QuestionUpdatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionUpdatedState&&(identical(other.question, question) || other.question == question));
}


@override
int get hashCode => Object.hash(runtimeType,question);

@override
String toString() {
  return 'QuestionsState.questionUpdated(question: $question)';
}


}

/// @nodoc
abstract mixin class $QuestionUpdatedStateCopyWith<$Res> implements $QuestionsStateCopyWith<$Res> {
  factory $QuestionUpdatedStateCopyWith(QuestionUpdatedState value, $Res Function(QuestionUpdatedState) _then) = _$QuestionUpdatedStateCopyWithImpl;
@useResult
$Res call({
 FlightQuestionEntity question
});




}
/// @nodoc
class _$QuestionUpdatedStateCopyWithImpl<$Res>
    implements $QuestionUpdatedStateCopyWith<$Res> {
  _$QuestionUpdatedStateCopyWithImpl(this._self, this._then);

  final QuestionUpdatedState _self;
  final $Res Function(QuestionUpdatedState) _then;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,}) {
  return _then(QuestionUpdatedState(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as FlightQuestionEntity,
  ));
}


}

/// @nodoc


class QuestionDeletedState extends QuestionsState {
  const QuestionDeletedState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionDeletedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionsState.questionDeleted()';
}


}




// dart format on
