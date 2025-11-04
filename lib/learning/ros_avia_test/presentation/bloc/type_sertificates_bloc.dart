import 'package:aviapoint/learning/hand_book/emegrency_categories_page/domain/entities/emergency_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_sertificates_bloc.freezed.dart';

@freezed
abstract class TypeSertificatesEvent with _$TypeSertificatesEvent {
  const TypeSertificatesEvent._();

  const factory TypeSertificatesEvent.get() = GetTypeSertificatesEvent;
  // const factory TypeSertificatesEvent.getById(int id) = GetByIdTypeSertificatesEvent;
}

@freezed
abstract class TypeSertificatesState with _$TypeSertificatesState {
  const TypeSertificatesState._();
  const factory TypeSertificatesState.loading() = LoadingTypeSertificatesState;
  const factory TypeSertificatesState.error({String? errorFromApi, required String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage}) = ErrorTypeSertificatesState;
  const factory TypeSertificatesState.success({required List<TypeSertificatesEntity> typeSertificates}) = SuccessTypeSertificatesState;
  // const factory TypeSertificatesState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdTypeSertificatesState;
  // const factory TypeSertificatesState.done() = DoneTypeSertificatesState;
}

class TypeSertificatesBloc extends Bloc<TypeSertificatesEvent, TypeSertificatesState> {
  final RosAviaTestRepository _rosAviaTestRepository;

  TypeSertificatesBloc({required RosAviaTestRepository rosAviaTestRepository}) : _rosAviaTestRepository = rosAviaTestRepository, super(const LoadingTypeSertificatesState()) {
    on<TypeSertificatesEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetTypeSertificatesEvent event, Emitter<TypeSertificatesState> emit) async {
    emit(const LoadingTypeSertificatesState());

    final response = await _rosAviaTestRepository.fetchTypeCertificates();
    response.fold(
      (l) {
        emit(
          ErrorTypeSertificatesState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessTypeSertificatesState(typeSertificates: r));
      },
    );
  }
}
