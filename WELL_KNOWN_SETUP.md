# Инструкция по настройке файлов .well-known для Deep Links

## 📋 Что нужно сделать

Для работы Universal Links (App Links) нужно разместить два файла на сервере `avia-point.com`:
1. `/.well-known/assetlinks.json` - для Android
2. `/.well-known/apple-app-site-association` - для iOS

## 🔧 Шаг 1: Получение данных для Android

### Получить SHA256 fingerprint отправительного ключа:

```bash
# Для release ключа (Google Play)
keytool -list -v -keystore android/keystores/aviapoint-release.keystore -alias aviapoint-release

# Или если ключ в другом месте
keytool -list -v -keystore /path/to/your/keystore.jks -alias your-alias
```

В выводе найдите строку:
```
SHA256: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX
```

**Скопируйте SHA256 без двоеточий** (только буквы и цифры).

### Для debug ключа (если нужно тестировать):

```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

## 🍎 Шаг 2: Получение данных для iOS

### Получить Team ID:

1. Откройте Xcode
2. Выберите проект → Target → Signing & Capabilities
3. Найдите **Team ID** (формат: `XXXXXXXXXX`)

Или через командную строку:
```bash
# Если у вас есть сертификат
security find-identity -v -p codesigning
```

Team ID обычно указан в сертификате.

## 📝 Шаг 3: Заполнение файлов

### 1. Отредактируйте `.well-known/assetlinks.json`:

Замените `ЗАМЕНИТЬ_НА_SHA256_FINGERPRINT_ОТПРАВОЧНОГО_КЛЮЧА` на реальный SHA256 fingerprint.

Пример:
```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "ru.dartflutter.aviapoint",
      "sha256_cert_fingerprints": [
        "A1B2C3D4E5F6A1B2C3D4E5F6A1B2C3D4E5F6A1B2C3D4E5F6A1B2C3D4E5F6"
      ]
    }
  }
]
```

### 2. Отредактируйте `.well-known/apple-app-site-association`:

Замените `ЗАМЕНИТЬ_НА_TEAM_ID` на реальный Team ID.

Пример:
```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "ABC123DEF4.ru.dartflutter.aviapoint",
        "paths": [
          "/on-the-way/*",
          "/market/*",
          "/blog/*",
          "/news/*",
          "/profile/*",
          "/payment/*"
        ]
      }
    ]
  }
}
```

**Важно для iOS:** Файл должен быть **без расширения** (не `.json`), и должен отдаваться с правильным Content-Type: `application/json`.

## 🚀 Шаг 4: Размещение на сервере

### Вариант 1: Автоматический деплой (рекомендуется)

Используйте готовый скрипт:

```bash
# Сделать скрипт исполняемым (один раз)
chmod +x scripts/deploy_well_known.sh

# Запустить деплой
./scripts/deploy_well_known.sh
```

Скрипт автоматически:
- Проверит наличие файлов
- Проверит валидность JSON
- Создаст директорию на сервере
- Скопирует файлы
- Установит правильные права доступа

### Вариант 2: Через SSH (вручную)

```bash
# 1. Создайте директорию .well-known на сервере
ssh root@83.166.246.205 'mkdir -p /home/aviapoint/.well-known'

# 2. Скопируйте файлы
scp .well-known/assetlinks.json root@83.166.246.205:/home/aviapoint/.well-known/
scp .well-known/apple-app-site-association root@83.166.246.205:/home/aviapoint/.well-known/

# 3. Установите правильные права доступа
ssh root@83.166.246.205 'chmod 644 /home/aviapoint/.well-known/*'
```

### Вариант 2: Через Nginx конфигурацию

Если файлы должны быть доступны через Nginx, добавьте в конфигурацию Nginx:

```nginx
location /.well-known/ {
    alias /home/aviapoint/.well-known/;
    default_type application/json;
    add_header Content-Type application/json;
    access_log off;
}
```

**Особенно важно для iOS:** Убедитесь, что `apple-app-site-association` отдается с `Content-Type: application/json`.

### Вариант 3: Через backend (Dart/Flutter)

Если файлы должны отдаваться через backend, добавьте роуты:

```dart
// В вашем backend роутере
router.get('/.well-known/assetlinks.json', (Request request) async {
  return Response.ok(
    File('.well-known/assetlinks.json').readAsStringSync(),
    headers: {'Content-Type': 'application/json'},
  );
});

router.get('/.well-known/apple-app-site-association', (Request request) async {
  return Response.ok(
    File('.well-known/apple-app-site-association').readAsStringSync(),
    headers: {'Content-Type': 'application/json'},
  );
});
```

## ✅ Шаг 5: Проверка

### Проверка Android (assetlinks.json):

1. Откройте в браузере: `https://avia-point.com/.well-known/assetlinks.json`
2. Убедитесь, что файл доступен и валидный JSON
3. Проверьте через Google Tool: https://digitalassetlinks.googleapis.com/v1/statements:list?source.web.site=https://avia-point.com&relation=delegate_permission/common.handle_all_urls

### Проверка iOS (apple-app-site-association):

1. Откройте в браузере: `https://avia-point.com/.well-known/apple-app-site-association`
2. Убедитесь, что файл доступен и валидный JSON
3. Проверьте через Apple Tool: https://search.developer.apple.com/appsearch-validation-tool/
4. **Важно:** Файл должен быть доступен по HTTPS без редиректов

### Проверка через приложение:

1. **Android:**
   ```bash
   adb shell pm get-app-links ru.dartflutter.aviapoint
   ```

2. **iOS:**
   - Откройте Settings → Developer → Associated Domains
   - Проверьте, что `applinks:avia-point.com` активен

## 🔍 Отладка

### Если диплинки не работают:

1. **Проверьте доступность файлов:**
   ```bash
   curl https://avia-point.com/.well-known/assetlinks.json
   curl https://avia-point.com/.well-known/apple-app-site-association
   ```

2. **Проверьте Content-Type:**
   ```bash
   curl -I https://avia-point.com/.well-known/assetlinks.json
   curl -I https://avia-point.com/.well-known/apple-app-site-association
   ```
   Должен быть: `Content-Type: application/json`

3. **Проверьте валидность JSON:**
   ```bash
   cat .well-known/assetlinks.json | python -m json.tool
   cat .well-known/apple-app-site-association | python -m json.tool
   ```

4. **Для Android:** Проверьте логи:
   ```bash
   adb logcat | grep -i "assetlinks"
   ```

5. **Для iOS:** Проверьте логи в Xcode Console при открытии ссылки

## 📌 Важные замечания

1. **Файлы должны быть доступны по HTTPS** (не HTTP)
2. **Файлы не должны иметь редиректов** (301, 302)
3. **Content-Type должен быть `application/json`**
4. **Для iOS:** Файл `apple-app-site-association` должен быть **без расширения**
5. **SHA256 fingerprint** должен быть от **того же ключа**, который используется для подписи приложения в Google Play
6. **Team ID** должен соответствовать вашему Apple Developer аккаунту

## 🔄 Обновление после изменения ключей

Если вы изменили ключ подписи (например, создали новый release ключ):

1. Получите новый SHA256 fingerprint
2. Обновите `assetlinks.json`
3. Загрузите обновленный файл на сервер
4. Подождите несколько часов для обновления кеша Google

## 📚 Дополнительные ресурсы

- [Android App Links](https://developer.android.com/training/app-links)
- [iOS Universal Links](https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app)
- [Google Digital Asset Links Validator](https://digitalassetlinks.googleapis.com/v1/statements:list)
- [Apple App Site Association Validator](https://search.developer.apple.com/appsearch-validation-tool/)
