# Настройка SEO для AviaPoint

Полная инструкция по настройке SEO для Flutter Web приложения.

## 1. Установка зависимостей

### Node.js скрипты
```bash
cd scripts
npm install
```

### Flutter пакет
```bash
flutter pub get
```

## 2. Генерация sitemap.xml

```bash
node scripts/generate_sitemap.js > web/sitemap.xml
```

Или с указанием API URL:
```bash
API_URL=https://avia-point.com node scripts/generate_sitemap.js > web/sitemap.xml
```

## 3. Prerendering страниц

### Шаг 1: Запустите Flutter Web сервер
```bash
flutter run -d chrome --web-port=8080
```

### Шаг 2: В другом терминале запустите prerendering
```bash
node scripts/prerender.js
```

Prerendered файлы будут сохранены в `web/prerendered/`

## 4. Настройка Nginx

Добавьте в `nginx.conf`:

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

# Sitemap
location = /sitemap.xml {
    root /path/to/web;
    access_log off;
}

# Robots.txt
location = /robots.txt {
    root /path/to/web;
    access_log off;
}
```

## 5. Использование динамических метатегов

### На странице новости
```dart
import 'package:aviapoint/core/utils/seo_helper.dart';

@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SeoHelper.setNewsMetaTags(
      title: news.title,
      description: news.description,
      imageUrl: news.image,
      newsId: news.id,
      publishedAt: news.createdAt,
    );
  });
}
```

### На странице чек-листа
```dart
SeoHelper.setChecklistMetaTags(
  title: 'Предполетный осмотр - Кабина',
  description: 'Чек-лист для предполетного осмотра кабины самолета',
  categoryType: 'preflight_inspection_categories',
  categoryId: 1,
);
```

### На странице вопроса
```dart
SeoHelper.setQuestionMetaTags(
  title: 'Вопрос о воздушном праве',
  description: 'Вопрос из экзаменационных билетов для пилотов',
  typeCertificate: 'rosaviatest',
  questionId: 123,
);
```

## 6. Добавление в CI/CD

Добавьте в ваш деплой скрипт:

```bash
# Генерация sitemap
node scripts/generate_sitemap.js > web/sitemap.xml

# Prerendering (опционально, если есть время)
# flutter run -d chrome --web-port=8080 &
# sleep 10
# node scripts/prerender.js
# pkill -f "flutter run"
```

## 7. Проверка

### Проверка sitemap.xml
Откройте в браузере: `https://avia-point.com/sitemap.xml`

### Проверка robots.txt
Откройте в браузере: `https://avia-point.com/robots.txt`

### Проверка индексации
1. Добавьте сайт в [Яндекс.Вебмастер](https://webmaster.yandex.ru/)
2. Добавьте sitemap.xml в Яндекс.Вебмастер
3. Проверьте индексацию через `site:avia-point.com`

### Проверка prerendering
```bash
curl -A "Googlebot/2.1" https://avia-point.com/learning/hand_book/preflight_inspection_categories/check_list/1
```

Должен вернуться prerendered HTML, а не пустая страница.

## 8. Обновление

Sitemap.xml нужно обновлять при:
- Добавлении новых новостей
- Добавлении новых категорий
- Добавлении новых вопросов

Можно настроить автоматическое обновление через cron или CI/CD.

## Структура файлов

```
web/
├── sitemap.xml           # Генерируемый sitemap
├── robots.txt            # Правила для ботов
└── prerendered/          # Prerendered HTML файлы
    ├── index.html
    ├── learning/
    └── news/

scripts/
├── generate_urls.js      # Генерация списка URL
├── generate_sitemap.js   # Генерация sitemap.xml
├── prerender.js          # Prerendering
└── package.json          # Зависимости

lib/core/utils/
└── seo_helper.dart       # Утилита для метатегов
```

## Примечания

- Prerendering требует времени, особенно для большого количества страниц
- Можно prerender только популярные страницы, остальные индексировать через JS
- Sitemap.xml должен обновляться регулярно
- Проверяйте индексацию в Яндекс.Вебмастер регулярно

