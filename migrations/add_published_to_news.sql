-- Миграция: добавление поля published и author_id в таблицу news
-- Поле published определяет, опубликована ли новость (true) или предложена пользователем (false)
-- Поле author_id связывает новость с пользователем, который её предложил

-- Добавляем поле author_id (если его еще нет)
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'news' AND column_name = 'author_id'
    ) THEN
        ALTER TABLE news ADD COLUMN author_id INTEGER REFERENCES profiles(id) ON DELETE SET NULL;
        CREATE INDEX IF NOT EXISTS idx_news_author_id ON news(author_id);
    END IF;
END $$;

-- Добавляем поле published
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'news' AND column_name = 'published'
    ) THEN
        ALTER TABLE news ADD COLUMN published BOOLEAN DEFAULT TRUE;
        -- Устанавливаем published = true для всех существующих новостей
        UPDATE news SET published = TRUE WHERE published IS NULL;
        -- Делаем поле NOT NULL после обновления
        ALTER TABLE news ALTER COLUMN published SET NOT NULL;
        ALTER TABLE news ALTER COLUMN published SET DEFAULT FALSE;
        -- Создаем индекс для быстрой фильтрации
        CREATE INDEX IF NOT EXISTS idx_news_published ON news(published);
    END IF;
END $$;

-- Комментарии к полям
COMMENT ON COLUMN news.author_id IS 'ID пользователя, предложившего новость';
COMMENT ON COLUMN news.published IS 'Опубликована ли новость (true) или находится на модерации (false)';
