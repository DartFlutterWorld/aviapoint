#!/bin/bash

# Скрипт для решения конфликта миграций в aviapoint_server
# Использование: выполните команды на сервере в проекте aviapoint_server

SERVER="root@83.166.246.205"
SERVER_PATH="/home/aviapoint_server"

echo "🔧 Решение конфликта миграций в aviapoint_server"
echo ""

echo "📋 Шаг 1: Проверка статуса изменений"
echo "Выполните на сервере:"
echo "  ssh $SERVER"
echo "  cd $SERVER_PATH"
echo "  git status"
echo ""

echo "📋 Шаг 2: Просмотр изменений в конфликтующих файлах"
echo "  git diff migrations/071_add_content_and_images_to_news.sql"
echo "  git diff migrations/072_sync_all_tables_and_fields.sql"
echo ""

echo "💡 Варианты решения:"
echo ""
echo "Вариант A: Сохранить локальные изменения (если они важны)"
echo "  git add migrations/071_add_content_and_images_to_news.sql migrations/072_sync_all_tables_and_fields.sql"
echo "  git commit -m 'Fix migrations: исправление ошибок в миграциях'"
echo "  git pull origin main"
echo "  # Если будут конфликты, разрешите их вручную"
echo ""

echo "Вариант B: Взять удалённые изменения (если локальные не нужны)"
echo "  git checkout -- migrations/071_add_content_and_images_to_news.sql migrations/072_sync_all_tables_and_fields.sql"
echo "  git pull origin main"
echo ""

echo "Вариант C: Временно сохранить локальные изменения (stash)"
echo "  git stash save 'Локальные исправления миграций'"
echo "  git pull origin main"
echo "  git stash pop"
echo "  # Если будут конфликты, разрешите их вручную"
echo ""

echo "📝 После решения конфликта:"
echo "  1. Проверьте, что миграции корректны"
echo "  2. Перезапустите бэкенд: docker-compose -f docker-compose.prod.yaml restart <backend_service>"
echo ""
