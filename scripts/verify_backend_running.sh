#!/bin/bash

# Скрипт для проверки, что бэкенд запустился без ошибок миграций
# Использование: выполните команды на сервере

echo "🔍 Проверка работы бэкенда после исправления миграций..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "1. Проверьте статус контейнеров:"
echo "   docker-compose -f docker-compose.prod.yaml ps"
echo ""
echo "2. Проверьте логи бэкенда на ошибки миграций:"
echo "   docker-compose -f docker-compose.prod.yaml logs --tail=100 | grep -i -E '(migration|error|query has no destination|successfully|completed)'"
echo ""
echo "3. Проверьте, что ошибка 'query has no destination' исчезла:"
echo "   docker-compose -f docker-compose.prod.yaml logs --tail=200 | grep -i 'query has no destination'"
echo "   # Если ничего не выведено - ошибка исправлена! ✅"
echo ""
echo "4. Проверьте последние логи бэкенда:"
echo "   docker-compose -f docker-compose.prod.yaml logs --tail=50 <backend_service_name>"
echo ""
echo "5. Если бэкенд не запущен или есть ошибки, перезапустите:"
echo "   docker-compose -f docker-compose.prod.yaml restart <backend_service_name>"
echo "   # Или пересоздайте:"
echo "   docker-compose -f docker-compose.prod.yaml up -d --force-recreate <backend_service_name>"
echo ""
