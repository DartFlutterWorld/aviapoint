-- Миграция: создание таблицы airport_reviews
-- Отзывы об аэродромах с поддержкой фотографий

CREATE TABLE airport_reviews (
  id SERIAL PRIMARY KEY,
  airport_code VARCHAR(10) NOT NULL REFERENCES airports(ident) ON DELETE CASCADE,
  reviewer_id INTEGER NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  photo_urls JSONB, -- Массив URL фотографий: ["url1", "url2", ...]
  reply_to_review_id INTEGER REFERENCES airport_reviews(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Индексы для производительности
CREATE INDEX idx_airport_reviews_airport_code ON airport_reviews(airport_code);
CREATE INDEX idx_airport_reviews_reviewer_id ON airport_reviews(reviewer_id);
CREATE INDEX idx_airport_reviews_reply_to_review_id ON airport_reviews(reply_to_review_id);
CREATE INDEX idx_airport_reviews_created_at ON airport_reviews(created_at DESC);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE airport_reviews IS 'Отзывы пользователей об аэродромах';
COMMENT ON COLUMN airport_reviews.airport_code IS 'Код аэродрома (ICAO)';
COMMENT ON COLUMN airport_reviews.reviewer_id IS 'ID пользователя, оставившего отзыв';
COMMENT ON COLUMN airport_reviews.rating IS 'Рейтинг от 1 до 5';
COMMENT ON COLUMN airport_reviews.comment IS 'Текстовый комментарий к отзыву';
COMMENT ON COLUMN airport_reviews.photo_urls IS 'Массив URL фотографий, приложенных к отзыву';
COMMENT ON COLUMN airport_reviews.reply_to_review_id IS 'ID отзыва, на который дан ответ (для ответов на отзывы)';

