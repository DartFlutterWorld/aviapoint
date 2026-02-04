#!/bin/bash

# Скрипт для деплоя файлов .well-known на VPS
# Использование: ./scripts/deploy_well_known.sh

set -e  # Остановка при ошибке

VPS_USER="root"
VPS_HOST="83.166.246.205"
VPS_PATH="/home/aviapoint"
VPS_PASSWORD="uOTC0OWjMVIoaRxI"
VPS_PORT="22"
WELL_KNOWN_DIR=".well-known"

echo "🚀 Начинаем деплой файлов .well-known..."

# 1. Проверка что мы в корне проекта
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Ошибка: Запусти скрипт из корня проекта"
    exit 1
fi

# 2. Проверка наличия файлов
if [ ! -d "$WELL_KNOWN_DIR" ]; then
    echo "❌ Ошибка: Папка $WELL_KNOWN_DIR не найдена"
    echo "   Создайте файлы согласно инструкции в WELL_KNOWN_SETUP.md"
    exit 1
fi

if [ ! -f "$WELL_KNOWN_DIR/assetlinks.json" ]; then
    echo "❌ Ошибка: Файл $WELL_KNOWN_DIR/assetlinks.json не найден"
    exit 1
fi

if [ ! -f "$WELL_KNOWN_DIR/apple-app-site-association" ]; then
    echo "❌ Ошибка: Файл $WELL_KNOWN_DIR/apple-app-site-association не найден"
    exit 1
fi

# 3. Проверка валидности JSON
echo "🔍 Проверка валидности JSON файлов..."
if command -v python3 &> /dev/null; then
    python3 -m json.tool "$WELL_KNOWN_DIR/assetlinks.json" > /dev/null || {
        echo "❌ Ошибка: assetlinks.json содержит невалидный JSON"
        exit 1
    }
    python3 -m json.tool "$WELL_KNOWN_DIR/apple-app-site-association" > /dev/null || {
        echo "❌ Ошибка: apple-app-site-association содержит невалидный JSON"
        exit 1
    }
    echo "✅ JSON файлы валидны"
else
    echo "⚠️  Python3 не найден, пропускаем проверку JSON"
fi

# 4. Проверка наличия sshpass
if ! command -v sshpass &> /dev/null; then
    echo "❌ Ошибка: sshpass не установлен"
    echo ""
    echo "Установи sshpass вручную:"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "   brew install hudochenkov/sshpass/sshpass"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt-get &> /dev/null; then
            echo "   sudo apt-get install -y sshpass"
        elif command -v yum &> /dev/null; then
            echo "   sudo yum install -y sshpass"
        fi
    fi
    echo ""
    echo "Или используйте SSH ключи (рекомендуется)"
    exit 1
fi

# 5. Создание директории на сервере
echo "📁 Создание директории .well-known на сервере..."
sshpass -p "$VPS_PASSWORD" ssh -o StrictHostKeyChecking=no -p $VPS_PORT $VPS_USER@$VPS_HOST "mkdir -p $VPS_PATH/.well-known"

# 6. Копирование файлов на VPS
echo "📤 Копирование файлов на VPS..."
sshpass -p "$VPS_PASSWORD" scp -o StrictHostKeyChecking=no -P $VPS_PORT "$WELL_KNOWN_DIR/assetlinks.json" $VPS_USER@$VPS_HOST:$VPS_PATH/.well-known/
sshpass -p "$VPS_PASSWORD" scp -o StrictHostKeyChecking=no -P $VPS_PORT "$WELL_KNOWN_DIR/apple-app-site-association" $VPS_USER@$VPS_HOST:$VPS_PATH/.well-known/

# 7. Установка правильных прав доступа
echo "🔐 Установка прав доступа..."
sshpass -p "$VPS_PASSWORD" ssh -o StrictHostKeyChecking=no -p $VPS_PORT $VPS_USER@$VPS_HOST "chmod 644 $VPS_PATH/.well-known/*"

# 8. Проверка успешности
if [ $? -eq 0 ]; then
    echo "✅ Файлы успешно скопированы на VPS!"
    echo ""
    echo "🔍 Проверка доступности файлов:"
    echo "   https://avia-point.com/.well-known/assetlinks.json"
    echo "   https://avia-point.com/.well-known/apple-app-site-association"
    echo ""
    echo "💡 Если файлы не доступны, проверьте конфигурацию Nginx:"
    echo "   Убедитесь, что в конфиге Nginx есть:"
    echo "   location /.well-known/ {"
    echo "       alias /home/aviapoint/.well-known/;"
    echo "       default_type application/json;"
    echo "       add_header Content-Type application/json;"
    echo "   }"
else
    echo "❌ Ошибка при копировании файлов"
    exit 1
fi
