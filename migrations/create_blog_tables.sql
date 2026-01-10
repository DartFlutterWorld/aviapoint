-- Миграция: создание таблиц для авиаблога
-- Блог для авиационной тематики (статьи, обзоры, советы пилотам)

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

-- Комментарии к таблицам
COMMENT ON TABLE blog_categories IS 'Категории статей блога';
COMMENT ON TABLE blog_articles IS 'Статьи авиаблога';
COMMENT ON TABLE blog_tags IS 'Теги для статей';
COMMENT ON TABLE blog_article_tags IS 'Связь статей и тегов (многие-ко-многим)';
COMMENT ON TABLE blog_comments IS 'Комментарии к статьям';

-- Заполнение категорий
INSERT INTO blog_categories (name, slug, description, color, order_index) VALUES
  (
    'Обучение пилотов',
    'pilot-training',
    'Статьи об обучении пилотов, курсах, экзаменах и сертификации',
    '#0A6EFA',
    1
  ),
  (
    'Безопасность полетов',
    'flight-safety',
    'Материалы о безопасности полетов, аварийных процедурах и лучших практиках',
    '#E63946',
    2
  ),
  (
    'Техника и оборудование',
    'aviation-technology',
    'Обзоры авиационной техники, оборудования и технологий',
    '#7A0FD9',
    3
  ),
  (
    'Правила и регламенты',
    'aviation-regulations',
    'Авиационные правила, регламенты и нормативные документы',
    '#06A77D',
    4
  ),
  (
    'Советы пилотам',
    'pilot-tips',
    'Практические советы и рекомендации для пилотов',
    '#F77F00',
    5
  ),
  (
    'Обзоры самолетов',
    'aircraft-reviews',
    'Обзоры различных моделей самолетов и их характеристик',
    '#7209B7',
    6
  ),
  (
    'Истории из практики',
    'pilot-stories',
    'Реальные истории из практики пилотов и интересные случаи',
    '#118AB2',
    7
  ),
  (
    'Навигация и планирование',
    'navigation-planning',
    'Статьи о навигации, планировании полетов и работе с картами',
    '#06FFA5',
    8
  );

-- Комментарии к категориям
COMMENT ON COLUMN blog_categories.name IS 'Название категории';
COMMENT ON COLUMN blog_categories.slug IS 'URL-friendly идентификатор категории';
COMMENT ON COLUMN blog_categories.description IS 'Описание категории';
COMMENT ON COLUMN blog_categories.color IS 'HEX цвет для отображения в UI';
COMMENT ON COLUMN blog_categories.order_index IS 'Порядок сортировки категорий';

