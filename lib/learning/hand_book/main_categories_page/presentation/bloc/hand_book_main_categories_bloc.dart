import 'package:aviapoint/core/presentation/widgets/app_state.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/domain/entities/hand_book_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/entities/video_for_students_entity.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/repositories/video_for_students_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hand_book_main_categories_bloc.freezed.dart';

@freezed
abstract class HandBookMainCategoriesEvent with _$HandBookMainCategoriesEvent {
  const HandBookMainCategoriesEvent._();

  const factory HandBookMainCategoriesEvent.get() = GetHandBookMainCategoriesEvent;
  // const factory HandBookMainCategoriesEvent.getById(int id) = GetByIdHandBookMainCategoriesEvent;
}

@freezed
abstract class HandBookMainCategoriesState with _$HandBookMainCategoriesState {
  const HandBookMainCategoriesState._();
  const factory HandBookMainCategoriesState.loading() = LoadingHandBookMainCategoriesState;
  const factory HandBookMainCategoriesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorHandBookMainCategoriesState;
  const factory HandBookMainCategoriesState.success({required List<HandBookMainCategoriesEntity> handBookCategories}) = SuccessHandBookMainCategoriesState;
  // const factory HandBookMainCategoriesState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdHandBookMainCategoriesState;
  // const factory HandBookMainCategoriesState.done() = DoneHandBookMainCategoriesState;
}

class HandBookMainCategoriesBloc extends Bloc<HandBookMainCategoriesEvent, HandBookMainCategoriesState> {
  final HandBookRepository _handBookRepository;

  HandBookMainCategoriesBloc({required HandBookRepository handBookRepository})
      : _handBookRepository = handBookRepository,
        super(const LoadingHandBookMainCategoriesState()) {
    on<HandBookMainCategoriesEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetHandBookMainCategoriesEvent event, Emitter<HandBookMainCategoriesState> emit) async {
    emit(const LoadingHandBookMainCategoriesState());

    final response = await _handBookRepository.fetchHandBookMainCategoties();
    response.fold(
      (l) {
        emit(
          ErrorHandBookMainCategoriesState(
            errorForUser: 'Что-то пошло не так! Попробуйте позже..',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessHandBookMainCategoriesState(handBookCategories: r),
        );
      },
    );
  }

  // Future<void> _getById(GetByIdHandBookMainCategoriesEvent event, Emitter<HandBookMainCategoriesState> emit) async {
  //   emit(const LoadingHandBookMainCategoriesState());

  //   final response = await _videoForStudentsRepository.fetchVideoById(event.id);

  //   response.fold(
  //     (l) {
  //       emit(
  //         ErrorHandBookMainCategoriesState(
  //           errorForUser: 'Что-то пошло не так! Попробуйте позже..',
  //           errorFromApi: l.message,
  //           statusCode: 'Код ошибки сервера: ${l.statusCode}',
  //           responseMessage: l.responseMessage,
  //         ),
  //       );
  //     },
  //     (r) {
  //       emit(
  //         SuccessByIdHandBookMainCategoriesState(videoForStudents: r),
  //       );
  //     },
  //   );
  // }
}
