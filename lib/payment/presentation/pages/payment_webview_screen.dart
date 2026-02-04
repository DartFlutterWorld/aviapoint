import 'dart:io' show Platform;
import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    print('🔵 PaymentWebViewScreen initState: paymentUrl=${widget.paymentUrl}');

    // Получаем User-Agent для WebView (важно для работы с ЮКассой)
    // Используем Platform вместо Theme.of(context), так как context недоступен в initState
    // PaymentWebViewScreen используется только на мобильных, но для безопасности проверяем kIsWeb
    final userAgent = kIsWeb
        ? 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Safari/537.36'
        : (!kIsWeb && Platform.isAndroid
              ? 'Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36'
              : 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1');

    print('🔵 PaymentWebViewScreen: User-Agent = $userAgent');
    print('🔵 PaymentWebViewScreen: Platform = ${Platform.isAndroid ? "Android" : "iOS"}');

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(userAgent)
      ..setBackgroundColor(Colors.white)
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('🔵 WebView onPageStarted: $url');
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
            _handleUrl(url);
          },
          onPageFinished: (String url) {
            print('🔵 WebView onPageFinished: $url');
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
            _handleUrl(url);
          },
          onWebResourceError: (WebResourceError error) {
            print('❌ WebView error: ${error.description}');
            print('❌ WebView error code: ${error.errorCode}');
            print('❌ WebView error URL: ${error.url}');
            print('❌ WebView error type: ${error.errorType}');
            print('❌ WebView error failingUrl: ${error.url}');

            // Дополнительная диагностика для реальных устройств
            // ERROR_HOST_LOOKUP = -2 (не удалось найти хост)
            // ERROR_CONNECT = -6 (не удалось подключиться)
            // ERROR_TIMEOUT = -8 (таймаут)
            // ERROR_UNKNOWN = -1 (неизвестная ошибка)
            // ERROR_SSL = -11 (ошибка SSL)
            if (error.errorCode == -2) {
              print('❌ Ошибка: Не удалось найти хост. Проверьте интернет-соединение.');
            } else if (error.errorCode == -6) {
              print('❌ Ошибка: Не удалось подключиться. Возможна проблема с сетью или блокировка.');
            } else if (error.errorCode == -8) {
              print('❌ Ошибка: Таймаут подключения. Возможно, медленное соединение.');
            } else if (error.errorCode == -11) {
              print('❌ Ошибка SSL: Проблема с сертификатом. Возможно, устаревшая версия WebView.');
            }

            // Критические ошибки, при которых страница не загрузится
            if (error.errorCode == -2 || error.errorCode == -6 || error.errorCode == -8 || error.errorCode == -11) {
              print('❌ Критическая ошибка загрузки страницы');
              if (mounted) {
                setState(() {
                  _isLoading = false;
                  _errorMessage =
                      '${error.description}\n\nКод ошибки: ${error.errorCode}\n\nПопробуйте:\n1. Проверить интернет-соединение\n2. Обновить Android System WebView в Google Play\n3. Перезагрузить устройство';
                });
              }
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            print('🔵 WebView navigation request: ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      );

    // Загружаем URL после первого кадра, чтобы избежать проблем с контекстом
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        print('🔵 Загружаем URL в WebView: ${widget.paymentUrl}');
        _controller.loadRequest(Uri.parse(widget.paymentUrl));
      }
    });
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
    
    // Проверяем, является ли URL нашим cancel_url (когда пользователь нажимает "Exit" в ЮKassa)
    // Для мобильных cancel_url = https://avia-point.com/payments/cancel?source=...
    final isCancelUrl = uri.path.contains('/payments/cancel');

    // Если это наш cancel_url, значит пользователь нажал "Exit" в ЮKassa
    if (isCancelUrl) {
      print('🔵 Обнаружен cancel_url (Exit из ЮKassa), закрываем WebView');
      print('   URL: $url');
      print('   returnRouteSource: ${widget.returnRouteSource}');
      // Вызываем onCancel для обработки отмены
      widget.onCancel?.call();
      // Используем addPostFrameCallback для закрытия WebView после завершения текущего кадра
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            try {
              Navigator.of(context, rootNavigator: true).pop(false);
            } catch (e) {
              print('❌ Ошибка при закрытии WebView: $e');
            }
          }
        });
      }
      return;
    }

    // Если это наш return_url, значит пользователь вернулся с ЮКассы
    // Статус будет проверен через API в PaymentHelper
    if (isReturnUrl) {
      print('🔵 Обнаружен return_url, закрываем WebView для проверки статуса через API');
      print('   URL: $url');
      print('   returnRouteSource: ${widget.returnRouteSource}');
      // Возвращаем true, чтобы PaymentHelper проверил статус через API
      widget.onSuccess?.call();
      // Используем addPostFrameCallback для закрытия WebView после завершения текущего кадра
      // Это предотвращает ошибку заблокированного Navigator
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            try {
              Navigator.of(context, rootNavigator: true).pop(true);
            } catch (e) {
              print('❌ Ошибка при закрытии WebView: $e');
            }
          }
        });
      }
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
            if (context.mounted) {
              Navigator.of(context).pop(false);
            }
          },
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading && _errorMessage == null) const Center(child: CircularProgressIndicator()),
          if (_errorMessage != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      'Ошибка загрузки страницы оплаты',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(_errorMessage!, style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _errorMessage = null;
                          _isLoading = true;
                        });
                        _controller.reload();
                      },
                      child: Text('Повторить'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
