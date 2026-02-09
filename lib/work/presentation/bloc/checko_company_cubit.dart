import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/company_short_info.dart';
import 'package:aviapoint/work/domain/repositories/checko_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checko_company_cubit.freezed.dart';

@freezed
class CheckoCompanyState with _$CheckoCompanyState {
  const factory CheckoCompanyState.initial() = InitialCheckoCompanyState;

  const factory CheckoCompanyState.loading() = LoadingCheckoCompanyState;

  const factory CheckoCompanyState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorCheckoCompanyState;

  const factory CheckoCompanyState.success({required CompanyShortInfo info}) = SuccessCheckoCompanyState;
}

class CheckoCompanyCubit extends Cubit<CheckoCompanyState> {
  final CheckoRepository repository;

  CheckoCompanyCubit({required this.repository}) : super(const CheckoCompanyState.initial());

  Future<void> fetchByInn(String inn) async {
    emit(const CheckoCompanyState.loading());

    final result = await repository.getCompanyByInn(inn);

    result.fold((failure) => emit(_mapError(failure)), (info) => emit(CheckoCompanyState.success(info: info)));
  }

  void reset() => emit(const CheckoCompanyState.initial());

  CheckoCompanyState _mapError(Failure failure) {
    return CheckoCompanyState.error(
      errorFromApi: failure.message,
      errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}
