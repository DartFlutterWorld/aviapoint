# Сбор анонимных FCM токенов

## Описание

Система собирает FCM токены как от авторизованных пользователей (с привязкой к `user_id`), так и от анонимных пользователей (для массовых рассылок).

## Структура таблицы `fcm_tokens`

```sql
CREATE TABLE fcm_tokens (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES profiles(id) ON DELETE CASCADE, -- NULL для анонимных токенов
    fcm_token VARCHAR(255) NOT NULL UNIQUE,
    platform VARCHAR(50) NOT NULL, -- 'ios', 'android', 'web'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Логика работы:

- **Если `user_id IS NOT NULL`** - токен привязан к конкретному пользователю (персонализированные уведомления)
- **Если `user_id IS NULL`** - анонимный токен для массовых рассылок (обновления приложения, новости и т.д.)

## API Endpoints

### 1. Сохранение токена авторизованного пользователя
**POST** `/api/profile/fcm-token`
- Требует авторизации (JWT токен)
- Автоматически привязывает токен к `user_id` из токена

**Request Body:**
```json
{
  "fcm_token": "dKj3h...",
  "platform": "ios"
}
```

### 2. Сохранение анонимного токена
**POST** `/api/fcm-token`
- Не требует авторизации
- Сохраняет токен с `user_id = NULL`

**Request Body:**
```json
{
  "fcm_token": "dKj3h...",
  "platform": "android"
}
```

## Логика работы на клиенте

1. **При получении FCM токена:**
   - Токен отправляется на сервер сразу
   - Если пользователь не авторизован → сохраняется как анонимный (`user_id = NULL`)
   - Если пользователь авторизован → сохраняется с `user_id`

2. **После авторизации:**
   - При загрузке профиля токен обновляется с привязкой к `user_id`
   - Анонимный токен становится персональным

3. **При обновлении токена (`onTokenRefresh`):**
   - Новый токен отправляется на сервер
   - Если пользователь авторизован → обновляется с `user_id`
   - Если не авторизован → сохраняется как анонимный

## Использование на бэкенде

### Массовая рассылка всем пользователям:
```sql
SELECT fcm_token FROM fcm_tokens;
```

### Персонализированная рассылка:
```sql
SELECT fcm_token FROM fcm_tokens WHERE user_id = 123;
```

### Рассылка только анонимным пользователям:
```sql
SELECT fcm_token FROM fcm_tokens WHERE user_id IS NULL;
```

### Рассылка по платформе:
```sql
SELECT fcm_token FROM fcm_tokens WHERE platform = 'ios';
```

## Миграция

Файл миграции: `migrations/create_fcm_tokens_table.sql`

Запуск миграции:
```bash
psql -d your_database -f migrations/create_fcm_tokens_table.sql
```

## Важные моменты

1. **Уникальность токена:** `fcm_token` должен быть уникальным (UNIQUE constraint)
2. **Обновление токена:** При обновлении FCM токена старый токен должен быть удален или обновлен
3. **Очистка:** Рекомендуется периодически удалять неактивные токены (например, старше 90 дней)
4. **Привязка при авторизации:** При авторизации пользователя анонимный токен должен быть обновлен с `user_id`

## Пример реализации на бэкенде (Node.js/Express)

```javascript
// Сохранение анонимного токена
router.post('/api/fcm-token', async (req, res) => {
  const { fcm_token, platform } = req.body;
  
  try {
    // Используем INSERT ... ON CONFLICT для обновления существующего токена
    await db.query(
      `INSERT INTO fcm_tokens (fcm_token, platform, user_id, updated_at)
       VALUES ($1, $2, NULL, NOW())
       ON CONFLICT (fcm_token) 
       DO UPDATE SET platform = $2, updated_at = NOW()`,
      [fcm_token, platform]
    );
    
    res.status(200).json({ message: 'Token saved' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Сохранение токена авторизованного пользователя
router.post('/api/profile/fcm-token', authenticateToken, async (req, res) => {
  const { fcm_token, platform } = req.body;
  const userId = req.user.id;
  
  try {
    // Обновляем токен с привязкой к user_id
    await db.query(
      `INSERT INTO fcm_tokens (fcm_token, platform, user_id, updated_at)
       VALUES ($1, $2, $3, NOW())
       ON CONFLICT (fcm_token) 
       DO UPDATE SET user_id = $3, platform = $2, updated_at = NOW()`,
      [fcm_token, platform, userId]
    );
    
    res.status(200).json({ message: 'Token saved' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
```
