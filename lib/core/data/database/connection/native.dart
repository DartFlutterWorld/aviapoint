import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

DatabaseConnection openConnection() {
  final lazy = LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'rosavia_app.db'));
    // Используем синхронное создание вместо createInBackground для более надежной работы
    return NativeDatabase(file);
  });
  return DatabaseConnection.fromExecutor(lazy);
}
