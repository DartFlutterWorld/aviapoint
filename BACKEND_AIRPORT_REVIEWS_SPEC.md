# Backend API Specification: Отзывы об аэропортах

## 📋 Обзор

Эта спецификация описывает API endpoints для работы с отзывами об аэропортах (аэродромах). Система позволяет пользователям оставлять отзывы с рейтингом, комментариями и фотографиями.

## 🗄️ База данных

### Миграция SQL

Файл: `migrations/create_airport_reviews_table.sql`

```sql
CREATE TABLE airport_reviews (
  id SERIAL PRIMARY KEY,
  airport_code VARCHAR(10) NOT NULL REFERENCES airports(code) ON DELETE CASCADE,
  reviewer_id INTEGER NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  photo_urls JSONB, -- Массив URL фотографий: ["url1", "url2", ...]
  reply_to_review_id INTEGER REFERENCES airport_reviews(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_airport_reviews_airport_code ON airport_reviews(airport_code);
CREATE INDEX idx_airport_reviews_reviewer_id ON airport_reviews(reviewer_id);
CREATE INDEX idx_airport_reviews_reply_to_review_id ON airport_reviews(reply_to_review_id);
CREATE INDEX idx_airport_reviews_created_at ON airport_reviews(created_at DESC);
```

### Структура данных

**Таблица `airport_reviews`:**
- `id` - уникальный идентификатор отзыва (SERIAL PRIMARY KEY)
- `airport_code` - код аэропорта (VARCHAR(10), FK → airports.code)
- `reviewer_id` - ID пользователя, оставившего отзыв (INTEGER, FK → profiles.id)
- `rating` - рейтинг от 1 до 5 (INTEGER, NOT NULL, CHECK 1-5)
- `comment` - текстовый комментарий (TEXT, nullable)
- `photo_urls` - массив URL фотографий (JSONB, nullable)
- `reply_to_review_id` - ID отзыва, на который дан ответ (INTEGER, FK → airport_reviews.id, nullable)
- `created_at` - дата создания (TIMESTAMP, DEFAULT NOW())
- `updated_at` - дата обновления (TIMESTAMP, DEFAULT NOW())

**Формат `photo_urls`:**
```json
["https://example.com/photos/photo1.jpg", "https://example.com/photos/photo2.jpg"]
```

## 🔌 API Endpoints

### 1. GET `/api/airports/{code}/reviews`

Получить список отзывов об аэропорте.

**Параметры:**
- `code` (path) - код аэропорта (ICAO)

**Авторизация:** Не требуется

**Response 200:**
```json
[
  {
    "id": 1,
    "airport_code": "UUEE",
    "reviewer_id": 123,
    "rating": 5,
    "comment": "Отличный аэропорт, чисто и уютно",
    "photo_urls": ["/uploads/reviews/photo1.jpg", "/uploads/reviews/photo2.jpg"],
    "reply_to_review_id": null,
    "created_at": "2024-01-15T10:30:00Z",
    "updated_at": "2024-01-15T10:30:00Z",
    "reviewer_first_name": "Иван",
    "reviewer_last_name": "Иванов",
    "reviewer_avatar_url": "/avatars/user123.jpg"
  },
  {
    "id": 2,
    "airport_code": "UUEE",
    "reviewer_id": 456,
    "rating": 4,
    "comment": "Неплохо, но можно лучше",
    "photo_urls": null,
    "reply_to_review_id": 1,
    "created_at": "2024-01-16T14:20:00Z",
    "updated_at": "2024-01-16T14:20:00Z",
    "reviewer_first_name": "Петр",
    "reviewer_last_name": "Петров",
    "reviewer_avatar_url": null
  }
]
```

**Логика:**
- Возвращает все отзывы для указанного аэропорта, отсортированные по `created_at DESC`
- JOIN с таблицей `profiles` для получения данных о рецензенте (`reviewer_first_name`, `reviewer_last_name`, `reviewer_avatar_url`)
- Если `reply_to_review_id` не null, это ответ на отзыв
- `photo_urls` возвращается как массив строк (может быть null или пустым массивом)

