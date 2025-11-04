// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ros_avia_test_category_with_questions_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RosAviaTestCategoryWithQuestionsDto
_$RosAviaTestCategoryWithQuestionsDtoFromJson(Map<String, dynamic> json) {
  return _RosAviaTestCategoryWithQuestionsDto.fromJson(json);
}

/// @nodoc
mixin _$RosAviaTestCategoryWithQuestionsDto {
  int get categoryId => throw _privateConstructorUsedError;
  String get categoryTitle => throw _privateConstructorUsedError;
  String? get categoryImage => throw _privateConstructorUsedError;
  int get categoryPosition => throw _privateConstructorUsedError;
  int get questionsCount => throw _privateConstructorUsedError;
  List<QuestionWithAnswersDto> get questionsWithAnswers =>
      throw _privateConstructorUsedError;

  /// Serializes this RosAviaTestCategoryWithQuestionsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RosAviaTestCategoryWithQuestionsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RosAviaTestCategoryWithQuestionsDtoCopyWith<
    RosAviaTestCategoryWithQuestionsDto
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res> {
  factory $RosAviaTestCategoryWithQuestionsDtoCopyWith(
    RosAviaTestCategoryWithQuestionsDto value,
    $Res Function(RosAviaTestCategoryWithQuestionsDto) then,
  ) =
      _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl<
        $Res,
        RosAviaTestCategoryWithQuestionsDto
      >;
  @useResult
  $Res call({
    int categoryId,
    String categoryTitle,
    String? categoryImage,
    int categoryPosition,
    int questionsCount,
    List<QuestionWithAnswersDto> questionsWithAnswers,
  });
}

/// @nodoc
class _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl<
  $Res,
  $Val extends RosAviaTestCategoryWithQuestionsDto
>
    implements $RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res> {
  _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RosAviaTestCategoryWithQuestionsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryTitle = null,
    Object? categoryImage = freezed,
    Object? categoryPosition = null,
    Object? questionsCount = null,
    Object? questionsWithAnswers = null,
  }) {
    return _then(
      _value.copyWith(
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int,
            categoryTitle: null == categoryTitle
                ? _value.categoryTitle
                : categoryTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryImage: freezed == categoryImage
                ? _value.categoryImage
                : categoryImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryPosition: null == categoryPosition
                ? _value.categoryPosition
                : categoryPosition // ignore: cast_nullable_to_non_nullable
                      as int,
            questionsCount: null == questionsCount
                ? _value.questionsCount
                : questionsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            questionsWithAnswers: null == questionsWithAnswers
                ? _value.questionsWithAnswers
                : questionsWithAnswers // ignore: cast_nullable_to_non_nullable
                      as List<QuestionWithAnswersDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RosAviaTestCategoryWithQuestionsDtoImplCopyWith<$Res>
    implements $RosAviaTestCategoryWithQuestionsDtoCopyWith<$Res> {
  factory _$$RosAviaTestCategoryWithQuestionsDtoImplCopyWith(
    _$RosAviaTestCategoryWithQuestionsDtoImpl value,
    $Res Function(_$RosAviaTestCategoryWithQuestionsDtoImpl) then,
  ) = __$$RosAviaTestCategoryWithQuestionsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int categoryId,
    String categoryTitle,
    String? categoryImage,
    int categoryPosition,
    int questionsCount,
    List<QuestionWithAnswersDto> questionsWithAnswers,
  });
}

/// @nodoc
class __$$RosAviaTestCategoryWithQuestionsDtoImplCopyWithImpl<$Res>
    extends
        _$RosAviaTestCategoryWithQuestionsDtoCopyWithImpl<
          $Res,
          _$RosAviaTestCategoryWithQuestionsDtoImpl
        >
    implements _$$RosAviaTestCategoryWithQuestionsDtoImplCopyWith<$Res> {
  __$$RosAviaTestCategoryWithQuestionsDtoImplCopyWithImpl(
    _$RosAviaTestCategoryWithQuestionsDtoImpl _value,
    $Res Function(_$RosAviaTestCategoryWithQuestionsDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RosAviaTestCategoryWithQuestionsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryTitle = null,
    Object? categoryImage = freezed,
    Object? categoryPosition = null,
    Object? questionsCount = null,
    Object? questionsWithAnswers = null,
  }) {
    return _then(
      _$RosAviaTestCategoryWithQuestionsDtoImpl(
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
        categoryTitle: null == categoryTitle
            ? _value.categoryTitle
            : categoryTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryImage: freezed == categoryImage
            ? _value.categoryImage
            : categoryImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryPosition: null == categoryPosition
            ? _value.categoryPosition
            : categoryPosition // ignore: cast_nullable_to_non_nullable
                  as int,
        questionsCount: null == questionsCount
            ? _value.questionsCount
            : questionsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        questionsWithAnswers: null == questionsWithAnswers
            ? _value._questionsWithAnswers
            : questionsWithAnswers // ignore: cast_nullable_to_non_nullable
                  as List<QuestionWithAnswersDto>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RosAviaTestCategoryWithQuestionsDtoImpl
    implements _RosAviaTestCategoryWithQuestionsDto {
  const _$RosAviaTestCategoryWithQuestionsDtoImpl({
    required this.categoryId,
    required this.categoryTitle,
    this.categoryImage,
    required this.categoryPosition,
    required this.questionsCount,
    required final List<QuestionWithAnswersDto> questionsWithAnswers,
  }) : _questionsWithAnswers = questionsWithAnswers;

  factory _$RosAviaTestCategoryWithQuestionsDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RosAviaTestCategoryWithQuestionsDtoImplFromJson(json);

  @override
  final int categoryId;
  @override
  final String categoryTitle;
  @override
  final String? categoryImage;
  @override
  final int categoryPosition;
  @override
  final int questionsCount;
  final List<QuestionWithAnswersDto> _questionsWithAnswers;
  @override
  List<QuestionWithAnswersDto> get questionsWithAnswers {
    if (_questionsWithAnswers is EqualUnmodifiableListView)
      return _questionsWithAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionsWithAnswers);
  }

  @override
  String toString() {
    return 'RosAviaTestCategoryWithQuestionsDto(categoryId: $categoryId, categoryTitle: $categoryTitle, categoryImage: $categoryImage, categoryPosition: $categoryPosition, questionsCount: $questionsCount, questionsWithAnswers: $questionsWithAnswers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RosAviaTestCategoryWithQuestionsDtoImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryTitle, categoryTitle) ||
                other.categoryTitle == categoryTitle) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage) &&
            (identical(other.categoryPosition, categoryPosition) ||
                other.categoryPosition == categoryPosition) &&
            (identical(other.questionsCount, questionsCount) ||
                other.questionsCount == questionsCount) &&
            const DeepCollectionEquality().equals(
              other._questionsWithAnswers,
              _questionsWithAnswers,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryTitle,
    categoryImage,
    categoryPosition,
    questionsCount,
    const DeepCollectionEquality().hash(_questionsWithAnswers),
  );

  /// Create a copy of RosAviaTestCategoryWithQuestionsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RosAviaTestCategoryWithQuestionsDtoImplCopyWith<
    _$RosAviaTestCategoryWithQuestionsDtoImpl
  >
  get copyWith =>
      __$$RosAviaTestCategoryWithQuestionsDtoImplCopyWithImpl<
        _$RosAviaTestCategoryWithQuestionsDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RosAviaTestCategoryWithQuestionsDtoImplToJson(this);
  }
}

abstract class _RosAviaTestCategoryWithQuestionsDto
    implements RosAviaTestCategoryWithQuestionsDto {
  const factory _RosAviaTestCategoryWithQuestionsDto({
    required final int categoryId,
    required final String categoryTitle,
    final String? categoryImage,
    required final int categoryPosition,
    required final int questionsCount,
    required final List<QuestionWithAnswersDto> questionsWithAnswers,
  }) = _$RosAviaTestCategoryWithQuestionsDtoImpl;

  factory _RosAviaTestCategoryWithQuestionsDto.fromJson(
    Map<String, dynamic> json,
  ) = _$RosAviaTestCategoryWithQuestionsDtoImpl.fromJson;

  @override
  int get categoryId;
  @override
  String get categoryTitle;
  @override
  String? get categoryImage;
  @override
  int get categoryPosition;
  @override
  int get questionsCount;
  @override
  List<QuestionWithAnswersDto> get questionsWithAnswers;

  /// Create a copy of RosAviaTestCategoryWithQuestionsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RosAviaTestCategoryWithQuestionsDtoImplCopyWith<
    _$RosAviaTestCategoryWithQuestionsDtoImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

QuestionWithAnswersDto _$QuestionWithAnswersDtoFromJson(
  Map<String, dynamic> json,
) {
  return _QuestionWithAnswersDto.fromJson(json);
}

/// @nodoc
mixin _$QuestionWithAnswersDto {
  int get questionId => throw _privateConstructorUsedError;
  String get questionText => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  int? get correctAnswer => throw _privateConstructorUsedError;
  List<AnswerDto> get answers => throw _privateConstructorUsedError;
  String? get categoryTitle => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;

  /// Serializes this QuestionWithAnswersDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionWithAnswersDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionWithAnswersDtoCopyWith<QuestionWithAnswersDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionWithAnswersDtoCopyWith<$Res> {
  factory $QuestionWithAnswersDtoCopyWith(
    QuestionWithAnswersDto value,
    $Res Function(QuestionWithAnswersDto) then,
  ) = _$QuestionWithAnswersDtoCopyWithImpl<$Res, QuestionWithAnswersDto>;
  @useResult
  $Res call({
    int questionId,
    String questionText,
    String? explanation,
    int? correctAnswer,
    List<AnswerDto> answers,
    String? categoryTitle,
    int? categoryId,
  });
}

/// @nodoc
class _$QuestionWithAnswersDtoCopyWithImpl<
  $Res,
  $Val extends QuestionWithAnswersDto
>
    implements $QuestionWithAnswersDtoCopyWith<$Res> {
  _$QuestionWithAnswersDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionWithAnswersDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? questionText = null,
    Object? explanation = freezed,
    Object? correctAnswer = freezed,
    Object? answers = null,
    Object? categoryTitle = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(
      _value.copyWith(
            questionId: null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                      as int,
            questionText: null == questionText
                ? _value.questionText
                : questionText // ignore: cast_nullable_to_non_nullable
                      as String,
            explanation: freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            correctAnswer: freezed == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                      as int?,
            answers: null == answers
                ? _value.answers
                : answers // ignore: cast_nullable_to_non_nullable
                      as List<AnswerDto>,
            categoryTitle: freezed == categoryTitle
                ? _value.categoryTitle
                : categoryTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuestionWithAnswersDtoImplCopyWith<$Res>
    implements $QuestionWithAnswersDtoCopyWith<$Res> {
  factory _$$QuestionWithAnswersDtoImplCopyWith(
    _$QuestionWithAnswersDtoImpl value,
    $Res Function(_$QuestionWithAnswersDtoImpl) then,
  ) = __$$QuestionWithAnswersDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int questionId,
    String questionText,
    String? explanation,
    int? correctAnswer,
    List<AnswerDto> answers,
    String? categoryTitle,
    int? categoryId,
  });
}

/// @nodoc
class __$$QuestionWithAnswersDtoImplCopyWithImpl<$Res>
    extends
        _$QuestionWithAnswersDtoCopyWithImpl<$Res, _$QuestionWithAnswersDtoImpl>
    implements _$$QuestionWithAnswersDtoImplCopyWith<$Res> {
  __$$QuestionWithAnswersDtoImplCopyWithImpl(
    _$QuestionWithAnswersDtoImpl _value,
    $Res Function(_$QuestionWithAnswersDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuestionWithAnswersDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? questionText = null,
    Object? explanation = freezed,
    Object? correctAnswer = freezed,
    Object? answers = null,
    Object? categoryTitle = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(
      _$QuestionWithAnswersDtoImpl(
        questionId: null == questionId
            ? _value.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as int,
        questionText: null == questionText
            ? _value.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String,
        explanation: freezed == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        correctAnswer: freezed == correctAnswer
            ? _value.correctAnswer
            : correctAnswer // ignore: cast_nullable_to_non_nullable
                  as int?,
        answers: null == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<AnswerDto>,
        categoryTitle: freezed == categoryTitle
            ? _value.categoryTitle
            : categoryTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$QuestionWithAnswersDtoImpl implements _QuestionWithAnswersDto {
  const _$QuestionWithAnswersDtoImpl({
    required this.questionId,
    required this.questionText,
    this.explanation,
    this.correctAnswer,
    required final List<AnswerDto> answers,
    this.categoryTitle,
    this.categoryId,
  }) : _answers = answers;

  factory _$QuestionWithAnswersDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionWithAnswersDtoImplFromJson(json);

  @override
  final int questionId;
  @override
  final String questionText;
  @override
  final String? explanation;
  @override
  final int? correctAnswer;
  final List<AnswerDto> _answers;
  @override
  List<AnswerDto> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String? categoryTitle;
  @override
  final int? categoryId;

  @override
  String toString() {
    return 'QuestionWithAnswersDto(questionId: $questionId, questionText: $questionText, explanation: $explanation, correctAnswer: $correctAnswer, answers: $answers, categoryTitle: $categoryTitle, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionWithAnswersDtoImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.categoryTitle, categoryTitle) ||
                other.categoryTitle == categoryTitle) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    questionId,
    questionText,
    explanation,
    correctAnswer,
    const DeepCollectionEquality().hash(_answers),
    categoryTitle,
    categoryId,
  );

  /// Create a copy of QuestionWithAnswersDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionWithAnswersDtoImplCopyWith<_$QuestionWithAnswersDtoImpl>
  get copyWith =>
      __$$QuestionWithAnswersDtoImplCopyWithImpl<_$QuestionWithAnswersDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionWithAnswersDtoImplToJson(this);
  }
}

abstract class _QuestionWithAnswersDto implements QuestionWithAnswersDto {
  const factory _QuestionWithAnswersDto({
    required final int questionId,
    required final String questionText,
    final String? explanation,
    final int? correctAnswer,
    required final List<AnswerDto> answers,
    final String? categoryTitle,
    final int? categoryId,
  }) = _$QuestionWithAnswersDtoImpl;

  factory _QuestionWithAnswersDto.fromJson(Map<String, dynamic> json) =
      _$QuestionWithAnswersDtoImpl.fromJson;

  @override
  int get questionId;
  @override
  String get questionText;
  @override
  String? get explanation;
  @override
  int? get correctAnswer;
  @override
  List<AnswerDto> get answers;
  @override
  String? get categoryTitle;
  @override
  int? get categoryId;

  /// Create a copy of QuestionWithAnswersDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionWithAnswersDtoImplCopyWith<_$QuestionWithAnswersDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) {
  return _AnswerDto.fromJson(json);
}

/// @nodoc
mixin _$AnswerDto {
  int get answerId => throw _privateConstructorUsedError;
  String get answerText => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  bool get isOfficial => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  /// Serializes this AnswerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerDtoCopyWith<AnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerDtoCopyWith<$Res> {
  factory $AnswerDtoCopyWith(AnswerDto value, $Res Function(AnswerDto) then) =
      _$AnswerDtoCopyWithImpl<$Res, AnswerDto>;
  @useResult
  $Res call({
    int answerId,
    String answerText,
    bool isCorrect,
    bool isOfficial,
    int position,
  });
}

/// @nodoc
class _$AnswerDtoCopyWithImpl<$Res, $Val extends AnswerDto>
    implements $AnswerDtoCopyWith<$Res> {
  _$AnswerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? answerText = null,
    Object? isCorrect = null,
    Object? isOfficial = null,
    Object? position = null,
  }) {
    return _then(
      _value.copyWith(
            answerId: null == answerId
                ? _value.answerId
                : answerId // ignore: cast_nullable_to_non_nullable
                      as int,
            answerText: null == answerText
                ? _value.answerText
                : answerText // ignore: cast_nullable_to_non_nullable
                      as String,
            isCorrect: null == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as bool,
            isOfficial: null == isOfficial
                ? _value.isOfficial
                : isOfficial // ignore: cast_nullable_to_non_nullable
                      as bool,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnswerDtoImplCopyWith<$Res>
    implements $AnswerDtoCopyWith<$Res> {
  factory _$$AnswerDtoImplCopyWith(
    _$AnswerDtoImpl value,
    $Res Function(_$AnswerDtoImpl) then,
  ) = __$$AnswerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int answerId,
    String answerText,
    bool isCorrect,
    bool isOfficial,
    int position,
  });
}

/// @nodoc
class __$$AnswerDtoImplCopyWithImpl<$Res>
    extends _$AnswerDtoCopyWithImpl<$Res, _$AnswerDtoImpl>
    implements _$$AnswerDtoImplCopyWith<$Res> {
  __$$AnswerDtoImplCopyWithImpl(
    _$AnswerDtoImpl _value,
    $Res Function(_$AnswerDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? answerText = null,
    Object? isCorrect = null,
    Object? isOfficial = null,
    Object? position = null,
  }) {
    return _then(
      _$AnswerDtoImpl(
        answerId: null == answerId
            ? _value.answerId
            : answerId // ignore: cast_nullable_to_non_nullable
                  as int,
        answerText: null == answerText
            ? _value.answerText
            : answerText // ignore: cast_nullable_to_non_nullable
                  as String,
        isCorrect: null == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as bool,
        isOfficial: null == isOfficial
            ? _value.isOfficial
            : isOfficial // ignore: cast_nullable_to_non_nullable
                  as bool,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AnswerDtoImpl implements _AnswerDto {
  const _$AnswerDtoImpl({
    required this.answerId,
    required this.answerText,
    required this.isCorrect,
    required this.isOfficial,
    required this.position,
  });

  factory _$AnswerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerDtoImplFromJson(json);

  @override
  final int answerId;
  @override
  final String answerText;
  @override
  final bool isCorrect;
  @override
  final bool isOfficial;
  @override
  final int position;

  @override
  String toString() {
    return 'AnswerDto(answerId: $answerId, answerText: $answerText, isCorrect: $isCorrect, isOfficial: $isOfficial, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerDtoImpl &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    answerId,
    answerText,
    isCorrect,
    isOfficial,
    position,
  );

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerDtoImplCopyWith<_$AnswerDtoImpl> get copyWith =>
      __$$AnswerDtoImplCopyWithImpl<_$AnswerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerDtoImplToJson(this);
  }
}

abstract class _AnswerDto implements AnswerDto {
  const factory _AnswerDto({
    required final int answerId,
    required final String answerText,
    required final bool isCorrect,
    required final bool isOfficial,
    required final int position,
  }) = _$AnswerDtoImpl;

  factory _AnswerDto.fromJson(Map<String, dynamic> json) =
      _$AnswerDtoImpl.fromJson;

  @override
  int get answerId;
  @override
  String get answerText;
  @override
  bool get isCorrect;
  @override
  bool get isOfficial;
  @override
  int get position;

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerDtoImplCopyWith<_$AnswerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
