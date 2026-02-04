# Отчет о проверке настроек Deep Links

## ✅ Что настроено правильно:

### 1. Android (AndroidManifest.xml)
- ✅ **Universal Links** для `avia-point.com` настроены:
  ```xml
  <intent-filter android:autoVerify="true">
      <action android:name="android.intent.action.VIEW" />
      <category android:name="android.intent.category.DEFAULT" />
      <category android:name="android.intent.category.BROWSABLE" />
      <data android:scheme="https" android:host="avia-point.com" />
      <data android:scheme="http" android:host="avia-point.com" />
  </intent-filter>
  ```

- ✅ **Custom Scheme** для платежей настроен:
  ```xml
  <intent-filter>
      <action android:name="android.intent.action.VIEW" />
      <category android:name="android.intent.category.DEFAULT" />
      <category android:name="android.intent.category.BROWSABLE" />
      <data android:scheme="aviapoint" />
  </intent-filter>
  ```

- ✅ `flutter_deeplinking_enabled` включен:
  ```xml
  <meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
  ```

### 2. iOS (Info.plist)
- ✅ **Custom Scheme** настроен:
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

### 3. iOS (Runner.entitlements)
- ✅ **Universal Links** настроены:
  ```xml
  <key>com.apple.developer.associated-domains</key>
  <array>
      <string>applinks:avia-point.com</string>
  </array>
  ```

### 4. Flutter (AutoRoute)
- ✅ Используется `defaultRouteParser()` для обработки диплинков
- ✅ Роуты настроены с правильными путями:
  - `/on-the-way/:id` → `FlightDetailRoute`
  - `/market/:id` → `AircraftMarketDetailRoute`
  - `/blog/:id` → `BlogArticleDetailRoute`
  - `/news/:id` → `DetailNewsRoute`

## ⚠️ Что нужно проверить/добавить:

### 1. Файлы .well-known для Universal Links

**Для Android** нужно разместить на сервере:
- `https://avia-point.com/.well-known/assetlinks.json`

Пример содержимого:
```json
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "ru.dartflutter.aviapoint",
    "sha256_cert_fingerprints": [
      "SHA256_FINGERPRINT_HERE"
    ]
  }
}]
```

**Для iOS** нужно разместить на сервере:
- `https://avia-point.com/.well-known/apple-app-site-association`

Пример содержимого:
```json
{
  "applinks": {
    "apps": [],
    "details": [{
      "appID": "TEAM_ID.ru.dartflutter.aviapoint",
      "paths": [
        "/on-the-way/*",
        "/market/*",
        "/blog/*",
        "/news/*"
      ]
    }]
  }
}
```

### 2. Обработка custom scheme для платежей

**Текущая ситуация:**
- ✅ Диплинки `aviapoint://payment/success` и `aviapoint://payment/cancel` настроены в манифестах
- ⚠️ Но в коде они не обрабатываются напрямую

**Текущая конфигурация роутера:**
```dart
AutoRoute(path: 'payment', page: PaymentRoute.page),
AutoRoute(path: 'payment/webview', page: PaymentWebViewRoute.page),
```

**Как работает сейчас:**
- Платежи обрабатываются через `return_url` на сайте (`https://avia-point.com/payments/return`)
- `PaymentWebViewScreen` отслеживает переход на `return_url` и закрывает WebView
- Статус платежа проверяется через API, а не через диплинки

**Рекомендация:**
Если нужно использовать диплинки `aviapoint://payment/success` и `aviapoint://payment/cancel`, нужно:
1. Добавить обработку этих путей в роутер:
   ```dart
   AutoRoute(path: 'payment/success', page: PaymentSuccessRoute.page),
   AutoRoute(path: 'payment/cancel', page: PaymentCancelRoute.page),
   ```
2. Или обработать их в `PaymentWebViewScreen._handleUrl()`:
   ```dart
   if (uri.scheme == 'aviapoint') {
     if (uri.path == '/payment/success') {
       widget.onSuccess?.call();
       Navigator.of(context).pop(true);
     } else if (uri.path == '/payment/cancel') {
       widget.onCancel?.call();
       Navigator.of(context).pop(false);
     }
   }
   ```

**Примечание:** Если текущая реализация через `return_url` работает корректно, диплинки могут быть не нужны.

### 3. Проверка соответствия URL структуре

**Текущие URL на сайте:**
- `https://avia-point.com/on-the-way/123` ✅
- `https://avia-point.com/market/456` ✅
- `https://avia-point.com/blog/789` ✅

**Пути в роутере:**
- `on-the-way/:id` ✅ Соответствует
- `market/:id` ✅ Соответствует
- `blog/:id` ✅ Соответствует

### 4. Обработка initialRoute

AutoRoute автоматически обрабатывает initialRoute через `defaultRouteParser()`, но нужно убедиться, что:
- При открытии приложения по диплинку правильно парсится URL
- Параметры из URL корректно передаются в роуты

## 📋 Рекомендации:

1. **Разместить файлы .well-known** на сервере `avia-point.com`:
   - `/well-known/assetlinks.json` (для Android)
   - `/well-known/apple-app-site-association` (для iOS)

2. **Добавить обработку payment/success и payment/cancel** в роутер или в `PaymentWebViewScreen`

3. **Протестировать диплинки:**
   - Открыть `https://avia-point.com/on-the-way/123` в браузере на Android/iOS
   - Проверить, что приложение открывается и переходит на нужный экран
   - Проверить `aviapoint://payment/success` и `aviapoint://payment/cancel`

4. **Добавить логирование** для отладки диплинков:
   ```dart
   // В app.dart или в роутере
   routerDelegate.addListener(() {
     debugPrint('🔗 Current route: ${routerDelegate.currentConfiguration}');
   });
   ```

## ✅ Итог:

**Настроено:**
- ✅ Android Universal Links
- ✅ Android Custom Scheme
- ✅ iOS Custom Scheme
- ✅ iOS Universal Links (entitlements)
- ✅ AutoRoute с defaultRouteParser
- ✅ Правильные пути в роутере

**Требуется:**
- ⚠️ Разместить файлы .well-known на сервере
- ⚠️ Добавить обработку payment/success и payment/cancel
- ⚠️ Протестировать диплинки на реальных устройствах
