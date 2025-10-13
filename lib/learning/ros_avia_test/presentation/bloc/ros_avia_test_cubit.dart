import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ros_avia_test_cubit.freezed.dart';

class RosAviaTestCubit extends Cubit<RosAviaTestState> {
  RosAviaTestCubit() : super(RosAviaTestState());

  void setTypeCertificate(TypeSertificatesEntity typeSertificate) {
    emit(state.copyWith(typeSertificate: typeSertificate));
  }

  void setTypeCertificateName(String typeCertificateName) {
    emit(state.copyWith(typeCertificateName: typeCertificateName));
  }

  // Добавляем id просмотренных сториков в лист
}

@freezed
class RosAviaTestState with _$RosAviaTestState {
  const factory RosAviaTestState({
    @Default('Частный пилот (самолет)') String typeCertificateName,
    @Default(TypeSertificatesEntity(id: 1, title: 'Частный пилот (самолет)', image: '')) TypeSertificatesEntity typeSertificate,
  }) = _RosAviaTestState;
}
