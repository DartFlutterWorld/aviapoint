// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ros_avia_test_category_with_questions_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RosAviaTestCategoryWithQuestionsDto {

 int get categoryId; String get categoryTitle; String? get categoryImage; int get categoryPosition; int get questionsCount; List<QuestionWithAnswersDto> get questionsWithAnswers;
/// Create a copy of RosAviaTestCategoryWithQuestionsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosAviaTestCategoryWithQuestionsDtoCopyWith<RosAviaTestCategoryWithQuestionsDto> get copyWith => _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl<RosAviaTestCategoryWithQuestionsDto>(this as RosAviaTestCategoryWithQuestionsDto, _$identity);

  /// Serializes this RosAviaTestCategoryWithQuestionsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosAviaTestCategoryWithQuestionsDto&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryTitle, categoryTitle) || other.categoryTitle == categoryTitle)&&(identical(other.categoryImage, categoryImage) || other.categoryImage == categoryImage)&&(identical(other.categoryPosition, categoryPosition) || other.categoryPosition == categoryPosition)&&(identical(other.questionsCount, questionsCount) || other.questionsCount == questionsCount)&&const DeepCollectionEquality().equals(other.questionsWithAnswers, questionsWithAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryTitle,categoryImage,categoryPosition,questionsCount,const DeepCollectionEquality().hash(questionsWithAnswers));

@override
String toString() {
  return 'RosAviaTestCategoryWithQuestionsDto(categoryId: $categoryId, categoryTitle: $categoryTitle, categoryImage: $categoryImage, categoryPosition: $categoryPosition, questionsCount: $questionsCount, questionsWithAnswers: $questionsWithAnswers)';
}


}

