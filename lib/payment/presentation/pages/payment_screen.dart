import 'payment_screen_stub.dart' if (dart.library.html) 'payment_screen_web.dart' as html;

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_event.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/payment/presentation/pages/payment_webview_screen.dart';
import 'package:aviapoint/payment/utils/payment_url_helper.dart';
import 'package:aviapoint/payment/utils/payment_storage_helper.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PaymentScreen extends StatefulWidget {
  final double amount;
  final String currency;
  final String description;
  final int subscriptionTypeId;
  final int periodDays;
  final String? returnUrl;
  final String? returnRouteSource; // Источник, откуда пришел пользователь (например, 'profile' или 'testing_mode')

  const PaymentScreen({
    super.key,
    required this.amount,
    this.currency = 'RUB',
    required this.description,
    required this.subscriptionTypeId,
    this.periodDays = 365,
    this.returnUrl,
    this.returnRouteSource,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _paymentId;

  @override
  Widget build(BuildContext context) {
    // Используем существующий PaymentBloc из app.dart
    final paymentBloc = context.read<PaymentBloc>();

    // Получаем userId и phone из ProfileBloc
    final profileState = context.read<ProfileBloc>().state;
    int? userId;
    String? customerPhone;
    profileState.maybeWhen(
      success: (profile) {
        userId = profile.id;
        customerPhone = profile.phone;
      },
      orElse: () {
        userId = null;
        customerPhone = null;
      },
    );

    // Добавляем событие только если блок не закрыт и userId получен
    if (!paymentBloc.isClosed && userId != null && _paymentId == null) {
      paymentBloc.add(
        CreatePaymentEvent(
          amount: widget.amount,
          currency: widget.currency,
          description: widget.description,
          userId: userId!,
          subscriptionTypeId: widget.subscriptionTypeId,
          periodDays: widget.periodDays,
          customerPhone: customerPhone,
          returnUrl: widget.returnUrl ?? PaymentUrlHelper.buildReturnUrl(source: widget.returnRouteSource),
        ),
      );
    } else if (userId == null) {
      // Если userId не получен, показываем ошибку
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка: не удалось получить данные пользователя'), backgroundColor: Colors.red));
        }
      });
    }

    return BlocProvider.value(
      value: paymentBloc,
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            success: (payment) async {
              // Сохраняем paymentId при создании платежа
              if (_paymentId == null && payment.id.isNotEmpty) {
                setState(() {
                  _paymentId = payment.id;
                });
              }

              // Если платеж успешен (succeeded), возвращаемся на исходный экран
              if (payment.isSucceeded && _paymentId != null && payment.id == _paymentId) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж успешно выполнен'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
                  // Закрываем экран оплаты
                  Navigator.of(context).pop();
                  // Возвращаемся на исходный экран, если указан
                  if (context.mounted && widget.returnRouteSource != null) {
                    if (widget.returnRouteSource == 'profile') {
                      context.router.push(const ProfileNavigationRoute());
                    } else if (widget.returnRouteSource == 'testing_mode') {
                      context.router.push(const TestingModeRoute());
                    }
                    // Если returnRouteSource не распознан, просто закрываем экран (pop уже вызван выше)
                  }
                }
                return;
              }

              // Если платеж отменен (canceled), показываем сообщение
              if (payment.isCanceled && _paymentId != null && payment.id == _paymentId) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж отменен'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
                }
                return;
              }

              if (payment.paymentUrl != null) {
                if (kIsWeb) {
                  // На веб открываем платежную форму в той же вкладке
                  // После оплаты ЮKassa редиректит на return_url
                  // Важно: ЮKassa всегда возвращает на return_url, независимо от результата
                  // Статус платежа нужно проверять через API после возврата
                  try {
                    // Сохраняем paymentId для проверки статуса после возврата
                    if (_paymentId == null && payment.id.isNotEmpty) {
                      setState(() {
                        _paymentId = payment.id;
                      });
                      // Сохраняем payment_id в localStorage перед редиректом
                      await PaymentStorageHelper.savePaymentId(payment.id);
                    }

                    // Используем прямой редирект через window.location для веб
                    // Это гарантирует, что пользователь останется в той же вкладке
                    html.setWindowLocationHref(payment.paymentUrl!);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка: $e'), backgroundColor: Colors.red));
                    }
                  }
                } else {
                  // На мобильных платформах используем WebView
                  final result = await Navigator.of(context).push<bool>(
                    MaterialPageRoute<bool>(
                      builder: (_) => PaymentWebViewScreen(
                        paymentUrl: payment.paymentUrl!,
                        onSuccess: () {
                          Navigator.of(context).pop(true);
                        },
                        onCancel: () {
                          Navigator.of(context).pop(false);
                        },
                        onFailure: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ),
                  );

                  // Если пользователь вернулся из WebView, проверяем статус платежа один раз
                  if (result == true && context.mounted && _paymentId != null) {
                    try {
                      // Проверяем статус платежа через API
                      final paymentBloc = context.read<PaymentBloc>();
                      if (!paymentBloc.isClosed) {
                        paymentBloc.add(CheckPaymentStatusEvent(_paymentId!));
                      }
                    } catch (e) {
                      print('Ошибка при проверке статуса платежа: $e');
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('Не удалось проверить статус платежа'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
                      }
                    }
                  } else if (result == false && context.mounted) {
                    // Пользователь отменил оплату в WebView
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж отменен'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
                  }
                }
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
                          // Получаем userId из ProfileBloc
                          final profileState = context.read<ProfileBloc>().state;
                          profileState.maybeWhen(
                            success: (profile) {
                              context.read<PaymentBloc>().add(
                                CreatePaymentEvent(
                                  amount: widget.amount,
                                  currency: widget.currency,
                                  description: widget.description,
                                  userId: profile.id,
                                  subscriptionTypeId: widget.subscriptionTypeId,
                                  periodDays: widget.periodDays,
                                  customerPhone: profile.phone,
                                  returnUrl: widget.returnUrl,
                                ),
                              );
                            },
                            orElse: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка: не удалось получить данные пользователя'), backgroundColor: Colors.red));
                            },
                          );
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
