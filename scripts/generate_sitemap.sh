#!/bin/bash

# Скрипт-обёртка для генерации sitemap.xml
# Использование: ./scripts/generate_sitemap.sh [--api-url=https://avia-point.com]

# Переходим в корень проекта
cd "$(dirname "$0")/.." || exit 1

# Проверяем наличие Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js не найден. Используйте Dart-версию:"
    echo "   fvm dart scripts/generate_sitemap.dart > web/sitemap.xml"
    exit 1
fi

# Запускаем скрипт
if [ -n "$1" ]; then
    node scripts/generate_sitemap.js "$1" > web/sitemap.xml
else
    node scripts/generate_sitemap.js > web/sitemap.xml
fi

if [ $? -eq 0 ]; then
    echo "✅ sitemap.xml создан в web/sitemap.xml"
else
    echo "❌ Ошибка при создании sitemap.xml"
    exit 1
fi

