import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_bloc.freezed.dart';

@freezed
abstract class AppSettingsEvent with _$AppSettingsEvent {
  const AppSettingsEvent._();

  const factory AppSettingsEvent.set() = SetAppSettingsEvent;
}

@freezed
abstract class AppSettingsState with _$AppSettingsState {
  const AppSettingsState._();
  const factory AppSettingsState.loading() = LoadingAppSettingsState;
  const factory AppSettingsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorAppSettingsState;
  const factory AppSettingsState.success() = SuccessAppSettingsState;
  // const factory AppSettingsState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdAppSettingsState;
  // const factory AppSettingsState.done() = DoneAppSettingsState;
}

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final AppDb _db;
  final RosAviaTestCubit _rosAviaTestCubit;

  AppSettingsBloc({required RosAviaTestCubit rosAviaTestCubit, required AppDb db})
    : _rosAviaTestCubit = rosAviaTestCubit,
      _db = db,
      super(const LoadingAppSettingsState()) {
    on<AppSettingsEvent>((event, emitter) => event.map(set: (event) => _set(event, emitter)));
  }

  Future<void> _set(SetAppSettingsEvent event, Emitter<AppSettingsState> emit) async {
    // final s = await _db.getSettingsForCertificate(certificateTypeId: 1);
    // if (s != null) {
    //   // Так как в таблице настроек нет title и image, используем уже установленное значение из кубита
    //   final current = _rosAviaTestCubit.state.typeSertificate;
    //   _rosAviaTestCubit.setTypeCertificate(TypeSertificatesEntity(id: s.certificateTypeId, title: current.title, image: current.image));
    //   // emit(s);
    // } else {}
  }
}
