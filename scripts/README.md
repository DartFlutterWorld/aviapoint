# SEO Scripts для AviaPoint

Набор скриптов для генерации URL, sitemap.xml и prerendering страниц Flutter Web.

## Установка

```bash
cd scripts
npm install
```

## Использование

### Вариант 1: Использование обёрток-скриптов (рекомендуется)

Эти скрипты автоматически переходят в корень проекта, можно запускать из любой директории:

```bash
# Генерация списка URL
./scripts/generate_urls.sh

# Генерация sitemap.xml
./scripts/generate_sitemap.sh

# Prerendering (после запуска Flutter Web сервера)
./scripts/prerender.sh
```

### Вариант 2: Прямой запуск (из корня проекта)

**Важно:** Запускайте команды из корня проекта, а не из папки `scripts/`

```bash
# Генерация списка URL
node scripts/generate_urls.js

# Генерация sitemap.xml
node scripts/generate_sitemap.js > web/sitemap.xml
```

### 3. Prerendering страниц

**Важно:** Перед prerendering нужно запустить Flutter Web сервер:

```bash
# В одном терминале (из корня проекта)
fvm flutter run -d chrome --web-port=8080

# В другом терминале
./scripts/prerender.sh
# или
node scripts/prerender.js
```

## Настройка Nginx

Добавьте в `nginx.conf` правило для отдачи prerendered HTML ботам:

```nginx
# Определяем ботов
map $http_user_agent $is_bot {
    default 0;
    ~*googlebot 1;
    ~*bingbot 1;
    ~*yandex 1;
    ~*slurp 1;
    ~*duckduckbot 1;
    ~*baiduspider 1;
    ~*facebookexternalhit 1;
    ~*twitterbot 1;
}

# Отдаем prerendered HTML ботам
location / {
    if ($is_bot) {
        rewrite ^(.*)$ /prerendered$1 break;
    }
    try_files $uri $uri/ /index.html;
}
```

## Автоматизация

Добавьте в `Makefile` или CI/CD:

```makefile
.PHONY: seo
seo:
	@echo "Генерация sitemap.xml..."
	@node scripts/generate_sitemap.js > web/sitemap.xml
	@echo "✅ sitemap.xml создан"

.PHONY: prerender
prerender:
	@echo "Prerendering страниц..."
	@node scripts/prerender.js
	@echo "✅ Prerendering завершен"
```

## Структура файлов

```
scripts/
├── generate_urls.js      # Генерация списка всех URL
├── generate_sitemap.js   # Генерация sitemap.xml (использует generate_urls.js)
├── prerender.js          # Prerendering страниц
├── generate_urls.sh      # Обёртка для generate_urls.js
├── generate_sitemap.sh   # Обёртка для generate_sitemap.js
├── prerender.sh          # Обёртка для prerender.js
├── package.json          # Зависимости Node.js
└── README.md            # Документация

web/
├── sitemap.xml           # Генерируемый sitemap
└── prerendered/          # Prerendered HTML файлы
    ├── index.html
    ├── learning/
    │   └── hand_book/
    │       └── ...
    └── news/
        └── ...
```

## Примечания

- Скрипты требуют доступ к API для получения списка ID
- Prerendering требует запущенный Flutter Web сервер
- Prerendered файлы должны быть доступны через Nginx
- Sitemap.xml нужно обновлять при добавлении нового контента

