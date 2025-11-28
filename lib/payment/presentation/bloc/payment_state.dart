import 'package:aviapoint/payment/domain/entities/payment_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = PaymentInitial;
  const factory PaymentState.loading() = PaymentLoading;
  const factory PaymentState.success(PaymentEntity payment) = PaymentSuccess;
  const factory PaymentState.failure(String message) = PaymentFailure;
}
