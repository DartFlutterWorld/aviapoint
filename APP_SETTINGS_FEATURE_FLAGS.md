# Система управления видимостью контента (Feature Flags)

## Описание

Система позволяет управлять видимостью контента в приложении через настройки на бэкенде. Это полезно для:
- Скрытия платного контента перед запуском
- A/B тестирования
- Постепенного включения новых функций
- Управления видимостью разделов приложения

## Структура

### Бэкенд
- **Миграция**: `migrations/create_app_settings_table.sql`
- **Модель**: `lib/app_settings/data/model/app_settings_model.dart`
- **Репозиторий**: `lib/app_settings/data/repositories/app_settings_repository.dart`
- **Контроллер**: `lib/app_settings/controller/app_settings_controller.dart`

### Фронтенд
- **DTO**: `lib/app_settings/data/models/app_settings_dto.dart`
- **Сервис**: `lib/app_settings/data/datasources/app_settings_service.dart`
- **Репозиторий**: `lib/app_settings/data/repositories/app_settings_repository_impl.dart`
- **Хелпер**: `lib/app_settings/data/services/app_settings_service_helper.dart`

## API Endpoints

### GET `/api/app-settings`
Получить все настройки приложения

**Response:**
```json
[
  {
    "id": 1,
    "key": "showPaidContent",
    "value": true,
    "description": "Показывать платный контент",
    "created_at": "2025-01-09T12:00:00Z",
    "updated_at": "2025-01-09T12:00:00Z"
  }
]
```

### GET `/api/app-settings/{key}`
Получить настройку по ключу

**Response:**
```json
{
  "id": 1,
  "key": "showPaidContent",
  "value": true,
  "description": "Показывать платный контент",
  "created_at": "2025-01-09T12:00:00Z",
  "updated_at": "2025-01-09T12:00:00Z"
}
```

### GET `/api/app-settings/{key}/value`
Получить только значение настройки

**Response:**
```json
{
  "key": "showPaidContent",
  "value": true
}
```

## Использование в коде

### Инициализация

Сервис автоматически инициализируется при старте приложения в `app.dart`:

```dart
AppSettingsServiceHelper().initialize();
```

### Проверка значения настройки

```dart
import 'package:aviapoint/app_settings/data/services/app_settings_service_helper.dart';

// Проверить значение настройки
bool showPaidContent = AppSettingsServiceHelper().getSettingValue('showPaidContent');

// Использовать в UI
if (AppSettingsServiceHelper().getSettingValue('showPaidContent')) {
  // Показать платный контент
}
```

### Пример использования в виджете

```dart
Column(
  children: [
    // Показываем виджет только если showPaidContent = true
    if (AppSettingsServiceHelper().getSettingValue('showPaidContent')) ...[
      PaidContentWidget(),
    ],
  ],
)
```

## Текущие настройки

### `showPaidContent`
- **Описание**: Показывать платный контент в приложении
- **Использование**:
  - Скрывает раздел "Тренировочный режим" в `testing_mode_screen.dart`
  - Скрывает виджет подписки в профиле (`profile_screen.dart`)

## Добавление новых настроек

### 1. Добавить настройку в БД

Выполните SQL запрос:

```sql
INSERT INTO app_settings (key, value, description)
VALUES ('newFeatureFlag', true, 'Описание новой настройки');
```

### 2. Использовать в коде

```dart
if (AppSettingsServiceHelper().getSettingValue('newFeatureFlag')) {
  // Показать новый функционал
}
```

### 3. Обновить значение через БД

```sql
UPDATE app_settings 
SET value = false 
WHERE key = 'newFeatureFlag';
```

После обновления в БД можно вызвать `refresh()` для обновления кеша:

```dart
await AppSettingsServiceHelper().refresh();
```

## Кеширование

Сервис автоматически кеширует значения настроек при инициализации для быстрого доступа. Кеш обновляется:
- При инициализации приложения
- При вызове `refresh()`

## Миграция

Для применения миграции выполните:

```bash
# На бэкенде
cd /Users/admin/Projects/aviapoint_server
# Миграция будет выполнена автоматически при старте сервера
# Или вручную через MigrationManager
```

## Важные моменты

1. **Значения по умолчанию**: Если настройка не найдена, возвращается `false` (кроме `showPaidContent`, который по умолчанию `true`)

2. **Обработка ошибок**: При ошибке загрузки настроек используются значения по умолчанию

3. **Производительность**: Кеширование обеспечивает быстрый доступ без запросов к серверу

4. **Расширяемость**: Легко добавлять новые настройки без изменения кода
