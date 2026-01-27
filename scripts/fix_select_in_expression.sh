#!/bin/bash

# Скрипт для исправления SELECT в выражениях
# Использование: выполните на сервере

echo "🔧 Исправление SELECT в выражениях..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Посмотреть полный контекст строки 856 в миграции 072"
echo "sed -n '590,610p' migrations/072_sync_all_tables_and_fields.sql"
echo ""
echo "# 2. Посмотреть контекст строки 822 в миграции 071 (если есть)"
echo "sed -n '815,830p' migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 3. Проверить, в каком блоке находится проблемный SELECT"
echo "grep -n 'DO \$\$' migrations/072_sync_all_tables_and_fields.sql | head -5"
echo "grep -n 'END \$\$' migrations/072_sync_all_tables_and_fields.sql | head -5"
echo ""
