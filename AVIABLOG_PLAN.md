# План реализации Авиаблога

Блог для авиационной тематики (статьи, обзоры, советы пилотам)

## 📋 Обзор проекта

**Цель**: Создать блог-платформу с авиационными статьями, обзорами, советами и образовательным контентом для пилотов и авиаэнтузиастов.

**Целевая аудитория**: Пилоты, авиаэнтузиасты, студенты авиационных учебных заведений.

**MVP срок**: 8-12 дней

---

## 🗄️ Фаза 1: Проектирование базы данных (1-2 дня)

### 1.1. Схема базы данных

```sql
-- Таблица категорий статей
CREATE TABLE blog_categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  slug VARCHAR(255) NOT NULL UNIQUE,
  description TEXT,
  icon_url VARCHAR(512),
  color VARCHAR(7), -- HEX цвет для UI (например, #0A6EFA)
  order_index INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Таблица статей блога
CREATE TABLE blog_articles (
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL REFERENCES profiles(id),
  category_id INTEGER REFERENCES blog_categories(id) ON DELETE SET NULL,
  title VARCHAR(500) NOT NULL,
  slug VARCHAR(500) NOT NULL UNIQUE,
  excerpt TEXT, -- Краткое описание (для превью)
  content TEXT NOT NULL, -- HTML контент статьи
  cover_image_url VARCHAR(512), -- Обложка статьи
  meta_title VARCHAR(255), -- SEO заголовок
  meta_description TEXT, -- SEO описание
  status VARCHAR(50) DEFAULT 'draft', -- draft, published, archived
  is_featured BOOLEAN DEFAULT FALSE, -- Выделенная статья
  view_count INTEGER DEFAULT 0, -- Количество просмотров
  published_at TIMESTAMP, -- Дата публикации
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Таблица тегов статей
CREATE TABLE blog_tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  slug VARCHAR(100) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Связь многие-ко-многим: статьи и теги
CREATE TABLE blog_article_tags (
  article_id INTEGER NOT NULL REFERENCES blog_articles(id) ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES blog_tags(id) ON DELETE CASCADE,
  PRIMARY KEY (article_id, tag_id)
);

-- Таблица комментариев к статьям (опционально для MVP)
CREATE TABLE blog_comments (
  id SERIAL PRIMARY KEY,
  article_id INTEGER NOT NULL REFERENCES blog_articles(id) ON DELETE CASCADE,
  author_id INTEGER NOT NULL REFERENCES profiles(id),
  parent_comment_id INTEGER REFERENCES blog_comments(id) ON DELETE CASCADE, -- Для ответов
  content TEXT NOT NULL,
  is_approved BOOLEAN DEFAULT TRUE, -- Модерация комментариев
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Индексы для производительности
CREATE INDEX idx_blog_articles_category_id ON blog_articles(category_id);
CREATE INDEX idx_blog_articles_author_id ON blog_articles(author_id);
CREATE INDEX idx_blog_articles_status ON blog_articles(status);
CREATE INDEX idx_blog_articles_published_at ON blog_articles(published_at DESC);
CREATE INDEX idx_blog_articles_is_featured ON blog_articles(is_featured);
CREATE INDEX idx_blog_article_tags_article_id ON blog_article_tags(article_id);
CREATE INDEX idx_blog_article_tags_tag_id ON blog_article_tags(tag_id);
CREATE INDEX idx_blog_comments_article_id ON blog_comments(article_id);
CREATE INDEX idx_blog_comments_author_id ON blog_comments(author_id);
```

### 1.2. Миграция SQL

Файл: `../aviapoint_server/migrations/create_blog_tables.sql`

---

## 🔧 Фаза 2: Backend реализация (3-4 дня)

### 2.1. Структура файлов

```
lib/
└── blog/
    ├── data/
    │   ├── models/
    │   │   ├── blog_category_dto.dart
    │   │   ├── blog_article_dto.dart
    │   │   ├── blog_tag_dto.dart
    │   │   └── blog_comment_dto.dart (опционально для MVP)
    │   ├── repositories/
    │   │   └── blog_repository.dart
    │   └── datasources/
    │       └── blog_service.dart
    ├── domain/
    │   ├── entities/
    │   │   ├── blog_category_entity.dart
    │   │   ├── blog_article_entity.dart
    │   │   ├── blog_tag_entity.dart
    │   │   └── blog_comment_entity.dart
    │   └── repositories/
    │       └── blog_repository.dart
    └── controller/
        └── blog_controller.dart
```

