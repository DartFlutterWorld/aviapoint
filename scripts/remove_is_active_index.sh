#!/bin/bash

# Скрипт для удаления создания индекса на несуществующее поле is_active
# Использование: выполните на сервере

echo "🗑️  Удаление создания индекса на несуществующее поле is_active..."
echo ""
echo "Выполните на сервере:"
echo ""
echo "cd /home/aviapoint_server"
echo ""
echo "# 1. Найти миграцию, которая создаёт индекс на is_active"
echo "grep -rn 'idx_aircraft_manufacturers_active' migrations/*.sql"
echo ""
echo "# 2. Посмотреть контекст вокруг этой строки"
echo "grep -B 5 -A 5 'idx_aircraft_manufacturers_active' migrations/*.sql"
echo ""
echo "# 3. Удалить строку с созданием индекса"
echo "# Замените <filename> на имя файла миграции"
echo "sed -i '/idx_aircraft_manufacturers_active/d' migrations/<filename>.sql"
echo ""
echo "# Или удалить строку с контекстом (если нужно удалить несколько строк)"
echo "sed -i '/CREATE INDEX IF NOT EXISTS idx_aircraft_manufacturers_active/d' migrations/*.sql"
echo ""
echo "# 4. Проверить результат"
echo "grep -rn 'idx_aircraft_manufacturers_active' migrations/*.sql"
echo ""
