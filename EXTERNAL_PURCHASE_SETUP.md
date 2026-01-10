# Настройка External Purchase Link для App Store

## Что это такое?

External Purchase Link — это функция Apple, которая позволяет приложениям ссылаться на внешние способы оплаты (например, веб-сайт) в определенных регионах. Это необходимо для соответствия требованиям различных юрисдикций (например, в ЕС после Digital Markets Act).

## 📋 Шаг 1: Запрос entitlement в App Store Connect

### 1.1. Войдите в App Store Connect

1. Перейдите на https://appstoreconnect.apple.com/
2. Войдите с вашим Apple ID (должен быть Admin или Account Holder)

### 1.2. Найдите ваше приложение

1. Нажмите **"Мои приложения"** (My Apps)
2. Выберите ваше приложение **AviaPoint**

### 1.3. Запросите External Purchase Link entitlement

**Вариант A: Через раздел "App Information"**

1. Перейдите в раздел **"Информация о приложении"** (App Information)
2. Найдите раздел **"StoreKit External Purchase Link"** или **"External Purchase Entitlement"**
3. Нажмите **"Request Entitlement"** или **"Запросить entitlement"**
4. Заполните форму запроса:
   - **Причина запроса:** Опишите, почему вам нужен External Purchase Link
     - Пример: "Наше приложение предлагает подписки, которые также доступны через веб-сайт. Мы хотим предоставить пользователям возможность выбирать способ оплаты в соответствии с требованиями Digital Markets Act."
   - **Регионы:** Укажите регионы, где будет доступна функция (например, ЕС, Дания, и т.д.)
   - **URL внешнего способа оплаты:** Укажите URL вашего веб-сайта для оплаты
     - Пример: `https://avia-point.com/payment` или `https://avia-point.com/subscribe`

**Вариант B: Через Support (если нет прямого раздела)**

1. Перейдите в **"App Information"** → **"App Store Connect Support"**
2. Выберите **"Request Entitlement"** или создайте новый запрос
3. В категории выберите **"App Store Connect"** → **"Entitlements"**
4. Укажите:
   - **App:** AviaPoint
   - **Entitlement:** `com.apple.developer.storekit.external-purchase`
   - **Описание:** Опишите причину запроса

### 1.4. Ожидание одобрения

- Apple обычно рассматривает запросы в течение **1-2 недель**
- Вы получите уведомление на email, указанный в App Store Connect
- После одобрения entitlement будет доступен в вашем App ID

---

## 🔧 Шаг 2: Настройка в Apple Developer Portal

### 2.1. Обновите App ID

