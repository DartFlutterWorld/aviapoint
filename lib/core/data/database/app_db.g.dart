// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _mixAnswersMeta =
      const VerificationMeta('mixAnswers');
  @override
  late final GeneratedColumn<bool> mixAnswers = GeneratedColumn<bool>(
      'mix_answers', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("mix_answers" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _buttonHintMeta =
      const VerificationMeta('buttonHint');
  @override
  late final GeneratedColumn<bool> buttonHint = GeneratedColumn<bool>(
      'button_hint', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("button_hint" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, mixAnswers, buttonHint, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mix_answers')) {
      context.handle(
          _mixAnswersMeta,
          mixAnswers.isAcceptableOrUnknown(
              data['mix_answers']!, _mixAnswersMeta));
    }
    if (data.containsKey('button_hint')) {
      context.handle(
          _buttonHintMeta,
          buttonHint.isAcceptableOrUnknown(
              data['button_hint']!, _buttonHintMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mixAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mix_answers'])!,
      buttonHint: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}button_hint'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final bool mixAnswers;
  final bool buttonHint;
  final DateTime updatedAt;
  const AppSetting(
      {required this.id,
      required this.mixAnswers,
      required this.buttonHint,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mix_answers'] = Variable<bool>(mixAnswers);
    map['button_hint'] = Variable<bool>(buttonHint);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      mixAnswers: Value(mixAnswers),
      buttonHint: Value(buttonHint),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      mixAnswers: serializer.fromJson<bool>(json['mixAnswers']),
      buttonHint: serializer.fromJson<bool>(json['buttonHint']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mixAnswers': serializer.toJson<bool>(mixAnswers),
      'buttonHint': serializer.toJson<bool>(buttonHint),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith(
          {int? id, bool? mixAnswers, bool? buttonHint, DateTime? updatedAt}) =>
      AppSetting(
        id: id ?? this.id,
        mixAnswers: mixAnswers ?? this.mixAnswers,
        buttonHint: buttonHint ?? this.buttonHint,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      mixAnswers:
          data.mixAnswers.present ? data.mixAnswers.value : this.mixAnswers,
      buttonHint:
          data.buttonHint.present ? data.buttonHint.value : this.buttonHint,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('mixAnswers: $mixAnswers, ')
          ..write('buttonHint: $buttonHint, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mixAnswers, buttonHint, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.mixAnswers == this.mixAnswers &&
          other.buttonHint == this.buttonHint &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<bool> mixAnswers;
  final Value<bool> buttonHint;
  final Value<DateTime> updatedAt;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.mixAnswers = const Value.absent(),
    this.buttonHint = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.mixAnswers = const Value.absent(),
    this.buttonHint = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<bool>? mixAnswers,
    Expression<bool>? buttonHint,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mixAnswers != null) 'mix_answers': mixAnswers,
      if (buttonHint != null) 'button_hint': buttonHint,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<int>? id,
      Value<bool>? mixAnswers,
      Value<bool>? buttonHint,
      Value<DateTime>? updatedAt}) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      mixAnswers: mixAnswers ?? this.mixAnswers,
      buttonHint: buttonHint ?? this.buttonHint,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mixAnswers.present) {
      map['mix_answers'] = Variable<bool>(mixAnswers.value);
    }
    if (buttonHint.present) {
      map['button_hint'] = Variable<bool>(buttonHint.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('mixAnswers: $mixAnswers, ')
          ..write('buttonHint: $buttonHint, ')
          ..write('updatedAt: $updatedAt')
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
  static const VerificationMeta _certificateTypeIdMeta =
      const VerificationMeta('certificateTypeId');
  @override
  late final GeneratedColumn<int> certificateTypeId = GeneratedColumn<int>(
      'certificate_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
      'question_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _selectedAnswerIdsJsonMeta =
      const VerificationMeta('selectedAnswerIdsJson');
  @override
  late final GeneratedColumn<String> selectedAnswerIdsJson =
      GeneratedColumn<String>('selected_answer_ids_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
      'is_correct', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_correct" IN (0, 1))'));
  static const VerificationMeta _timeSpentSecMeta =
      const VerificationMeta('timeSpentSec');
  @override
  late final GeneratedColumn<int> timeSpentSec = GeneratedColumn<int>(
      'time_spent_sec', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        certificateTypeId,
        categoryId,
        questionId,
        selectedAnswerIdsJson,
        isCorrect,
        timeSpentSec,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_answers';
  @override
  VerificationContext validateIntegrity(Insertable<UserAnswer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('certificate_type_id')) {
      context.handle(
          _certificateTypeIdMeta,
          certificateTypeId.isAcceptableOrUnknown(
              data['certificate_type_id']!, _certificateTypeIdMeta));
    } else if (isInserting) {
      context.missing(_certificateTypeIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_answer_ids_json')) {
      context.handle(
          _selectedAnswerIdsJsonMeta,
          selectedAnswerIdsJson.isAcceptableOrUnknown(
              data['selected_answer_ids_json']!, _selectedAnswerIdsJsonMeta));
    } else if (isInserting) {
      context.missing(_selectedAnswerIdsJsonMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    }
    if (data.containsKey('time_spent_sec')) {
      context.handle(
          _timeSpentSecMeta,
          timeSpentSec.isAcceptableOrUnknown(
              data['time_spent_sec']!, _timeSpentSecMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {certificateTypeId, questionId};
  @override
  UserAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAnswer(
      certificateTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}certificate_type_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}question_id'])!,
      selectedAnswerIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}selected_answer_ids_json'])!,
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct']),
      timeSpentSec: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_spent_sec'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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
  final int timeSpentSec;
  final DateTime updatedAt;
  const UserAnswer(
      {required this.certificateTypeId,
      required this.categoryId,
      required this.questionId,
      required this.selectedAnswerIdsJson,
      this.isCorrect,
      required this.timeSpentSec,
      required this.updatedAt});
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
    map['time_spent_sec'] = Variable<int>(timeSpentSec);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      timeSpentSec: Value(timeSpentSec),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserAnswer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAnswer(
      certificateTypeId: serializer.fromJson<int>(json['certificateTypeId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      questionId: serializer.fromJson<int>(json['questionId']),
      selectedAnswerIdsJson:
          serializer.fromJson<String>(json['selectedAnswerIdsJson']),
      isCorrect: serializer.fromJson<bool?>(json['isCorrect']),
      timeSpentSec: serializer.fromJson<int>(json['timeSpentSec']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'timeSpentSec': serializer.toJson<int>(timeSpentSec),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserAnswer copyWith(
          {int? certificateTypeId,
          int? categoryId,
          int? questionId,
          String? selectedAnswerIdsJson,
          Value<bool?> isCorrect = const Value.absent(),
          int? timeSpentSec,
          DateTime? updatedAt}) =>
      UserAnswer(
        certificateTypeId: certificateTypeId ?? this.certificateTypeId,
        categoryId: categoryId ?? this.categoryId,
        questionId: questionId ?? this.questionId,
        selectedAnswerIdsJson:
            selectedAnswerIdsJson ?? this.selectedAnswerIdsJson,
        isCorrect: isCorrect.present ? isCorrect.value : this.isCorrect,
        timeSpentSec: timeSpentSec ?? this.timeSpentSec,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserAnswer copyWithCompanion(UserAnswersCompanion data) {
    return UserAnswer(
      certificateTypeId: data.certificateTypeId.present
          ? data.certificateTypeId.value
          : this.certificateTypeId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
      selectedAnswerIdsJson: data.selectedAnswerIdsJson.present
          ? data.selectedAnswerIdsJson.value
          : this.selectedAnswerIdsJson,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      timeSpentSec: data.timeSpentSec.present
          ? data.timeSpentSec.value
          : this.timeSpentSec,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAnswer(')
          ..write('certificateTypeId: $certificateTypeId, ')
          ..write('categoryId: $categoryId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedAnswerIdsJson: $selectedAnswerIdsJson, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('timeSpentSec: $timeSpentSec, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(certificateTypeId, categoryId, questionId,
      selectedAnswerIdsJson, isCorrect, timeSpentSec, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAnswer &&
          other.certificateTypeId == this.certificateTypeId &&
          other.categoryId == this.categoryId &&
          other.questionId == this.questionId &&
          other.selectedAnswerIdsJson == this.selectedAnswerIdsJson &&
          other.isCorrect == this.isCorrect &&
          other.timeSpentSec == this.timeSpentSec &&
          other.updatedAt == this.updatedAt);
}

class UserAnswersCompanion extends UpdateCompanion<UserAnswer> {
  final Value<int> certificateTypeId;
  final Value<int> categoryId;
  final Value<int> questionId;
  final Value<String> selectedAnswerIdsJson;
  final Value<bool?> isCorrect;
  final Value<int> timeSpentSec;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserAnswersCompanion({
    this.certificateTypeId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedAnswerIdsJson = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.timeSpentSec = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAnswersCompanion.insert({
    required int certificateTypeId,
    required int categoryId,
    required int questionId,
    required String selectedAnswerIdsJson,
    this.isCorrect = const Value.absent(),
    this.timeSpentSec = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : certificateTypeId = Value(certificateTypeId),
        categoryId = Value(categoryId),
        questionId = Value(questionId),
        selectedAnswerIdsJson = Value(selectedAnswerIdsJson);
  static Insertable<UserAnswer> custom({
    Expression<int>? certificateTypeId,
    Expression<int>? categoryId,
    Expression<int>? questionId,
    Expression<String>? selectedAnswerIdsJson,
    Expression<bool>? isCorrect,
    Expression<int>? timeSpentSec,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (certificateTypeId != null) 'certificate_type_id': certificateTypeId,
      if (categoryId != null) 'category_id': categoryId,
      if (questionId != null) 'question_id': questionId,
      if (selectedAnswerIdsJson != null)
        'selected_answer_ids_json': selectedAnswerIdsJson,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (timeSpentSec != null) 'time_spent_sec': timeSpentSec,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAnswersCompanion copyWith(
      {Value<int>? certificateTypeId,
      Value<int>? categoryId,
      Value<int>? questionId,
      Value<String>? selectedAnswerIdsJson,
      Value<bool?>? isCorrect,
      Value<int>? timeSpentSec,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return UserAnswersCompanion(
      certificateTypeId: certificateTypeId ?? this.certificateTypeId,
      categoryId: categoryId ?? this.categoryId,
      questionId: questionId ?? this.questionId,
      selectedAnswerIdsJson:
          selectedAnswerIdsJson ?? this.selectedAnswerIdsJson,
      isCorrect: isCorrect ?? this.isCorrect,
      timeSpentSec: timeSpentSec ?? this.timeSpentSec,
      updatedAt: updatedAt ?? this.updatedAt,
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
      map['selected_answer_ids_json'] =
          Variable<String>(selectedAnswerIdsJson.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (timeSpentSec.present) {
      map['time_spent_sec'] = Variable<int>(timeSpentSec.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('timeSpentSec: $timeSpentSec, ')
          ..write('updatedAt: $updatedAt, ')
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
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [appSettings, userAnswers];
}

typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<bool> mixAnswers,
  Value<bool> buttonHint,
  Value<DateTime> updatedAt,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<bool> mixAnswers,
  Value<bool> buttonHint,
  Value<DateTime> updatedAt,
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
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get mixAnswers => $composableBuilder(
      column: $table.mixAnswers, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get buttonHint => $composableBuilder(
      column: $table.buttonHint, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get mixAnswers => $composableBuilder(
      column: $table.mixAnswers, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get buttonHint => $composableBuilder(
      column: $table.buttonHint, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get mixAnswers => $composableBuilder(
      column: $table.mixAnswers, builder: (column) => column);

  GeneratedColumn<bool> get buttonHint => $composableBuilder(
      column: $table.buttonHint, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
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
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDb db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> mixAnswers = const Value.absent(),
            Value<bool> buttonHint = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            id: id,
            mixAnswers: mixAnswers,
            buttonHint: buttonHint,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> mixAnswers = const Value.absent(),
            Value<bool> buttonHint = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            id: id,
            mixAnswers: mixAnswers,
            buttonHint: buttonHint,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function()>;
typedef $$UserAnswersTableCreateCompanionBuilder = UserAnswersCompanion
    Function({
  required int certificateTypeId,
  required int categoryId,
  required int questionId,
  required String selectedAnswerIdsJson,
  Value<bool?> isCorrect,
  Value<int> timeSpentSec,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$UserAnswersTableUpdateCompanionBuilder = UserAnswersCompanion
    Function({
  Value<int> certificateTypeId,
  Value<int> categoryId,
  Value<int> questionId,
  Value<String> selectedAnswerIdsJson,
  Value<bool?> isCorrect,
  Value<int> timeSpentSec,
  Value<DateTime> updatedAt,
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
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get selectedAnswerIdsJson => $composableBuilder(
      column: $table.selectedAnswerIdsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeSpentSec => $composableBuilder(
      column: $table.timeSpentSec, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
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
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get selectedAnswerIdsJson => $composableBuilder(
      column: $table.selectedAnswerIdsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeSpentSec => $composableBuilder(
      column: $table.timeSpentSec,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
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
      column: $table.certificateTypeId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<int> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => column);

  GeneratedColumn<String> get selectedAnswerIdsJson => $composableBuilder(
      column: $table.selectedAnswerIdsJson, builder: (column) => column);

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<int> get timeSpentSec => $composableBuilder(
      column: $table.timeSpentSec, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserAnswersTableTableManager extends RootTableManager<
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
    PrefetchHooks Function()> {
  $$UserAnswersTableTableManager(_$AppDb db, $UserAnswersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> certificateTypeId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> questionId = const Value.absent(),
            Value<String> selectedAnswerIdsJson = const Value.absent(),
            Value<bool?> isCorrect = const Value.absent(),
            Value<int> timeSpentSec = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAnswersCompanion(
            certificateTypeId: certificateTypeId,
            categoryId: categoryId,
            questionId: questionId,
            selectedAnswerIdsJson: selectedAnswerIdsJson,
            isCorrect: isCorrect,
            timeSpentSec: timeSpentSec,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int certificateTypeId,
            required int categoryId,
            required int questionId,
            required String selectedAnswerIdsJson,
            Value<bool?> isCorrect = const Value.absent(),
            Value<int> timeSpentSec = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAnswersCompanion.insert(
            certificateTypeId: certificateTypeId,
            categoryId: categoryId,
            questionId: questionId,
            selectedAnswerIdsJson: selectedAnswerIdsJson,
            isCorrect: isCorrect,
            timeSpentSec: timeSpentSec,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserAnswersTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$UserAnswersTableTableManager get userAnswers =>
      $$UserAnswersTableTableManager(_db, _db.userAnswers);
}
