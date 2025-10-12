// lib/data/app_db.dart
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:aviapoint/core/data/database/connection/connection.dart' as conn;

part 'app_db.g.dart';

/// Единственная строка с пользовательскими настройками
class AppSettings extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  BoolColumn get mixAnswers => boolean().withDefault(const Constant(true))();
  BoolColumn get buttonHint => boolean().withDefault(const Constant(true))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column> get primaryKey => {id};
}

/// Ответы пользователя БЕЗ попыток.
/// Храним последний ответ для пары (certificateTypeId, questionId).
class UserAnswers extends Table {
  IntColumn get certificateTypeId => integer()(); // тип сертификата (твоя специализация)
  IntColumn get categoryId => integer()(); // для фильтрации по выбранным темам
  IntColumn get questionId => integer()(); // ID вопроса
  TextColumn get selectedAnswerIdsJson => text()(); // JSON: [id1, id2, ...]
  BoolColumn get isCorrect => boolean().nullable()(); // можно заполнять сразу/позже
  IntColumn get timeSpentSec => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Один актуальный ответ на вопрос в рамках типа сертификата
  @override
  Set<Column> get primaryKey => {certificateTypeId, questionId};

  @override
  List<String> get customConstraints => ['INDEX ua_cat_idx (category_id)', 'INDEX ua_cert_idx (certificate_type_id)', 'INDEX ua_correct_idx (is_correct)'];
}

@DriftDatabase(tables: [AppSettings, UserAnswers])
class AppDb extends _$AppDb {
  AppDb() : super(conn.openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async => m.createAll());

  // ---------------- SETTINGS ----------------
  Future<AppSetting> getSettings() async => (await (select(appSettings)..where((t) => t.id.equals(1))).getSingleOrNull()) ?? await _initDefaultSettings();

  Future<AppSetting> _initDefaultSettings() async {
    await into(appSettings).insert(
      const AppSettingsCompanion(id: Value(1), mixAnswers: Value(true), buttonHint: Value(true)),
      mode: InsertMode.insertOrIgnore,
    );
    return (select(appSettings)..where((t) => t.id.equals(1))).getSingle();
  }

  Future<void> saveSettings({required bool mixAnswers, required bool buttonHint}) async {
    await into(appSettings).insertOnConflictUpdate(AppSetting(id: 1, mixAnswers: mixAnswers, buttonHint: buttonHint, updatedAt: DateTime.now()));
  }

  Stream<AppSetting> watchSettings() => (select(appSettings)..where((t) => t.id.equals(1))).watchSingle();

  // ---------------- ANSWERS (без попыток) ----------------

  /// Upsert: пишет последний ответ пользователя на вопрос
  Future<void> upsertAnswer({required int certificateTypeId, required int categoryId, required int questionId, required List<int> selectedAnswerIds, bool? isCorrect, int timeSpentSec = 0}) async {
    await into(userAnswers).insertOnConflictUpdate(
      UserAnswer(
        certificateTypeId: certificateTypeId,
        categoryId: categoryId,
        questionId: questionId,
        selectedAnswerIdsJson: jsonEncode(selectedAnswerIds),
        isCorrect: isCorrect,
        timeSpentSec: timeSpentSec,
        updatedAt: DateTime.now(),
      ),
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

// DatabaseConnection _open() {
//   if (kIsWeb) {
//     // Web через WasmDatabase.open
//     return DatabaseConnection.delayed(Future(() async {
//       final res = await WasmDatabase.open(
//         databaseName: 'rosavia_app_db', // латинские символы/цифры
//         sqlite3Uri: Uri.parse('sqlite3mc.wasm'), // лежит в web/
//         driftWorkerUri: Uri.parse('drift_worker.js'), // лежит в web/
//         // при необходимости можно подложить начальный дамп БД:
//         // initializeDatabase: () async => (await rootBundle.load('assets/seed.sqlite')).buffer.asUint8List(),
//       );
//       return res.resolvedExecutor; // отдать executor в drift
//     }));
//   } else {
//     // Native (Android/iOS/desktop) — как раньше
//     final lazy = LazyDatabase(() async {
//       final dir = await getApplicationDocumentsDirectory();
//       final file = File(p.join(dir.path, 'rosavia_app.db'));
//       return NativeDatabase.createInBackground(file);
//     });
//     return DatabaseConnection.fromExecutor(lazy);
//   }
// }
