import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';
import 'dart:html' as html if (dart.library.html) 'dart:html';

DatabaseConnection openConnection() {
  // Веб: файлы sqlite3.wasm и drift_worker.dart.js лежат в /web
  // Используем абсолютные пути от корня, чтобы работало на любых страницах
  return DatabaseConnection.delayed(
    Future(() async {
      // В production используем абсолютные пути от корня
      // В development можно использовать относительные
      String basePath = '';
      if (kIsWeb) {
        // Получаем базовый путь из window.location
        try {
          basePath = html.window.location.origin;
        } catch (e) {
          // Если не удалось получить, используем относительный путь
          basePath = '';
        }
      }

      final sqlite3Uri = basePath.isEmpty ? Uri.parse('/sqlite3mc.wasm') : Uri.parse('$basePath/sqlite3mc.wasm');
      final driftWorkerUri = basePath.isEmpty ? Uri.parse('/drift_worker.js') : Uri.parse('$basePath/drift_worker.js');

      if (kDebugMode) {
        print('🔵 WebAssembly: sqlite3Uri = $sqlite3Uri, driftWorkerUri = $driftWorkerUri');
      }

      final res = await WasmDatabase.open(databaseName: 'rosavia_app_db', sqlite3Uri: sqlite3Uri, driftWorkerUri: driftWorkerUri);
      return res.resolvedExecutor;
    }),
  );
}
