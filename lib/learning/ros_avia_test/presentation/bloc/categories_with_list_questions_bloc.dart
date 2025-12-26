import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_with_list_questions_bloc.freezed.dart';

@freezed
abstract class CategoriesWithListQuestionsEvent with _$CategoriesWithListQuestionsEvent {
  const CategoriesWithListQuestionsEvent._();

  const factory CategoriesWithListQuestionsEvent.get({required int typeSsertificatesId}) =
      GetCategoriesWithListQuestionsEvent;
  // const factory CategoriesWithListQuestionsEvent.getById(int id) = GetByIdCategoriesWithListQuestionsEvent;
}

@freezed
abstract class CategoriesWithListQuestionsState with _$CategoriesWithListQuestionsState {
  const CategoriesWithListQuestionsState._();
  const factory CategoriesWithListQuestionsState.loading() = LoadingCategoriesWithListQuestionsState;
  const factory CategoriesWithListQuestionsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorCategoriesWithListQuestionsState;
  const factory CategoriesWithListQuestionsState.success({
    required List<RosAviaTestCategoryWithQuestionsEntity> categoryWithQuestions,
  }) = SuccessCategoriesWithListQuestionsState;
  // const factory CategoriesWithListQuestionsState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdCategoriesWithListQuestionsState;
  // const factory CategoriesWithListQuestionsState.done() = DoneCategoriesWithListQuestionsState;
}

class CategoriesWithListQuestionsBloc extends Bloc<CategoriesWithListQuestionsEvent, CategoriesWithListQuestionsState> {
  final RosAviaTestRepository _rosAviaTestRepository;

  CategoriesWithListQuestionsBloc({required RosAviaTestRepository rosAviaTestRepository})
    : _rosAviaTestRepository = rosAviaTestRepository,
      super(const LoadingCategoriesWithListQuestionsState()) {
    on<CategoriesWithListQuestionsEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetCategoriesWithListQuestionsEvent event, Emitter<CategoriesWithListQuestionsState> emit) async {
    emit(const LoadingCategoriesWithListQuestionsState());

    final response = await _rosAviaTestRepository.fetchRosAviaTestCategoryWithQuestions(event.typeSsertificatesId);
    response.fold(
      (l) {
        emit(
          ErrorCategoriesWithListQuestionsState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessCategoriesWithListQuestionsState(categoryWithQuestions: r));
      },
    );
  }
}
