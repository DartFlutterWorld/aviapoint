import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

DatabaseConnection openConnection() {
  final lazy = LazyDatabase(() async {
    // Инициализируем SQLite на Android перед использованием (только для старых версий)
    // Обертываем в try-catch, так как на новых версиях Android это не требуется
    // и плагин может быть не зарегистрирован
    if (Platform.isAndroid) {
      try {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      } catch (e) {
        // Игнорируем ошибку - на новых версиях Android это не требуется
        // и база данных будет работать без этого workaround
      }
    }

    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'rosavia_app.db'));
    // Используем синхронное создание вместо createInBackground для более надежной работы
    return NativeDatabase(file);
  });
  return DatabaseConnection.fromExecutor(lazy);
}