### 2.2. Модели данных

**BlogCategoryDto** (`lib/blog/data/models/blog_category_dto.dart`)
- id, name, slug, description, iconUrl, color, orderIndex

**BlogArticleDto** (`lib/blog/data/models/blog_article_dto.dart`)
- id, authorId, categoryId, title, slug, excerpt, content
- coverImageUrl, metaTitle, metaDescription
- status, isFeatured, viewCount, publishedAt, createdAt, updatedAt
- author (вложенный объект ProfileDto)
- category (вложенный объект BlogCategoryDto)
- tags (массив BlogTagDto)

**BlogTagDto** (`lib/blog/data/models/blog_tag_dto.dart`)
- id, name, slug

**BlogCommentDto** (опционально для MVP)
- id, articleId, authorId, parentCommentId, content, isApproved, createdAt

### 2.3. API Endpoints

**Основные endpoints:**
```
GET    /api/blog/categories              - Список категорий
GET    /api/blog/categories/{id}         - Детали категории

GET    /api/blog/articles                - Список статей (с фильтрами: category, tag, featured, author)
GET    /api/blog/articles/{id}           - Детали статьи (увеличивает view_count)
GET    /api/blog/articles/slug/{slug}    - Статья по slug (для SEO-friendly URLs)

POST   /api/blog/articles                - Создать статью (только авторизованные, для админов/авторов)
PUT    /api/blog/articles/{id}           - Обновить статью (только автор/админ)
DELETE /api/blog/articles/{id}           - Удалить статью (только автор/админ)

GET    /api/blog/tags                    - Список всех тегов
GET    /api/blog/tags/{id}               - Статьи с определенным тегом

POST   /api/blog/articles/{id}/comments  - Добавить комментарий (опционально для MVP)
GET    /api/blog/articles/{id}/comments  - Комментарии к статье (опционально для MVP)
DELETE /api/blog/comments/{id}           - Удалить комментарий (опционально для MVP)
```

**Фильтры для GET /api/blog/articles:**
- `category_id` - фильтр по категории
- `tag_id` - фильтр по тегу
- `author_id` - фильтр по автору
- `featured` - только выделенные статьи
- `status=published` - только опубликованные
- `limit` - количество записей (по умолчанию 20)
- `offset` - смещение для пагинации
- `search` - поиск по title и content

### 2.4. Репозиторий

**BlogRepository** (`lib/blog/data/repositories/blog_repository.dart`)
- `fetchCategories()` - получение списка категорий
- `fetchCategoryById(int id)` - получение категории
- `fetchArticles({filters})` - получение списка статей с фильтрами
- `fetchArticleById(int id)` - получение статьи (увеличивает view_count)
- `fetchArticleBySlug(String slug)` - получение статьи по slug
- `fetchTags()` - получение списка тегов
- `fetchArticlesByTag(int tagId)` - статьи с определенным тегом
- `createArticle(article)` - создание статьи (только для авторов)
- `updateArticle(id, article)` - обновление статьи
- `deleteArticle(int id)` - удаление статьи

### 2.5. Controller

**BlogController** (`lib/blog/controller/blog_controller.dart`)
- Реализация всех API endpoints
- Валидация данных
- Обработка ошибок
- Пагинация для списка статей

---

## 📱 Фаза 3: Frontend реализация (4-6 дней)

### 3.1. Структура файлов