/// @nodoc
abstract mixin class $RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res>  {
  factory $RosAviaTestCategoryWithQuestionsDtoCopyWith(RosAviaTestCategoryWithQuestionsDto value, $Res Function(RosAviaTestCategoryWithQuestionsDto) _then) = _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl;
@useResult
$Res call({
 int categoryId, String categoryTitle, String? categoryImage, int categoryPosition, int questionsCount, List<QuestionWithAnswersDto> questionsWithAnswers
});




}
/// @nodoc
class _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl<$Res>
    implements $RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res> {
  _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl(this._self, this._then);

  final RosAviaTestCategoryWithQuestionsDto _self;
  final $Res Function(RosAviaTestCategoryWithQuestionsDto) _then;

/// Create a copy of RosAviaTestCategoryWithQuestionsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categoryTitle = null,Object? categoryImage = freezed,Object? categoryPosition = null,Object? questionsCount = null,Object? questionsWithAnswers = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryTitle: null == categoryTitle ? _self.categoryTitle : categoryTitle // ignore: cast_nullable_to_non_nullable
as String,categoryImage: freezed == categoryImage ? _self.categoryImage : categoryImage // ignore: cast_nullable_to_non_nullable
as String?,categoryPosition: null == categoryPosition ? _self.categoryPosition : categoryPosition // ignore: cast_nullable_to_non_nullable
as int,questionsCount: null == questionsCount ? _self.questionsCount : questionsCount // ignore: cast_nullable_to_non_nullable
as int,questionsWithAnswers: null == questionsWithAnswers ? _self.questionsWithAnswers : questionsWithAnswers // ignore: cast_nullable_to_non_nullable
as List<QuestionWithAnswersDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [RosAviaTestCategoryWithQuestionsDto].
extension RosAviaTestCategoryWithQuestionsDtoPatterns on RosAviaTestCategoryWithQuestionsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RosAviaTestCategoryWithQuestionsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RosAviaTestCategoryWithQuestionsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RosAviaTestCategoryWithQuestionsDto value)  $default,){
final _that = this;
switch (_that) {
case _RosAviaTestCategoryWithQuestionsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RosAviaTestCategoryWithQuestionsDto value)?  $default,){
final _that = this;
switch (_that) {
case _RosAviaTestCategoryWithQuestionsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryId,  String categoryTitle,  String? categoryImage,  int categoryPosition,  int questionsCount,  List<QuestionWithAnswersDto> questionsWithAnswers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RosAviaTestCategoryWithQuestionsDto() when $default != null:
return $default(_that.categoryId,_that.categoryTitle,_that.categoryImage,_that.categoryPosition,_that.questionsCount,_that.questionsWithAnswers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryId,  String categoryTitle,  String? categoryImage,  int categoryPosition,  int questionsCount,  List<QuestionWithAnswersDto> questionsWithAnswers)  $default,) {final _that = this;
switch (_that) {
case _RosAviaTestCategoryWithQuestionsDto():
return $default(_that.categoryId,_that.categoryTitle,_that.categoryImage,_that.categoryPosition,_that.questionsCount,_that.questionsWithAnswers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryId,  String categoryTitle,  String? categoryImage,  int categoryPosition,  int questionsCount,  List<QuestionWithAnswersDto> questionsWithAnswers)?  $default,) {final _that = this;
switch (_that) {
case _RosAviaTestCategoryWithQuestionsDto() when $default != null:
return $default(_that.categoryId,_that.categoryTitle,_that.categoryImage,_that.categoryPosition,_that.questionsCount,_that.questionsWithAnswers);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RosAviaTestCategoryWithQuestionsDto implements RosAviaTestCategoryWithQuestionsDto {
  const _RosAviaTestCategoryWithQuestionsDto({required this.categoryId, required this.categoryTitle, this.categoryImage, required this.categoryPosition, required this.questionsCount, required final  List<QuestionWithAnswersDto> questionsWithAnswers}): _questionsWithAnswers = questionsWithAnswers;
  factory _RosAviaTestCategoryWithQuestionsDto.fromJson(Map<String, dynamic> json) => _$RosAviaTestCategoryWithQuestionsDtoFromJson(json);

@override final  int categoryId;
@override final  String categoryTitle;
@override final  String? categoryImage;
@override final  int categoryPosition;
@override final  int questionsCount;
 final  List<QuestionWithAnswersDto> _questionsWithAnswers;
@override List<QuestionWithAnswersDto> get questionsWithAnswers {
  if (_questionsWithAnswers is EqualUnmodifiableListView) return _questionsWithAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questionsWithAnswers);
}


/// Create a copy of RosAviaTestCategoryWithQuestionsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RosAviaTestCategoryWithQuestionsDtoCopyWith<_RosAviaTestCategoryWithQuestionsDto> get copyWith => __$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl<_RosAviaTestCategoryWithQuestionsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RosAviaTestCategoryWithQuestionsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RosAviaTestCategoryWithQuestionsDto&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryTitle, categoryTitle) || other.categoryTitle == categoryTitle)&&(identical(other.categoryImage, categoryImage) || other.categoryImage == categoryImage)&&(identical(other.categoryPosition, categoryPosition) || other.categoryPosition == categoryPosition)&&(identical(other.questionsCount, questionsCount) || other.questionsCount == questionsCount)&&const DeepCollectionEquality().equals(other._questionsWithAnswers, _questionsWithAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryTitle,categoryImage,categoryPosition,questionsCount,const DeepCollectionEquality().hash(_questionsWithAnswers));

@override
String toString() {
  return 'RosAviaTestCategoryWithQuestionsDto(categoryId: $categoryId, categoryTitle: $categoryTitle, categoryImage: $categoryImage, categoryPosition: $categoryPosition, questionsCount: $questionsCount, questionsWithAnswers: $questionsWithAnswers)';
}


}

/// @nodoc
abstract mixin class _$RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res> implements $RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res> {
  factory _$RosAviaTestCategoryWithQuestionsDtoCopyWith(_RosAviaTestCategoryWithQuestionsDto value, $Res Function(_RosAviaTestCategoryWithQuestionsDto) _then) = __$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl;
@override @useResult
$Res call({
 int categoryId, String categoryTitle, String? categoryImage, int categoryPosition, int questionsCount, List<QuestionWithAnswersDto> questionsWithAnswers
});




}
/// @nodoc
class __$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl<$Res>
    implements _$RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res> {
  __$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl(this._self, this._then);

  final _RosAviaTestCategoryWithQuestionsDto _self;
  final $Res Function(_RosAviaTestCategoryWithQuestionsDto) _then;

/// Create a copy of RosAviaTestCategoryWithQuestionsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categoryTitle = null,Object? categoryImage = freezed,Object? categoryPosition = null,Object? questionsCount = null,Object? questionsWithAnswers = null,}) {
  return _then(_RosAviaTestCategoryWithQuestionsDto(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryTitle: null == categoryTitle ? _self.categoryTitle : categoryTitle // ignore: cast_nullable_to_non_nullable
as String,categoryImage: freezed == categoryImage ? _self.categoryImage : categoryImage // ignore: cast_nullable_to_non_nullable
as String?,categoryPosition: null == categoryPosition ? _self.categoryPosition : categoryPosition // ignore: cast_nullable_to_non_nullable
as int,questionsCount: null == questionsCount ? _self.questionsCount : questionsCount // ignore: cast_nullable_to_non_nullable
as int,questionsWithAnswers: null == questionsWithAnswers ? _self._questionsWithAnswers : questionsWithAnswers // ignore: cast_nullable_to_non_nullable
as List<QuestionWithAnswersDto>,
  ));
}


}


/// @nodoc
mixin _$QuestionWithAnswersDto {

 int get questionId; String get questionText; String? get explanation; int? get correctAnswer; List<AnswerDto> get answers; String get categoryTitle; int get categoryId;
/// Create a copy of QuestionWithAnswersDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionWithAnswersDtoCopyWith<QuestionWithAnswersDto> get copyWith => _$QuestionWithAnswersDtoCopyWithImpl<QuestionWithAnswersDto>(this as QuestionWithAnswersDto, _$identity);

  /// Serializes this QuestionWithAnswersDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionWithAnswersDto&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.categoryTitle, categoryTitle) || other.categoryTitle == categoryTitle)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,questionText,explanation,correctAnswer,const DeepCollectionEquality().hash(answers),categoryTitle,categoryId);

@override
String toString() {
  return 'QuestionWithAnswersDto(questionId: $questionId, questionText: $questionText, explanation: $explanation, correctAnswer: $correctAnswer, answers: $answers, categoryTitle: $categoryTitle, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $QuestionWithAnswersDtoCopyWith<$Res>  {
  factory $QuestionWithAnswersDtoCopyWith(QuestionWithAnswersDto value, $Res Function(QuestionWithAnswersDto) _then) = _$QuestionWithAnswersDtoCopyWithImpl;
@useResult
$Res call({
 int questionId, String questionText, String? explanation, int? correctAnswer, List<AnswerDto> answers, String categoryTitle, int categoryId
});




}
/// @nodoc
class _$QuestionWithAnswersDtoCopyWithImpl<$Res>
    implements $QuestionWithAnswersDtoCopyWith<$Res> {
  _$QuestionWithAnswersDtoCopyWithImpl(this._self, this._then);

  final QuestionWithAnswersDto _self;
  final $Res Function(QuestionWithAnswersDto) _then;

/// Create a copy of QuestionWithAnswersDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? questionText = null,Object? explanation = freezed,Object? correctAnswer = freezed,Object? answers = null,Object? categoryTitle = null,Object? categoryId = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<AnswerDto>,categoryTitle: null == categoryTitle ? _self.categoryTitle : categoryTitle // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionWithAnswersDto].
extension QuestionWithAnswersDtoPatterns on QuestionWithAnswersDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionWithAnswersDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionWithAnswersDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionWithAnswersDto value)  $default,){
final _that = this;
switch (_that) {
case _QuestionWithAnswersDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionWithAnswersDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionWithAnswersDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questionId,  String questionText,  String? explanation,  int? correctAnswer,  List<AnswerDto> answers,  String categoryTitle,  int categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionWithAnswersDto() when $default != null:
return $default(_that.questionId,_that.questionText,_that.explanation,_that.correctAnswer,_that.answers,_that.categoryTitle,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questionId,  String questionText,  String? explanation,  int? correctAnswer,  List<AnswerDto> answers,  String categoryTitle,  int categoryId)  $default,) {final _that = this;
switch (_that) {
case _QuestionWithAnswersDto():
return $default(_that.questionId,_that.questionText,_that.explanation,_that.correctAnswer,_that.answers,_that.categoryTitle,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questionId,  String questionText,  String? explanation,  int? correctAnswer,  List<AnswerDto> answers,  String categoryTitle,  int categoryId)?  $default,) {final _that = this;
switch (_that) {
case _QuestionWithAnswersDto() when $default != null:
return $default(_that.questionId,_that.questionText,_that.explanation,_that.correctAnswer,_that.answers,_that.categoryTitle,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _QuestionWithAnswersDto implements QuestionWithAnswersDto {
  const _QuestionWithAnswersDto({required this.questionId, required this.questionText, this.explanation, this.correctAnswer, required final  List<AnswerDto> answers, required this.categoryTitle, required this.categoryId}): _answers = answers;
  factory _QuestionWithAnswersDto.fromJson(Map<String, dynamic> json) => _$QuestionWithAnswersDtoFromJson(json);

@override final  int questionId;
@override final  String questionText;
@override final  String? explanation;
@override final  int? correctAnswer;
 final  List<AnswerDto> _answers;
@override List<AnswerDto> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override final  String categoryTitle;
@override final  int categoryId;

/// Create a copy of QuestionWithAnswersDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionWithAnswersDtoCopyWith<_QuestionWithAnswersDto> get copyWith => __$QuestionWithAnswersDtoCopyWithImpl<_QuestionWithAnswersDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionWithAnswersDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionWithAnswersDto&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.categoryTitle, categoryTitle) || other.categoryTitle == categoryTitle)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,questionText,explanation,correctAnswer,const DeepCollectionEquality().hash(_answers),categoryTitle,categoryId);

@override
String toString() {
  return 'QuestionWithAnswersDto(questionId: $questionId, questionText: $questionText, explanation: $explanation, correctAnswer: $correctAnswer, answers: $answers, categoryTitle: $categoryTitle, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$QuestionWithAnswersDtoCopyWith<$Res> implements $QuestionWithAnswersDtoCopyWith<$Res> {
  factory _$QuestionWithAnswersDtoCopyWith(_QuestionWithAnswersDto value, $Res Function(_QuestionWithAnswersDto) _then) = __$QuestionWithAnswersDtoCopyWithImpl;
@override @useResult
$Res call({
 int questionId, String questionText, String? explanation, int? correctAnswer, List<AnswerDto> answers, String categoryTitle, int categoryId
});




}
/// @nodoc
class __$QuestionWithAnswersDtoCopyWithImpl<$Res>
    implements _$QuestionWithAnswersDtoCopyWith<$Res> {
  __$QuestionWithAnswersDtoCopyWithImpl(this._self, this._then);

  final _QuestionWithAnswersDto _self;
  final $Res Function(_QuestionWithAnswersDto) _then;

/// Create a copy of QuestionWithAnswersDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? questionText = null,Object? explanation = freezed,Object? correctAnswer = freezed,Object? answers = null,Object? categoryTitle = null,Object? categoryId = null,}) {
  return _then(_QuestionWithAnswersDto(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<AnswerDto>,categoryTitle: null == categoryTitle ? _self.categoryTitle : categoryTitle // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AnswerDto {

 int get answerId; String get answerText; bool get isCorrect; bool get isOfficial; int get position;
/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerDtoCopyWith<AnswerDto> get copyWith => _$AnswerDtoCopyWithImpl<AnswerDto>(this as AnswerDto, _$identity);

  /// Serializes this AnswerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerDto&&(identical(other.answerId, answerId) || other.answerId == answerId)&&(identical(other.answerText, answerText) || other.answerText == answerText)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answerId,answerText,isCorrect,isOfficial,position);

@override
String toString() {
  return 'AnswerDto(answerId: $answerId, answerText: $answerText, isCorrect: $isCorrect, isOfficial: $isOfficial, position: $position)';
}


}

/// @nodoc
abstract mixin class $AnswerDtoCopyWith<$Res>  {
  factory $AnswerDtoCopyWith(AnswerDto value, $Res Function(AnswerDto) _then) = _$AnswerDtoCopyWithImpl;
@useResult
$Res call({
 int answerId, String answerText, bool isCorrect, bool isOfficial, int position
});




}
/// @nodoc
class _$AnswerDtoCopyWithImpl<$Res>
    implements $AnswerDtoCopyWith<$Res> {
  _$AnswerDtoCopyWithImpl(this._self, this._then);

  final AnswerDto _self;
  final $Res Function(AnswerDto) _then;

/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answerId = null,Object? answerText = null,Object? isCorrect = null,Object? isOfficial = null,Object? position = null,}) {
  return _then(_self.copyWith(
answerId: null == answerId ? _self.answerId : answerId // ignore: cast_nullable_to_non_nullable
as int,answerText: null == answerText ? _self.answerText : answerText // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AnswerDto].
extension AnswerDtoPatterns on AnswerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnswerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnswerDto value)  $default,){
final _that = this;
switch (_that) {
case _AnswerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnswerDto value)?  $default,){
final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int answerId,  String answerText,  bool isCorrect,  bool isOfficial,  int position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
return $default(_that.answerId,_that.answerText,_that.isCorrect,_that.isOfficial,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int answerId,  String answerText,  bool isCorrect,  bool isOfficial,  int position)  $default,) {final _that = this;
switch (_that) {
case _AnswerDto():
return $default(_that.answerId,_that.answerText,_that.isCorrect,_that.isOfficial,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int answerId,  String answerText,  bool isCorrect,  bool isOfficial,  int position)?  $default,) {final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
return $default(_that.answerId,_that.answerText,_that.isCorrect,_that.isOfficial,_that.position);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AnswerDto implements AnswerDto {
  const _AnswerDto({required this.answerId, required this.answerText, required this.isCorrect, required this.isOfficial, required this.position});
  factory _AnswerDto.fromJson(Map<String, dynamic> json) => _$AnswerDtoFromJson(json);

@override final  int answerId;
@override final  String answerText;
@override final  bool isCorrect;
@override final  bool isOfficial;
@override final  int position;

/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerDtoCopyWith<_AnswerDto> get copyWith => __$AnswerDtoCopyWithImpl<_AnswerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerDto&&(identical(other.answerId, answerId) || other.answerId == answerId)&&(identical(other.answerText, answerText) || other.answerText == answerText)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answerId,answerText,isCorrect,isOfficial,position);

@override
String toString() {
  return 'AnswerDto(answerId: $answerId, answerText: $answerText, isCorrect: $isCorrect, isOfficial: $isOfficial, position: $position)';
}


}

/// @nodoc
abstract mixin class _$AnswerDtoCopyWith<$Res> implements $AnswerDtoCopyWith<$Res> {
  factory _$AnswerDtoCopyWith(_AnswerDto value, $Res Function(_AnswerDto) _then) = __$AnswerDtoCopyWithImpl;
@override @useResult
$Res call({
 int answerId, String answerText, bool isCorrect, bool isOfficial, int position
});




}
/// @nodoc
class __$AnswerDtoCopyWithImpl<$Res>
    implements _$AnswerDtoCopyWith<$Res> {
  __$AnswerDtoCopyWithImpl(this._self, this._then);

  final _AnswerDto _self;
  final $Res Function(_AnswerDto) _then;

/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answerId = null,Object? answerText = null,Object? isCorrect = null,Object? isOfficial = null,Object? position = null,}) {
  return _then(_AnswerDto(
answerId: null == answerId ? _self.answerId : answerId // ignore: cast_nullable_to_non_nullable
as int,answerText: null == answerText ? _self.answerText : answerText // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
