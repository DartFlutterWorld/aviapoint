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
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String>
  selectedCategoryIds = GeneratedColumn<String>(
    'selected_category_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  ).withConverter<List<int>>($AppSettingsTable.$converterselectedCategoryIds);
  @override
  List<GeneratedColumn> get $columns => [
    certificateTypeId,
    mixAnswers,
    buttonHint,
    selectedCategoryIds,
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
    if (data.containsKey('button_hint')) {
      context.handle(
        _buttonHintMeta,
        buttonHint.isAcceptableOrUnknown(data['button_hint']!, _buttonHintMeta),
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
      buttonHint: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}button_hint'],
      )!,
      selectedCategoryIds: $AppSettingsTable.$converterselectedCategoryIds
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}selected_category_ids'],
            )!,
          ),
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converterselectedCategoryIds =
      const IntListJson();
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int certificateTypeId;
  final bool mixAnswers;
  final bool buttonHint;
  final List<int> selectedCategoryIds;
  const AppSetting({
    required this.certificateTypeId,
    required this.mixAnswers,
    required this.buttonHint,
    required this.selectedCategoryIds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['certificate_type_id'] = Variable<int>(certificateTypeId);
    map['mix_answers'] = Variable<bool>(mixAnswers);
    map['button_hint'] = Variable<bool>(buttonHint);
    {
      map['selected_category_ids'] = Variable<String>(
        $AppSettingsTable.$converterselectedCategoryIds.toSql(
          selectedCategoryIds,
        ),
      );
    }
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      certificateTypeId: Value(certificateTypeId),
      mixAnswers: Value(mixAnswers),
      buttonHint: Value(buttonHint),
      selectedCategoryIds: Value(selectedCategoryIds),
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
      buttonHint: serializer.fromJson<bool>(json['buttonHint']),
      selectedCategoryIds: serializer.fromJson<List<int>>(
        json['selectedCategoryIds'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'certificateTypeId': serializer.toJson<int>(certificateTypeId),
      'mixAnswers': serializer.toJson<bool>(mixAnswers),
      'buttonHint': serializer.toJson<bool>(buttonHint),
      'selectedCategoryIds': serializer.toJson<List<int>>(selectedCategoryIds),
    };
  }

  AppSetting copyWith({
    int? certificateTypeId,
    bool? mixAnswers,
    bool? buttonHint,
    List<int>? selectedCategoryIds,
  }) => AppSetting(
    certificateTypeId: certificateTypeId ?? this.certificateTypeId,
    mixAnswers: mixAnswers ?? this.mixAnswers,
    buttonHint: buttonHint ?? this.buttonHint,
    selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      certificateTypeId: data.certificateTypeId.present
          ? data.certificateTypeId.value
          : this.certificateTypeId,
      mixAnswers: data.mixAnswers.present
          ? data.mixAnswers.value
          : this.mixAnswers,
      buttonHint: data.buttonHint.present
          ? data.buttonHint.value
          : this.buttonHint,
      selectedCategoryIds: data.selectedCategoryIds.present
          ? data.selectedCategoryIds.value
          : this.selectedCategoryIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('mixAnswers: $mixAnswers, ')
          ..write('buttonHint: $buttonHint, ')
          ..write('selectedCategoryIds: $selectedCategoryIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    certificateTypeId,
    mixAnswers,
    buttonHint,
    selectedCategoryIds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.certificateTypeId == this.certificateTypeId &&
          other.mixAnswers == this.mixAnswers &&
          other.buttonHint == this.buttonHint &&
          other.selectedCategoryIds == this.selectedCategoryIds);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> certificateTypeId;
  final Value<bool> mixAnswers;
  final Value<bool> buttonHint;
  final Value<List<int>> selectedCategoryIds;
  const AppSettingsCompanion({
    this.certificateTypeId = const Value.absent(),
    this.mixAnswers = const Value.absent(),
    this.buttonHint = const Value.absent(),
    this.selectedCategoryIds = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.certificateTypeId = const Value.absent(),
    this.mixAnswers = const Value.absent(),
    this.buttonHint = const Value.absent(),
    this.selectedCategoryIds = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? certificateTypeId,
    Expression<bool>? mixAnswers,
    Expression<bool>? buttonHint,
    Expression<String>? selectedCategoryIds,
  }) {
    return RawValuesInsertable({
      if (certificateTypeId != null) 'certificate_type_id': certificateTypeId,
      if (mixAnswers != null) 'mix_answers': mixAnswers,
      if (buttonHint != null) 'button_hint': buttonHint,
      if (selectedCategoryIds != null)
        'selected_category_ids': selectedCategoryIds,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? certificateTypeId,
    Value<bool>? mixAnswers,
    Value<bool>? buttonHint,
    Value<List<int>>? selectedCategoryIds,
  }) {
    return AppSettingsCompanion(
      certificateTypeId: certificateTypeId ?? this.certificateTypeId,
      mixAnswers: mixAnswers ?? this.mixAnswers,
      buttonHint: buttonHint ?? this.buttonHint,
      selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
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
    if (buttonHint.present) {
      map['button_hint'] = Variable<bool>(buttonHint.value);
    }
    if (selectedCategoryIds.present) {
      map['selected_category_ids'] = Variable<String>(
        $AppSettingsTable.$converterselectedCategoryIds.toSql(
          selectedCategoryIds.value,
        ),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('mixAnswers: $mixAnswers, ')
          ..write('buttonHint: $buttonHint, ')
          ..write('selectedCategoryIds: $selectedCategoryIds')
          ..write(')'))
        .toString();
  }
}

class $UserAnswersTable extends UserAnswers
    with TableInfo<$UserAnswersTable, UserAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAnswersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _selectedAnswerIdsJsonMeta =
      const VerificationMeta('selectedAnswerIdsJson');
  @override
  late final GeneratedColumn<String> selectedAnswerIdsJson =
      GeneratedColumn<String>(
        'selected_answer_ids_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
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
    certificateTypeId,
    categoryId,
    questionId,
    selectedAnswerIdsJson,
    isCorrect,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserAnswer> instance, {
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
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_answer_ids_json')) {
      context.handle(
        _selectedAnswerIdsJsonMeta,
        selectedAnswerIdsJson.isAcceptableOrUnknown(
          data['selected_answer_ids_json']!,
          _selectedAnswerIdsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedAnswerIdsJsonMeta);
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAnswer(
      certificateTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}certificate_type_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}question_id'],
      )!,
      selectedAnswerIdsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_answer_ids_json'],
      )!,
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      ),
    );
  }

  @override
  $UserAnswersTable createAlias(String alias) {
    return $UserAnswersTable(attachedDatabase, alias);
  }
}

class UserAnswer extends DataClass implements Insertable<UserAnswer> {
  final int certificateTypeId;
  final int categoryId;
  final int questionId;
  final String selectedAnswerIdsJson;
  final bool? isCorrect;
  const UserAnswer({
    required this.certificateTypeId,
    required this.categoryId,
    required this.questionId,
    required this.selectedAnswerIdsJson,
    this.isCorrect,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['certificate_type_id'] = Variable<int>(certificateTypeId);
    map['category_id'] = Variable<int>(categoryId);
    map['question_id'] = Variable<int>(questionId);
    map['selected_answer_ids_json'] = Variable<String>(selectedAnswerIdsJson);
    if (!nullToAbsent || isCorrect != null) {
      map['is_correct'] = Variable<bool>(isCorrect);
    }
    return map;
  }

  UserAnswersCompanion toCompanion(bool nullToAbsent) {
    return UserAnswersCompanion(
      certificateTypeId: Value(certificateTypeId),
      categoryId: Value(categoryId),
      questionId: Value(questionId),
      selectedAnswerIdsJson: Value(selectedAnswerIdsJson),
      isCorrect: isCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(isCorrect),
    );
  }

  factory UserAnswer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAnswer(
      certificateTypeId: serializer.fromJson<int>(json['certificateTypeId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      questionId: serializer.fromJson<int>(json['questionId']),
      selectedAnswerIdsJson: serializer.fromJson<String>(
        json['selectedAnswerIdsJson'],
      ),
      isCorrect: serializer.fromJson<bool?>(json['isCorrect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'certificateTypeId': serializer.toJson<int>(certificateTypeId),
      'categoryId': serializer.toJson<int>(categoryId),
      'questionId': serializer.toJson<int>(questionId),
      'selectedAnswerIdsJson': serializer.toJson<String>(selectedAnswerIdsJson),
      'isCorrect': serializer.toJson<bool?>(isCorrect),
    };
  }

  UserAnswer copyWith({
    int? certificateTypeId,
    int? categoryId,
    int? questionId,
    String? selectedAnswerIdsJson,
    Value<bool?> isCorrect = const Value.absent(),
  }) => UserAnswer(
    certificateTypeId: certificateTypeId ?? this.certificateTypeId,
    categoryId: categoryId ?? this.categoryId,
    questionId: questionId ?? this.questionId,
    selectedAnswerIdsJson: selectedAnswerIdsJson ?? this.selectedAnswerIdsJson,
    isCorrect: isCorrect.present ? isCorrect.value : this.isCorrect,
  );
  UserAnswer copyWithCompanion(UserAnswersCompanion data) {
    return UserAnswer(
      certificateTypeId: data.certificateTypeId.present
          ? data.certificateTypeId.value
          : this.certificateTypeId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      selectedAnswerIdsJson: data.selectedAnswerIdsJson.present
          ? data.selectedAnswerIdsJson.value
          : this.selectedAnswerIdsJson,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAnswer(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('categoryId: $categoryId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedAnswerIdsJson: $selectedAnswerIdsJson, ')
          ..write('isCorrect: $isCorrect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    certificateTypeId,
    categoryId,
    questionId,
    selectedAnswerIdsJson,
    isCorrect,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAnswer &&
          other.certificateTypeId == this.certificateTypeId &&
          other.categoryId == this.categoryId &&
          other.questionId == this.questionId &&
          other.selectedAnswerIdsJson == this.selectedAnswerIdsJson &&
          other.isCorrect == this.isCorrect);
}

class UserAnswersCompanion extends UpdateCompanion<UserAnswer> {
  final Value<int> certificateTypeId;
  final Value<int> categoryId;
  final Value<int> questionId;
  final Value<String> selectedAnswerIdsJson;
  final Value<bool?> isCorrect;
  final Value<int> rowid;
  const UserAnswersCompanion({
    this.certificateTypeId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedAnswerIdsJson = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAnswersCompanion.insert({
    required int certificateTypeId,
    required int categoryId,
    required int questionId,
    required String selectedAnswerIdsJson,
    this.isCorrect = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : certificateTypeId = Value(certificateTypeId),
       categoryId = Value(categoryId),
       questionId = Value(questionId),
       selectedAnswerIdsJson = Value(selectedAnswerIdsJson);
  static Insertable<UserAnswer> custom({
    Expression<int>? certificateTypeId,
    Expression<int>? categoryId,
    Expression<int>? questionId,
    Expression<String>? selectedAnswerIdsJson,
    Expression<bool>? isCorrect,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (certificateTypeId != null) 'certificate_type_id': certificateTypeId,
      if (categoryId != null) 'category_id': categoryId,
      if (questionId != null) 'question_id': questionId,
      if (selectedAnswerIdsJson != null)
        'selected_answer_ids_json': selectedAnswerIdsJson,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAnswersCompanion copyWith({
    Value<int>? certificateTypeId,
    Value<int>? categoryId,
    Value<int>? questionId,
    Value<String>? selectedAnswerIdsJson,
    Value<bool?>? isCorrect,
    Value<int>? rowid,
  }) {
    return UserAnswersCompanion(
      certificateTypeId: certificateTypeId ?? this.certificateTypeId,
      categoryId: categoryId ?? this.categoryId,
      questionId: questionId ?? this.questionId,
      selectedAnswerIdsJson:
          selectedAnswerIdsJson ?? this.selectedAnswerIdsJson,
      isCorrect: isCorrect ?? this.isCorrect,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (certificateTypeId.present) {
      map['certificate_type_id'] = Variable<int>(certificateTypeId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (selectedAnswerIdsJson.present) {
      map['selected_answer_ids_json'] = Variable<String>(
        selectedAnswerIdsJson.value,
      );
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAnswersCompanion(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('categoryId: $categoryId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedAnswerIdsJson: $selectedAnswerIdsJson, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $UserAnswersTable userAnswers = $UserAnswersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    appSettings,
    userAnswers,
  ];
}

typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> certificateTypeId,
      Value<bool> mixAnswers,
      Value<bool> buttonHint,
      Value<List<int>> selectedCategoryIds,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> certificateTypeId,
      Value<bool> mixAnswers,
      Value<bool> buttonHint,
      Value<List<int>> selectedCategoryIds,
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

  ColumnFilters<bool> get buttonHint => $composableBuilder(
    column: $table.buttonHint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
  get selectedCategoryIds => $composableBuilder(
    column: $table.selectedCategoryIds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  ColumnOrderings<bool> get buttonHint => $composableBuilder(
    column: $table.buttonHint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedCategoryIds => $composableBuilder(
    column: $table.selectedCategoryIds,
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

  GeneratedColumn<bool> get buttonHint => $composableBuilder(
    column: $table.buttonHint,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<int>, String> get selectedCategoryIds =>
      $composableBuilder(
        column: $table.selectedCategoryIds,
        builder: (column) => column,
      );
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
                Value<bool> buttonHint = const Value.absent(),
                Value<List<int>> selectedCategoryIds = const Value.absent(),
              }) => AppSettingsCompanion(
                certificateTypeId: certificateTypeId,
                mixAnswers: mixAnswers,
                buttonHint: buttonHint,
                selectedCategoryIds: selectedCategoryIds,
              ),
          createCompanionCallback:
              ({
                Value<int> certificateTypeId = const Value.absent(),
                Value<bool> mixAnswers = const Value.absent(),
                Value<bool> buttonHint = const Value.absent(),
                Value<List<int>> selectedCategoryIds = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                certificateTypeId: certificateTypeId,
                mixAnswers: mixAnswers,
                buttonHint: buttonHint,
                selectedCategoryIds: selectedCategoryIds,
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
typedef $$UserAnswersTableCreateCompanionBuilder =
    UserAnswersCompanion Function({
      required int certificateTypeId,
      required int categoryId,
      required int questionId,
      required String selectedAnswerIdsJson,
      Value<bool?> isCorrect,
      Value<int> rowid,
    });
typedef $$UserAnswersTableUpdateCompanionBuilder =
    UserAnswersCompanion Function({
      Value<int> certificateTypeId,
      Value<int> categoryId,
      Value<int> questionId,
      Value<String> selectedAnswerIdsJson,
      Value<bool?> isCorrect,
      Value<int> rowid,
    });

class $$UserAnswersTableFilterComposer
    extends Composer<_$AppDb, $UserAnswersTable> {
  $$UserAnswersTableFilterComposer({
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

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedAnswerIdsJson => $composableBuilder(
    column: $table.selectedAnswerIdsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserAnswersTableOrderingComposer
    extends Composer<_$AppDb, $UserAnswersTable> {
  $$UserAnswersTableOrderingComposer({
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

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedAnswerIdsJson => $composableBuilder(
    column: $table.selectedAnswerIdsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserAnswersTableAnnotationComposer
    extends Composer<_$AppDb, $UserAnswersTable> {
  $$UserAnswersTableAnnotationComposer({
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

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedAnswerIdsJson => $composableBuilder(
    column: $table.selectedAnswerIdsJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);
}

class $$UserAnswersTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UserAnswersTable,
          UserAnswer,
          $$UserAnswersTableFilterComposer,
          $$UserAnswersTableOrderingComposer,
          $$UserAnswersTableAnnotationComposer,
          $$UserAnswersTableCreateCompanionBuilder,
          $$UserAnswersTableUpdateCompanionBuilder,
          (UserAnswer, BaseReferences<_$AppDb, $UserAnswersTable, UserAnswer>),
          UserAnswer,
          PrefetchHooks Function()
        > {
  $$UserAnswersTableTableManager(_$AppDb db, $UserAnswersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> certificateTypeId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> questionId = const Value.absent(),
                Value<String> selectedAnswerIdsJson = const Value.absent(),
                Value<bool?> isCorrect = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserAnswersCompanion(
                certificateTypeId: certificateTypeId,
                categoryId: categoryId,
                questionId: questionId,
                selectedAnswerIdsJson: selectedAnswerIdsJson,
                isCorrect: isCorrect,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int certificateTypeId,
                required int categoryId,
                required int questionId,
                required String selectedAnswerIdsJson,
                Value<bool?> isCorrect = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserAnswersCompanion.insert(
                certificateTypeId: certificateTypeId,
                categoryId: categoryId,
                questionId: questionId,
                selectedAnswerIdsJson: selectedAnswerIdsJson,
                isCorrect: isCorrect,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserAnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UserAnswersTable,
      UserAnswer,
      $$UserAnswersTableFilterComposer,
      $$UserAnswersTableOrderingComposer,
      $$UserAnswersTableAnnotationComposer,
      $$UserAnswersTableCreateCompanionBuilder,
      $$UserAnswersTableUpdateCompanionBuilder,
      (UserAnswer, BaseReferences<_$AppDb, $UserAnswersTable, UserAnswer>),
      UserAnswer,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$UserAnswersTableTableManager get userAnswers =>
      $$UserAnswersTableTableManager(_db, _db.userAnswers);
}
