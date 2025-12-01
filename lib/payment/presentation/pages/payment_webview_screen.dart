import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentWebViewScreen extends StatefulWidget {
  final String paymentUrl;
  final VoidCallback? onSuccess;
  final VoidCallback? onCancel;
  final VoidCallback? onFailure;

  const PaymentWebViewScreen({super.key, required this.paymentUrl, this.onSuccess, this.onCancel, this.onFailure});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
            _handleUrl(url);
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            _handleUrl(url);
          },
          onWebResourceError: (WebResourceError error) {
            widget.onFailure?.call();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  void _handleUrl(String url) {
    // Обработка возврата из платежной системы
    // ЮKassa перенаправляет на returnUrl или cancelUrl (HTTP URL на бэкенде)
    // Бэкенд может передать payment_id в query string для быстрой проверки статуса
    final uri = Uri.parse(url);

    // Проверяем, является ли URL одним из наших return/cancel URL
    // ЮKassa может передать параметры:
    // - payment_id - ID платежа (если бэкенд добавил в return_url)
    // - payment_status - статус (если бэкенд добавил)
    final isReturnUrl = uri.path.contains('/payments/return') || uri.path.contains('/payments/success') || url.contains('payment_status=succeeded');

    final isCancelUrl = uri.path.contains('/payments/cancel') || url.contains('payment_status=canceled');

    if (isReturnUrl) {
      // Если есть payment_id в query string, можно использовать его для проверки статуса
      final paymentId = uri.queryParameters['payment_id'];
      if (paymentId != null) {
        print('🔵 Получен payment_id из return_url: $paymentId');
      }

      widget.onSuccess?.call();
      Navigator.of(context).pop(true);
    } else if (isCancelUrl) {
      widget.onCancel?.call();
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оплата'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            widget.onCancel?.call();
            Navigator.of(context).pop(false);
          },
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
