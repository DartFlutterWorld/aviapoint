#!/bin/bash

# Скрипт для диагностики проблем с запуском бэкенда
# Использование: ./scripts/check_backend.sh

SERVER="root@83.166.246.205"
SERVER_PATH="/home/aviapoint_server"

echo "🔍 Диагностика запуска бэкенда на сервере..."
echo ""

# 1. Проверка подключения к серверу
echo "📡 1. Проверка подключения к серверу:"
if ssh -o ConnectTimeout=5 $SERVER "echo 'OK'" 2>/dev/null; then
    echo "✅ Подключение успешно"
else
    echo "❌ Не удалось подключиться к серверу"
    exit 1
fi
echo ""

# 2. Проверка существования директории aviapoint_server
echo "📁 2. Проверка директории проекта:"
ssh $SERVER "if [ -d $SERVER_PATH ]; then echo '✅ Директория существует'; ls -la $SERVER_PATH | head -10; else echo '❌ Директория не найдена'; fi"
echo ""

# 3. Проверка docker-compose файла
echo "📄 3. Проверка docker-compose.prod.yaml:"
ssh $SERVER "cd $SERVER_PATH && if [ -f docker-compose.prod.yaml ]; then echo '✅ Файл найден'; head -30 docker-compose.prod.yaml; else echo '❌ Файл не найден'; fi"
echo ""

# 4. Статус всех контейнеров
echo "📦 4. Статус всех контейнеров:"
ssh $SERVER "docker ps -a --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
echo ""

# 5. Статус контейнеров aviapoint_server
echo "📦 5. Статус контейнеров aviapoint_server:"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml ps 2>&1"
echo ""

# 6. Последние ошибки в логах
echo "📋 6. Последние ошибки в логах (топ 30):"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml logs --tail=100 2>&1 | grep -i -E '(error|fail|exception|timeout|connection|refused|cannot|unable|panic)' | tail -30"
echo ""

# 7. Логи всех сервисов
echo "📋 7. Последние логи всех сервисов (последние 50 строк):"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml logs --tail=50 2>&1"
echo ""

# 8. Проверка портов
echo "🔌 8. Проверка используемых портов:"
ssh $SERVER "netstat -tuln | grep -E ':(80|443|8080|5432|3306)' || ss -tuln | grep -E ':(80|443|8080|5432|3306)'"
echo ""

# 9. Проверка Docker daemon
echo "🐳 9. Статус Docker daemon:"
ssh $SERVER "systemctl status docker --no-pager -l | head -10 || service docker status | head -10"
echo ""

# 10. Проверка дискового пространства
echo "💾 10. Использование диска:"
ssh $SERVER "df -h | grep -E '(Filesystem|/dev/|/home)'"
echo ""

# 11. Проверка памяти
echo "🧠 11. Использование памяти:"
ssh $SERVER "free -h"
echo ""

# 12. Проверка переменных окружения (если есть .env)
echo "🔐 12. Проверка .env файла:"
ssh $SERVER "cd $SERVER_PATH && if [ -f .env ]; then echo '✅ .env найден'; head -20 .env | sed 's/=.*/=***/' ; else echo '⚠️  .env не найден'; fi"
echo ""

# 13. Проверка сетей Docker
echo "🌐 13. Docker сети:"
ssh $SERVER "docker network ls"
echo ""

# 14. Попытка запуска (если контейнеры остановлены)
echo "🚀 14. Попытка запуска контейнеров (если остановлены):"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml up -d 2>&1 | tail -20"
echo ""

# 15. Финальный статус
echo "📊 15. Финальный статус контейнеров:"
ssh $SERVER "cd $SERVER_PATH && docker-compose -f docker-compose.prod.yaml ps"
echo ""

echo "✅ Диагностика завершена!"
echo ""
echo "💡 Полезные команды для дальнейшей диагностики:"
echo ""
echo "   # Подключиться к серверу:"
echo "   ssh $SERVER"
echo ""
echo "   # Перейти в директорию проекта:"
echo "   cd $SERVER_PATH"
echo ""
echo "   # Посмотреть логи в реальном времени:"
echo "   docker-compose -f docker-compose.prod.yaml logs -f"
echo ""
echo "   # Перезапустить все контейнеры:"
echo "   docker-compose -f docker-compose.prod.yaml restart"
echo ""
echo "   # Пересоздать контейнеры:"
echo "   docker-compose -f docker-compose.prod.yaml up -d --force-recreate"
echo ""
echo "   # Остановить и удалить контейнеры:"
echo "   docker-compose -f docker-compose.prod.yaml down"
echo ""
echo "   # Запустить заново:"
echo "   docker-compose -f docker-compose.prod.yaml up -d"
echo ""
