import 'package:aviapoint/on_the_way/domain/entities/flight_question_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questions_bloc.freezed.dart';

// События
abstract class QuestionsEvent {}

class GetQuestionsByFlightIdEvent extends QuestionsEvent {
  final int flightId;

  GetQuestionsByFlightIdEvent({required this.flightId});
}

class CreateQuestionEvent extends QuestionsEvent {
  final int flightId;
  final String questionText;

  CreateQuestionEvent({
    required this.flightId,
    required this.questionText,
  });
}

class UpdateQuestionEvent extends QuestionsEvent {
  final int flightId;
  final int questionId;
  final String? questionText;
  final String? answerText;

  UpdateQuestionEvent({
    required this.flightId,
    required this.questionId,
    this.questionText,
    this.answerText,
  });
}

class DeleteQuestionEvent extends QuestionsEvent {
  final int flightId;
  final int questionId;

  DeleteQuestionEvent({
    required this.flightId,
    required this.questionId,
  });
}

@freezed
class QuestionsState with _$QuestionsState {
  const QuestionsState._();

  const factory QuestionsState.initial() = InitialQuestionsState;
  const factory QuestionsState.loading() = LoadingQuestionsState;
  const factory QuestionsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorQuestionsState;
  const factory QuestionsState.success({required List<FlightQuestionEntity> questions}) = SuccessQuestionsState;
  const factory QuestionsState.questionCreated({required FlightQuestionEntity question}) = QuestionCreatedState;
  const factory QuestionsState.questionUpdated({required FlightQuestionEntity question}) = QuestionUpdatedState;
  const factory QuestionsState.questionDeleted() = QuestionDeletedState;
}

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final OnTheWayRepository _onTheWayRepository;

  QuestionsBloc({required OnTheWayRepository onTheWayRepository})
    : _onTheWayRepository = onTheWayRepository,
      super(const QuestionsState.initial()) {
    on<GetQuestionsByFlightIdEvent>(_handleGetQuestionsByFlightId);
    on<CreateQuestionEvent>(_handleCreateQuestion);
    on<UpdateQuestionEvent>(_handleUpdateQuestion);
    on<DeleteQuestionEvent>(_handleDeleteQuestion);
  }

  Future<void> _handleGetQuestionsByFlightId(GetQuestionsByFlightIdEvent event, Emitter<QuestionsState> emit) async {
    emit(QuestionsState.loading());

    final response = await _onTheWayRepository.getQuestionsByFlightId(event.flightId);

    response.fold(
      (l) {
        emit(
          QuestionsState.error(
            errorForUser: 'Не удалось загрузить вопросы',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(QuestionsState.success(questions: r));
      },
    );
  }

  Future<void> _handleCreateQuestion(CreateQuestionEvent event, Emitter<QuestionsState> emit) async {
    emit(QuestionsState.loading());

    final response = await _onTheWayRepository.createQuestion(
      flightId: event.flightId,
      questionText: event.questionText,
    );

    response.fold(
      (l) {
        emit(
          QuestionsState.error(
            errorForUser: 'Не удалось создать вопрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(QuestionsState.questionCreated(question: r));
        // После создания вопроса перезагружаем список
        add(GetQuestionsByFlightIdEvent(flightId: event.flightId));
      },
    );
  }

  Future<void> _handleUpdateQuestion(UpdateQuestionEvent event, Emitter<QuestionsState> emit) async {
    emit(QuestionsState.loading());

    final response = await _onTheWayRepository.updateQuestion(
      flightId: event.flightId,
      questionId: event.questionId,
      questionText: event.questionText,
      answerText: event.answerText,
    );

    response.fold(
      (l) {
        emit(
          QuestionsState.error(
            errorForUser: 'Не удалось обновить вопрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(QuestionsState.questionUpdated(question: r));
        // После обновления вопроса перезагружаем список
        add(GetQuestionsByFlightIdEvent(flightId: event.flightId));
      },
    );
  }

  Future<void> _handleDeleteQuestion(DeleteQuestionEvent event, Emitter<QuestionsState> emit) async {
    emit(QuestionsState.loading());

    final response = await _onTheWayRepository.deleteQuestion(
      flightId: event.flightId,
      questionId: event.questionId,
    );

    response.fold(
      (l) {
        emit(
          QuestionsState.error(
            errorForUser: 'Не удалось удалить вопрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(QuestionsState.questionDeleted());
        // После удаления вопроса перезагружаем список
        add(GetQuestionsByFlightIdEvent(flightId: event.flightId));
      },
    );
  }
}

