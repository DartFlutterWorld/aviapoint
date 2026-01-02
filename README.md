# ===== РАЗРАБОТКА =====

dart pub global activate flutterfire_cli
flutterfire configure   

fvm dart pub run build_runner build --delete-conflicting-outputs

# Генерация иконок для андройд
https://iconnaut.com/android.php#ready

# ===== ДЕПЛОЙ НА VPS =====

## Вариант 1: Автоматический деплой (рекомендуется)

```bash
# Сделать скрипт исполняемым (один раз)
chmod +x scripts/deploy.sh

# Запустить деплой (без перезапуска Nginx)
./scripts/deploy.sh

# Или с автоматическим перезапуском Nginx
./scripts/deploy.sh --restart-nginx
```

## Вариант 2: Ручной деплой

```bash
# 1. Очистка и получение зависимостей
flutter clean
flutter pub get

# 2. Генерация кода (если нужно)
fvm dart pub run build_runner build --delete-conflicting-outputs

# 3. Сборка production версии WEB
fvm flutter build web --release --dart-define=isDevelopment=false

# 3. Сборка production версии appbundle
fvm flutter build appbundle --release --dart-define=isDevelopment=false

# 3. Сборка production версии appbundle
fvm flutter build apk --release --dart-define=isDevelopment=false

# 2. Соберите iOS приложение с production окружением
flutter build ios --release --dart-define=isDevelopment=false

# 4. Копирование на VPS
scp -r build/web/* root@83.166.246.205:/home/aviapoint/
uOTC0OWjMVIoaRxI
# 5. Перезапуск Nginx (обычно не требуется, но можно для надежности)
ssh root@83.166.246.205 'docker restart aviapoint-nginx'
```

## Проверка после деплоя

1. Открой https://avia-point.com
2. Проверь DevTools (F12) → Console на наличие ошибок
3. Проверь Network → убедись что изображения загружаются из `/public/`

## Важно

- **Production сборка**: всегда используй флаг `--dart-define=isDevelopment=false`
- **Путь на VPS**: `/home/aviapoint/` (куда копируются файлы)
- **Nginx**: автоматически отдает файлы из `/home/aviapoint/`
- **Изображения**: должны быть в папке `public/` на VPS

## Обновление docker-compose.prod.yaml

Если изменился `docker-compose.prod.yaml` в проекте `aviapoint_server`:
  ```bash
# 1. Скопировать файл на VPS
scp docker-compose.prod.yaml root@83.166.246.205:/home/aviapoint_server/

# 2. На VPS перезапустить контейнеры
ssh root@83.166.246.205
cd /home/aviapoint_server
docker-compose -f docker-compose.prod.yaml down
docker-compose -f docker-compose.prod.yaml up -d
```

**Или просто перезапустить контейнеры без пересборки:**
```bash
ssh root@83.166.246.205 'cd /home/aviapoint_server && docker-compose -f docker-compose.prod.yaml restart'
```

## Проверка папки public на VPS

```bash
# Проверить содержимое папки public
ssh root@83.166.246.205 'docker exec aviapoint-nginx ls -la /app/public/'

# Посмотреть структуру и размер
ssh root@83.166.246.205 'docker exec aviapoint-nginx find /app/public/ -type f | head -20'
ssh root@83.166.246.205 'docker exec aviapoint-nginx du -sh /app/public/'

# Или проверить на хосте (если папка смонтирована)
ssh root@83.166.246.205 'ls -la /home/aviapoint_server/public/'
```
