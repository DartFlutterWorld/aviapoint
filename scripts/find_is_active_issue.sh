#!/bin/bash

# Скрипт для поиска проблемы с колонкой is_active
# Использование: выполните на сервере

echo "🔍 Поиск проблемы с колонкой is_active..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Найти все упоминания is_active в миграциях"
echo "grep -rn 'is_active' migrations/*.sql"
echo ""
echo "# 2. Найти, в какой миграции создаётся колонка is_active"
echo "grep -rn 'ADD COLUMN.*is_active\\|is_active.*ADD\\|is_active.*BOOLEAN' migrations/*.sql"
echo ""
echo "# 3. Найти, где используется is_active ДО создания"
echo "grep -rn 'is_active' migrations/*.sql | grep -v 'ADD COLUMN' | grep -v 'CREATE'"
echo ""
echo "# 4. Проверить порядок миграций"
echo "ls -1 migrations/*.sql | sort"
echo ""
echo "# 5. Посмотреть логи, чтобы понять, какая миграция вызывает ошибку"
echo "docker-compose -f docker-compose.prod.yaml logs --tail=100 | grep -B 10 'is_active'"
echo ""
