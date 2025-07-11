import 'package:aviapoint/auth_page/domain/entities/sms_entity.dart';
import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sms_bloc.freezed.dart';

@freezed
class SmsEvent with _$SmsEvent {
  const SmsEvent._();

  const factory SmsEvent.getSms({required String phone}) = GetSmsEvent;
  const factory SmsEvent.initial() = InitialSmsEvent;
}

@freezed
class SmsState with _$SmsState {
  const SmsState._();

  const factory SmsState.initial() = InitialSmsState;

  const factory SmsState.loading() = LoadingSmsState;

  const factory SmsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorSmsState;

  const factory SmsState.success(SmsEntity sms) = SuccessSmsState;
}

class SmsBloc extends Bloc<SmsEvent, SmsState> {
  final AuthRepository _authRepository;

  String email = '';
  String smsCode = '';

  SmsBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const InitialSmsState()) {
    on<SmsEvent>(
      (event, emitter) => event.map(
        initial: (event) => _initial(event, emitter),
        getSms: (event) => _getSms(event, emitter),
      ),
    );
  }

  /// Авторизация по логину/паролю.
  Future<void> _initial(_, Emitter<SmsState> emit) async {
    emit(const InitialSmsState());
  }

  /// Авторизация по номеру телефона.
  Future<void> _getSms(GetSmsEvent event, Emitter<SmsState> emit) async {
    emit(const LoadingSmsState());

    final response = await _authRepository.getSms(
      event.phone,
    );
    response.fold(
      (l) {
        emit(
          ErrorSmsState(
            errorForUser: 'Что-то пошло не так! Проверьте номер телефона и попробуйте заново',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessSmsState(r),
        );
      },
    );
  }
}
