import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preflight_inspection_check_list_by_category_bloc.freezed.dart';

@freezed
abstract class PreflightInspectionCheckListByCategoryEvent with _$PreflightInspectionCheckListByCategoryEvent {
  const PreflightInspectionCheckListByCategoryEvent._();

  const factory PreflightInspectionCheckListByCategoryEvent.get(String preflihgtInspectionCategoryId) =
      GetPreflightInspectionCheckListByCategoryEvent;
  const factory PreflightInspectionCheckListByCategoryEvent.initial() =
      InitialPreflightInspectionCheckListByCategoryEvent;
  // const factory PreflightInspectionCheckListByCategoryEvent.getById(int id) = GetByIdPreflightInspectionCheckListByCategoryEvent;
}

@freezed
abstract class PreflightInspectionCheckListByCategoryState with _$PreflightInspectionCheckListByCategoryState {
  const PreflightInspectionCheckListByCategoryState._();
  const factory PreflightInspectionCheckListByCategoryState.loading() =
      LoadingPreflightInspectionCheckListByCategoryState;
  const factory PreflightInspectionCheckListByCategoryState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorPreflightInspectionCheckListByCategoryState;
  const factory PreflightInspectionCheckListByCategoryState.success({
    required List<PreflightInspectionCheckListEntity> preflightInspectionCheckListByCategory,
    required int index,
  }) = SuccessPreflightInspectionCheckListByCategoryState;
  // const factory PreflightInspectionCheckListByCategoryState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdPreflightInspectionCheckListByCategoryState;
  const factory PreflightInspectionCheckListByCategoryState.initial() =
      InitialPreflightInspectionCheckListByCategoryState;
}

class PreflightInspectionCheckListByCategoryBloc
    extends Bloc<PreflightInspectionCheckListByCategoryEvent, PreflightInspectionCheckListByCategoryState> {
  final HandBookRepository _handBookRepository;
  final PreflightCheckedCubit _preflightCheckedCubit;

  PreflightInspectionCheckListByCategoryBloc({
    required HandBookRepository handBookRepository,
    required PreflightCheckedCubit preflightCheckedCubit,
  }) : _handBookRepository = handBookRepository,
       _preflightCheckedCubit = preflightCheckedCubit,
       super(const InitialPreflightInspectionCheckListByCategoryState()) {
    on<PreflightInspectionCheckListByCategoryEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        initial: (event) => _initial(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }
  Future<void> _initial(
    InitialPreflightInspectionCheckListByCategoryEvent event,
    Emitter<PreflightInspectionCheckListByCategoryState> emit,
  ) async {
    emit(const InitialPreflightInspectionCheckListByCategoryState());
  }

  Future<void> _get(
    GetPreflightInspectionCheckListByCategoryEvent event,
    Emitter<PreflightInspectionCheckListByCategoryState> emit,
  ) async {
    emit(const LoadingPreflightInspectionCheckListByCategoryState());

    final response = await _handBookRepository.fetchPreflightInspectionCheckListByCategory(
      event.preflihgtInspectionCategoryId,
    );
    response.fold(
      (l) {
        emit(
          ErrorPreflightInspectionCheckListByCategoryState(
            errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        // Если какие то проверки уже были проведены то при заходе в категории начинаем
        // показывать проверки с следующей (после последней)

        final checkProgressByIdCategory = _preflightCheckedCubit.state.checkProgress.firstWhereOrNull(
          (e) => e.idCategory == r.first.preflightInspectionCategoryId,
        );
        ;
        emit(
          SuccessPreflightInspectionCheckListByCategoryState(
            preflightInspectionCheckListByCategory: r,
            index: checkProgressByIdCategory?.checkedIds.last ?? 0,
          ),
        );
      },
    );
  }
}
