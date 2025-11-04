import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_bloc.freezed.dart';

@freezed
abstract class CategoriesEvent with _$CategoriesEvent {
  const CategoriesEvent._();

  const factory CategoriesEvent.get({required int typeSsertificatesId}) = GetCategoriesEvent;
  // const factory CategoriesEvent.getById(int id) = GetByIdCategoriesEvent;
}

@freezed
abstract class CategoriesState with _$CategoriesState {
  const CategoriesState._();
  const factory CategoriesState.loading() = LoadingCategoriesState;
  const factory CategoriesState.error({String? errorFromApi, required String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage}) = ErrorCategoriesState;
  const factory CategoriesState.success({required List<RosAviaTestCategoryEntity> categories}) = SuccessCategoriesState;
  // const factory CategoriesState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdCategoriesState;
  // const factory CategoriesState.done() = DoneCategoriesState;
}

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final RosAviaTestRepository _rosAviaTestRepository;

  CategoriesBloc({required RosAviaTestRepository rosAviaTestRepository}) : _rosAviaTestRepository = rosAviaTestRepository, super(const LoadingCategoriesState()) {
    on<CategoriesEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(const LoadingCategoriesState());

    final response = await _rosAviaTestRepository.fetchRosAviaTestCategory(event.typeSsertificatesId);
    response.fold(
      (l) {
        emit(
          ErrorCategoriesState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessCategoriesState(categories: r));
      },
    );
  }
}
