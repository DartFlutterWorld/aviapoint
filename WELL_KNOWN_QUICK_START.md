# Быстрый старт: Настройка файлов .well-known

## 📋 Что нужно сделать

1. Получить SHA256 fingerprint (Android) и Team ID (iOS)
2. Заполнить файлы `.well-known/assetlinks.json` и `.well-known/apple-app-site-association`
3. Загрузить файлы на сервер

## 🔧 Шаг 1: Получить данные

### Android - SHA256 fingerprint:

```bash
# Для release ключа
keytool -list -v -keystore android/keystores/aviapoint-release.keystore -alias aviapoint-release
```

Найдите строку `SHA256:` и скопируйте значение **без двоеточий**.

### iOS - Team ID:

1. Откройте Xcode → Проект → Target → Signing & Capabilities
2. Найдите **Team ID** (формат: `XXXXXXXXXX`)

## 📝 Шаг 2: Заполнить файлы

### 1. Откройте `.well-known/assetlinks.json`:

Замените `ЗАМЕНИТЬ_НА_SHA256_FINGERPRINT_ОТПРАВОЧНОГО_КЛЮЧА` на ваш SHA256 fingerprint.

### 2. Откройте `.well-known/apple-app-site-association`:

Замените `ЗАМЕНИТЬ_НА_TEAM_ID` на ваш Team ID.

## 🚀 Шаг 3: Загрузить на сервер

```bash
# Автоматический деплой (рекомендуется)
./scripts/deploy_well_known.sh
```

Или вручную через SSH (см. `WELL_KNOWN_SETUP.md`).

## ✅ Шаг 4: Проверить

1. Откройте в браузере:
   - `https://avia-point.com/.well-known/assetlinks.json`
   - `https://avia-point.com/.well-known/apple-app-site-association`

2. Убедитесь, что файлы доступны и валидны.

## 📚 Подробная инструкция

См. `WELL_KNOWN_SETUP.md` для детальной информации и отладки.
