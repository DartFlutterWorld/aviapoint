#!/bin/bash

# Скрипт-обёртка для prerendering
# Использование: ./scripts/prerender.sh [--api-url=https://avia-point.com] [--output-dir=web/prerendered]

# Переходим в корень проекта
cd "$(dirname "$0")/.." || exit 1

# Проверяем наличие Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js не найден"
    exit 1
fi

# Запускаем скрипт
node scripts/prerender.js "$@"

