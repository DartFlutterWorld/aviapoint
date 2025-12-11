# Шаги для подключения ЮKassa

## ✅ Что уже сделано

1. ✅ Добавлена зависимость `webview_flutter` в `pubspec.yaml`
2. ✅ Создана полная структура модуля платежей:
   - Модели: `PaymentDto`, `CreatePaymentRequestDto`
   - Сервис: `PaymentService` (Retrofit)
   - Репозиторий: `PaymentRepository` и `PaymentRepositoryImpl`
   - BLoC: `PaymentBloc`, `PaymentEvent`, `PaymentState`
   - UI: `PaymentScreen`, `PaymentWebViewScreen`
3. ✅ Добавлен `PaymentRepository` в DI контейнер (`injection_container.dart`)
4. ✅ Добавлен `PaymentBloc` в провайдеры (`app.dart`)
5. ✅ Добавлены маршруты в роутер (`app_router.dart`)

## 🔧 Что нужно сделать сейчас

### Шаг 1: Установить зависимости

```bash
flutter pub get
```

### Шаг 2: Запустить build_runner

Это сгенерирует все необходимые файлы (freezed, retrofit):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Или если используете fvm:

```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### Шаг 3: Настроить backend

**КРИТИЧЕСКИ ВАЖНО:** Платежи обрабатываются на backend, не напрямую из приложения!

Backend должен реализовать два endpoint:

#### 1. POST `/payments/create`

Создает платеж в ЮKassa через их API.

**Request body:**
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

#### 2. GET `/api/payments/{paymentId}/status`

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

#### 3. POST `/api/payments/webhook` (опционально, но рекомендуется)

Webhook от ЮKassa для уведомления о статусе платежа.
**URL для настройки в ЮKassa:** `https://avia-point.com/api/payments/webhook`

### Шаг 4: Регистрация в ЮKassa

1. Зарегистрируйтесь на https://yookassa.ru/
2. Подтвердите статус самозанятого
3. Получите `shopId` и `secretKey`
4. **ВАЖНО:** Храните ключи только на backend, НЕ в приложении!
5. Настройте webhook URL на вашем backend

### Шаг 5: Настройка Deep Links

Для возврата в приложение после оплаты нужно настроить deep links.

#### iOS (`ios/Runner/Info.plist`):

Добавьте в секцию `<dict>`:

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

#### Android (`android/app/src/main/AndroidManifest.xml`):

В секцию `<activity android:name=".MainActivity">` добавьте:

```xml
<intent-filter>
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data android:scheme="aviapoint" />
</intent-filter>
```

## 📱 Использование в приложении

### Пример 1: Через роутер

```dart
context.router.push(
  PaymentRoute(
    amount: 1000.00,
    currency: 'RUB',
    description: 'Оплата подписки AviaPoint',
  ),
);
```

### Пример 2: Через Bloc напрямую

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

## 🧪 Тестирование

1. Используйте тестовые данные от ЮKassa:
   - Номер карты: `5555 5555 5555 4444`
   - Срок действия: любая будущая дата (например, 12/25)
   - CVC: любые 3 цифры (например, 123)

2. Проверьте сценарии:
   - ✅ Успешная оплата
   - ✅ Отмена оплаты
   - ✅ Ошибка при оплате
   - ✅ Возврат в приложение после оплаты

## 📋 Чек-лист

- [ ] `flutter pub get` выполнен
- [ ] `build_runner` запущен и сгенерировал файлы
- [ ] Backend endpoints `/api/payments/create` и `/api/payments/{id}/status` реализованы
- [ ] Зарегистрирован аккаунт в ЮKassa
- [ ] Получены `shopId` и `secretKey` (хранятся на backend)
- [ ] Настроен webhook на backend
- [ ] Настроены deep links для iOS и Android
- [ ] Протестировано создание платежа
- [ ] Протестирована оплата в тестовом режиме

## 🔐 Безопасность

⚠️ **КРИТИЧЕСКИ ВАЖНО:**

1. **НЕ храните `secretKey` в приложении!** Только на backend!
2. Все платежи обрабатываются на backend
3. Проверяйте статус платежа на backend через webhook
4. Не доверяйте только ответу от клиента

## 📚 Полезные ссылки

- ЮKassa API: https://yookassa.ru/developers/api
- Документация для самозанятых: https://yookassa.ru/developers/payment-acceptance/getting-started/self-employed
- Пример интеграции: https://yookassa.ru/developers/payment-acceptance/getting-started/quick-start

---

**После выполнения всех шагов платежи будут готовы к использованию!** 🎉

Если возникнут вопросы - обращайтесь!

