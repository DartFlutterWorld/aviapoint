#!/bin/bash

# Скрипт для исправления всех проблемных SELECT в миграциях
# Использование: выполните на сервере

echo "🔧 Исправление проблемных SELECT в миграциях..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Исправить SELECT setval в миграции 069"
echo "sed -i \"s/SELECT setval(/PERFORM setval(/g\" migrations/069_add_published_to_news.sql"
echo ""
echo "# 2. Проверить строки 822 и 597 в миграциях 071 и 072"
echo "# Если они используют SELECT в выражениях вне блока DO, нужно исправить"
echo ""
echo "# 3. Проверить строку 836 в add_subscription_fields_to_profiles.sql"
echo "grep -n 'SELECT 1 FROM subscriptions WHERE user_id = p.id' migrations/add_subscription_fields_to_profiles.sql"
echo ""
echo "# 4. После исправлений:"
echo "git add migrations/"
echo "git commit -m 'Fix: исправление всех SELECT без INTO в миграциях'"
echo "git push origin main"
echo ""
