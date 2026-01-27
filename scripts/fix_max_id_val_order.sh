#!/bin/bash

# Скрипт для исправления порядка вычисления max_id_val
# Использование: выполните на сервере

echo "🔧 Исправление порядка вычисления max_id_val..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Проверить полный контекст миграции 071 (строки 40-70)"
echo "sed -n '40,70p' migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 2. Проверить, в каком блоке DO находится строка 48"
echo "grep -n 'DO \$\$' migrations/071_add_content_and_images_to_news.sql"
echo "grep -n 'BEGIN' migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 3. Если max_id_val используется на строке 48, а вычисляется на 61,"
echo "#    нужно переместить вычисление выше или убедиться, что они в одном блоке"
echo ""
echo "# 4. Проверить, что замена действительно произошла"
echo "grep -n '(SELECT COALESCE(MAX(id), 0) FROM news)' migrations/071_add_content_and_images_to_news.sql"
echo "grep -n '(SELECT COALESCE(MAX(id), 0) FROM news)' migrations/072_sync_all_tables_and_fields.sql"
echo ""
