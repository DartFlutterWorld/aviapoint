# Инструкция по настройке платежей ЮKassa

## ✅ Что уже сделано

1. ✅ Добавлена зависимость `webview_flutter` в `pubspec.yaml`
2. ✅ Создана структура модуля платежей:
   - Модели данных (PaymentDto, CreatePaymentRequestDto)
   - PaymentService для API запросов
   - PaymentRepository и PaymentRepositoryImpl
   - PaymentBloc для управления состоянием
   - UI экраны (PaymentScreen, PaymentWebViewScreen)
3. ✅ Добавлен PaymentRepository в DI контейнер
4. ✅ Добавлены маршруты в роутер

## 🔧 Что нужно сделать дальше

### 1. Установить зависимости

```bash
flutter pub get
```

### 2. Запустить build_runner для генерации кода

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Это сгенерирует:
- `*.freezed.dart` файлы для моделей
- `*.g.dart` файлы для JSON сериализации
- `payment_service.g.dart` для Retrofit

### 3. Настроить backend

**Важно:** Платежи должны обрабатываться на backend, а не напрямую из приложения!

Backend должен иметь следующие endpoints:

#### POST `/api/payments/create`
Создает платеж в ЮKassa и возвращает paymentUrl.

**Request:**
```json
{
  "amount": 1000.00,
  "currency": "RUB",
  "description": "Оплата подписки AviaPoint",
  "return_url": "aviapoint://payment/success",
  "cancel_url": "aviapoint://payment/cancel"
}
```

**Response:**
```json
{
  "id": "2c5d5b87-0001-5000-8000-1d5e5b5b5b5b",
  "status": "pending",
  "amount": 1000.00,
  "currency": "RUB",
  "description": "Оплата подписки AviaPoint",
  "payment_url": "https://yookassa.ru/checkout/payments/...",
  "created_at": "2024-01-01T12:00:00Z",
  "paid": false
}
```

#### GET `/api/payments/{paymentId}/status`
Проверяет статус платежа.

**Response:**
```json
{
  "id": "2c5d5b87-0001-5000-8000-1d5e5b5b5b5b",
  "status": "succeeded",
  "amount": 1000.00,
  "currency": "RUB",
  "description": "Оплата подписки AviaPoint",
  "paid": true,
  "created_at": "2024-01-01T12:00:00Z"
}
```

#### POST `/api/payments/webhook` (на backend)
Webhook от ЮKassa для уведомления о статусе платежа.
**URL для настройки в ЮKassa:** `https://avia-point.com/api/payments/webhook`

### 4. Регистрация в ЮKassa

1. Зарегистрируйтесь на https://yookassa.ru/
2. Подтвердите статус самозанятого
3. Получите `shopId` и `secretKey`
4. Настройте webhook URL на вашем backend
5. Добавьте ключи в переменные окружения backend (НЕ в приложение!)

### 5. Настройка Deep Links (для возврата в приложение)

✅ **Готово!** Deep links уже настроены в проекте:

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>aviapoint</string>
    </array>
  </dict>
</array>
```

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<!-- Deep link для платежей: aviapoint://payment/success и aviapoint://payment/cancel -->
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="aviapoint" />
</intent-filter>
```

Deep links обрабатываются автоматически в `PaymentWebViewScreen` через метод `_handleUrl()`.

### 6. Использование в приложении

Пример использования:

```dart
// Открыть экран оплаты
context.router.push(
  PaymentRoute(
    amount: 1000.00,
    currency: 'RUB',
    description: 'Оплата подписки AviaPoint',
  ),
);
```

Или через Bloc:

```dart
context.read<PaymentBloc>().add(
  CreatePaymentEvent(
    amount: 1000.00,
    currency: 'RUB',
    description: 'Оплата подписки AviaPoint',
    returnUrl: 'aviapoint://payment/success',
    cancelUrl: 'aviapoint://payment/cancel',
  ),
);
```

## 📝 Чек-лист

- [ ] Запущен `flutter pub get`
- [ ] Запущен `build_runner` для генерации кода
- [ ] Backend настроен с endpoints `/api/payments/create` и `/api/payments/{id}/status`
- [ ] Зарегистрирован аккаунт в ЮKassa
- [ ] Получены `shopId` и `secretKey` (хранятся на backend)
- [ ] Настроен webhook на backend
- [ ] Настроены deep links для iOS и Android
- [ ] Протестировано создание платежа
- [ ] Протестирована оплата в тестовом режиме ЮKassa

## 🧪 Тестирование

1. Используйте тестовые данные карт от ЮKassa:
   - Номер карты: `5555 5555 5555 4444`
   - Срок действия: любая будущая дата
   - CVC: любые 3 цифры

2. Проверьте все сценарии:
   - Успешная оплата
   - Отмена оплаты
   - Ошибка при оплате
   - Возврат в приложение после оплаты

## 🔐 Безопасность

⚠️ **ВАЖНО:**
- НЕ храните `secretKey` в приложении
- Все платежи обрабатываются на backend
- Проверяйте статус платежа на backend через webhook
- Не доверяйте только ответу от клиента

## 📚 Документация

- ЮKassa API: https://yookassa.ru/developers/api
- Документация для самозанятых: https://yookassa.ru/developers/payment-acceptance/getting-started/self-employed

---

**После выполнения всех шагов платежи будут готовы к использованию!** 🎉