```
lib/
└── blog/
    ├── data/
    │   ├── datasources/
    │   │   ├── blog_service.dart
    │   │   └── blog_service.g.dart (сгенерированный)
    │   ├── models/
    │   │   ├── blog_category_dto.dart
    │   │   ├── blog_article_dto.dart
    │   │   ├── blog_tag_dto.dart
    │   │   └── *.freezed.dart, *.g.dart (сгенерированные)
    │   ├── repositories/
    │   │   ├── mappers/
    │   │   │   ├── blog_category_mapper.dart
    │   │   │   ├── blog_article_mapper.dart
    │   │   │   └── blog_tag_mapper.dart
    │   │   └── blog_repository_impl.dart
    ├── domain/
    │   ├── entities/
    │   │   ├── blog_category_entity.dart
    │   │   ├── blog_article_entity.dart
    │   │   └── blog_tag_entity.dart
    │   └── repositories/
    │       └── blog_repository.dart
    └── presentation/
        ├── bloc/
        │   ├── blog_categories_bloc.dart
        │   ├── blog_articles_bloc.dart
        │   ├── blog_article_detail_bloc.dart
        │   └── *.freezed.dart (сгенерированные)
        ├── pages/
        │   ├── blog_navigation_screen.dart
        │   ├── blog_screen.dart (список статей)
        │   ├── blog_article_detail_screen.dart
        │   └── blog_category_screen.dart (опционально)
        └── widgets/
            ├── blog_article_card.dart
            ├── blog_featured_article_card.dart
            ├── blog_category_chip.dart
            └── blog_article_content.dart (отображение HTML контента)
```

### 3.2. Экраны

**1. BlogScreen** - Главный экран блога
- Список категорий (горизонтальный скролл, как в NewsScreen)
- Список статей (вертикальный список)
- Фильтр по категориям
- Поиск (опционально для MVP)
- Pull-to-refresh
- Бесконечная прокрутка (пагинация)

**2. BlogArticleDetailScreen** - Детальный просмотр статьи
- Заголовок и мета-информация (автор, дата, категория, теги)
- Обложка статьи
- HTML контент (использовать flutter_html или flutter_widget_from_html)
- Кнопка "Поделиться"
- Похожие статьи (опционально для MVP)
- Комментарии (опционально для MVP)

**3. BlogNavigationScreen** - Навигационный экран (если нужна вкладка)

### 3.3. BLoC состояние

**BlogCategoriesBloc**
- States: loading, error, success(List<CategoryEntity>)

**BlogArticlesBloc**
- Events: GetArticlesEvent(filters), LoadMoreArticlesEvent
- States: loading, error, success(List<ArticleEntity>, hasMore), loadingMore

**BlogArticleDetailBloc**
- Events: GetArticleEvent(id/slug), IncrementViewCountEvent
- States: loading, error, success(ArticleEntity)

### 3.4. Виджеты

**BlogArticleCard** - Карточка статьи в списке
- Обложка (миниатюра)
- Заголовок
- Краткое описание (excerpt)
- Автор, дата публикации
- Категория (чип)
- Количество просмотров

**BlogFeaturedArticleCard** - Большая карточка для выделенных статей
- Увеличенная обложка
- Бейдж "Рекомендуемое"
- Остальное как в обычной карточке

**BlogCategoryChip** - Чип категории
- Название категории
- Иконка (если есть)
- Цвет (из category.color)
- Активное/неактивное состояние

---

## 🎨 Фаза 4: UI/UX (интегрирована в фазу 3)

### 4.1. Дизайн принципы

- Следовать существующему дизайн-системе (AppStyles, AppColors)
- Использовать те же паттерны, что в NewsScreen
- Адаптивность для разных размеров экранов
- Темная/светлая тема (если поддерживается)

### 4.2. Основные экраны UI

**BlogScreen:**
```
┌─────────────────────────┐
│   Авиаблог              │
├─────────────────────────┤
│ [Категория1] [Кат2] ... │ ← Горизонтальный скролл
├─────────────────────────┤
│ ┌─────────────────────┐ │
│ │ [Обложка]           │ │ ← Featured статья
│ │ ⭐ Рекомендуемое    │ │
│ │ Заголовок статьи... │ │
│ │ Автор • Дата        │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ ┌─────┐                │ │
│ │[img]│ Заголовок...   │ │ ← Обычные статьи
│ │     │ Краткое опис.. │ │
│ │     │ Автор • Дата   │ │
│ └─────┘                │ │
│ ┌─────┐                │ │
│ │[img]│ Заголовок...   │ │
│ └─────┘                │ │
└─────────────────────────┘
```

