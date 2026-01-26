-- Создание таблицы для FCM токенов (авторизованных и анонимных)
-- Если user_id = NULL, то это анонимный токен для массовых рассылок

CREATE TABLE IF NOT EXISTS fcm_tokens (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES profiles(id) ON DELETE CASCADE, -- NULL для анонимных токенов
    fcm_token VARCHAR(255) NOT NULL UNIQUE,
    platform VARCHAR(50) NOT NULL, -- 'ios', 'android', 'web'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Индексы для быстрого поиска
CREATE INDEX IF NOT EXISTS idx_fcm_tokens_user_id ON fcm_tokens(user_id);
CREATE INDEX IF NOT EXISTS idx_fcm_tokens_anonymous ON fcm_tokens(fcm_token) WHERE user_id IS NULL;
CREATE INDEX IF NOT EXISTS idx_fcm_tokens_platform ON fcm_tokens(platform);

-- Комментарии к таблице
COMMENT ON TABLE fcm_tokens IS 'FCM токены для push-уведомлений. user_id = NULL означает анонимный токен для массовых рассылок';
COMMENT ON COLUMN fcm_tokens.user_id IS 'ID пользователя. NULL для анонимных токенов';
COMMENT ON COLUMN fcm_tokens.fcm_token IS 'FCM токен устройства (уникальный)';
COMMENT ON COLUMN fcm_tokens.platform IS 'Платформа: ios, android, web';
