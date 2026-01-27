#!/bin/bash

# Скрипт для замены подзапроса на переменную max_id_val
# Использование: выполните на сервере

echo "🔧 Замена подзапроса на переменную max_id_val..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Проверить, где вычисляется max_id_val в миграции 071"
echo "grep -n 'INTO max_id_val' migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 2. Проверить, где используется подзапрос"
echo "grep -n '(SELECT COALESCE(MAX(id), 0) FROM news)' migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 3. Заменить подзапрос на переменную в миграции 071"
echo "sed -i \"s/(SELECT COALESCE(MAX(id), 0) FROM news) +/max_id_val +/g\" migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 4. Сделать то же самое для миграции 072"
echo "grep -n 'INTO max_id_val' migrations/072_sync_all_tables_and_fields.sql"
echo "sed -i \"s/(SELECT COALESCE(MAX(id), 0) FROM news) +/max_id_val +/g\" migrations/072_sync_all_tables_and_fields.sql"
echo ""
echo "# 5. Проверить результат"
echo "grep -n 'max_id_val +' migrations/071_add_content_and_images_to_news.sql"
echo "grep -n 'max_id_val +' migrations/072_sync_all_tables_and_fields.sql"
echo ""
