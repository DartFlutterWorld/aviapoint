import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentWebViewScreen extends StatefulWidget {
  final String paymentUrl;
  final String? returnRouteSource;
  final String? paymentId;
  final VoidCallback? onSuccess;
  final VoidCallback? onCancel;
  final VoidCallback? onFailure;

  const PaymentWebViewScreen({super.key, required this.paymentUrl, this.returnRouteSource, this.paymentId, this.onSuccess, this.onCancel, this.onFailure});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    print('🔵 PaymentWebViewScreen initState: paymentUrl=${widget.paymentUrl}');
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('🔵 WebView onPageStarted: $url');
            setState(() {
              _isLoading = true;
            });
            _handleUrl(url);
          },
          onPageFinished: (String url) {
            print('🔵 WebView onPageFinished: $url');
            setState(() {
              _isLoading = false;
            });
            _handleUrl(url);
          },
          onWebResourceError: (WebResourceError error) {
            print('❌ WebView error: ${error.description}, code: ${error.errorCode}');
            widget.onFailure?.call();
          },
        ),
      );

    // Загружаем URL
    print('🔵 Загружаем URL в WebView: ${widget.paymentUrl}');
    _controller.loadRequest(Uri.parse(widget.paymentUrl));
  }

  void _handleUrl(String url) {
    // Обработка возврата из платежной системы
    // ЮKassa всегда возвращает на return_url, независимо от результата
    // Статус платежа проверяется через API, а не через URL параметры
    final uri = Uri.parse(url);
    print('🔵 WebView URL изменен: $url');

    // Проверяем, является ли URL нашим return_url
    // Для мобильных return_url = https://avia-point.com/payments/return?source=...
    final isReturnUrl = uri.path.contains('/payments/return');

    // Если это наш return_url, значит пользователь вернулся с ЮКассы
    // Статус будет проверен через API в PaymentHelper
    if (isReturnUrl) {
      print('🔵 Обнаружен return_url, закрываем WebView для проверки статуса через API');
      print('   URL: $url');
      print('   returnRouteSource: ${widget.returnRouteSource}');
      // Возвращаем true, чтобы PaymentHelper проверил статус через API
      widget.onSuccess?.call();
      Navigator.of(context).pop(true);
      return;
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
