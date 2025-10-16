import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppTalker {
  static final Talker _talker = TalkerFlutter.init(settings: TalkerSettings(useConsoleLogs: kDebugMode, useHistory: true, maxHistoryItems: 100));

  static Talker get instance => _talker;

  static void debug(String message) {
    _talker.debug(message);
  }

  static void info(String message) {
    _talker.info(message);
  }

  static void warning(String message) {
    _talker.warning(message);
  }

  static void error(String message, [Object? exception, StackTrace? stackTrace]) {
    _talker.error(message, exception, stackTrace);
  }

  static void good(String message) {
    _talker.info('✅ $message');
  }

  static void verbose(String message) {
    _talker.verbose(message);
  }
}
