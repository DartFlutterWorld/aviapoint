import 'package:aviapoint/auth_page/domain/entities/auth_entity.dart';
import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.get({required String phone, required String sms}) = GetAuthEvent;
  const factory AuthEvent.initial() = InitialAuthEvent;
}

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = InitialAuthState;

  const factory AuthState.loading() = LoadingAuthState;

  const factory AuthState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorAuthState;

  const factory AuthState.success(AuthEntity auth) = SuccessAuthState;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final AppState _appState;

  AuthBloc({required AuthRepository authRepository, required AppState appState})
    : _authRepository = authRepository,
      _appState = appState,
      super(const InitialAuthState()) {
    on<AuthEvent>(
      (event, emitter) => event.map(initial: (event) => _initial(event, emitter), get: (event) => _get(event, emitter)),
    );
  }

  Future<void> _initial(_, Emitter<AuthState> emit) async {
    emit(const InitialAuthState());
  }

  /// Авторизация по номеру телефона.
  Future<void> _get(GetAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());

    final response = await _authRepository.auth(phone: event.phone, sms: event.sms);
    await response.fold(
      (l) async {
        emit(
          ErrorAuthState(
            errorForUser: 'Что-то пошло не так! Проверьте правильность введённого смс кода',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) async {
        try {
          // Теперь проверяем статус авторизации
          await _appState.checkAuthStatus();

          // FCM токен будет отправлен автоматически после загрузки профиля

          emit(SuccessAuthState(r));
        } catch (e) {
          emit(ErrorAuthState(errorForUser: 'Ошибка сохранения токенов', errorFromApi: e.toString()));
        }
      },
    );
  }
}
