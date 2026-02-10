# Чеклист по подпискам для App Store (Guideline 3.1.2 и 2.1)

## Что сделано в приложении

### 3.1.2 — Информация о подписке в приложении
- **Название подписки** — отображается в виджете подписки (`subscriptionType.name`).
- **Срок подписки** — отображается явно («Срок: 1 год» и т.п.).
- **Цена и цена за единицу** — отображаются в формате «Цена: X ₽ (X ₽/год)».
- **Ссылки в приложении**:
  - «Политика конфиденциальности» — открывает экран политики конфиденциальности в приложении.
  - «Условия использования (EULA)» — открывает URL из `lib/core/utils/const/legal_urls.dart` (`kTermsOfUseEulaUrl`) в браузере.

URL для EULA настраивается в `lib/core/utils/const/legal_urls.dart`. По умолчанию: `https://avia-point.com/terms`. При использовании стандартного EULA Apple укажите: `https://www.apple.com/legal/internet-services/itunes/dev/stdeula/`

---

## Что нужно сделать в App Store Connect

### 1. Privacy Policy (обязательно)
- В карточке приложения в разделе **App Information** в поле **Privacy Policy URL** укажите **рабочую** ссылку на политику конфиденциальности (например, `https://avia-point.com/privacy-policy` или страница с текстом политики).
- URL должен открываться в браузере и вести на актуальный документ.

### 2. Terms of Use (EULA) (обязательно)
Выберите один из вариантов:

- **Вариант A.** Используете **стандартный EULA Apple**: в **описании приложения** (App Description) добавьте текст и ссылку, например:  
  `Условия использования (EULA): https://www.apple.com/legal/internet-services/itunes/dev/stdeula/`

- **Вариант B.** Используете **свой EULA**: в App Store Connect в разделе приложения загрузите кастомный EULA (если в интерфейсе есть поле для EULA / Terms of Use).

### 3. Paid Apps Agreement
- Убедитесь, что в разделе **Agreements, Tax, and Banking** (Business) принято **Paid Apps Agreement** (соглашение для платных приложений и подписок). Без него IAP в ревью работать не будет.

### 4. Ошибка IAP (Guideline 2.1)
- Проверьте подписку в **App Store Connect → Ваше приложение → Подписки**: Product ID должен совпадать с `IAPProducts.yearlySubscription` в коде (`lib/payment/data/datasources/iap_service.dart`): `com.aviapoint.subscription.rosaviatest.yearly`.
- Подписка должна быть в статусе **«Готово к отправке»** (или уже отправлена), привязана к правильному Bundle ID.
- Протестируйте покупку в **Sandbox** на реальном устройстве (не симулятор): создайте тестового пользователя в App Store Connect (Users and Access → Sandbox) и войдите под ним в настройках устройства (Настройки → App Store → Sandbox Account).
- На устройстве ревью (iPad Pro 11-inch, iOS 26.2.1) ревьюеры используют Sandbox; если у вас всё работает в Sandbox, но ревью пишет «error on IAP», проверьте верификацию чека на бэкенде (не блокирует ли сервер запросы от Sandbox или от определённых регионов).

---

## Ошибка «Продукты не найдены» / storekit_no_response

Если в логах: **«Продукты не найдены в App Store Connect: [com.aviapoint.subscription.rosaviatest.yearly]»** и **«StoreKit: Failed to get response from platform»**:

1. **Product ID — точное совпадение**  
   В App Store Connect откройте подписку и скопируйте **Identifier продукта** (Product ID). В коде используется строго:  
   `com.aviapoint.subscription.rosaviatest.yearly`  
   Должно совпадать посимвольно (часто бывает опечатка: `.year` вместо `.yearly`, или другой суффикс).

2. **Paid Applications Agreement**  
   App Store Connect → **Agreements, Tax, and Banking** → соглашение **Paid Applications** должно быть в статусе «Active». Без этого StoreKit не отдаёт продукты.

3. **Sandbox-аккаунт на устройстве**  
   На iPhone/iPad: **Настройки → App Store → внизу «Sandbox-аккаунт»** — войдите тестовым пользователем из App Store Connect (Users and Access → Sandbox). Без Sandbox-аккаунта продукты часто не загружаются.

4. **Подписка привязана к версии приложения**  
   Первая подписка должна быть добавлена в состав версии приложения (в карточке приложения — версия для отправки в ревью, в ней раздел In-App Purchases). Сохраните версию. После сохранения подождите 15–30 минут (иногда до нескольких часов), затем снова проверьте на устройстве.

5. **Bundle ID**  
   В Xcode (и в карточке приложения в App Store Connect) Bundle ID должен быть: **ru.dartflutter.aviapoint**.

6. **storekit_no_response**  
   Может быть из-за сети, таймаута Apple или того, что продукты ещё не «подтянулись». Проверьте интернет на устройстве, попробуйте через 30 минут; при следующем запуске приложения — снова нажать «Купить подписку».

---

## Кратко по файлам

| Задача | Файл |
|--------|------|
| URL политики и EULA | `lib/core/utils/const/legal_urls.dart` |
| Виджет подписки (название, срок, цена, ссылки) | `lib/profile_page/profile/presentation/widget/subscribe_widget.dart` |
| Обработка ошибок IAP и закрытие диалога | `lib/payment/utils/payment_helper.dart` |

После правок в App Store Connect отправьте приложение на ревью снова.
