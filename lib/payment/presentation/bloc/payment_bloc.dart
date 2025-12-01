import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_event.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository _paymentRepository;

  PaymentBloc({required PaymentRepository paymentRepository}) : _paymentRepository = paymentRepository, super(const PaymentState.initial()) {
    on<CreatePaymentEvent>(_onCreatePayment);
    on<CheckPaymentStatusEvent>(_onCheckPaymentStatus);
    on<ResetPaymentEvent>(_onReset);
  }

  Future<void> _onCreatePayment(CreatePaymentEvent event, Emitter<PaymentState> emit) async {
    emit(const PaymentState.loading());
    try {
      final payment = await _paymentRepository.createPayment(
        amount: event.amount,
        currency: event.currency,
        description: event.description,
        userId: event.userId,
        subscriptionType: event.subscriptionType,
        periodDays: event.periodDays,
        customerPhone: event.customerPhone,
        returnUrl: event.returnUrl,
        cancelUrl: event.cancelUrl,
      );
      emit(PaymentState.success(payment));
    } catch (e) {
      emit(PaymentState.failure(e.toString()));
    }
  }

  Future<void> _onCheckPaymentStatus(CheckPaymentStatusEvent event, Emitter<PaymentState> emit) async {
    emit(const PaymentState.loading());
    try {
      final payment = await _paymentRepository.getPaymentStatus(event.paymentId);
      emit(PaymentState.success(payment));
    } catch (e) {
      emit(PaymentState.failure(e.toString()));
    }
  }

  void _onReset(ResetPaymentEvent event, Emitter<PaymentState> emit) {
    emit(const PaymentState.initial());
  }
}
