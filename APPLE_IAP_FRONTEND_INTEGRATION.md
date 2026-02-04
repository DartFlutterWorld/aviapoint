# Интеграция Apple IAP во фронтенд - Завершено

## Что реализовано:

### 1. ✅ Добавлен пакет `in_app_purchase`
- В `pubspec.yaml` добавлена зависимость `in_app_purchase: ^3.1.11`

### 2. ✅ Создан сервис `IAPService`
- Файл: `lib/payment/data/datasources/iap_service.dart`
- Инициализация IAP
- Загрузка продуктов из App Store
- Покупка подписки
- Верификация на сервере через `PaymentService.verifyIAP`

### 3. ✅ Добавлен endpoint в `PaymentService`
- Метод `verifyIAP` для отправки receipt data на сервер
- Endpoint: `POST /api/payments/verify-iap`

### 4. ✅ Обновлен `PaymentHelper`
- Метод `createPaymentAndRedirect` теперь автоматически определяет платформу:
  - **iOS**: использует Apple IAP через `_createIAPPayment`
  - **Web/Android**: использует YooKassa через `_createYooKassaPayment`

### 5. ✅ Product ID настроен
- `com.aviapoint.subscription.rosaviatest.yearly` - должен совпадать с App Store Connect

## Что нужно сделать:

### 1. Запустить build_runner
```bash
cd ../aviapoint
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### 2. Проверить Product ID
Убедитесь, что Product ID в `IAPProducts.yearlySubscription` совпадает с тем, что в App Store Connect:
- Текущий: `com.aviapoint.subscription.rosaviatest.yearly`
- Должен совпадать с ID продукта в App Store Connect

### 3. Тестирование
1. Запустите приложение на реальном iOS устройстве (не симулятор)
2. Используйте Sandbox Test Account
3. Попробуйте купить подписку из:
   - Экран выбора режима тестирования (`testing_mode_screen`)
   - Экран профиля (`profile_screen`)

## Как это работает:

1. **На iOS**: При нажатии на покупку подписки:
   - `PaymentHelper.createPaymentAndRedirect` определяет iOS
   - Вызывает `_createIAPPayment`
   - Инициализирует `IAPService`
   - Загружает продукты из App Store
   - Показывает диалог покупки Apple
   - После покупки верифицирует на сервере
   - Активирует подписку

2. **На Web/Android**: Работает как раньше через YooKassa

## Важные замечания:

- IAP работает только на реальных iOS устройствах (не в симуляторе)
- Для тестирования нужен Sandbox Test Account
- Product ID должен точно совпадать с App Store Connect
- После покупки подписка автоматически активируется на сервере
