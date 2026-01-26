import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

/// Сервис для мониторинга подключения к интернету
class InternetConnectionService {
  static final InternetConnectionService _instance = InternetConnectionService._internal();
  factory InternetConnectionService() => _instance;
  InternetConnectionService._internal();

  InternetConnection? _connectionChecker;
  final Dio _dio = Dio();

  StreamController<bool>? _connectionController;
  Stream<bool>? _connectionStream;
  bool _isConnected = true;
  StreamSubscription<InternetStatus>? _connectionStatusSubscription;
  Timer? _periodicCheckTimer;

  /// Текущее состояние подключения
  bool get isConnected => _isConnected;

  /// Stream для отслеживания изменений подключения
  Stream<bool> get connectionStream {
    _connectionController ??= StreamController<bool>.broadcast();
    _connectionStream ??= _connectionController!.stream;
    return _connectionStream!;
  }

  /// Инициализация мониторинга подключения
  Future<void> initialize() async {
    // На веб не используем internet_connection_checker_plus, так как он зависит от connectivity_plus
    if (!kIsWeb) {
      _connectionChecker = InternetConnection();
    }

    try {
      // Проверяем начальное состояние
      await _checkConnection();
    } catch (e) {
      // В случае ошибки при инициализации считаем, что подключения нет
      _updateConnectionStatus(false);
    }

    // Слушаем изменения реального подключения к интернету
    // Используем stream как в официальном примере
    try {
      _connectionStatusSubscription = _connectionChecker!.onStatusChange.listen(
        (InternetStatus status) {
          try {
            final isConnected = status == InternetStatus.connected;
            _updateConnectionStatus(isConnected);
          } catch (e) {
            // При ошибке считаем, что подключения нет
            try {
              _updateConnectionStatus(false);
            } catch (e2) {
              // Игнорируем ошибки при обновлении статуса
            }
          }
        },
        onError: (error) {
          // При ошибке в stream переключаемся на периодическую проверку
          try {
            _updateConnectionStatus(false);
            _connectionStatusSubscription?.cancel();
            _connectionStatusSubscription = null;
            _startPeriodicCheck();
          } catch (e) {
            // Игнорируем ошибки
          }
        },
        cancelOnError: false,
      );
    } catch (e) {
      // Если не удалось создать подписку, используем периодическую проверку
      _startPeriodicCheck();
    }
  }

  /// Проверка текущего подключения
  Future<bool> checkConnection() async {
    try {
      await _checkConnection();
    } catch (e) {
      // В случае ошибки возвращаем текущее состояние
    }
    return _isConnected;
  }

  Future<void> _checkConnection() async {
    try {
      bool isConnected;

      if (kIsWeb) {
        // На веб используем простой HTTP запрос через Dio
        try {
          final response = await _dio.get<dynamic>(
            'https://www.google.com/favicon.ico',
            options: Options(receiveTimeout: const Duration(seconds: 3), sendTimeout: const Duration(seconds: 3), validateStatus: (status) => status != null && status < 500),
          );
          isConnected = response.statusCode == 200;
        } catch (e) {
          isConnected = false;
        }
      } else {
        // На мобильных платформах используем internet_connection_checker_plus
        try {
          isConnected = await _connectionChecker!.hasInternetAccess.timeout(const Duration(seconds: 3), onTimeout: () => false);
        } catch (e) {
          // Если не удалось проверить доступ к интернету, считаем что его нет
          isConnected = false;
        }
      }

      _updateConnectionStatus(isConnected);
    } catch (e) {
      // В случае любой другой ошибки считаем, что подключения нет
      _updateConnectionStatus(false);
    }
  }

  /// Периодическая проверка подключения (используется на веб-платформе)
  void _startPeriodicCheck() {
    _periodicCheckTimer?.cancel();
    _periodicCheckTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _checkConnection();
    });
  }

  void _updateConnectionStatus(bool isConnected) {
    if (_isConnected != isConnected) {
      _isConnected = isConnected;
      try {
        if (_connectionController != null && !_connectionController!.isClosed) {
          _connectionController!.add(_isConnected);
        }
      } catch (e) {
        // Игнорируем ошибки при добавлении в stream (например, если контроллер закрыт)
      }
    }
  }

  /// Остановка мониторинга
  void dispose() {
    _connectionStatusSubscription?.cancel();
    _periodicCheckTimer?.cancel();
    _connectionController?.close();
    _connectionController = null;
    _connectionStream = null;
  }
}