1. Перейдите в [Apple Developer Portal](https://developer.apple.com/account/)
2. Выберите **"Certificates, Identifiers & Profiles"**
3. Перейдите в **"Identifiers"** → **"App IDs"**
4. Найдите ваш App ID: `ru.dartflutter.aviapoint`
5. Нажмите на него для редактирования
6. В разделе **"Capabilities"** или **"App Services"** найдите **"StoreKit External Purchase Link"**
7. Включите эту опцию (если она доступна после одобрения)

---

## 📱 Шаг 3: Настройка в проекте

### 3.1. Обновите Info.plist

Добавьте ключ `SKExternalPurchase` с массивом регионов:

```xml
<key>SKExternalPurchase</key>
<array>
    <string>dk</string>  <!-- Дания -->
    <string>eu</string>   <!-- Европейский Союз -->
    <!-- Добавьте другие регионы по необходимости -->
</array>
```

**Доступные регионы:**
- `dk` - Дания
- `eu` - Европейский Союз (все страны ЕС)
- И другие регионы, где Apple разрешает External Purchase Link

### 3.2. Обновите entitlements файл

В файле `ios/Runner/Runner.entitlements` добавьте:

```xml
<key>com.apple.developer.storekit.external-purchase</key>
<true/>
```

---

## 💻 Шаг 4: Реализация в коде

### 4.1. Проверка доступности External Purchase Link

```dart
import 'package:storekit_external_purchase_link/storekit_external_purchase_link.dart';

Future<void> checkExternalPurchaseAvailability() async {
  final canPresent = await StoreKitExternalPurchaseLink.canPresent();
  
  if (canPresent) {
    // External Purchase Link доступен
    // Можно показать кнопку для перехода на внешний способ оплаты
  } else {
    // External Purchase Link недоступен
    // Используйте обычные In-App Purchases
  }
}
```

### 4.2. Показ External Purchase Link

```dart
Future<void> showExternalPurchaseLink() async {
  try {
    await StoreKitExternalPurchaseLink.present(
      url: 'https://avia-point.com/payment',
    );
  } catch (e) {
    // Обработка ошибки
    print('Error presenting external purchase link: $e');
  }
}
```

### 4.3. Добавьте зависимость в pubspec.yaml

```yaml
dependencies:
  storekit_external_purchase_link: ^1.0.0  # Проверьте актуальную версию
```

---

## ⚠️ Важные моменты

### Требования Apple:

1. **Региональные ограничения:**
   - External Purchase Link доступен только в определенных регионах
   - В США эта функция недоступна (требуется использовать только IAP)

2. **Условия использования:**
   - Приложение должно также предлагать подписки через In-App Purchases
   - External Purchase Link должен быть дополнительной опцией, а не единственным способом

3. **Требования к URL:**
   - URL должен вести на страницу, где пользователь может совершить покупку
   - Страница должна быть доступна на том же языке, что и приложение

4. **Тестирование:**
   - `canPresent()` может возвращать `false` в симуляторе
   - Тестируйте на реальном устройстве с правильным регионом Apple ID

---

## 📝 Пример полной реализации

```dart
import 'package:storekit_external_purchase_link/storekit_external_purchase_link.dart';
import 'dart:io' show Platform;

class PaymentHelper {
  static Future<bool> canUseExternalPurchase() async {
    if (!Platform.isIOS) return false;
    
    try {
      return await StoreKitExternalPurchaseLink.canPresent();
    } catch (e) {
      return false;
    }
  }
  
  static Future<void> showExternalPurchaseOption(BuildContext context) async {
    final canUse = await canUseExternalPurchase();
    
    if (canUse) {
      // Показываем диалог с выбором способа оплаты
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Выберите способ оплаты'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Встроенные покупки'),
                subtitle: Text('Оплата через App Store'),
                onTap: () {
                  Navigator.pop(context);
                  // Используйте обычный IAP
                },
              ),
              ListTile(
                title: Text('Внешний способ оплаты'),
                subtitle: Text('Оплата через веб-сайт'),
                onTap: () async {
                  Navigator.pop(context);
                  await _openExternalPurchase();
                },
              ),
            ],
          ),
        ),
      );
    } else {
      // Используйте только IAP
    }
  }
  
  static Future<void> _openExternalPurchase() async {
    try {
      await StoreKitExternalPurchaseLink.present(
        url: 'https://avia-point.com/payment',
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
```

---

## 🔍 Проверка статуса запроса

1. В App Store Connect перейдите в **"App Information"**
2. Найдите раздел **"StoreKit External Purchase Link"**
3. Проверьте статус запроса:
   - **Pending** - запрос на рассмотрении
   - **Approved** - одобрено, можно использовать
   - **Rejected** - отклонено (проверьте причину)

---

## 📞 Если запрос отклонен

1. Проверьте причину отклонения в App Store Connect
2. Убедитесь, что:
   - Ваше приложение соответствует требованиям
   - Вы указали правильный URL для внешней оплаты
   - Ваше приложение также предлагает IAP
3. При необходимости подайте новый запрос с исправленной информацией

---

## 📚 Дополнительные ресурсы

- [Apple Documentation: External Purchase Link](https://developer.apple.com/documentation/storekit/external-purchase-link)
- [Receiving and decoding external purchase tokens](https://developer.apple.com/documentation/storekit/receiving-and-decoding-external-purchase-tokens)
- [App Store Review Guidelines - Section 3.1.3(b)](https://developer.apple.com/app-store/review/guidelines/#multiplatform-services)

---

## ⚡ Быстрая проверка

После настройки проверьте:

1. ✅ Entitlement запрошен и одобрен в App Store Connect
2. ✅ App ID обновлен в Developer Portal
3. ✅ Info.plist содержит `SKExternalPurchase` с правильными регионами
4. ✅ Runner.entitlements содержит `com.apple.developer.storekit.external-purchase`
5. ✅ Код проверяет `canPresent()` перед показом External Purchase Link
6. ✅ Тестирование на реальном устройстве с правильным регионом
