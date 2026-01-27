#!/bin/bash

# Скрипт для поиска всех проблемных SELECT в миграциях
# Использование: выполните на сервере

echo "🔍 Поиск проблемных SELECT в миграциях..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Найти все SELECT без INTO в блоках DO"
echo "grep -rn 'SELECT.*FROM' migrations/ | grep -v 'INTO' | grep -v 'EXISTS' | grep -v 'PERFORM'"
echo ""
echo "# 2. Найти все SELECT в блоках DO $$"
echo "grep -A 5 'DO \$\$' migrations/*.sql | grep -B 2 -A 2 'SELECT'"
echo ""
echo "# 3. Найти все SELECT, которые могут вызывать ошибку"
echo "grep -rn 'SELECT.*FROM.*news' migrations/ | grep -v 'INTO' | grep -v 'EXISTS'"
echo ""
echo "# 4. Проверить конкретные проблемные паттерны:"
echo "grep -rn 'SELECT.*COALESCE.*MAX' migrations/ | grep -v 'INTO'"
echo ""
echo "# 5. Посмотреть, какие миграции ещё не применены"
echo "# Проверьте логи, чтобы понять номер миграции"
echo "docker-compose -f docker-compose.prod.yaml logs --tail=200 | grep -i migration"
echo ""
