// lib/data/app_db.dart
import 'dart:convert';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:drift/drift.dart';
import 'package:aviapoint/core/data/database/connection/connection.dart' as conn;

part 'app_db.g.dart';

/// Единственная строка с пользовательскими настройками
class AppSettings extends Table {
  IntColumn get certificateTypeId => integer().withDefault(const Constant(1))(); // тип сертификата (твоя специализация)
  BoolColumn get mixAnswers => boolean().withDefault(const Constant(true))();
  BoolColumn get buttonHint => boolean().withDefault(const Constant(true))();

  // JSON-список выбранных категорий
  TextColumn get selectedCategoryIds => text().map(const IntListJson()).withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {certificateTypeId};
}

/// Ответы пользователя БЕЗ попыток.
/// Храним последний ответ для пары (certificateTypeId, questionId).
class UserAnswers extends Table {
  IntColumn? get certificateTypeId => integer()(); // тип сертификата (твоя специализация)
  IntColumn? get categoryId => integer()(); // для фильтрации по выбранным темам
  IntColumn? get questionId => integer()(); // ID вопроса
  TextColumn? get selectedAnswerIdsJson => text()(); // JSON: [id1, id2, ...]
  BoolColumn? get isCorrect => boolean().nullable()(); // можно заполнять сразу/позже
}

@DriftDatabase(tables: [AppSettings, UserAnswers])
class AppDb extends _$AppDb {
  AppDb() : super(conn.openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async => m.createAll());

  // ---------------- SETTINGS ----------------
  Future<AppSetting?> getSettings() async => (await (select(appSettings)).getSingleOrNull());

  /// Настройки для конкретного типа свидетельства
  Future<AppSetting?> getSettingsForCertificate({required int certificateTypeId}) async {
    return (select(appSettings)..where((t) => t.certificateTypeId.equals(certificateTypeId))).getSingleOrNull();
  }

  Future<void> saveSettings({required int certificateTypeId, required bool mixAnswers, required bool buttonHint, required List<int> selectedCategoryIds}) async {
    await into(appSettings).insertOnConflictUpdate(AppSetting(certificateTypeId: certificateTypeId, mixAnswers: mixAnswers, buttonHint: buttonHint, selectedCategoryIds: selectedCategoryIds));
  }

  // ---------------- ANSWERS (без попыток) ----------------

  /// Upsert: пишет последний ответ пользователя на вопрос
  Future<void> upsertAnswer({required int certificateTypeId, required int categoryId, required int questionId, required List<int> selectedAnswerIds, bool? isCorrect, int timeSpentSec = 0}) async {
    await into(userAnswers).insertOnConflictUpdate(
      UserAnswer(certificateTypeId: certificateTypeId, categoryId: categoryId, questionId: questionId, selectedAnswerIdsJson: jsonEncode(selectedAnswerIds), isCorrect: isCorrect),
    );
  }

  /// Ответ по конкретному вопросу (для префилла UI)
  Future<UserAnswer?> getAnswer({required int certificateTypeId, required int questionId}) =>
      (select(userAnswers)..where((u) => u.certificateTypeId.equals(certificateTypeId) & u.questionId.equals(questionId))).getSingleOrNull();

  /// Все ответы по выбранным категориям
  Future<List<UserAnswer>> getAnswersForCategories({required int certificateTypeId, required Iterable<int> categoryIds}) =>
      (select(userAnswers)..where((u) => u.certificateTypeId.equals(certificateTypeId) & u.categoryId.isIn(categoryIds.toList()))).get();

  /// Стрим ответов по выбранным категориям (удобно для живой статистики)
  Stream<List<UserAnswer>> watchAnswersForCategories({required int certificateTypeId, required Iterable<int> categoryIds}) =>
      (select(userAnswers)..where((u) => u.certificateTypeId.equals(certificateTypeId) & u.categoryId.isIn(categoryIds.toList()))).watch();

  /// Сброс ответов (например, начать «с чистого листа» по выбранным темам)
  Future<int> resetAnswersForCategories({required int certificateTypeId, required Iterable<int> categoryIds}) =>
      (delete(userAnswers)..where((u) => u.certificateTypeId.equals(certificateTypeId) & u.categoryId.isIn(categoryIds.toList()))).go();

  /// Быстрая статистика по выбранным темам
  Future<({int answered, int correct})> getStats({required int certificateTypeId, required Iterable<int> categoryIds}) async {
    final list = await getAnswersForCategories(certificateTypeId: certificateTypeId, categoryIds: categoryIds);
    final answered = list.length;
    final correct = list.where((a) => a.isCorrect == true).length;
    return (answered: answered, correct: correct);
  }
}
