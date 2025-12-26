// lib/data/app_db.dart
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/talker_config.dart';
import 'package:drift/drift.dart';
import 'package:aviapoint/core/data/database/connection/connection.dart' as conn;

part 'app_db.g.dart';

/// Единственная строка с пользовательскими настройками
class AppSettings extends Table {
  IntColumn get certificateTypeId => integer().withDefault(const Constant(1))(); // тип сертификата (твоя специализация)
  BoolColumn get mixAnswers => boolean().withDefault(const Constant(true))();
  BoolColumn get mixQuestions => boolean().withDefault(const Constant(true))();
  BoolColumn get buttonHint => boolean().withDefault(const Constant(true))();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get image => text().withDefault(const Constant(''))();

  // JSON-список выбранных категорий
  TextColumn get selectedCategoryIds => text().map(const IntListJson()).withDefault(const Constant('{}'))();

  // Сохраненный режим тестирования (training или standart)
  TextColumn get testMode => text().withDefault(const Constant('training'))();

  @override
  Set<Column> get primaryKey => {certificateTypeId};
}

/// Выбранные вопросы для текущего теста
class SelectedQuestions extends Table {
  IntColumn get certificateTypeId => integer()();
  IntColumn get questionId => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {certificateTypeId, questionId},
  ];
}

/// Ответы на вопросы тестирования
class TestAnswers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get certificateTypeId => integer()();
  IntColumn get questionId => integer()();
  IntColumn get selectedAnswerId => integer()();
  IntColumn get categoryId => integer()(); // categoryId теперь обязательное поле
  BoolColumn? get isCorrect => boolean().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {certificateTypeId, questionId},
  ];
}

@DriftDatabase(tables: [AppSettings, SelectedQuestions, TestAnswers])
class AppDb extends _$AppDb {
  AppDb() : super(conn.openConnection());