**BlogArticleDetailScreen:**
```
┌─────────────────────────┐
│ ← Назад        Поделиться│
├─────────────────────────┤
│ [Обложка - на весь экран]│
│                         │
├─────────────────────────┤
│ Заголовок статьи        │
│ Автор • Дата • Категория│
│ [Тег1] [Тег2]           │
├─────────────────────────┤
│ HTML контент статьи     │
│ (с изображениями,        │
│  форматированием)        │
│                         │
│ ...                     │
├─────────────────────────┤
│ Похожие статьи          │
│ [Карточки статей]       │
└─────────────────────────┘
```

---

## 📝 Фаза 5: Дополнительные функции (опционально для MVP)

### 5.1. Комментарии
- Система комментариев к статьям
- Ответы на комментарии (вложенность)
- Модерация комментариев
- Лайки комментариев

### 5.2. Избранное
- Сохранение статей в избранное
- Экран "Мои избранные статьи"

### 5.3. Поиск
- Полнотекстовый поиск по статьям
- Фильтры (категория, тег, дата)

### 5.4. SEO оптимизация
- SEO-friendly URLs (slug)
- Meta теги
- Open Graph теги (для социальных сетей)

### 5.5. Статистика
- Просмотры статей
- Популярные статьи
- Рекомендации на основе просмотров

---

## ✅ Чек-лист реализации MVP

### Backend:
- [ ] Создать миграцию базы данных
- [ ] Реализовать модели (DTO)
- [ ] Реализовать репозиторий
- [ ] Реализовать контроллер с основными endpoints
- [ ] Тестирование API

### Frontend:
- [ ] Создать структуру папок
- [ ] Реализовать модели (DTO, Entity)
- [ ] Реализовать мапперы
- [ ] Реализовать API сервис (retrofit)
- [ ] Реализовать репозиторий
- [ ] Реализовать BLoC для категорий
- [ ] Реализовать BLoC для статей
- [ ] Реализовать BLoC для детальной страницы
- [ ] Реализовать экран списка статей (BlogScreen)
- [ ] Реализовать экран детальной статьи (BlogArticleDetailScreen)
- [ ] Реализовать виджеты (карточки, чипы)
- [ ] Добавить роутинг
- [ ] Тестирование UI

### Интеграция:
- [ ] Добавить навигацию в приложение (если нужна отдельная вкладка)
- [ ] Интеграция с существующими сервисами (если нужна)
- [ ] Обновить главный экран (если нужны ссылки на блог)

---

## 🚀 Этапы разработки (по приоритету)

**Этап 1 (MVP - 8-10 дней):**
1. База данных и миграция (1 день)
2. Backend API - основные endpoints (2-3 дня)
3. Frontend - структура и модели (1 день)
4. Frontend - экран списка статей (2 дня)
5. Frontend - экран детальной статьи (2 дня)
6. Тестирование и исправления (1 день)

**Этап 2 (Дополнительно - 4-6 дней):**
1. Комментарии (2-3 дня)
2. Поиск (1-2 дня)
3. Избранное (1 день)

---

## 📚 Используемые библиотеки

**Уже используются в проекте:**
- `flutter_bloc` - для управления состоянием
- `retrofit` - для API сервисов
- `freezed` - для моделей данных
- `flutter_widget_from_html` - для отображения HTML (уже в зависимостях)
- `cached_network_image` - для изображений

**Дополнительно не требуется** - все необходимое уже есть в проекте!

---

## 🎯 Ключевые отличия от News

1. **Контент**: Блог - более длинные статьи с образовательным контентом, новости - короткие сообщения
2. **Структура**: Блог имеет категории, теги, комментарии; новости - только категории
3. **Авторство**: В блоге важен автор статьи (профиль автора), в новостях - источник
4. **SEO**: Блог использует slug для SEO-friendly URLs
5. **Метаданные**: Блог имеет meta_title, meta_description для SEO
6. **Статусы**: Блог поддерживает draft/published (для редакции), новости - только опубликованные

---

## 💡 Рекомендации

1. **Начать с MVP** - реализовать базовый функционал без комментариев и избранного
2. **Использовать существующие паттерны** - максимально переиспользовать код из News модуля
3. **Постепенное развитие** - добавить комментарии и поиск после MVP
4. **Контент-стратегия** - подготовить несколько статей для тестирования и демонстрации

