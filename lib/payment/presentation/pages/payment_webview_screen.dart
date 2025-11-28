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
    // ЮKassa может вернуть на returnUrl или cancelUrl
    if (url.contains('payment/success') || url.contains('payment_status=succeeded')) {
      widget.onSuccess?.call();
      Navigator.of(context).pop(true);
    } else if (url.contains('payment/cancel') || url.contains('payment_status=canceled')) {
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
