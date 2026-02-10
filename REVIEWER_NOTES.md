# Заметки для ревьюера (App Store / Google Play)

Используйте этот текст в поле **«Notes for the Review Team»** (App Store Connect) или в контактах для ревью (Google Play Console).

---

## Краткая версия (если есть лимит символов)

**Payments:** Subscriptions are not sold via In-App Purchase. All payments go through our website (YooKassa). Tapping "Subscribe" opens a secure in-app payment page. We use External Purchase; no StoreKit/IAP. For testing without payment we can provide test credentials or disable paid content on the server—contact support.

---

## English (для App Store Connect)

**App: AviaPoint**

**Payment and subscriptions**

- AviaPoint offers a **subscription** for the training mode in the «РосАвиаТест» (exam preparation) section.
- **Subscriptions are not sold via In-App Purchase.** All payments are processed **outside the app** through our website using the YooKassa payment system. When the user taps «Subscribe» or «Buy» in the app, they are taken to a secure payment page (in-app browser or redirect) where they complete the payment. No Apple IAP or Google Play Billing is used.
- This flow complies with our use of **External Purchase** (e.g. for regions where external payment is permitted). We do not use StoreKit or In-App Purchase for this subscription.
- **Testing:** If you need to test without paying, we can provide a test account or temporarily disable paid content on the server (the training mode will then open without payment). Please contact us at [your-support-email] if you need this.

**Other**

- The app requires sign-in (phone number) to access most features. We can provide test credentials if needed.
- «По пути» (On the way) is an informational section for planning flights and finding co-pilots; the developer does not operate aircraft or sell flights.

Thank you for reviewing our app.

---

## Русский (при необходимости для поддержки)

**Приложение: AviaPoint**

**Оплата и подписки**

- В AviaPoint доступна **подписка** на тренировочный режим в разделе «РосАвиаТест» (подготовка к экзаменам).
- **Подписки не продаются через In-App Purchase.** Все платежи проходят **вне приложения** через наш сайт по платёжной системе ЮKassa. При нажатии «Подписаться» или «Купить» в приложении пользователь переходит на защищённую страницу оплаты (браузер внутри приложения или редирект), где совершает платёж. Apple IAP и Google Play Billing не используются.
- Такой сценарий соответствует использованию **внешней оплаты** (в т.ч. в регионах, где это допускается). Для данной подписки StoreKit и In-App Purchase не используются.
- **Тестирование:** при необходимости проверить приложение без оплаты мы можем выдать тестовый аккаунт или временно отключить платный контент на сервере (тренировочный режим откроется без оплаты). Напишите нам: [ваш-email-поддержки].

**Прочее**

- Для доступа к основным разделам требуется авторизация по номеру телефона. Можем предоставить тестовые данные для входа.
- Раздел «По пути» носит информационный характер (планирование полётов, поиск попутчиков); разработчик не является авиаперевозчиком и не продаёт перелёты.

Спасибо за проверку приложения.
