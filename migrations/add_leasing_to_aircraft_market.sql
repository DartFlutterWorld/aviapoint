-- Миграция: добавление полей лизинга к таблице aircraft_market
-- Поля:
-- - is_leasing BOOLEAN: признак, что самолёт продаётся в лизинг
-- - leasing_conditions TEXT: произвольный текст с условиями лизинга

ALTER TABLE aircraft_market
  ADD COLUMN IF NOT EXISTS is_leasing BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS leasing_conditions TEXT;

COMMENT ON COLUMN aircraft_market.is_leasing IS 'Флаг: самолёт продаётся в лизинг';
COMMENT ON COLUMN aircraft_market.leasing_conditions IS 'Условия лизинга, заполняются владельцем объявления';

