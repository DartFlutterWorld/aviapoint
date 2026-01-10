# Реализация удаления аккаунта на бэкенде

## Endpoint

### DELETE `/api/profile`

Удаляет аккаунт текущего авторизованного пользователя.

**Требования:**
- Пользователь должен быть авторизован (требуется JWT токен)
- Удаление должно быть необратимым

**Request Headers:**
```
Authorization: Bearer <jwt_token>
```

**Response:**

**Успех (200 OK):**
```json
{
  "message": "Account deleted successfully"
}
```

**Ошибка авторизации (401 Unauthorized):**
```json
{
  "error": "Unauthorized"
}
```

**Ошибка (500 Internal Server Error):**
```json
{
  "error": "Failed to delete account"
}
```

## Логика удаления на бэкенде

### Что нужно удалить:

1. **Профиль пользователя** (`profiles` таблица)
   - Удалить запись профиля
   - Или пометить как удаленный (soft delete) с установкой `deleted_at`

2. **Связанные данные** (в зависимости от вашей бизнес-логики):
   - Подписки пользователя (`subscriptions`)
   - Платежи пользователя (`payments`) - можно оставить для истории
   - Отзывы пользователя (`reviews`) - можно оставить анонимными
   - Полеты пользователя (`flights`) - можно оставить для истории
   - FCM токены (`fcm_tokens`)
   - Другие связанные данные

### Рекомендуемый подход (PostgreSQL):

#### Вариант 1: Soft Delete (рекомендуется)

```sql
-- Обновляем профиль, помечая как удаленный
UPDATE profiles 
SET 
  deleted_at = NOW(),
  phone = NULL,  -- Удаляем персональные данные
  email = NULL,
  first_name = NULL,
  last_name = NULL,
  telegram = NULL,
  max = NULL,
  avatar_url = NULL
WHERE id = $1;

-- Удаляем FCM токены
DELETE FROM fcm_tokens WHERE user_id = $1;

-- Анонимизируем отзывы (опционально)
UPDATE reviews 
SET author_id = NULL, 
    author_name = 'Удаленный пользователь'
WHERE author_id = $1;
```

#### Вариант 2: Hard Delete (полное удаление)

```sql
-- Удаляем все связанные данные
DELETE FROM fcm_tokens WHERE user_id = $1;
DELETE FROM subscriptions WHERE user_id = $1;
DELETE FROM reviews WHERE author_id = $1;
-- ... другие связанные таблицы

-- Удаляем профиль
DELETE FROM profiles WHERE id = $1;
```

### Пример реализации (Node.js/Express с PostgreSQL):

```javascript
// routes/profile.js
router.delete('/api/profile', authenticateToken, async (req, res) => {
  const userId = req.user.id; // Из JWT токена
  
  const client = await pool.connect();
  
  try {
    await client.query('BEGIN');
    
    // Soft delete: помечаем профиль как удаленный
    await client.query(
      `UPDATE profiles 
       SET deleted_at = NOW(),
           phone = NULL,
           email = NULL,
           first_name = NULL,
           last_name = NULL,
           telegram = NULL,
           max = NULL,
           avatar_url = NULL
       WHERE id = $1`,
      [userId]
    );
    
    // Удаляем FCM токены
    await client.query(
      'DELETE FROM fcm_tokens WHERE user_id = $1',
      [userId]
    );
    
    // Анонимизируем отзывы (опционально)
    await client.query(
      `UPDATE reviews 
       SET author_id = NULL, 
           author_name = 'Удаленный пользователь'
       WHERE author_id = $1`,
      [userId]
    );
    
    // Отменяем активные подписки
    await client.query(
      `UPDATE subscriptions 
       SET status = 'cancelled', 
           cancelled_at = NOW()
       WHERE user_id = $1 AND status = 'active'`,
      [userId]
    );
    
    await client.query('COMMIT');
    
    res.status(200).json({ message: 'Account deleted successfully' });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error deleting account:', error);
    res.status(500).json({ error: 'Failed to delete account' });
  } finally {
    client.release();
  }
});
```

### Пример реализации (Dart/Server):

```dart
// routes/profile_route.dart
@Route.delete('/api/profile')
Future<Response> deleteProfile(Request request) async {
  // Получаем пользователя из сессии/JWT
  final userId = request.context['userId'] as int?;
  if (userId == null) {
    return Response.unauthorized(body: {'error': 'Unauthorized'});
  }
  
  final db = request.context['db'] as Database;
  
  try {
    await db.transaction((txn) async {
      // Soft delete профиля
      await txn.execute(
        '''
        UPDATE profiles 
        SET deleted_at = NOW(),
            phone = NULL,
            email = NULL,
            first_name = NULL,
            last_name = NULL,
            telegram = NULL,
            max = NULL,
            avatar_url = NULL
        WHERE id = ?
        ''',
        [userId],
      );
      
      // Удаляем FCM токены
      await txn.execute(
        'DELETE FROM fcm_tokens WHERE user_id = ?',
        [userId],
      );
      
      // Анонимизируем отзывы
      await txn.execute(
        '''
        UPDATE reviews 
        SET author_id = NULL, 
            author_name = 'Удаленный пользователь'
        WHERE author_id = ?
        ''',
        [userId],
      );
      
      // Отменяем активные подписки
      await txn.execute(
        '''
        UPDATE subscriptions 
        SET status = 'cancelled', 
            cancelled_at = NOW()
        WHERE user_id = ? AND status = 'active'
        ''',
        [userId],
      );
    });
    
    return Response.ok({'message': 'Account deleted successfully'});
  } catch (e) {
    print('Error deleting account: $e');
    return Response.internalServerError(
      body: {'error': 'Failed to delete account'},
    );
  }
}
```

## Важные моменты

1. **Безопасность:**
   - Убедитесь, что пользователь может удалить только свой аккаунт
   - Проверяйте авторизацию перед удалением

2. **GDPR Compliance:**
   - При удалении аккаунта должны удаляться все персональные данные
   - Можно оставить анонимные данные для статистики/истории

3. **Cascade Delete:**
   - Настройте CASCADE DELETE в базе данных для автоматического удаления связанных данных
   - Или обрабатывайте удаление вручную в транзакции

4. **Логирование:**
   - Логируйте факт удаления аккаунта для аудита
   - Не логируйте персональные данные

5. **Валидация:**
   - Проверьте, нет ли активных подписок перед удалением
   - Предупредите пользователя, если есть важные данные

## Тестирование

1. **Успешное удаление:**
   - Авторизованный пользователь удаляет свой аккаунт
   - Проверьте, что профиль помечен как удаленный
   - Проверьте, что FCM токены удалены

2. **Ошибка авторизации:**
   - Запрос без токена должен вернуть 401

3. **Ошибка сервера:**
   - При ошибке БД должен вернуться 500

## После реализации

После реализации endpoint на бэкенде:
1. Протестируйте удаление аккаунта через Postman/curl
2. Проверьте, что все связанные данные обрабатываются корректно
3. Убедитесь, что пользователь не может удалить чужой аккаунт
4. Проверьте, что после удаления пользователь не может авторизоваться
