import 'dart:async';
import 'payment_screen_stub.dart' if (dart.library.html) 'payment_screen_web.dart' as html;

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/payment/domain/entities/subscription_type.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_bloc.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_event.dart';
import 'package:aviapoint/payment/presentation/bloc/payment_state.dart';
import 'package:aviapoint/payment/presentation/pages/payment_webview_screen.dart';
import 'package:aviapoint/payment/utils/payment_url_helper.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PaymentScreen extends StatefulWidget {
  final double amount;
  final String currency;
  final String description;
  final SubscriptionType subscriptionType;
  final int periodDays;
  final String? returnUrl;
  final String? cancelUrl;

  const PaymentScreen({
    super.key,
    required this.amount,
    this.currency = 'RUB',
    required this.description,
    this.subscriptionType = SubscriptionType.yearly,
    this.periodDays = 365,
    this.returnUrl,
    this.cancelUrl,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _paymentId;
  bool _isCheckingStatus = false;
  Timer? _pollingTimer;
  DateTime? _pollingStartTime;
  static const Duration _maxPollingDuration = Duration(minutes: 10); // Максимальное время polling

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkPaymentStatusOnce(String paymentId) async {
    if (!mounted) return;

    final paymentBloc = context.read<PaymentBloc>();
    if (paymentBloc.isClosed) return;

    // Проверяем статус платежа один раз
    paymentBloc.add(CheckPaymentStatusEvent(paymentId));
  }

  void _startPolling(String paymentId) {
    if (_isCheckingStatus) return; // Уже проверяем статус

    setState(() {
      _isCheckingStatus = true;
      _pollingStartTime = DateTime.now();
    });

    final paymentBloc = context.read<PaymentBloc>();

    // Начинаем polling - проверяем статус каждые 3 секунды
    _pollingTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      // Проверяем, не истекло ли максимальное время
      if (_pollingStartTime != null && DateTime.now().difference(_pollingStartTime!) > _maxPollingDuration) {
        timer.cancel();
        if (mounted) {
          setState(() {
            _isCheckingStatus = false;
          });
        }
        return;
      }

      if (!mounted || paymentBloc.isClosed) {
        timer.cancel();
        if (mounted) {
          setState(() {
            _isCheckingStatus = false;
          });
        }
        return;
      }

      // Проверяем статус платежа
      await _checkPaymentStatusOnce(paymentId);
    });
  }

  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    if (mounted) {
      setState(() {
        _isCheckingStatus = false;
        _pollingStartTime = null;
      });
    }
  }

  Future<void> _handlePaymentSuccess(String paymentId) async {
    // Начинаем polling для проверки статуса
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Проверяем статус платежа...'), backgroundColor: Colors.blue, duration: Duration(seconds: 2)));

    // Начинаем периодическую проверку статуса
    _startPolling(paymentId);
  }

  @override
  void initState() {
    super.initState();

    // На веб слушаем события фокуса окна для проверки статуса при возврате
    if (kIsWeb) {
      // Проверяем статус при возврате на страницу (когда окно получает фокус)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Используем Visibility API для веб
        // Это будет работать только если браузер поддерживает Page Visibility API
      });
    }
  }

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
          subscriptionType: widget.subscriptionType,
          periodDays: widget.periodDays,
          customerPhone: customerPhone,
          returnUrl: widget.returnUrl ?? PaymentUrlHelper.buildReturnUrl(),
          cancelUrl: widget.cancelUrl ?? PaymentUrlHelper.buildCancelUrl(),
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

              // Если платеж успешен (succeeded), переходим на профиль
              if (payment.isSucceeded && _paymentId != null && payment.id == _paymentId) {
                // Останавливаем polling
                _stopPolling();

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж успешно выполнен'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
                  // Закрываем экран оплаты
                  Navigator.of(context).pop();
                  // Переходим на экран профиля
                  if (context.mounted) {
                    context.router.push(const ProfileNavigationRoute());
                  }
                }
                return;
              }

              // Если платеж отменен, останавливаем polling
              if (payment.isCanceled && _paymentId != null && payment.id == _paymentId) {
                _stopPolling();
              }

              if (payment.paymentUrl != null) {
                if (kIsWeb) {
                  // На веб открываем платежную форму в той же вкладке
                  // После оплаты ЮKassa редиректит на /payments/return, который редиректит на профиль
                  try {
                    // Сохраняем paymentId для проверки статуса
                    if (_paymentId == null && payment.id.isNotEmpty) {
                      setState(() {
                        _paymentId = payment.id;
                      });
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

                  // Если пользователь вернулся из WebView с успехом, проверяем статус платежа
                  if (result == true && context.mounted && _paymentId != null) {
                    await _handlePaymentSuccess(_paymentId!);
                  } else if (result == false && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Платеж отменен'), backgroundColor: Colors.orange));
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
                                  subscriptionType: widget.subscriptionType,
                                  periodDays: widget.periodDays,
                                  customerPhone: profile.phone,
                                  returnUrl: widget.returnUrl,
                                  cancelUrl: widget.cancelUrl,
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
