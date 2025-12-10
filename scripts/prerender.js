#!/usr/bin/env node

/**
 * Скрипт для prerendering страниц Flutter Web
 * Использование: node scripts/prerender.js [--api-url=https://avia-point.com] [--output-dir=web/prerendered]
 * 
 * Требования:
 * npm install puppeteer
 */

const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');
const { generateAllUrls, BASE_URL } = require('./generate_urls');

const OUTPUT_DIR = process.env.OUTPUT_DIR || process.argv.find(arg => arg.startsWith('--output-dir='))?.split('=')[1] || 'web/prerendered';
// По умолчанию используем production URL (после исправления Nginx конфигурации)
// Для локального prerendering:
// 1. Собрать Flutter Web: fvm flutter build web --release
// 2. Запустить локальный сервер: cd build/web && python3 -m http.server 8081
// 3. Использовать: LOCAL_URL=http://localhost:8081 node scripts/prerender.js
const LOCAL_URL = process.env.LOCAL_URL || process.argv.find(arg => arg.startsWith('--local-url='))?.split('=')[1] || 'https://avia-point.com';

// Создаем директорию для prerendered файлов
if (!fs.existsSync(OUTPUT_DIR)) {
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}

async function prerenderPage(browser, url, outputPath) {
    const page = await browser.newPage();

    try {
        console.log(`  🔵 Prerendering: ${url}`);

        // Устанавливаем User-Agent как у поискового бота
        await page.setUserAgent('Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)');

        // Переходим на страницу
        await page.goto(url, {
            waitUntil: 'networkidle2',
            timeout: 30000,
        });

        // Ждем загрузки Flutter приложения и выполнения JavaScript
        await new Promise(resolve => setTimeout(resolve, 3000));

        // Получаем HTML
        const html = await page.content();

        // Сохраняем в файл
        const filePath = path.join(OUTPUT_DIR, outputPath);
        const dir = path.dirname(filePath);
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true });
        }

        fs.writeFileSync(filePath, html, 'utf8');
        console.log(`  ✅ Сохранено: ${outputPath}`);

        return true;
    } catch (error) {
        console.error(`  ❌ Ошибка при prerendering ${url}:`, error.message);
        return false;
    } finally {
        await page.close();
    }
}

function urlToFilePath(url) {
    // Преобразуем URL в путь файла
    // https://avia-point.com/learning/hand_book/check_list/1?nameCategory=... -> learning/hand_book/check_list/1.html
    // Удаляем query параметры из пути
    const urlWithoutQuery = url.split('?')[0];
    const urlPath = urlWithoutQuery.replace(BASE_URL, '').replace(/^\//, '') || 'index';
    return urlPath === '' ? 'index.html' : `${urlPath}.html`;
}

async function prerenderAll() {
    console.log('🚀 Запуск prerendering...');
    console.log(`Локальный URL: ${LOCAL_URL}`);
    console.log(`Директория вывода: ${OUTPUT_DIR}`);

    // Получаем список всех URL
    const urls = await generateAllUrls();

    console.log(`\n📋 Всего страниц для prerendering: ${urls.length}`);

    // Запускаем браузер
    const browser = await puppeteer.launch({
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox'],
    });

    let successCount = 0;
    let failCount = 0;

    // Prerender каждую страницу
    for (let i = 0; i < urls.length; i++) {
        const url = urls[i];
        const localUrl = url.replace(BASE_URL, LOCAL_URL);
        const outputPath = urlToFilePath(url);

        console.log(`\n[${i + 1}/${urls.length}] ${url}`);

        const success = await prerenderPage(browser, localUrl, outputPath);
        if (success) {
            successCount++;
        } else {
            failCount++;
        }

        // Небольшая задержка между запросами
        await new Promise(resolve => setTimeout(resolve, 500));
    }

    await browser.close();

    console.log(`\n✅ Prerendering завершен!`);
    console.log(`   Успешно: ${successCount}`);
    console.log(`   Ошибок: ${failCount}`);
    console.log(`   Файлы сохранены в: ${OUTPUT_DIR}`);
}

if (require.main === module) {
    prerenderAll()
        .then(() => process.exit(0))
        .catch(error => {
            console.error('❌ Критическая ошибка:', error);
            process.exit(1);
        });
}

module.exports = { prerenderAll };

