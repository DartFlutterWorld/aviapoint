# Исправление проблемы с SELECT в миграциях

## Проблема

Ошибка возникает после строки:
```sql
ALTER TABLE news ALTER COLUMN id SET DEFAULT nextval('news_id_seq');
```

Это означает, что где-то в миграции есть SELECT без INTO, который выполняется после этой строки.

## Решение

Выполните на сервере:

```bash
cd /home/aviapoint_server

# 1. Найти все SELECT в миграциях, которые могут вызывать проблему
grep -rn "SELECT.*FROM" migrations/*.sql | grep -v "INTO" | grep -v "EXISTS" | grep -v "PERFORM" | grep -v "COMMENT"

# 2. Найти SELECT в миграциях, которые работают с news
grep -rn "SELECT.*news" migrations/*.sql | grep -v "INTO" | grep -v "EXISTS"

# 3. Найти проблемные SELECT в блоках DO $$
# Проверьте миграции 071 и 072
grep -A 20 "ALTER TABLE news ALTER COLUMN id SET DEFAULT" migrations/071_add_content_and_images_to_news.sql
grep -A 20 "ALTER TABLE news ALTER COLUMN id SET DEFAULT" migrations/072_sync_all_tables_and_fields.sql
```

## Вероятная проблема

MigrationManager может разбивать SQL по точкам с запятой. Если в миграции есть SELECT без INTO вне блока DO $$, он будет выполняться отдельно и вызовет ошибку.

## Что нужно исправить

Найдите все SELECT в миграциях, которые:
1. Не используют INTO для сохранения результата
2. Не используются в EXISTS
3. Не обёрнуты в PERFORM

И исправьте их, используя один из подходов:
- `SELECT ... INTO variable` если результат нужен
- `PERFORM ...` если результат не нужен
- Обернуть в блок DO $$ если это часть логики
