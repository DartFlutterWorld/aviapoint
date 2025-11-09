import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';
import 'dart:html' as html if (dart.library.html) 'dart:html';

DatabaseConnection openConnection() {
  // Веб: файлы sqlite3.wasm и drift_worker.dart.js лежат в /web
  // Используем абсолютные пути от корня, чтобы работало на любых страницах
  return DatabaseConnection.delayed(
    Future(() async {
      // Всегда используем абсолютные пути от корня для production
      // Это гарантирует, что файлы будут запрашиваться по правильному пути
      final sqlite3Uri = Uri.parse('/sqlite3mc.wasm');
      final driftWorkerUri = Uri.parse('/drift_worker.js');

      // Логирование для диагностики (работает и в production через window.console)
      if (kIsWeb) {
        try {
          html.window.console.log('🔵 WebAssembly: Инициализация БД');
          html.window.console.log('🔵 WebAssembly: sqlite3Uri = $sqlite3Uri');
          html.window.console.log('🔵 WebAssembly: driftWorkerUri = $driftWorkerUri');
          html.window.console.log('🔵 WebAssembly: current location = ${html.window.location.href}');
        } catch (e) {
          // Игнорируем ошибки логирования
        }
      } else if (kDebugMode) {
        print('🔵 WebAssembly: sqlite3Uri = $sqlite3Uri, driftWorkerUri = $driftWorkerUri');
      }

      try {
        final res = await WasmDatabase.open(databaseName: 'rosavia_app_db', sqlite3Uri: sqlite3Uri, driftWorkerUri: driftWorkerUri);

        if (kIsWeb) {
          try {
            html.window.console.log('✅ WebAssembly: БД успешно инициализирована');
          } catch (e) {}
        }

        return res.resolvedExecutor;
      } catch (e, stackTrace) {
        // Детальное логирование ошибки
        if (kIsWeb) {
          try {
            html.window.console.error('❌ WebAssembly: Ошибка инициализации БД: $e');
            html.window.console.error('❌ WebAssembly: StackTrace: $stackTrace');
            html.window.console.error('❌ WebAssembly: sqlite3Uri был: $sqlite3Uri');
            html.window.console.error('❌ WebAssembly: driftWorkerUri был: $driftWorkerUri');
          } catch (e2) {}
        } else if (kDebugMode) {
          print('❌ WebAssembly: Ошибка инициализации БД: $e');
          print('❌ WebAssembly: StackTrace: $stackTrace');
        }
        rethrow;
      }
    }),
  );
}