  @override
  int get schemaVersion => 15;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 3) {
        await m.addColumn(appSettings, appSettings.title);
        await m.addColumn(appSettings, appSettings.image);
      }
      if (from < 4) {
        // Пересоздаем таблицу appSettings чтобы добавить столбец mixQuestions
        await m.deleteTable('app_settings');
        await m.createTable(appSettings);
      }
      if (from < 5) {
        // Создаем новые таблицы для сессий и ответов
        await m.createTable(selectedQuestions);
        await m.createTable(testAnswers);
      }
      if (from < 9) {
        // Пересоздаем таблицу testAnswers с упрощенной структурой
        await m.deleteTable('test_answers');
        await m.createTable(testAnswers);
      }
      if (from < 10) {
        // Удаляем testSessions и создаем selectedQuestions
        await m.deleteTable('test_sessions');
        await m.createTable(selectedQuestions);
      }
      if (from < 12) {
        // Пересоздаем testAnswers с новым полем categoryId
        // Версия 11 пропущена, так как версия 12 пересоздает таблицу полностью
        await m.deleteTable('test_answers');
        await m.createTable(testAnswers);
      }
      if (from < 13) {
        // Пересоздаем testAnswers чтобы сделать categoryId обязательным (non-nullable)
        await m.deleteTable('test_answers');
        await m.createTable(testAnswers);
      }
      if (from < 14) {
        // Добавляем testMode в AppSettings
        await m.addColumn(appSettings, appSettings.testMode);
      }
      if (from < 15) {
        // Исправление: пересоздаем testAnswers чтобы гарантировать правильную структуру
        // Это исправляет проблему с дублированием category_id
        await m.deleteTable('test_answers');
        await m.createTable(testAnswers);
      }
    },
  );

  // ---------------- SETTINGS ----------------

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
    required bool mixQuestions,
    required bool buttonHint,
    required Set<int> selectedCategoryIds,
    required String title,
    required String image,
    String testMode = 'training',
  }) async {
    try {
      await into(appSettings).insertOnConflictUpdate(
        AppSetting(
          certificateTypeId: certificateTypeId,
          mixAnswers: mixAnswers,
          mixQuestions: mixQuestions,
          buttonHint: buttonHint,
          selectedCategoryIds: selectedCategoryIds,
          title: title,
          image: image,
          testMode: testMode,
        ),
      );
      AppTalker.good('saveSettings: saved successfully');
    } catch (e, stackTrace) {
      AppTalker.error('saveSettings error', e, stackTrace);
      rethrow;
    }
  }

  /// Сохранить только режим тестирования для типа сертификата
  Future<void> saveTestMode({required int certificateTypeId, required String testMode}) async {
    try {
      final existing = await getSettingsForCertificate(certificateTypeId: certificateTypeId);

      if (existing != null) {
        // Обновляем существующую запись
        await (update(appSettings)..where((t) => t.certificateTypeId.equals(certificateTypeId))).write(
          AppSettingsCompanion(testMode: Value(testMode)),
        );
      } else {
        // Создаем новую запись с дефолтными значениями
        await into(appSettings).insert(
          AppSetting(
            certificateTypeId: certificateTypeId,
            testMode: testMode,
            mixAnswers: true,
            mixQuestions: true,
            buttonHint: true,
            selectedCategoryIds: const {},
            title: '',
            image: '',
          ),
        );
      }
      AppTalker.good('saveTestMode: saved successfully for certificateTypeId=$certificateTypeId, testMode=$testMode');
    } catch (e, stackTrace) {
      AppTalker.error('saveTestMode error', e, stackTrace);
      rethrow;
    }
  }

  // ---- SELECTED QUESTIONS ----

  /// Сохранить выбранные вопросы для теста
  Future<void> saveSelectedQuestions({required int certificateTypeId, required List<int> questionIds}) async {
    await delete(selectedQuestions).go();

    // Удаляем дубликаты из списка
    final uniqueQuestionIds = questionIds.toSet().toList();

    for (final questionId in uniqueQuestionIds) {
      try {
        await into(selectedQuestions).insert(
          SelectedQuestionsCompanion(certificateTypeId: Value(certificateTypeId), questionId: Value(questionId)),
        );
      } catch (e) {
        // Игнорируем ошибку дубликата если она все же возникнет
        continue;
      }
    }
  }

  /// Получить все выбранные вопросы
  Future<List<SelectedQuestion>> getSelectedQuestions(int certificateTypeId) =>
      (select(selectedQuestions)..where((t) => t.certificateTypeId.equals(certificateTypeId))).get();

  /// Удалить все выбранные вопросы
  Future<int> deleteSelectedQuestions(int certificateTypeId) =>
      (delete(selectedQuestions)..where((t) => t.certificateTypeId.equals(certificateTypeId))).go();

  // ---------------- TEST ANSWERS ----------------

  /// Сохранить ответ на вопрос
  Future<int> saveTestAnswer({
    required int certificateTypeId,
    required int questionId,
    required int selectedAnswerId,
    required int categoryId,
    required bool? isCorrect,
  }) async {
    final existingAnswer = await getAnswerForQuestion(certificateTypeId: certificateTypeId, questionId: questionId);

    if (existingAnswer != null) {
      await (update(
        testAnswers,
      )..where((t) => t.certificateTypeId.equals(certificateTypeId) & t.questionId.equals(questionId))).write(
        TestAnswersCompanion(
          selectedAnswerId: Value(selectedAnswerId),
          categoryId: Value(categoryId),
          isCorrect: Value(isCorrect),
        ),
      );
      return existingAnswer.id;
    } else {
      return into(testAnswers).insert(
        TestAnswersCompanion(
          certificateTypeId: Value(certificateTypeId),
          questionId: Value(questionId),
          selectedAnswerId: Value(selectedAnswerId),
          categoryId: Value(categoryId),
          isCorrect: Value(isCorrect),
        ),
      );
    }
  }

  /// Получить все ответы по типу сертификата
  Future<List<TestAnswer>> getAnswersByCertificateType(int certificateTypeId) =>
      (select(testAnswers)..where((t) => t.certificateTypeId.equals(certificateTypeId))).get();

  /// Проверить есть ли хоть какие-то ответы (активный тест)
  Future<bool> hasActiveTest(int certificateTypeId) async {
    final answers = await (select(testAnswers)..where((t) => t.certificateTypeId.equals(certificateTypeId))).get();
    AppTalker.error('🔴 hasActiveTest: certificateTypeId=$certificateTypeId, found=${answers.length} answers');
    return answers.isNotEmpty;
  }

  /// Получить количество неотвеченных вопросов
  Future<int> getUnansweredQuestionsCount(int certificateTypeId) async {
    final selectedQuestions = await getSelectedQuestions(certificateTypeId);
    AppTalker.error('🔴 getUnansweredQuestionsCount: selectedQuestions=${selectedQuestions.length}');

    final answeredQuestions = await getAnswersByCertificateType(certificateTypeId);
    AppTalker.error('🔴 getUnansweredQuestionsCount: answeredQuestions=${answeredQuestions.length}');

    final answeredIds = answeredQuestions.map((a) => a.questionId).toSet();
    final unanswered = selectedQuestions.where((q) => !answeredIds.contains(q.questionId)).length;
    AppTalker.error('🔴 getUnansweredQuestionsCount: unanswered=$unanswered');

    return unanswered;
  }

  /// Получить ответ на конкретный вопрос
  Future<TestAnswer?> getAnswerForQuestion({required int certificateTypeId, required int questionId}) => (select(
    testAnswers,
  )..where((t) => t.certificateTypeId.equals(certificateTypeId) & t.questionId.equals(questionId))).getSingleOrNull();

  /// Удалить все ответы для типа сертификата
  Future<int> deleteAnswersByCertificateType(int certificateTypeId) async {
    AppTalker.error('🔴 deleteAnswersByCertificateType: Deleting answers for certificateTypeId=$certificateTypeId');
    final deletedCount = await (delete(testAnswers)..where((t) => t.certificateTypeId.equals(certificateTypeId))).go();
    AppTalker.error('🔴 deleteAnswersByCertificateType: Deleted $deletedCount answer(s)');
    return deletedCount;
  }

  /// Очистить всю БД (удалить все вопросы и ответы)
  Future<void> clearAllData() async {
    AppTalker.error('🔴 clearAllData: Starting database clear...');

    final deletedAnswers = await delete(testAnswers).go();
    AppTalker.error('🔴 clearAllData: Deleted $deletedAnswers test answers');

    final deletedQuestions = await delete(selectedQuestions).go();
    AppTalker.error('🔴 clearAllData: Deleted $deletedQuestions selected questions');

    AppTalker.error(
      '🔴 clearAllData: Database cleared! Total deletions - Answers: $deletedAnswers, Questions: $deletedQuestions',
    );
  }
}
