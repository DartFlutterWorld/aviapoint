#!/bin/bash

# Скрипт-обёртка для генерации списка URL
# Использование: ./scripts/generate_urls.sh [--api-url=https://avia-point.com]

# Переходим в корень проекта
cd "$(dirname "$0")/.." || exit 1

# Проверяем наличие Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js не найден"
    exit 1
fi

# Запускаем скрипт
if [ -n "$1" ]; then
    node scripts/generate_urls.js "$1"
else
    node scripts/generate_urls.js
fi