---

### 2. POST `/api/airports/reviews`

Создать новый отзыв об аэропорте.

**Авторизация:** Требуется (Bearer token)

**Content-Type:** `multipart/form-data`

**Request Body:**
```
airport_code: "UUEE" (required, string)
reviewer_id: 123 (required, integer) - из токена авторизации
rating: 5 (required, integer, 1-5)
comment: "Отличный аэропорт" (optional, string)
reply_to_review_id: null (optional, integer) - ID отзыва для ответа
photos[]: [file1.jpg, file2.jpg] (optional, array of files)
```

**Response 200:**
```json
{
  "id": 1,
  "airport_code": "UUEE",
  "reviewer_id": 123,
  "rating": 5,
  "comment": "Отличный аэропорт",
  "photo_urls": ["/uploads/airport_reviews/1/photo1.jpg", "/uploads/airport_reviews/1/photo2.jpg"],
  "reply_to_review_id": null,
  "created_at": "2024-01-15T10:30:00Z",
  "updated_at": "2024-01-15T10:30:00Z",
  "reviewer_first_name": "Иван",
  "reviewer_last_name": "Иванов",
  "reviewer_avatar_url": "/avatars/user123.jpg"
}
```

**Валидация:**
- `airport_code` должен существовать в таблице `airports`
- `rating` должен быть от 1 до 5
- Если `reply_to_review_id` указан, `rating` не требуется (ответы не имеют рейтинга)
- Если `reply_to_review_id` указан, он должен существовать и принадлежать тому же `airport_code`
- `reviewer_id` должен соответствовать ID из токена авторизации
- Фотографии: максимальный размер файла 10MB, разрешенные форматы: jpg, jpeg, png, webp
- Максимум 10 фотографий на отзыв

**Логика:**
1. Валидация входных данных
2. Проверка авторизации (reviewer_id из токена)
3. Если есть фотографии:
   - Сохранить файлы в `/uploads/airport_reviews/{review_id}/`
   - Генерировать уникальные имена файлов
   - Создать thumbnails (опционально)
   - Сохранить URL в `photo_urls` (JSONB массив)
4. Создать запись в `airport_reviews`
5. Вернуть созданный отзыв с данными о рецензенте

**Ошибки:**
- `400 Bad Request` - неверные данные (rating вне диапазона, airport_code не найден)
- `401 Unauthorized` - не авторизован
- `403 Forbidden` - reviewer_id не соответствует токену
- `422 Unprocessable Entity` - ошибка валидации (файлы слишком большие, неверный формат)

---

### 3. PUT `/api/airports/reviews/{id}`

Обновить отзыв об аэропорте.

**Авторизация:** Требуется (Bearer token), только автор отзыва

**Content-Type:** `application/json`

**Request Body:**
```json
{
  "rating": 4,
  "comment": "Исправленный комментарий"
}
```

**Response 200:**
```json
{
  "id": 1,
  "airport_code": "UUEE",
  "reviewer_id": 123,
  "rating": 4,
  "comment": "Исправленный комментарий",
  "photo_urls": ["/uploads/airport_reviews/1/photo1.jpg"],
  "reply_to_review_id": null,
  "created_at": "2024-01-15T10:30:00Z",
  "updated_at": "2024-01-15T11:00:00Z",
  "reviewer_first_name": "Иван",
  "reviewer_last_name": "Иванов",
  "reviewer_avatar_url": "/avatars/user123.jpg"
}
```

**Валидация:**
- Пользователь должен быть автором отзыва
- `rating` должен быть от 1 до 5
- Можно обновить только `rating` и `comment`
- `updated_at` обновляется автоматически

**Ошибки:**
- `400 Bad Request` - неверные данные
- `401 Unauthorized` - не авторизован
- `403 Forbidden` - пользователь не является автором отзыва
- `404 Not Found` - отзыв не найден

