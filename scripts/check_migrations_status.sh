#!/bin/bash

# Скрипт для проверки статуса миграций на сервере
# Использование: ./scripts/check_migrations_status.sh

SERVER="root@83.166.246.205"
SERVER_PATH="/home/aviapoint_server"

echo "🔍 Проверка статуса миграций на сервере..."
echo ""

# 1. Проверка подключения
echo "📡 1. Проверка подключения к серверу:"
if ssh -o ConnectTimeout=5 $SERVER "echo 'OK'" 2>/dev/null; then
    echo "✅ Подключение успешно"
else
    echo "❌ Не удалось подключиться к серверу"
    exit 1
fi
echo ""

# 2. Проверка статуса Git
echo "📦 2. Статус Git в проекте:"
ssh $SERVER "cd $SERVER_PATH && git status --short"
echo ""

# 3. Проверка последних коммитов
echo "📝 3. Последние коммиты:"
ssh $SERVER "cd $SERVER_PATH && git log --oneline -5"
echo ""

# 4. Проверка содержимого миграций
echo "📄 4. Проверка исправлений в миграциях:"
echo ""
echo "   Проверка файла 071_add_content_and_images_to_news.sql:"
ssh $SERVER "cd $SERVER_PATH && if grep -q 'SELECT COALESCE(MAX(id), 0) INTO max_id_val FROM news' migrations/071_add_content_and_images_to_news.sql 2>/dev/null; then echo '   ✅ Исправление применено (SELECT ... INTO)'; else echo '   ❌ Исправление НЕ применено'; fi"
echo ""

echo "   Проверка файла 072_sync_all_tables_and_fields.sql:"
ssh $SERVER "cd $SERVER_PATH && if grep -q 'SELECT.*INTO.*FROM news' migrations/072_sync_all_tables_and_fields.sql 2>/dev/null; then echo '   ✅ Исправление применено (SELECT ... INTO)'; else echo '   ⚠️  Проверьте вручную'; fi"
echo ""

# 5. Проверка статуса контейнеров
echo "🐳 5. Статус контейнеров:"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml ps 2>&1 | head -20"
echo ""

# 6. Проверка последних логов бэкенда
echo "📋 6. Последние логи бэкенда (последние 30 строк):"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml logs --tail=30 2>&1 | grep -i -E '(migration|error|success|applied|completed)' | tail -15"
echo ""

# 7. Проверка ошибок в логах
echo "❌ 7. Последние ошибки в логах:"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml logs --tail=50 2>&1 | grep -i -E '(error|fail|exception|query has no destination)' | tail -10"
echo ""

# 8. Проверка версии файлов миграций
echo "📊 8. Информация о файлах миграций:"
ssh $SERVER "cd $SERVER_PATH && ls -lh migrations/071_add_content_and_images_to_news.sql migrations/072_sync_all_tables_and_fields.sql 2>/dev/null | awk '{print \$9, \$6, \$7, \$8}'"
echo ""

echo "✅ Проверка завершена!"
echo ""
echo "💡 Если миграции не применены, выполните:"
echo "   ssh $SERVER 'cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml restart <backend_service>'"
echo ""
