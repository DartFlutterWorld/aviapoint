# Проверка бэкенда: использование subscription_type_id вместо subscriptionType

## ✅ Что проверено на фронтенде

### 1. Модели данных

**CreatePaymentRequestDto** (`lib/payment/data/models/create_payment_request_dto.dart`):
```dart
@JsonKey(name: 'subscription_type_id') required int subscriptionTypeId
```
✅ Отправляет `subscription_type_id` (integer)

**SubscriptionDto** (`lib/payment/data/models/subscription_dto.dart`):
```dart
@JsonKey(name: 'subscription_type_id') required int subscriptionTypeId
```
✅ Ожидает `subscription_type_id` (integer) в ответах

**SubscriptionTypeModel** (`lib/payment/data/models/subscription_type_model.dart`):
```dart
required int id,  // ✅ Используется id, не subscriptionType
required String code,
required String name,
...
```
✅ Модель использует `id`, не `subscriptionType`

### 2. API Endpoints

**POST /api/payments/create**
- Отправляет: `subscription_type_id` (integer)
- Пример запроса:
```json
{
  "amount": 1000.00,
  "currency": "RUB",
  "description": "Оплата подписки",
  "user_id": 123,
  "subscription_type_id": 1,  // ✅ Правильно
  "return_url": "aviapoint://payment/success"
}
```

**GET /api/subscriptions/active**
- Ожидает в ответе: `subscription_type_id` (integer)
- Пример ответа:
```json
{
  "subscriptions": [
    {
      "id": 1,
      "user_id": 123,
      "subscription_type_id": 1,  // ✅ Правильно
      "period_days": 365,
      "start_date": "2024-01-01T00:00:00Z",
      "end_date": "2024-12-31T23:59:59Z",
      "is_active": true
    }
  ]
}
```

**GET /api/subscriptions/types**
- Ожидает в ответе объекты с полем `id`:
```json
{
  "subscription_types": [
    {
      "id": 1,  // ✅ Правильно
      "code": "rosaviatest_365",
      "name": "Годовая подписка",
      "period_days": 365,
      "price": 1000,
      "is_active": true,
      "created_at": "2024-01-01T00:00:00Z",
      "description": "Подписка на год"
    }
  ]
}
```

## 🔍 Что нужно проверить на бэкенде

### 1. База данных

**Таблица `subscriptions`:**
```sql
-- ✅ Должно быть:
subscription_type_id INTEGER NOT NULL REFERENCES subscription_types(id)

-- ❌ НЕ должно быть:
subscription_type VARCHAR(50)  -- Старое поле, нужно удалить
```

**Таблица `subscription_types`:**
```sql
-- ✅ Должна иметь:
id SERIAL PRIMARY KEY,
code VARCHAR(255) NOT NULL,
name VARCHAR(255) NOT NULL,
period_days INTEGER NOT NULL,
price INTEGER NOT NULL,
is_active BOOLEAN DEFAULT TRUE,
created_at TIMESTAMP DEFAULT NOW(),
description TEXT
```

### 2. API Endpoints

#### POST /api/payments/create

**Проверить:**
- ✅ Принимает `subscription_type_id` (integer)
- ❌ НЕ принимает `subscription_type` (string)
- ✅ Валидирует, что `subscription_type_id` существует в таблице `subscription_types`
- ✅ Сохраняет `subscription_type_id` в таблицу `payments` или `subscriptions`

**Пример валидации (PHP/Laravel):**
```php
$request->validate([
    'subscription_type_id' => 'required|integer|exists:subscription_types,id',
    // НЕ должно быть: 'subscription_type' => ...
]);
```

#### GET /api/subscriptions/active

**Проверить:**
- ✅ Возвращает `subscription_type_id` (integer)
- ❌ НЕ возвращает `subscription_type` (string)
- ✅ JOIN с таблицей `subscription_types` по `subscription_type_id`

**Пример SQL запроса:**
```sql
SELECT 
    s.id,
    s.user_id,
    s.subscription_type_id,  -- ✅ Правильно
    s.period_days,
    s.start_date,
    s.end_date,
    s.is_active,
    st.code,
    st.name,
    st.price
FROM subscriptions s
JOIN subscription_types st ON s.subscription_type_id = st.id
WHERE s.user_id = ? AND s.is_active = true
```

#### GET /api/subscriptions/types

**Проверить:**
- ✅ Возвращает объекты с полем `id`
- ✅ Возвращает все необходимые поля: `id`, `code`, `name`, `period_days`, `price`, `is_active`, `created_at`, `description`
- ❌ НЕ возвращает поле `subscription_type` (string)

**Пример SQL запроса:**
```sql
SELECT 
    id,  -- ✅ Правильно
    code,
    name,
    period_days,
    price,
    is_active,
    created_at,
    description
FROM subscription_types
WHERE is_active = true
ORDER BY price ASC
```

### 3. Модели/Entity на бэкенде

**Payment Model:**
```php
// ✅ Должно быть:
protected $fillable = [
    'subscription_type_id',  // integer
    // ...
];

// ❌ НЕ должно быть:
// protected $fillable = ['subscription_type', ...];
```

**Subscription Model:**
```php
// ✅ Должно быть:
protected $fillable = [
    'user_id',
    'subscription_type_id',  // integer, foreign key
    'period_days',
    // ...
];

public function subscriptionType() {
    return $this->belongsTo(SubscriptionType::class, 'subscription_type_id');
}
```

