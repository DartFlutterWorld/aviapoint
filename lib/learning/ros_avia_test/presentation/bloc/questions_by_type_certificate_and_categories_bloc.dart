import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questions_by_type_certificate_and_categories_bloc.freezed.dart';

@freezed
abstract class QuestionsByTypeCertificateAndCategories with _$QuestionsByTypeCertificateAndCategories {
  const QuestionsByTypeCertificateAndCategories._();

  const factory QuestionsByTypeCertificateAndCategories.get({required int typeSsertificatesId}) =
      GetQuestionsByTypeCertificateAndCategories;
}

@freezed
abstract class QuestionsByTypeCertificateAndCategoriesState with _$QuestionsByTypeCertificateAndCategoriesState {
  const QuestionsByTypeCertificateAndCategoriesState._();
  const factory QuestionsByTypeCertificateAndCategoriesState.loading() =
      LoadingQuestionsByTypeCertificateAndCategoriesState;
  const factory QuestionsByTypeCertificateAndCategoriesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorQuestionsByTypeCertificateAndCategoriesState;
  const factory QuestionsByTypeCertificateAndCategoriesState.success({
    required List<QuestionWithAnswersEntity> questionsWithAnswers,
    required bool buttonHint,
  }) = SuccessQuestionsByTypeCertificateAndCategoriesState;
}

class QuestionsByTypeCertificateAndCategoriesBloc
    extends Bloc<QuestionsByTypeCertificateAndCategories, QuestionsByTypeCertificateAndCategoriesState> {
  final RosAviaTestRepository _rosAviaTestRepository;

  QuestionsByTypeCertificateAndCategoriesBloc({required RosAviaTestRepository rosAviaTestRepository})
    : _rosAviaTestRepository = rosAviaTestRepository,
      super(const LoadingQuestionsByTypeCertificateAndCategoriesState()) {
    on<QuestionsByTypeCertificateAndCategories>((event, emitter) => event.map(get: (event) => _get(event, emitter)));
  }

  Future<void> _get(
    GetQuestionsByTypeCertificateAndCategories event,
    Emitter<QuestionsByTypeCertificateAndCategoriesState> emit,
  ) async {
    emit(const LoadingQuestionsByTypeCertificateAndCategoriesState());
    final db = getIt<AppDb>();

    final s = await db.getSettingsForCertificate(certificateTypeId: event.typeSsertificatesId);

    final response = await _rosAviaTestRepository.fetchQuestionsWithAnswersByCategoryAndTypeCertificate(
      typeSsertificatesId: event.typeSsertificatesId,
      categoryIds: s?.selectedCategoryIds ?? {},
      mixAnswers: s?.mixAnswers ?? false,
      mixQuestions: s?.mixQuestions ?? false,
    );

    response.fold(
      (l) {
        emit(
          ErrorQuestionsByTypeCertificateAndCategoriesState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessQuestionsByTypeCertificateAndCategoriesState(
            questionsWithAnswers: r,
            buttonHint: s?.buttonHint ?? false,
          ),
        );
      },
    );
  }
}
