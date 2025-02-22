import 'package:logger/logger.dart';

abstract class AppLogger {
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]);
}

class AppLoggerImpl extends AppLogger {
  final log = Logger();

  @override
  void d(message, [dynamic error, StackTrace? stackTrace]) {
    log.d(message, error, stackTrace);
  }

  @override
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.e(message, error, stackTrace);
  }

  @override
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.i(message, error, stackTrace);
  }

  @override
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.v(message, error, stackTrace);
  }

  @override
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.w(message, error, stackTrace);
  }
}

final logger = AppLoggerImpl();
