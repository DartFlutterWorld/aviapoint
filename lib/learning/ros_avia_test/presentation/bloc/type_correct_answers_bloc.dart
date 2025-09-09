import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_correct_answer_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_correct_answers_bloc.freezed.dart';

@freezed
abstract class TypeCorrectAnswersEvent with _$TypeCorrectAnswersEvent {
  const TypeCorrectAnswersEvent._();

  const factory TypeCorrectAnswersEvent.get() = GetTypeCorrectAnswersEvent;
  // const factory TypeCorrectAnswersEvent.getById(int id) = GetByIdTypeCorrectAnswersEvent;
}

@freezed
abstract class TypeCorrectAnswersState with _$TypeCorrectAnswersState {
  const TypeCorrectAnswersState._();
  const factory TypeCorrectAnswersState.loading() = LoadingTypeCorrectAnswersState;
  const factory TypeCorrectAnswersState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorTypeCorrectAnswersState;
  const factory TypeCorrectAnswersState.success({required List<TypeCorrectAnswerEntity> typeCorrectAnswer}) = SuccessTypeCorrectAnswersState;
  // const factory TypeCorrectAnswersState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdTypeCorrectAnswersState;
  // const factory TypeCorrectAnswersState.done() = DoneTypeCorrectAnswersState;
}

class TypeCorrectAnswersBloc extends Bloc<TypeCorrectAnswersEvent, TypeCorrectAnswersState> {
  final RosAviaTestRepository _rosAviaTestRepository;

  TypeCorrectAnswersBloc({required RosAviaTestRepository rosAviaTestRepository})
      : _rosAviaTestRepository = rosAviaTestRepository,
        super(const LoadingTypeCorrectAnswersState()) {
    on<TypeCorrectAnswersEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetTypeCorrectAnswersEvent event, Emitter<TypeCorrectAnswersState> emit) async {
    emit(const LoadingTypeCorrectAnswersState());

    final response = await _rosAviaTestRepository.fetchTypeCorrectAnswer();
    response.fold(
      (l) {
        emit(
          ErrorTypeCorrectAnswersState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessTypeCorrectAnswersState(typeCorrectAnswer: r),
        );
      },
    );
  }
}
