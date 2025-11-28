import 'package:auto_route/annotations.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_event.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/payment/presentation/pages/payment_webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PaymentScreen extends StatelessWidget {
  final double amount;
  final String currency;
  final String description;
  final String? returnUrl;
  final String? cancelUrl;

  const PaymentScreen({super.key, required this.amount, this.currency = 'RUB', required this.description, this.returnUrl, this.cancelUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<PaymentBloc>()
        ..add(
          CreatePaymentEvent(amount: amount, currency: currency, description: description, returnUrl: returnUrl ?? 'aviapoint://payment/success', cancelUrl: cancelUrl ?? 'aviapoint://payment/cancel'),
        ),
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            success: (payment) {
              if (payment.paymentUrl != null) {
                // Открываем WebView с платежной формой
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PaymentWebViewScreen(
                      paymentUrl: payment.paymentUrl!,
                      onSuccess: () {
                        Navigator.of(context).pop(true);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж успешно выполнен'), backgroundColor: Colors.green));
                      },
                      onCancel: () {
                        Navigator.of(context).pop(false);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж отменен'), backgroundColor: Colors.orange));
                      },
                      onFailure: () {
                        Navigator.of(context).pop(false);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка при выполнении платежа'), backgroundColor: Colors.red));
                      },
                    ),
                  ),
                );
              }
            },
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка: $message'), backgroundColor: Colors.red));
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Оплата')),
          body: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('Инициализация...')),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (payment) => const Center(child: Text('Перенаправление на оплату...')),
                failure: (message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ошибка: $message'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<PaymentBloc>().add(CreatePaymentEvent(amount: amount, currency: currency, description: description, returnUrl: returnUrl, cancelUrl: cancelUrl));
                        },
                        child: const Text('Повторить'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
