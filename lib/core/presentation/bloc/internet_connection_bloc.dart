import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_connection_bloc.freezed.dart';

@freezed
class InternetConnectionEvent with _$InternetConnectionEvent {
  const InternetConnectionEvent._();

  const factory InternetConnectionEvent.startMonitoring() = StartMonitoringEvent;
  const factory InternetConnectionEvent.stopMonitoring() = StopMonitoringEvent;
  const factory InternetConnectionEvent.statusChanged({required InternetStatus status}) = StatusChangedEvent;
}

@freezed
class InternetConnectionState with _$InternetConnectionState {
  const InternetConnectionState._();

  const factory InternetConnectionState.initial() = InitialInternetConnectionState;
  const factory InternetConnectionState.connected() = ConnectedInternetConnectionState;
  const factory InternetConnectionState.disconnected() = DisconnectedInternetConnectionState;
}

class InternetConnectionBloc extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  final InternetConnection _connectionChecker = InternetConnection();
  StreamSubscription<InternetStatus>? _subscription;

  InternetConnectionBloc() : super(const InitialInternetConnectionState()) {
    on<InternetConnectionEvent>(
      (event, emitter) => event.map(
        startMonitoring: (event) => _startMonitoring(event, emitter),
        stopMonitoring: (event) => _stopMonitoring(event, emitter),
        statusChanged: (event) => _statusChanged(event, emitter),
      ),
    );
  }

  Future<void> _startMonitoring(StartMonitoringEvent event, Emitter<InternetConnectionState> emit) async {
    // Отменяем предыдущую подписку, если есть
    _subscription?.cancel();

    // Проверяем начальное состояние
    await _checkInitialStatus(emit);

    // Подписываемся на изменения подключения
    // Используем add для создания новых событий вместо прямого emit
    _subscription = _connectionChecker.onStatusChange.listen(
      (InternetStatus status) {
        add(InternetConnectionEvent.statusChanged(status: status));
      },
      onError: (error) {
        // При ошибке считаем, что подключения нет
        add(const InternetConnectionEvent.statusChanged(status: InternetStatus.disconnected));
      },
    );
  }

  Future<void> _checkInitialStatus(Emitter<InternetConnectionState> emit) async {
    try {
      final hasInternet = await _connectionChecker.hasInternetAccess;
      if (hasInternet) {
        emit(const ConnectedInternetConnectionState());
      } else {
        emit(const DisconnectedInternetConnectionState());
      }
    } catch (e) {
      emit(const DisconnectedInternetConnectionState());
    }
  }

  void _statusChanged(StatusChangedEvent event, Emitter<InternetConnectionState> emit) {
    if (event.status == InternetStatus.connected) {
      emit(const ConnectedInternetConnectionState());
    } else {
      emit(const DisconnectedInternetConnectionState());
    }
  }

  void _stopMonitoring(StopMonitoringEvent event, Emitter<InternetConnectionState> emit) {
    _subscription?.cancel();
    _subscription = null;
    emit(const InitialInternetConnectionState());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