---

### 4. DELETE `/api/airports/reviews/{id}`

Удалить отзыв об аэропорте.

**Авторизация:** Требуется (Bearer token), только автор отзыва

**Response 204:** No Content

**Логика:**
- Удалить отзыв из БД (каскадное удаление ответов, если они есть)
- Удалить связанные фотографии с диска
- Вернуть 204 No Content

**Ошибки:**
- `401 Unauthorized` - не авторизован
- `403 Forbidden` - пользователь не является автором отзыва
- `404 Not Found` - отзыв не найден

---

### 5. POST `/api/airports/reviews/{id}/photos`

Добавить фотографии к существующему отзыву.

**Авторизация:** Требуется (Bearer token), только автор отзыва

**Content-Type:** `multipart/form-data`

**Request Body:**
```
photos[]: [file1.jpg, file2.jpg] (required, array of files)
```

**Response 200:**
```json
{
  "id": 1,
  "airport_code": "UUEE",
  "reviewer_id": 123,
  "rating": 5,
  "comment": "Отличный аэропорт",
  "photo_urls": [
    "/uploads/airport_reviews/1/photo1.jpg",
    "/uploads/airport_reviews/1/photo2.jpg",
    "/uploads/airport_reviews/1/photo3.jpg"
  ],
  "reply_to_review_id": null,
  "created_at": "2024-01-15T10:30:00Z",
  "updated_at": "2024-01-15T12:00:00Z",
  "reviewer_first_name": "Иван",
  "reviewer_last_name": "Иванов",
  "reviewer_avatar_url": "/avatars/user123.jpg"
}
```

**Валидация:**
- Пользователь должен быть автором отзыва
- Максимум 10 фотографий на отзыв (учитывая уже существующие)
- Файлы: максимум 10MB, форматы: jpg, jpeg, png, webp

**Логика:**
1. Проверка авторизации и прав
2. Сохранение новых фотографий
3. Обновление `photo_urls` (добавить новые URL к существующим)
4. Обновление `updated_at`
5. Возврат обновленного отзыва

**Ошибки:**
- `400 Bad Request` - превышен лимит фотографий или неверный формат
- `401 Unauthorized` - не авторизован
- `403 Forbidden` - пользователь не является автором отзыва
- `404 Not Found` - отзыв не найден

---

### 6. DELETE `/api/airports/reviews/{id}/photos`

Удалить фотографию из отзыва.

**Авторизация:** Требуется (Bearer token), только автор отзыва

**Query Parameters:**
- `photo_url` (required) - URL фотографии для удаления

**Response 200:**
```json
{
  "id": 1,
  "airport_code": "UUEE",
  "reviewer_id": 123,
  "rating": 5,
  "comment": "Отличный аэропорт",
  "photo_urls": ["/uploads/airport_reviews/1/photo2.jpg"],
  "reply_to_review_id": null,
  "created_at": "2024-01-15T10:30:00Z",
  "updated_at": "2024-01-15T12:30:00Z",
  "reviewer_first_name": "Иван",
  "reviewer_last_name": "Иванов",
  "reviewer_avatar_url": "/avatars/user123.jpg"
}
```

**Логика:**
1. Проверка авторизации и прав
2. Удалить URL из массива `photo_urls`
3. Удалить файл с диска
4. Обновить `updated_at`
5. Вернуть обновленный отзыв

**Ошибки:**
- `400 Bad Request` - photo_url не указан или не найден в отзыве
- `401 Unauthorized` - не авторизован
- `403 Forbidden` - пользователь не является автором отзыва
- `404 Not Found` - отзыв не найден

---

## 📝 Дополнительные требования

### SQL запросы для получения отзывов

**Пример SQL запроса для GET `/api/airports/{code}/reviews`:**