**SubscriptionType Model:**
```php
// ✅ Должно быть:
protected $fillable = [
    'id',  // primary key
    'code',
    'name',
    'period_days',
    'price',
    'is_active',
    'description',
];
```

### 4. Миграции базы данных

**Проверить миграции:**
- ✅ Если есть миграция, которая добавляет `subscription_type_id` - хорошо
- ❌ Если есть миграция, которая добавляет `subscription_type` (string) - нужно удалить или изменить
- ✅ Если есть старые данные с `subscription_type`, нужна миграция для конвертации:
  ```sql
  -- Пример миграции конвертации (если нужно)
  UPDATE subscriptions s
  SET subscription_type_id = (
      SELECT id FROM subscription_types WHERE code = s.subscription_type
  )
  WHERE subscription_type_id IS NULL;
  
  -- Затем удалить старое поле
  ALTER TABLE subscriptions DROP COLUMN subscription_type;
  ```

## 📋 Чек-лист проверки бэкенда

- [ ] Таблица `subscriptions` использует `subscription_type_id` (integer, foreign key)
- [ ] Таблица `subscriptions` НЕ содержит поле `subscription_type` (string)
- [ ] Таблица `subscription_types` существует и имеет поле `id` (primary key)
- [ ] API `/api/payments/create` принимает `subscription_type_id` (integer)
- [ ] API `/api/payments/create` НЕ принимает `subscription_type` (string)
- [ ] API `/api/subscriptions/active` возвращает `subscription_type_id` (integer)
- [ ] API `/api/subscriptions/active` НЕ возвращает `subscription_type` (string)
- [ ] API `/api/subscriptions/types` возвращает объекты с полем `id`
- [ ] Модели на бэкенде используют `subscription_type_id`, а не `subscription_type`
- [ ] Валидация проверяет существование `subscription_type_id` в таблице `subscription_types`
- [ ] Все SQL запросы используют `subscription_type_id` для JOIN
- [ ] Старые данные (если есть) конвертированы с `subscription_type` на `subscription_type_id`

## 🚨 Потенциальные проблемы

1. **Если бэкенд все еще использует `subscription_type` (string):**
   - Фронтенд отправляет `subscription_type_id` (integer)
   - Бэкенд ожидает `subscription_type` (string)
   - ❌ Результат: ошибка валидации или неправильное сохранение

2. **Если в БД есть оба поля:**
   - Нужно убедиться, что используется только `subscription_type_id`
   - Удалить поле `subscription_type` после миграции данных

3. **Если бэкенд возвращает `subscription_type` вместо `subscription_type_id`:**
   - Фронтенд ожидает `subscription_type_id` (integer)
   - ❌ Результат: ошибка парсинга JSON

## ✅ Итог проверки

### Фронтенд - полностью готов ✅

**Проверено:**
1. ✅ `CreatePaymentRequestDto` отправляет `subscription_type_id` (integer)
2. ✅ `SubscriptionDto` ожидает `subscription_type_id` (integer) в ответах
3. ✅ `SubscriptionTypeModel` использует `id`, не `subscription_type`
4. ✅ Все сгенерированные файлы (`.g.dart`) используют правильные поля
5. ✅ Комментарии в коде указывают на синхронизацию с бэкендом: "required как на бэкенде"
6. ✅ Неиспользуемый enum `SubscriptionType` удален
7. ✅ Везде используется `id` из модели `SubscriptionTypeModel`

**Структура запросов/ответов:**
- **POST /api/payments/create** → отправляет: `{"subscription_type_id": 1}`
- **GET /api/subscriptions/active** → ожидает: `{"subscription_type_id": 1}`
- **GET /api/subscriptions/types** → ожидает: `{"id": 1, "code": "...", ...}`

### Бэкенд - требуется проверка ⚠️

**Что нужно проверить на бэкенде:**

1. **База данных:**
   - [ ] Таблица `subscriptions` использует `subscription_type_id` (integer, foreign key)
   - [ ] Таблица `subscriptions` НЕ содержит поле `subscription_type` (string)
   - [ ] Таблица `subscription_types` существует и имеет поле `id` (primary key)

2. **API Endpoints:**
   - [ ] `POST /api/payments/create` принимает `subscription_type_id` (integer)
   - [ ] `POST /api/payments/create` НЕ принимает `subscription_type` (string)
   - [ ] `GET /api/subscriptions/active` возвращает `subscription_type_id` (integer)
   - [ ] `GET /api/subscriptions/active` НЕ возвращает `subscription_type` (string)
   - [ ] `GET /api/subscriptions/types` возвращает объекты с полем `id`

3. **Модели/Entity:**
   - [ ] Модели используют `subscription_type_id`, а не `subscription_type`
   - [ ] Валидация проверяет существование `subscription_type_id` в таблице `subscription_types`

4. **Миграции:**
   - [ ] Если есть старые данные с `subscription_type`, они конвертированы на `subscription_type_id`
   - [ ] Старое поле `subscription_type` удалено из БД

### Рекомендации

Если бэкенд еще использует `subscription_type` (string):
1. Создать миграцию для конвертации данных
2. Обновить модели на бэкенде
3. Обновить валидацию API endpoints
4. Удалить старое поле из БД

**Фронтенд готов к работе с правильной структурой данных!** ✅
