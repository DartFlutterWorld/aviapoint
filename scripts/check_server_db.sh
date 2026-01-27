#!/bin/bash

# Скрипт для диагностики контейнеров и БД на удалённом сервере
# Использование: ./scripts/check_server_db.sh

SERVER="root@83.166.246.205"
SERVER_PATH="/home/aviapoint_server"

echo "🔍 Проверка контейнеров и БД на сервере..."
echo ""

# 1. Проверка статуса всех контейнеров
echo "📦 1. Статус всех контейнеров:"
ssh $SERVER "docker ps -a"
echo ""

# 2. Проверка контейнеров aviapoint_server
echo "📦 2. Статус контейнеров aviapoint_server:"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml ps"
echo ""

# 3. Последние логи с ошибками
echo "📋 3. Последние ошибки в логах:"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml logs --tail=50 2>&1 | grep -i -E '(error|fail|exception|timeout|connection)' | tail -20"
echo ""

# 4. Логи всех сервисов (последние 30 строк)
echo "📋 4. Последние логи всех сервисов:"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml logs --tail=30"
echo ""

# 5. Проверка использования ресурсов
echo "💻 5. Использование ресурсов контейнерами:"
ssh $SERVER "docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}' | head -10"
echo ""

# 6. Проверка сетей
echo "🌐 6. Docker сети:"
ssh $SERVER "docker network ls"
echo ""

# 7. Проверка дискового пространства
echo "💾 7. Использование диска:"
ssh $SERVER "df -h | grep -E '(Filesystem|/dev/)'"
echo ""

echo "✅ Диагностика завершена!"
echo ""
echo "💡 Для детального просмотра логов выполните:"
echo "   ssh $SERVER 'cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml logs -f'"
echo ""
echo "💡 Для перезапуска контейнеров:"
echo "   ssh $SERVER 'cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml restart'"
