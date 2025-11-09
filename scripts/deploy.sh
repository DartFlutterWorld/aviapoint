#!/bin/bash

# Скрипт для деплоя Flutter Web приложения на VPS
# Использование: ./scripts/deploy.sh [--restart-nginx]
#   --restart-nginx  - автоматически перезапустить Nginx после деплоя

set -e  # Остановка при ошибке

VPS_USER="root"
VPS_HOST="83.166.246.205"
VPS_PATH="/home/aviapoint"
BUILD_DIR="build/web"
RESTART_NGINX=false

# Проверка аргументов
if [[ "$1" == "--restart-nginx" ]]; then
    RESTART_NGINX=true
fi

echo "🚀 Начинаем деплой Flutter Web приложения..."

# 1. Проверка что мы в корне проекта
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Ошибка: Запусти скрипт из корня проекта"
    exit 1
fi

# 2. Определение команды Flutter (fvm или flutter)
if command -v fvm &> /dev/null; then
    FLUTTER_CMD="fvm flutter"
    DART_CMD="fvm dart"
else
    FLUTTER_CMD="flutter"
    DART_CMD="dart"
fi

# 3. Очистка предыдущей сборки
echo "📦 Очистка предыдущей сборки..."
$FLUTTER_CMD clean

# 4. Получение зависимостей
echo "📥 Получение зависимостей..."
$FLUTTER_CMD pub get

# 5. Генерация кода (если нужно)
echo "🔨 Генерация кода..."
$DART_CMD pub run build_runner build --delete-conflicting-outputs || true

# 6. Сборка production версии
echo "🏗️  Сборка production версии..."
$FLUTTER_CMD build web --release --dart-define=isDevelopment=false

# 6. Проверка что сборка прошла успешно
if [ ! -d "$BUILD_DIR" ]; then
    echo "❌ Ошибка: Папка $BUILD_DIR не найдена"
    exit 1
fi

# 7. Копирование файлов на VPS
echo "📤 Копирование файлов на VPS..."
scp -r $BUILD_DIR/* $VPS_USER@$VPS_HOST:$VPS_PATH/

# 8. Проверка успешности копирования
if [ $? -eq 0 ]; then
    echo "✅ Файлы успешно скопированы на VPS!"
    
    # 9. Перезапуск Nginx (если нужно)
    if [ "$RESTART_NGINX" = true ]; then
        echo "🔄 Перезапуск Nginx контейнера..."
        ssh $VPS_USER@$VPS_HOST 'docker restart aviapoint-nginx' || {
            echo "⚠️  Не удалось перезапустить Nginx, но файлы скопированы"
            echo "   Перезапусти вручную: ssh $VPS_USER@$VPS_HOST 'docker restart aviapoint-nginx'"
        }
    fi
    
    echo ""
    echo "✅ Деплой завершен успешно!"
    echo ""
    echo "🌐 Сайт доступен по адресу: https://avia-point.com"
    echo ""
    if [ "$RESTART_NGINX" = false ]; then
        echo "💡 Обычно перезапуск Nginx не требуется, но если нужно:"
        echo "   ssh $VPS_USER@$VPS_HOST 'docker restart aviapoint-nginx'"
        echo "   или запусти скрипт с флагом: ./scripts/deploy.sh --restart-nginx"
    fi
else
    echo "❌ Ошибка при копировании файлов"
    exit 1
fi

