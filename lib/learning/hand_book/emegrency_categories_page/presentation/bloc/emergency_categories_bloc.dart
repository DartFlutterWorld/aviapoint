import 'package:aviapoint/learning/hand_book/emegrency_categories_page/domain/entities/emergency_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_categories_bloc.freezed.dart';

@freezed
abstract class EmergencyCategoriesEvent with _$EmergencyCategoriesEvent {
  const EmergencyCategoriesEvent._();

  const factory EmergencyCategoriesEvent.get() = GetEmergencyCategoriesEvent;
  // const factory EmergencyCategoriesEvent.getById(int id) = GetByIdEmergencyCategoriesEvent;
}

@freezed
abstract class EmergencyCategoriesState with _$EmergencyCategoriesState {
  const EmergencyCategoriesState._();
  const factory EmergencyCategoriesState.loading() = LoadingEmergencyCategoriesState;
  const factory EmergencyCategoriesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorEmergencyCategoriesState;
  const factory EmergencyCategoriesState.success({required List<EmergencyCategoriesEntity> emergencyCategories}) = SuccessEmergencyCategoriesState;
  // const factory EmergencyCategoriesState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdEmergencyCategoriesState;
  // const factory EmergencyCategoriesState.done() = DoneEmergencyCategoriesState;
}

class EmergencyCategoriesBloc extends Bloc<EmergencyCategoriesEvent, EmergencyCategoriesState> {
  final HandBookRepository _handBookRepository;

  EmergencyCategoriesBloc({required HandBookRepository handBookRepository})
      : _handBookRepository = handBookRepository,
        super(const LoadingEmergencyCategoriesState()) {
    on<EmergencyCategoriesEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetEmergencyCategoriesEvent event, Emitter<EmergencyCategoriesState> emit) async {
    emit(const LoadingEmergencyCategoriesState());

    final response = await _handBookRepository.fetchEmergencyCategories();
    response.fold(
      (l) {
        emit(
          ErrorEmergencyCategoriesState(
            errorForUser: 'Что-то пошло не так! Попробуйте позже..',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessEmergencyCategoriesState(emergencyCategories: r),
        );
      },
    );
  }
}
