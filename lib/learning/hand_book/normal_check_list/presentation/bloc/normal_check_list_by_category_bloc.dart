import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_check_list_by_category_bloc.freezed.dart';

@freezed
abstract class NormalCheckListByCategoryEvent with _$NormalCheckListByCategoryEvent {
  const NormalCheckListByCategoryEvent._();

  const factory NormalCheckListByCategoryEvent.get(String normalCategoryId) = GetNormalCheckListByCategoryEvent;
  const factory NormalCheckListByCategoryEvent.initial() = InitialNormalCheckListByCategoryEvent;
  // const factory NormalCheckListByCategoryEvent.getById(int id) = GetByIdNormalCheckListByCategoryEvent;
}

@freezed
abstract class NormalCheckListByCategoryState with _$NormalCheckListByCategoryState {
  const NormalCheckListByCategoryState._();
  const factory NormalCheckListByCategoryState.loading() = LoadingNormalCheckListByCategoryState;
  const factory NormalCheckListByCategoryState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorNormalCheckListByCategoryState;
  const factory NormalCheckListByCategoryState.success({required List<NormalCheckListEntity> normalCheckListByCategory, required int index}) = SuccessNormalCheckListByCategoryState;
  // const factory NormalCheckListByCategoryState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdNormalCheckListByCategoryState;
  const factory NormalCheckListByCategoryState.initial() = InitialNormalCheckListByCategoryState;
}

class NormalCheckListByCategoryBloc extends Bloc<NormalCheckListByCategoryEvent, NormalCheckListByCategoryState> {
  final HandBookRepository _handBookRepository;
  final NormalCheckedCubit _normalCheckedCubit;

  NormalCheckListByCategoryBloc({required HandBookRepository handBookRepository, required NormalCheckedCubit normalCheckedCubit})
      : _handBookRepository = handBookRepository,
        _normalCheckedCubit = normalCheckedCubit,
        super(const InitialNormalCheckListByCategoryState()) {
    on<NormalCheckListByCategoryEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        initial: (event) => _initial(event, emitter),
        // getById: (event) => _getById(event, emitter),
      ),
    );
  }
  Future<void> _initial(InitialNormalCheckListByCategoryEvent event, Emitter<NormalCheckListByCategoryState> emit) async {
    emit(const InitialNormalCheckListByCategoryState());
  }

  Future<void> _get(GetNormalCheckListByCategoryEvent event, Emitter<NormalCheckListByCategoryState> emit) async {
    emit(const LoadingNormalCheckListByCategoryState());

    final response = await _handBookRepository.fetchNormalCheckListByCategory(event.normalCategoryId);
    response.fold(
      (l) {
        emit(
          ErrorNormalCheckListByCategoryState(
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

        final checkProgressByIdCategory = _normalCheckedCubit.state.checkProgress.firstWhereOrNull(
          (e) => e.idCategory == r.first.normalCategoryId,
        );
        ;
        emit(
          SuccessNormalCheckListByCategoryState(normalCheckListByCategory: r, index: checkProgressByIdCategory?.checkedIds.last ?? 0),
        );
      },
    );
  }
}
