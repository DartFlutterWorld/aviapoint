import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

DatabaseConnection openConnection() {
  // Веб: файлы sqlite3.wasm и drift_worker.dart.js лежат в /web
  return DatabaseConnection.delayed(
    Future(() async {
      final res = await WasmDatabase.open(databaseName: 'rosavia_app_db', sqlite3Uri: Uri.parse('sqlite3mc.wasm'), driftWorkerUri: Uri.parse('drift_worker.js'));
      return res.resolvedExecutor;
    }),
  );
}
