import 'dart:async';
import 'dart:convert';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:aviapoint/payment/data/datasources/payment_service.dart';
import 'package:aviapoint/injection_container.dart';

/// Product ID для годовой подписки (должен совпадать с App Store Connect)
class IAPProducts {
  static const String yearlySubscription = 'com.aviapoint.subscription.rosaviatest.yearly';
  static const List<String> allProducts = [yearlySubscription];
}

/// Сервис для работы с Apple In-App Purchases
class IAPService {
  final InAppPurchase _iap = InAppPurchase.instance;
  final PaymentService _paymentService = getIt<PaymentService>();
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  final StreamController<bool> _purchaseController = StreamController<bool>.broadcast();

  /// Поток для отслеживания статуса покупки
  Stream<bool> get purchaseStream => _purchaseController.stream;

  /// Инициализация IAP
  Future<bool> initialize() async {
    try {
      final bool available = await _iap.isAvailable();
      if (!available) {
        print('IAP not available');
        return false;
      }
    } catch (e) {
      print('Error checking IAP availability: $e');
      // IAP может быть недоступен на симуляторе или если не настроены capabilities
      return false;
    }

    // Слушаем обновления покупок
    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onDone: () => _subscription?.cancel(),
      onError: (error) {
        print('Purchase stream error: $error');
        _purchaseController.add(false);
      },
    );

    return true;
  }

  /// Загрузка доступных продуктов
  Future<List<ProductDetails>> loadProducts() async {
    try {
      final Set<String> productIds = IAPProducts.allProducts.toSet();
      print('🔵 Загружаем продукты: $productIds');

      final ProductDetailsResponse response = await _iap.queryProductDetails(productIds);

      print('🔵 Ответ от App Store:');
      print('   - Найдено продуктов: ${response.productDetails.length}');
      print('   - Не найдено продуктов: ${response.notFoundIDs}');
      print('   - Ошибка: ${response.error}');

      if (response.notFoundIDs.isNotEmpty) {
        print('❌ Продукты не найдены в App Store Connect: ${response.notFoundIDs}');
        print('   В коде ожидается Product ID: ${IAPProducts.yearlySubscription}');
        print('   Скопируйте Identifier из App Store Connect и сравните посимвольно.');
        print('   Проверьте:');
        print('   1. Product ID совпадает с App Store Connect');
        print('   2. Подписка создана и имеет статус "Готово к отправке"');
        print('   3. Bundle ID совпадает: ru.dartflutter.aviapoint');
        print('   4. Первая подписка должна быть отправлена вместе с версией приложения');
        print('   5. Paid Applications Agreement подписан (Agreements, Tax, and Banking)');
        print('   6. На устройстве войдите в Sandbox-аккаунт (Настройки → App Store)');
      }

      if (response.error != null) {
        print('❌ Ошибка при загрузке продуктов: ${response.error}');
        print('   Код ошибки: ${response.error?.code}');
        print('   Сообщение: ${response.error?.message}');
        print('   Детали: ${response.error?.details}');
        return [];
      }

      if (response.productDetails.isEmpty) {
        print('⚠️ Продукты не найдены. Возможные причины:');
        print('   1. Подписка не создана в App Store Connect');
        print('   2. Product ID не совпадает: ${IAPProducts.yearlySubscription}');
        print(
          '   3. Подписка не отправлена на проверку (первая подписка должна быть отправлена вместе с версией приложения)',
        );
        print('   4. Bundle ID не совпадает');
        return [];
      }

      print('✅ Продукты успешно загружены:');
      for (final product in response.productDetails) {
        print('   - ${product.id}: ${product.title} (${product.price})');
      }

      return response.productDetails;
    } catch (e, stackTrace) {
      print('❌ Исключение при загрузке продуктов: $e');
      print('StackTrace: $stackTrace');
      return [];
    }
  }

  /// Покупка подписки
  Future<bool> buySubscription(String productId) async {
    try {
      final ProductDetailsResponse response = await _iap.queryProductDetails({productId});

      if (response.productDetails.isEmpty) {
        print('Product not found: $productId');
        _purchaseController.add(false);
        return false;
      }

      final ProductDetails productDetails = response.productDetails.first;
      final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);

      // Запускаем покупку
      final bool success = await _iap.buyNonConsumable(purchaseParam: purchaseParam);

      if (!success) {
        print('Failed to initiate purchase');
        _purchaseController.add(false);
        return false;
      }

      // Обработка покупки произойдет в _onPurchaseUpdate
      return true;
    } catch (e) {
      print('Error buying subscription: $e');
      _purchaseController.add(false);
      return false;
    }
  }

  /// Обработка обновлений покупок
  void _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (final PurchaseDetails purchase in purchases) {
      if (purchase.status == PurchaseStatus.pending) {
        // Покупка в процессе
        print('Purchase pending: ${purchase.productID}');
        continue;
      }

      if (purchase.status == PurchaseStatus.error) {
        // Ошибка покупки
        print('Purchase error: ${purchase.error}');
        _purchaseController.add(false);
        _handlePurchaseError(purchase);
        continue;
      }

      if (purchase.status == PurchaseStatus.purchased || purchase.status == PurchaseStatus.restored) {
        // Покупка успешна - верифицируем на сервере
        final success = await _verifyPurchaseOnServer(purchase);
        _purchaseController.add(success);
      }

      // Завершаем транзакцию
      if (purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }
  }

  /// Верификация покупки на сервере
  Future<bool> _verifyPurchaseOnServer(PurchaseDetails purchase) async {
    try {
      // Определяем, это Sandbox или Production
      final bool isSandbox = purchase.verificationData.source == 'sandbox';

      // Отправляем на сервер для верификации
      final response = await _paymentService.verifyIAP({
        'receipt_data': purchase.verificationData.serverVerificationData,
        'transaction_id': purchase.purchaseID ?? '',
        'original_transaction_id': purchase.transactionDate ?? '',
        'is_sandbox': isSandbox,
      });

      print('IAP verification response: ${response.status}');
      return response.status == 'success';
    } catch (e) {
      print('Error verifying purchase: $e');
      return false;
    }
  }

  /// Обработка ошибки покупки
  void _handlePurchaseError(PurchaseDetails purchase) {
    print('Purchase error: ${purchase.error}');
  }

  /// Восстановление покупок
  Future<void> restorePurchases() async {
    try {
      await _iap.restorePurchases();
    } catch (e) {
      print('Error restoring purchases: $e');
    }
  }

  /// Очистка ресурсов
  void dispose() {
    _subscription?.cancel();
    _purchaseController.close();
  }
}
