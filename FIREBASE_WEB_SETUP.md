# Настройка Firebase Messaging для веба

## Проблема
Ошибка: `[firebase_messaging/token-subscribe-failed] Messaging: A problem occurred while subscribing the user to FCM: Request is missing required authentication credential`

## Решение

### 1. Проверьте VAPID ключ в Firebase Console

1. Откройте [Firebase Console](https://console.firebase.google.com)
2. Выберите проект **`aviapoint`** (не `silk-42ca2`!)
3. Перейдите в **Project Settings** (⚙️) → **Cloud Messaging**
4. В разделе **Web Push certificates**:
   - Если ключ уже есть — скопируйте его
   - Если ключа нет — нажмите **Generate key pair** и скопируйте публичный ключ

### 2. Обновите VAPID ключ в коде

Откройте файл `lib/core/services/app_messaging.dart` и обновите строку 49:

```dart
const String vapidKey = 'ВАШ_НОВЫЙ_VAPID_КЛЮЧ_ИЗ_FIREBASE_CONSOLE';
```

### 3. Проверьте авторизованные домены

1. В Firebase Console → **Authentication** → **Settings** → **Authorized domains**
2. Убедитесь, что ваш домен добавлен:
   - `localhost` (для разработки)
   - `avia-point.com` (для продакшена)
   - Другие используемые домены

### 4. Проверьте Service Worker

Убедитесь, что файл `web/firebase-messaging-sw.js` доступен и правильно настроен:

- Файл должен быть доступен по пути `/firebase-messaging-sw.js`
- Конфигурация Firebase должна совпадать с `firebase_options.dart`:
  - `projectId: 'aviapoint'`
  - Правильный `apiKey` и `messagingSenderId`

### 5. Проверьте консоль браузера

Откройте DevTools (F12) → Console и проверьте:
- Регистрируется ли Service Worker
- Есть ли ошибки при инициализации Firebase
- Какой проект Firebase используется

## Текущая конфигурация

### Firebase проект
- **Project ID:** `aviapoint`
- **messagingSenderId:** `591230040091`

### Конфигурация синхронизирована в:
- ✅ `lib/firebase_options.dart` - веб конфигурация
- ✅ `web/firebase-messaging-sw.js` - Service Worker
- ✅ `lib/core/services/app_firebase.dart` - использует `DefaultFirebaseOptions.web`

### VAPID ключ
Текущий VAPID ключ может быть неправильным или устаревшим. Получите актуальный ключ из Firebase Console.

## После обновления

После обновления VAPID ключа:
1. Перезапустите приложение
2. Очистите кэш браузера (Ctrl+Shift+Delete)
3. Проверьте, что Service Worker обновлен (DevTools → Application → Service Workers → Update)
4. Проверьте логи в консоли браузера
