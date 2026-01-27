#!/bin/bash

# Скрипт для исправления подзапросов в UPDATE
# Использование: выполните на сервере

echo "🔧 Исправление подзапросов в UPDATE..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Найти все места с подзапросами в UPDATE в миграции 071"
echo "grep -n '(SELECT COALESCE(MAX(id), 0) FROM news)' migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 2. Посмотреть контекст в миграции 071"
echo "grep -B 10 -A 5 '(SELECT COALESCE(MAX(id), 0) FROM news)' migrations/071_add_content_and_images_to_news.sql"
echo ""
echo "# 3. Проверить, есть ли такая же проблема в других миграциях"
echo "grep -rn '(SELECT.*FROM news)' migrations/*.sql | grep -v 'INTO' | grep -v 'EXISTS'"
echo ""
echo "# Решение: заменить подзапрос на использование переменной"
echo "# Вместо: (SELECT COALESCE(MAX(id), 0) FROM news) +"
echo "# Использовать: max_id_val + (где max_id_val уже вычислен через SELECT ... INTO)"
echo ""