```sql
SELECT 
  ar.id,
  ar.airport_code,
  ar.reviewer_id,
  ar.rating,
  ar.comment,
  ar.photo_urls,
  ar.reply_to_review_id,
  ar.created_at,
  ar.updated_at,
  p.first_name AS reviewer_first_name,
  p.last_name AS reviewer_last_name,
  p.avatar_url AS reviewer_avatar_url
FROM airport_reviews ar
LEFT JOIN profiles p ON ar.reviewer_id = p.id
WHERE ar.airport_code = $1
ORDER BY ar.created_at DESC;
```

### Обработка фотографий

1. **Сохранение:**
   - Директория: `/uploads/airport_reviews/{review_id}/`
   - Именование: `{timestamp}_{random}.{ext}`
   - Опционально: создание thumbnails (например, `{filename}_thumb.jpg`)

2. **Валидация файлов:**
   - Максимальный размер: 10MB
   - Разрешенные форматы: jpg, jpeg, png, webp
   - Проверка MIME type

3. **Безопасность:**
   - Проверка расширения файла
   - Проверка размера
   - Сканирование на вирусы (опционально)
   - Удаление EXIF данных (опционально, для приватности)

### Триггер для updated_at

Рекомендуется создать триггер для автоматического обновления `updated_at`:

```sql
CREATE OR REPLACE FUNCTION update_airport_reviews_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER airport_reviews_updated_at
BEFORE UPDATE ON airport_reviews
FOR EACH ROW
EXECUTE FUNCTION update_airport_reviews_updated_at();
```

---

## 🔒 Безопасность

1. **Авторизация:**
   - Все endpoints (кроме GET) требуют Bearer token
   - `reviewer_id` всегда берется из токена, игнорируется из request body

2. **Валидация:**
   - Проверка существования `airport_code`
   - Проверка диапазона `rating` (1-5)
   - Валидация файлов (размер, формат)
   - Проверка прав доступа (только автор может редактировать/удалять)

3. **Ограничения:**
   - Максимум 10 фотографий на отзыв
   - Максимальный размер файла: 10MB
   - Защита от SQL injection (использовать параметризованные запросы)

---

## 📊 Примеры использования

### Создание отзыва с фотографиями

```bash
curl -X POST "http://api.example.com/api/airports/reviews" \
  -H "Authorization: Bearer {token}" \
  -F "airport_code=UUEE" \
  -F "rating=5" \
  -F "comment=Отличный аэропорт" \
  -F "photos[]=@photo1.jpg" \
  -F "photos[]=@photo2.jpg"
```

### Получение отзывов об аэропорте

```bash
curl -X GET "http://api.example.com/api/airports/UUEE/reviews"
```

### Обновление отзыва

```bash
curl -X PUT "http://api.example.com/api/airports/reviews/1" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "rating": 4,
    "comment": "Исправленный комментарий"
  }'
```

### Удаление фотографии

```bash
curl -X DELETE "http://api.example.com/api/airports/reviews/1/photos?photo_url=/uploads/airport_reviews/1/photo1.jpg" \
  -H "Authorization: Bearer {token}"
```

---

## ✅ Чеклист реализации

- [ ] Создать таблицу `airport_reviews` через миграцию
- [ ] Реализовать GET `/api/airports/{code}/reviews`
- [ ] Реализовать POST `/api/airports/reviews` (с поддержкой multipart/form-data)
- [ ] Реализовать PUT `/api/airports/reviews/{id}`
- [ ] Реализовать DELETE `/api/airports/reviews/{id}`
- [ ] Реализовать POST `/api/airports/reviews/{id}/photos`
- [ ] Реализовать DELETE `/api/airports/reviews/{id}/photos`
- [ ] Настроить сохранение и обработку фотографий
- [ ] Добавить валидацию данных
- [ ] Добавить проверку прав доступа
- [ ] Создать триггер для `updated_at`
- [ ] Добавить индексы для производительности
- [ ] Написать тесты для всех endpoints

