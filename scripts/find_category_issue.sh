#!/bin/bash

# Скрипт для поиска проблемы с колонкой category
# Использование: выполните на сервере

echo "🔍 Поиск проблемы с колонкой category..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Найти все упоминания category в миграциях"
echo "grep -rn 'category' migrations/*.sql | grep -v 'category_id' | grep -v 'blog_category' | head -20"
echo ""
echo "# 2. Посмотреть логи PostgreSQL, чтобы понять, в какой таблице ищется category"
echo "docker-compose -f docker-compose.prod.yaml logs --tail=200 | grep -B 10 'category' | grep -i 'STATEMENT'"
echo ""
echo "# 3. Найти, где используется category в миграциях"
echo "grep -rn '\"category\"\\|\\bcategory\\b' migrations/*.sql | grep -v 'category_id' | grep -v 'blog_category'"
echo ""
