// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _certificateTypeIdMeta = const VerificationMeta(
    'certificateTypeId',
  );
  @override
  late final GeneratedColumn<int> certificateTypeId = GeneratedColumn<int>(
    'certificate_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _mixAnswersMeta = const VerificationMeta(
    'mixAnswers',
  );
  @override
  late final GeneratedColumn<bool> mixAnswers = GeneratedColumn<bool>(
    'mix_answers',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("mix_answers" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _mixQuestionsMeta = const VerificationMeta(
    'mixQuestions',
  );
  @override
  late final GeneratedColumn<bool> mixQuestions = GeneratedColumn<bool>(
    'mix_questions',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("mix_questions" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _buttonHintMeta = const VerificationMeta(
    'buttonHint',
  );
  @override
  late final GeneratedColumn<bool> buttonHint = GeneratedColumn<bool>(
    'button_hint',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("button_hint" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Set<int>, String>
  selectedCategoryIds = GeneratedColumn<String>(
    'selected_category_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  ).withConverter<Set<int>>($AppSettingsTable.$converterselectedCategoryIds);
  static const VerificationMeta _testModeMeta = const VerificationMeta(
    'testMode',
  );
  @override
  late final GeneratedColumn<String> testMode = GeneratedColumn<String>(
    'test_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('training'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    certificateTypeId,
    mixAnswers,
    mixQuestions,
    buttonHint,
    title,
    image,
    selectedCategoryIds,
    testMode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('certificate_type_id')) {
      context.handle(
        _certificateTypeIdMeta,
        certificateTypeId.isAcceptableOrUnknown(
          data['certificate_type_id']!,
          _certificateTypeIdMeta,
        ),
      );
    }
    if (data.containsKey('mix_answers')) {
      context.handle(
        _mixAnswersMeta,
        mixAnswers.isAcceptableOrUnknown(data['mix_answers']!, _mixAnswersMeta),
      );
    }
    if (data.containsKey('mix_questions')) {
      context.handle(
        _mixQuestionsMeta,
        mixQuestions.isAcceptableOrUnknown(
          data['mix_questions']!,
          _mixQuestionsMeta,
        ),
      );
    }
    if (data.containsKey('button_hint')) {
      context.handle(
        _buttonHintMeta,
        buttonHint.isAcceptableOrUnknown(data['button_hint']!, _buttonHintMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('test_mode')) {
      context.handle(
        _testModeMeta,
        testMode.isAcceptableOrUnknown(data['test_mode']!, _testModeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {certificateTypeId};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      certificateTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}certificate_type_id'],
      )!,
      mixAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}mix_answers'],
      )!,
      mixQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}mix_questions'],
      )!,
      buttonHint: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}button_hint'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      selectedCategoryIds: $AppSettingsTable.$converterselectedCategoryIds
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}selected_category_ids'],
            )!,
          ),
      testMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_mode'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }

  static TypeConverter<Set<int>, String> $converterselectedCategoryIds =
      const IntListJson();
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int certificateTypeId;
  final bool mixAnswers;
  final bool mixQuestions;
  final bool buttonHint;
  final String title;
  final String image;
  final Set<int> selectedCategoryIds;
  final String testMode;
  const AppSetting({
    required this.certificateTypeId,
    required this.mixAnswers,
    required this.mixQuestions,
    required this.buttonHint,
    required this.title,
    required this.image,
    required this.selectedCategoryIds,
    required this.testMode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['certificate_type_id'] = Variable<int>(certificateTypeId);
    map['mix_answers'] = Variable<bool>(mixAnswers);
    map['mix_questions'] = Variable<bool>(mixQuestions);
    map['button_hint'] = Variable<bool>(buttonHint);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    {
      map['selected_category_ids'] = Variable<String>(
        $AppSettingsTable.$converterselectedCategoryIds.toSql(
          selectedCategoryIds,
        ),
      );
    }
    map['test_mode'] = Variable<String>(testMode);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      certificateTypeId: Value(certificateTypeId),
      mixAnswers: Value(mixAnswers),
      mixQuestions: Value(mixQuestions),
      buttonHint: Value(buttonHint),
      title: Value(title),
      image: Value(image),
      selectedCategoryIds: Value(selectedCategoryIds),
      testMode: Value(testMode),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      certificateTypeId: serializer.fromJson<int>(json['certificateTypeId']),
      mixAnswers: serializer.fromJson<bool>(json['mixAnswers']),
      mixQuestions: serializer.fromJson<bool>(json['mixQuestions']),
      buttonHint: serializer.fromJson<bool>(json['buttonHint']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      selectedCategoryIds: serializer.fromJson<Set<int>>(
        json['selectedCategoryIds'],
      ),
      testMode: serializer.fromJson<String>(json['testMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'certificateTypeId': serializer.toJson<int>(certificateTypeId),
      'mixAnswers': serializer.toJson<bool>(mixAnswers),
      'mixQuestions': serializer.toJson<bool>(mixQuestions),
      'buttonHint': serializer.toJson<bool>(buttonHint),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'selectedCategoryIds': serializer.toJson<Set<int>>(selectedCategoryIds),
      'testMode': serializer.toJson<String>(testMode),
    };
  }

  AppSetting copyWith({
    int? certificateTypeId,
    bool? mixAnswers,
    bool? mixQuestions,
    bool? buttonHint,
    String? title,
    String? image,
    Set<int>? selectedCategoryIds,
    String? testMode,
  }) => AppSetting(
    certificateTypeId: certificateTypeId ?? this.certificateTypeId,
    mixAnswers: mixAnswers ?? this.mixAnswers,
    mixQuestions: mixQuestions ?? this.mixQuestions,
    buttonHint: buttonHint ?? this.buttonHint,
    title: title ?? this.title,
    image: image ?? this.image,
    selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
    testMode: testMode ?? this.testMode,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      certificateTypeId: data.certificateTypeId.present
          ? data.certificateTypeId.value
          : this.certificateTypeId,
      mixAnswers: data.mixAnswers.present
          ? data.mixAnswers.value
          : this.mixAnswers,
      mixQuestions: data.mixQuestions.present
          ? data.mixQuestions.value
          : this.mixQuestions,
      buttonHint: data.buttonHint.present
          ? data.buttonHint.value
          : this.buttonHint,
      title: data.title.present ? data.title.value : this.title,
      image: data.image.present ? data.image.value : this.image,
      selectedCategoryIds: data.selectedCategoryIds.present
          ? data.selectedCategoryIds.value
          : this.selectedCategoryIds,
      testMode: data.testMode.present ? data.testMode.value : this.testMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('mixAnswers: $mixAnswers, ')
          ..write('mixQuestions: $mixQuestions, ')
          ..write('buttonHint: $buttonHint, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('selectedCategoryIds: $selectedCategoryIds, ')
          ..write('testMode: $testMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    certificateTypeId,
    mixAnswers,
    mixQuestions,
    buttonHint,
    title,
    image,
    selectedCategoryIds,
    testMode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.certificateTypeId == this.certificateTypeId &&
          other.mixAnswers == this.mixAnswers &&
          other.mixQuestions == this.mixQuestions &&
          other.buttonHint == this.buttonHint &&
          other.title == this.title &&
          other.image == this.image &&
          other.selectedCategoryIds == this.selectedCategoryIds &&
          other.testMode == this.testMode);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> certificateTypeId;
  final Value<bool> mixAnswers;
  final Value<bool> mixQuestions;
  final Value<bool> buttonHint;
  final Value<String> title;
  final Value<String> image;
  final Value<Set<int>> selectedCategoryIds;
  final Value<String> testMode;
  const AppSettingsCompanion({
    this.certificateTypeId = const Value.absent(),
    this.mixAnswers = const Value.absent(),
    this.mixQuestions = const Value.absent(),
    this.buttonHint = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.selectedCategoryIds = const Value.absent(),
    this.testMode = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.certificateTypeId = const Value.absent(),
    this.mixAnswers = const Value.absent(),
    this.mixQuestions = const Value.absent(),
    this.buttonHint = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.selectedCategoryIds = const Value.absent(),
    this.testMode = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? certificateTypeId,
    Expression<bool>? mixAnswers,
    Expression<bool>? mixQuestions,
    Expression<bool>? buttonHint,
    Expression<String>? title,
    Expression<String>? image,
    Expression<String>? selectedCategoryIds,
    Expression<String>? testMode,
  }) {
    return RawValuesInsertable({
      if (certificateTypeId != null) 'certificate_type_id': certificateTypeId,
      if (mixAnswers != null) 'mix_answers': mixAnswers,
      if (mixQuestions != null) 'mix_questions': mixQuestions,
      if (buttonHint != null) 'button_hint': buttonHint,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (selectedCategoryIds != null)
        'selected_category_ids': selectedCategoryIds,
      if (testMode != null) 'test_mode': testMode,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? certificateTypeId,
    Value<bool>? mixAnswers,
    Value<bool>? mixQuestions,
    Value<bool>? buttonHint,
    Value<String>? title,
    Value<String>? image,
    Value<Set<int>>? selectedCategoryIds,
    Value<String>? testMode,
  }) {
    return AppSettingsCompanion(
      certificateTypeId: certificateTypeId ?? this.certificateTypeId,
      mixAnswers: mixAnswers ?? this.mixAnswers,
      mixQuestions: mixQuestions ?? this.mixQuestions,
      buttonHint: buttonHint ?? this.buttonHint,
      title: title ?? this.title,
      image: image ?? this.image,
      selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
      testMode: testMode ?? this.testMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (certificateTypeId.present) {
      map['certificate_type_id'] = Variable<int>(certificateTypeId.value);
    }
    if (mixAnswers.present) {
      map['mix_answers'] = Variable<bool>(mixAnswers.value);
    }
    if (mixQuestions.present) {
      map['mix_questions'] = Variable<bool>(mixQuestions.value);
    }
    if (buttonHint.present) {
      map['button_hint'] = Variable<bool>(buttonHint.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (selectedCategoryIds.present) {
      map['selected_category_ids'] = Variable<String>(
        $AppSettingsTable.$converterselectedCategoryIds.toSql(
          selectedCategoryIds.value,
        ),
      );
    }
    if (testMode.present) {
      map['test_mode'] = Variable<String>(testMode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('mixAnswers: $mixAnswers, ')
          ..write('mixQuestions: $mixQuestions, ')
          ..write('buttonHint: $buttonHint, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('selectedCategoryIds: $selectedCategoryIds, ')
          ..write('testMode: $testMode')
          ..write(')'))
        .toString();
  }
}

class $SelectedQuestionsTable extends SelectedQuestions
    with TableInfo<$SelectedQuestionsTable, SelectedQuestion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SelectedQuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _certificateTypeIdMeta = const VerificationMeta(
    'certificateTypeId',
  );
  @override
  late final GeneratedColumn<int> certificateTypeId = GeneratedColumn<int>(
    'certificate_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [certificateTypeId, questionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'selected_questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SelectedQuestion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('certificate_type_id')) {
      context.handle(
        _certificateTypeIdMeta,
        certificateTypeId.isAcceptableOrUnknown(
          data['certificate_type_id']!,
          _certificateTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_certificateTypeIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {certificateTypeId, questionId},
  ];
  @override
  SelectedQuestion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SelectedQuestion(
      certificateTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}certificate_type_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}question_id'],
      )!,
    );
  }

  @override
  $SelectedQuestionsTable createAlias(String alias) {
    return $SelectedQuestionsTable(attachedDatabase, alias);
  }
}

class SelectedQuestion extends DataClass
    implements Insertable<SelectedQuestion> {
  final int certificateTypeId;
  final int questionId;
  const SelectedQuestion({
    required this.certificateTypeId,
    required this.questionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['certificate_type_id'] = Variable<int>(certificateTypeId);
    map['question_id'] = Variable<int>(questionId);
    return map;
  }

  SelectedQuestionsCompanion toCompanion(bool nullToAbsent) {
    return SelectedQuestionsCompanion(
      certificateTypeId: Value(certificateTypeId),
      questionId: Value(questionId),
    );
  }

  factory SelectedQuestion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SelectedQuestion(
      certificateTypeId: serializer.fromJson<int>(json['certificateTypeId']),
      questionId: serializer.fromJson<int>(json['questionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'certificateTypeId': serializer.toJson<int>(certificateTypeId),
      'questionId': serializer.toJson<int>(questionId),
    };
  }

  SelectedQuestion copyWith({int? certificateTypeId, int? questionId}) =>
      SelectedQuestion(
        certificateTypeId: certificateTypeId ?? this.certificateTypeId,
        questionId: questionId ?? this.questionId,
      );
  SelectedQuestion copyWithCompanion(SelectedQuestionsCompanion data) {
    return SelectedQuestion(
      certificateTypeId: data.certificateTypeId.present
          ? data.certificateTypeId.value
          : this.certificateTypeId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SelectedQuestion(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('questionId: $questionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(certificateTypeId, questionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectedQuestion &&
          other.certificateTypeId == this.certificateTypeId &&
          other.questionId == this.questionId);
}

class SelectedQuestionsCompanion extends UpdateCompanion<SelectedQuestion> {
  final Value<int> certificateTypeId;
  final Value<int> questionId;
  final Value<int> rowid;
  const SelectedQuestionsCompanion({
    this.certificateTypeId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SelectedQuestionsCompanion.insert({
    required int certificateTypeId,
    required int questionId,
    this.rowid = const Value.absent(),
  }) : certificateTypeId = Value(certificateTypeId),
       questionId = Value(questionId);
  static Insertable<SelectedQuestion> custom({
    Expression<int>? certificateTypeId,
    Expression<int>? questionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (certificateTypeId != null) 'certificate_type_id': certificateTypeId,
      if (questionId != null) 'question_id': questionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SelectedQuestionsCompanion copyWith({
    Value<int>? certificateTypeId,
    Value<int>? questionId,
    Value<int>? rowid,
  }) {
    return SelectedQuestionsCompanion(
      certificateTypeId: certificateTypeId ?? this.certificateTypeId,
      questionId: questionId ?? this.questionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (certificateTypeId.present) {
      map['certificate_type_id'] = Variable<int>(certificateTypeId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SelectedQuestionsCompanion(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('questionId: $questionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestAnswersTable extends TestAnswers
    with TableInfo<$TestAnswersTable, TestAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _certificateTypeIdMeta = const VerificationMeta(
    'certificateTypeId',
  );
  @override
  late final GeneratedColumn<int> certificateTypeId = GeneratedColumn<int>(
    'certificate_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedAnswerIdMeta = const VerificationMeta(
    'selectedAnswerId',
  );
  @override
  late final GeneratedColumn<int> selectedAnswerId = GeneratedColumn<int>(
    'selected_answer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    certificateTypeId,
    questionId,
    selectedAnswerId,
    categoryId,
    isCorrect,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestAnswer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('certificate_type_id')) {
      context.handle(
        _certificateTypeIdMeta,
        certificateTypeId.isAcceptableOrUnknown(
          data['certificate_type_id']!,
          _certificateTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_certificateTypeIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_answer_id')) {
      context.handle(
        _selectedAnswerIdMeta,
        selectedAnswerId.isAcceptableOrUnknown(
          data['selected_answer_id']!,
          _selectedAnswerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedAnswerIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {certificateTypeId, questionId},
  ];
  @override
  TestAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestAnswer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      certificateTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}certificate_type_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}question_id'],
      )!,
      selectedAnswerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}selected_answer_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      ),
    );
  }

  @override
  $TestAnswersTable createAlias(String alias) {
    return $TestAnswersTable(attachedDatabase, alias);
  }
}

class TestAnswer extends DataClass implements Insertable<TestAnswer> {
  final int id;
  final int certificateTypeId;
  final int questionId;
  final int selectedAnswerId;
  final int categoryId;
  final bool? isCorrect;
  const TestAnswer({
    required this.id,
    required this.certificateTypeId,
    required this.questionId,
    required this.selectedAnswerId,
    required this.categoryId,
    this.isCorrect,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['certificate_type_id'] = Variable<int>(certificateTypeId);
    map['question_id'] = Variable<int>(questionId);
    map['selected_answer_id'] = Variable<int>(selectedAnswerId);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || isCorrect != null) {
      map['is_correct'] = Variable<bool>(isCorrect);
    }
    return map;
  }

  TestAnswersCompanion toCompanion(bool nullToAbsent) {
    return TestAnswersCompanion(
      id: Value(id),
      certificateTypeId: Value(certificateTypeId),
      questionId: Value(questionId),
      selectedAnswerId: Value(selectedAnswerId),
      categoryId: Value(categoryId),
      isCorrect: isCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(isCorrect),
    );
  }

  factory TestAnswer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestAnswer(
      id: serializer.fromJson<int>(json['id']),
      certificateTypeId: serializer.fromJson<int>(json['certificateTypeId']),
      questionId: serializer.fromJson<int>(json['questionId']),
      selectedAnswerId: serializer.fromJson<int>(json['selectedAnswerId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      isCorrect: serializer.fromJson<bool?>(json['isCorrect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'certificateTypeId': serializer.toJson<int>(certificateTypeId),
      'questionId': serializer.toJson<int>(questionId),
      'selectedAnswerId': serializer.toJson<int>(selectedAnswerId),
      'categoryId': serializer.toJson<int>(categoryId),
      'isCorrect': serializer.toJson<bool?>(isCorrect),
    };
  }

  TestAnswer copyWith({
    int? id,
    int? certificateTypeId,
    int? questionId,
    int? selectedAnswerId,
    int? categoryId,
    Value<bool?> isCorrect = const Value.absent(),
  }) => TestAnswer(
    id: id ?? this.id,
    certificateTypeId: certificateTypeId ?? this.certificateTypeId,
    questionId: questionId ?? this.questionId,
    selectedAnswerId: selectedAnswerId ?? this.selectedAnswerId,
    categoryId: categoryId ?? this.categoryId,
    isCorrect: isCorrect.present ? isCorrect.value : this.isCorrect,
  );
  TestAnswer copyWithCompanion(TestAnswersCompanion data) {
    return TestAnswer(
      id: data.id.present ? data.id.value : this.id,
      certificateTypeId: data.certificateTypeId.present
          ? data.certificateTypeId.value
          : this.certificateTypeId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      selectedAnswerId: data.selectedAnswerId.present
          ? data.selectedAnswerId.value
          : this.selectedAnswerId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestAnswer(')
          ..write('id: $id, ')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedAnswerId: $selectedAnswerId, ')
          ..write('categoryId: $categoryId, ')
          ..write('isCorrect: $isCorrect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    certificateTypeId,
    questionId,
    selectedAnswerId,
    categoryId,
    isCorrect,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestAnswer &&
          other.id == this.id &&
          other.certificateTypeId == this.certificateTypeId &&
          other.questionId == this.questionId &&
          other.selectedAnswerId == this.selectedAnswerId &&
          other.categoryId == this.categoryId &&
          other.isCorrect == this.isCorrect);
}

class TestAnswersCompanion extends UpdateCompanion<TestAnswer> {
  final Value<int> id;
  final Value<int> certificateTypeId;
  final Value<int> questionId;
  final Value<int> selectedAnswerId;
  final Value<int> categoryId;
  final Value<bool?> isCorrect;
  const TestAnswersCompanion({
    this.id = const Value.absent(),
    this.certificateTypeId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedAnswerId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isCorrect = const Value.absent(),
  });
  TestAnswersCompanion.insert({
    this.id = const Value.absent(),
    required int certificateTypeId,
    required int questionId,
    required int selectedAnswerId,
    required int categoryId,
    this.isCorrect = const Value.absent(),
  }) : certificateTypeId = Value(certificateTypeId),
       questionId = Value(questionId),
       selectedAnswerId = Value(selectedAnswerId),
       categoryId = Value(categoryId);
  static Insertable<TestAnswer> custom({
    Expression<int>? id,
    Expression<int>? certificateTypeId,
    Expression<int>? questionId,
    Expression<int>? selectedAnswerId,
    Expression<int>? categoryId,
    Expression<bool>? isCorrect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (certificateTypeId != null) 'certificate_type_id': certificateTypeId,
      if (questionId != null) 'question_id': questionId,
      if (selectedAnswerId != null) 'selected_answer_id': selectedAnswerId,
      if (categoryId != null) 'category_id': categoryId,
      if (isCorrect != null) 'is_correct': isCorrect,
    });
  }

  TestAnswersCompanion copyWith({
    Value<int>? id,
    Value<int>? certificateTypeId,
    Value<int>? questionId,
    Value<int>? selectedAnswerId,
    Value<int>? categoryId,
    Value<bool?>? isCorrect,
  }) {
    return TestAnswersCompanion(
      id: id ?? this.id,
      certificateTypeId: certificateTypeId ?? this.certificateTypeId,
      questionId: questionId ?? this.questionId,
      selectedAnswerId: selectedAnswerId ?? this.selectedAnswerId,
      categoryId: categoryId ?? this.categoryId,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (certificateTypeId.present) {
      map['certificate_type_id'] = Variable<int>(certificateTypeId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (selectedAnswerId.present) {
      map['selected_answer_id'] = Variable<int>(selectedAnswerId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestAnswersCompanion(')
          ..write('id: $id, ')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedAnswerId: $selectedAnswerId, ')
          ..write('categoryId: $categoryId, ')
          ..write('isCorrect: $isCorrect')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $SelectedQuestionsTable selectedQuestions =
      $SelectedQuestionsTable(this);
  late final $TestAnswersTable testAnswers = $TestAnswersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    appSettings,
    selectedQuestions,
    testAnswers,
  ];
}

typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> certificateTypeId,
      Value<bool> mixAnswers,
      Value<bool> mixQuestions,
      Value<bool> buttonHint,
      Value<String> title,
      Value<String> image,
      Value<Set<int>> selectedCategoryIds,
      Value<String> testMode,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> certificateTypeId,
      Value<bool> mixAnswers,
      Value<bool> mixQuestions,
      Value<bool> buttonHint,
      Value<String> title,
      Value<String> image,
      Value<Set<int>> selectedCategoryIds,
      Value<String> testMode,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDb, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mixAnswers => $composableBuilder(
    column: $table.mixAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mixQuestions => $composableBuilder(
    column: $table.mixQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get buttonHint => $composableBuilder(
    column: $table.buttonHint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Set<int>, Set<int>, String>
  get selectedCategoryIds => $composableBuilder(
    column: $table.selectedCategoryIds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get testMode => $composableBuilder(
    column: $table.testMode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDb, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mixAnswers => $composableBuilder(
    column: $table.mixAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mixQuestions => $composableBuilder(
    column: $table.mixQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get buttonHint => $composableBuilder(
    column: $table.buttonHint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedCategoryIds => $composableBuilder(
    column: $table.selectedCategoryIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testMode => $composableBuilder(
    column: $table.testMode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDb, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get mixAnswers => $composableBuilder(
    column: $table.mixAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get mixQuestions => $composableBuilder(
    column: $table.mixQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get buttonHint => $composableBuilder(
    column: $table.buttonHint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Set<int>, String> get selectedCategoryIds =>
      $composableBuilder(
        column: $table.selectedCategoryIds,
        builder: (column) => column,
      );

  GeneratedColumn<String> get testMode =>
      $composableBuilder(column: $table.testMode, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (AppSetting, BaseReferences<_$AppDb, $AppSettingsTable, AppSetting>),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDb db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> certificateTypeId = const Value.absent(),
                Value<bool> mixAnswers = const Value.absent(),
                Value<bool> mixQuestions = const Value.absent(),
                Value<bool> buttonHint = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<Set<int>> selectedCategoryIds = const Value.absent(),
                Value<String> testMode = const Value.absent(),
              }) => AppSettingsCompanion(
                certificateTypeId: certificateTypeId,
                mixAnswers: mixAnswers,
                mixQuestions: mixQuestions,
                buttonHint: buttonHint,
                title: title,
                image: image,
                selectedCategoryIds: selectedCategoryIds,
                testMode: testMode,
              ),
          createCompanionCallback:
              ({
                Value<int> certificateTypeId = const Value.absent(),
                Value<bool> mixAnswers = const Value.absent(),
                Value<bool> mixQuestions = const Value.absent(),
                Value<bool> buttonHint = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<Set<int>> selectedCategoryIds = const Value.absent(),
                Value<String> testMode = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                certificateTypeId: certificateTypeId,
                mixAnswers: mixAnswers,
                mixQuestions: mixQuestions,
                buttonHint: buttonHint,
                title: title,
                image: image,
                selectedCategoryIds: selectedCategoryIds,
                testMode: testMode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (AppSetting, BaseReferences<_$AppDb, $AppSettingsTable, AppSetting>),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$SelectedQuestionsTableCreateCompanionBuilder =
    SelectedQuestionsCompanion Function({
      required int certificateTypeId,
      required int questionId,
      Value<int> rowid,
    });
typedef $$SelectedQuestionsTableUpdateCompanionBuilder =
    SelectedQuestionsCompanion Function({
      Value<int> certificateTypeId,
      Value<int> questionId,
      Value<int> rowid,
    });

class $$SelectedQuestionsTableFilterComposer
    extends Composer<_$AppDb, $SelectedQuestionsTable> {
  $$SelectedQuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SelectedQuestionsTableOrderingComposer
    extends Composer<_$AppDb, $SelectedQuestionsTable> {
  $$SelectedQuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SelectedQuestionsTableAnnotationComposer
    extends Composer<_$AppDb, $SelectedQuestionsTable> {
  $$SelectedQuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );
}

class $$SelectedQuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SelectedQuestionsTable,
          SelectedQuestion,
          $$SelectedQuestionsTableFilterComposer,
          $$SelectedQuestionsTableOrderingComposer,
          $$SelectedQuestionsTableAnnotationComposer,
          $$SelectedQuestionsTableCreateCompanionBuilder,
          $$SelectedQuestionsTableUpdateCompanionBuilder,
          (
            SelectedQuestion,
            BaseReferences<_$AppDb, $SelectedQuestionsTable, SelectedQuestion>,
          ),
          SelectedQuestion,
          PrefetchHooks Function()
        > {
  $$SelectedQuestionsTableTableManager(
    _$AppDb db,
    $SelectedQuestionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SelectedQuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SelectedQuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SelectedQuestionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> certificateTypeId = const Value.absent(),
                Value<int> questionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SelectedQuestionsCompanion(
                certificateTypeId: certificateTypeId,
                questionId: questionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int certificateTypeId,
                required int questionId,
                Value<int> rowid = const Value.absent(),
              }) => SelectedQuestionsCompanion.insert(
                certificateTypeId: certificateTypeId,
                questionId: questionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SelectedQuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SelectedQuestionsTable,
      SelectedQuestion,
      $$SelectedQuestionsTableFilterComposer,
      $$SelectedQuestionsTableOrderingComposer,
      $$SelectedQuestionsTableAnnotationComposer,
      $$SelectedQuestionsTableCreateCompanionBuilder,
      $$SelectedQuestionsTableUpdateCompanionBuilder,
      (
        SelectedQuestion,
        BaseReferences<_$AppDb, $SelectedQuestionsTable, SelectedQuestion>,
      ),
      SelectedQuestion,
      PrefetchHooks Function()
    >;
typedef $$TestAnswersTableCreateCompanionBuilder =
    TestAnswersCompanion Function({
      Value<int> id,
      required int certificateTypeId,
      required int questionId,
      required int selectedAnswerId,
      required int categoryId,
      Value<bool?> isCorrect,
    });
typedef $$TestAnswersTableUpdateCompanionBuilder =
    TestAnswersCompanion Function({
      Value<int> id,
      Value<int> certificateTypeId,
      Value<int> questionId,
      Value<int> selectedAnswerId,
      Value<int> categoryId,
      Value<bool?> isCorrect,
    });

class $$TestAnswersTableFilterComposer
    extends Composer<_$AppDb, $TestAnswersTable> {
  $$TestAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get selectedAnswerId => $composableBuilder(
    column: $table.selectedAnswerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TestAnswersTableOrderingComposer
    extends Composer<_$AppDb, $TestAnswersTable> {
  $$TestAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get selectedAnswerId => $composableBuilder(
    column: $table.selectedAnswerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TestAnswersTableAnnotationComposer
    extends Composer<_$AppDb, $TestAnswersTable> {
  $$TestAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get certificateTypeId => $composableBuilder(
    column: $table.certificateTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get selectedAnswerId => $composableBuilder(
    column: $table.selectedAnswerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);
}

class $$TestAnswersTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $TestAnswersTable,
          TestAnswer,
          $$TestAnswersTableFilterComposer,
          $$TestAnswersTableOrderingComposer,
          $$TestAnswersTableAnnotationComposer,
          $$TestAnswersTableCreateCompanionBuilder,
          $$TestAnswersTableUpdateCompanionBuilder,
          (TestAnswer, BaseReferences<_$AppDb, $TestAnswersTable, TestAnswer>),
          TestAnswer,
          PrefetchHooks Function()
        > {
  $$TestAnswersTableTableManager(_$AppDb db, $TestAnswersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> certificateTypeId = const Value.absent(),
                Value<int> questionId = const Value.absent(),
                Value<int> selectedAnswerId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<bool?> isCorrect = const Value.absent(),
              }) => TestAnswersCompanion(
                id: id,
                certificateTypeId: certificateTypeId,
                questionId: questionId,
                selectedAnswerId: selectedAnswerId,
                categoryId: categoryId,
                isCorrect: isCorrect,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int certificateTypeId,
                required int questionId,
                required int selectedAnswerId,
                required int categoryId,
                Value<bool?> isCorrect = const Value.absent(),
              }) => TestAnswersCompanion.insert(
                id: id,
                certificateTypeId: certificateTypeId,
                questionId: questionId,
                selectedAnswerId: selectedAnswerId,
                categoryId: categoryId,
                isCorrect: isCorrect,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TestAnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $TestAnswersTable,
      TestAnswer,
      $$TestAnswersTableFilterComposer,
      $$TestAnswersTableOrderingComposer,
      $$TestAnswersTableAnnotationComposer,
      $$TestAnswersTableCreateCompanionBuilder,
      $$TestAnswersTableUpdateCompanionBuilder,
      (TestAnswer, BaseReferences<_$AppDb, $TestAnswersTable, TestAnswer>),
      TestAnswer,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$SelectedQuestionsTableTableManager get selectedQuestions =>
      $$SelectedQuestionsTableTableManager(_db, _db.selectedQuestions);
  $$TestAnswersTableTableManager get testAnswers =>
      $$TestAnswersTableTableManager(_db, _db.testAnswers);
}
