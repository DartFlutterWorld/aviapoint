// lib/data/app_db.dart
import 'dart:convert';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/talker_config.dart';
import 'package:drift/drift.dart';
import 'package:aviapoint/core/data/database/connection/connection.dart' as conn;

part 'app_db.g.dart';

/// Единственная строка с пользовательскими настройками
class AppSettings extends Table {
  IntColumn get certificateTypeId => integer().withDefault(const Constant(1))(); // тип сертификата (твоя специализация)
  BoolColumn get mixAnswers => boolean().withDefault(const Constant(true))();
  BoolColumn get buttonHint => boolean().withDefault(const Constant(true))();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get image => text().withDefault(const Constant(''))();

  // JSON-список выбранных категорий
  TextColumn get selectedCategoryIds => text().map(const IntListJson()).withDefault(const Constant('{}'))();

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
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 3) {
        await m.addColumn(appSettings, appSettings.title);
        await m.addColumn(appSettings, appSettings.image);
      }
    },
  );

  // ---------------- SETTINGS ----------------
  Future<AppSetting?> getSettings() async => (await (select(appSettings)).getSingleOrNull());

  /// Настройки для конкретного типа свидетельства
  Future<AppSetting?> getSettingsForCertificate({required int certificateTypeId}) async {
    AppTalker.debug('getSettingsForCertificate: searching for certificateTypeId = $certificateTypeId');

    // Сначала проверим, есть ли вообще записи в таблице
    final allSettings = await select(appSettings).get();
    AppTalker.debug('getSettingsForCertificate: all settings in DB = $allSettings');

    final result = (select(appSettings)..where((t) => t.certificateTypeId.equals(certificateTypeId))).getSingleOrNull();
    AppTalker.debug('getSettingsForCertificate: result = $result');

    return result;
  }

  Future<void> saveSettings({
    required int certificateTypeId,
    required bool mixAnswers,
    required bool buttonHint,
    required Set<int> selectedCategoryIds,
    required String title,
    required String image,
  }) async {
    AppTalker.info('saveSettings: saving for certificateTypeId = $certificateTypeId');
    AppTalker.debug('saveSettings: mixAnswers = $mixAnswers, buttonHint = $buttonHint');
    AppTalker.debug('saveSettings: selectedCategoryIds = $selectedCategoryIds');

    // Проверим, есть ли записи перед удалением
    final existingRecords = await (select(appSettings)..where((t) => t.certificateTypeId.equals(certificateTypeId))).get();
    AppTalker.debug('saveSettings: existing records before delete = $existingRecords');

    // Сначала удаляем существующую запись для данного certificateTypeId
    await (delete(appSettings)..where((t) => t.certificateTypeId.equals(certificateTypeId))).go();
    AppTalker.debug('saveSettings: deleted records for certificateTypeId = $certificateTypeId');

    // Проверим, что записи действительно удалены
    final recordsAfterDelete = await (select(appSettings)..where((t) => t.certificateTypeId.equals(certificateTypeId))).get();
    AppTalker.debug('saveSettings: records after delete = $recordsAfterDelete');

    // Затем вставляем новую запись
    try {
      await into(
        appSettings,
      ).insert(AppSetting(certificateTypeId: certificateTypeId, mixAnswers: mixAnswers, buttonHint: buttonHint, selectedCategoryIds: selectedCategoryIds, title: title, image: image));

      AppTalker.good('saveSettings: inserted new record');

      // Проверим, что запись действительно сохранилась
      final savedRecord = await getSettingsForCertificate(certificateTypeId: certificateTypeId);
      AppTalker.debug('saveSettings: verification - saved record = $savedRecord');

      // Также проверим все записи в таблице
      final allRecords = await select(appSettings).get();
      AppTalker.debug('saveSettings: all records in table = $allRecords');
    } catch (e, stackTrace) {
      AppTalker.error('saveSettings: ERROR during insert', e, stackTrace);
      rethrow;
    }
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
