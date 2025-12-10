#!/usr/bin/env node

/**
 * Скрипт для генерации списка всех URL для prerendering и sitemap
 * Использование: node scripts/generate_urls.js [--api-url=https://avia-point.com]
 */

const https = require('https');
const http = require('http');

const API_URL = process.env.API_URL || process.argv.find(arg => arg.startsWith('--api-url='))?.split('=')[1] || 'https://avia-point.com';
const BASE_URL = 'https://avia-point.com';

// Утилита для HTTP запросов
function fetch(url) {
    return new Promise((resolve, reject) => {
        const client = url.startsWith('https') ? https : http;
        client.get(url, (res) => {
            let data = '';
            res.on('data', (chunk) => { data += chunk; });
            res.on('end', () => {
                try {
                    resolve(JSON.parse(data));
                } catch (e) {
                    reject(new Error(`Failed to parse JSON: ${e.message}`));
                }
            });
        }).on('error', reject);
    });
}

// Статические страницы
const staticPages = [
    '/',
    '/learning',
    '/learning/testing_mode',
    '/news',
    '/market',
    '/prices',
    '/profile/privacy-policy',
    '/learning/video_for_students',
    '/learning/hand_book',
    '/learning/base_questions',
    '/learning/hand_book/preflight_inspection_categories',
    '/learning/hand_book/normal_categories',
    '/learning/hand_book/emergency_categories',
];

// Получение всех новостей
async function getNewsIds() {
    try {
        const news = await fetch(`${API_URL}/news`);
        return news.map(item => `/news/${item.id}`);
    } catch (error) {
        console.error('Error fetching news:', error.message);
        return [];
    }
}

// Получение всех категорий предполетного осмотра
async function getPreflightInspectionCategoryIds() {
    try {
        const categories = await fetch(`${API_URL}/learning/hand_book/preflight_inspection_categories`);
        console.error(`   Получено категорий из API: ${categories.length}`);
        const urls = [];

        for (const cat of categories) {
            const id = cat.id;
            if (!id) {
                console.error(`   ⚠️ Категория без ID:`, cat);
                continue;
            }
            // Добавляем только URL для страницы категории
            // Элементы check_list не являются отдельными страницами, они отображаются на одной странице
            // nameCategory теперь загружается из API по categoryId
            urls.push(`/learning/hand_book/preflight_inspection_categories/check_list/${id}`);
        }

        console.error(`   Сгенерировано URL: ${urls.length}`);
        return urls;
    } catch (error) {
        console.error('Error fetching preflight inspection categories:', error.message);
        return [];
    }
}

// Получение всех категорий нормальных процедур
async function getNormalCategoryIds() {
    try {
        const categories = await fetch(`${API_URL}/learning/hand_book/normal_categories`);
        console.error(`   Получено категорий из API: ${categories.length}`);
        const urls = [];

        for (const cat of categories) {
            const id = cat.id;
            if (!id) {
                console.error(`   ⚠️ Категория без ID:`, cat);
                continue;
            }
            // Добавляем только URL для страницы категории
            // Элементы check_list не являются отдельными страницами, они отображаются на одной странице
            // nameCategory теперь загружается из API по categoryId
            urls.push(`/learning/hand_book/normal_categories/check_list/${id}`);
        }

        console.error(`   Сгенерировано URL: ${urls.length}`);
        return urls;
    } catch (error) {
        console.error('Error fetching normal categories:', error.message);
        return [];
    }
}

// Получение всех категорий вопросов
async function getBaseQuestionCategoryIds() {
    try {
        // Предполагаем, что есть эндпоинт для получения категорий
        // Если нет, можно получить через /learning/base_questions и парсить
        const categories = await fetch(`${API_URL}/learning/ros_avia_test/categories/1`); // Пример
        return categories.map(cat => `/learning/base_questions/${cat.id}`);
    } catch (error) {
        console.error('Error fetching base question categories:', error.message);
        return [];
    }
}

// Получение всех типов сертификатов и вопросов
async function getTypeCertificatesAndQuestions() {
    try {
        const typeCertificates = await fetch(`${API_URL}/learning/ros_avia_test/type_sertificates`);
        console.error(`   Найдено типов сертификатов: ${typeCertificates.length}`);
        const urls = [];
        const questionIds = new Set(); // Для отслеживания уникальных вопросов

        for (const cert of typeCertificates) {
            console.error(`   Обработка сертификата: ${cert.title || cert.id} (id: ${cert.id})`);

            // Получаем категории для каждого типа сертификата
            try {
                const categories = await fetch(`${API_URL}/learning/ros_avia_test/categories/${cert.id}`);
                console.error(`     Найдено категорий: ${categories.length}`);

                for (const category of categories) {
                    // Получаем вопросы для категории
                    try {
                        const questions = await fetch(`${API_URL}/learning/ros_avia_test/questions/${cert.id}?categoryIds=${category.id}&mixAnswers=false&mixQuestions=false`);
                        console.error(`       Категория ${category.id}: найдено вопросов: ${questions.length}`);

                        for (const question of questions) {
                            // Используем id сертификата вместо code (code отсутствует в API)
                            // В API поле называется question_id (snake_case), а не questionId
                            const questionId = question.question_id || question.questionId || question.id;
                            if (!questionId) {
                                console.error(`       ⚠️ Вопрос без ID:`, Object.keys(question));
                                continue;
                            }
                            const url = `/learning/type_sertificates/${cert.id}/${questionId}`;
                            // Добавляем только уникальные вопросы (один вопрос может быть в нескольких категориях)
                            if (!questionIds.has(questionId)) {
                                questionIds.add(questionId);
                                urls.push(url);
                            }
                        }
                    } catch (e) {
                        console.error(`       ❌ Ошибка при получении вопросов для категории ${category.id}:`, e.message);
                    }
                }
            } catch (e) {
                console.error(`     ❌ Ошибка при получении категорий для сертификата ${cert.id}:`, e.message);
            }
        }

        console.error(`   Всего уникальных вопросов: ${questionIds.size}`);
        return urls;
    } catch (error) {
        console.error('❌ Ошибка при получении типов сертификатов:', error.message);
        return [];
    }
}

// Основная функция
async function generateAllUrls() {
    // Логи выводим в stderr, чтобы не попадали в stdout при перенаправлении
    console.error('🔵 Генерация списка URL...');
    console.error(`API URL: ${API_URL}`);

    const urls = [...staticPages];

    console.error('📰 Получение новостей...');
    const newsUrls = await getNewsIds();
    urls.push(...newsUrls);
    console.error(`   Найдено новостей: ${newsUrls.length}`);

    console.error('✈️ Получение категорий предполетного осмотра...');
    const preflightUrls = await getPreflightInspectionCategoryIds();
    urls.push(...preflightUrls);
    console.error(`   Найдено категорий: ${preflightUrls.length}`);

    console.error('📋 Получение категорий нормальных процедур...');
    const normalUrls = await getNormalCategoryIds();
    urls.push(...normalUrls);
    console.error(`   Найдено категорий: ${normalUrls.length}`);

    console.error('❓ Получение категорий вопросов...');
    const questionCategoryUrls = await getBaseQuestionCategoryIds();
    urls.push(...questionCategoryUrls);
    console.error(`   Найдено категорий: ${questionCategoryUrls.length}`);

    console.error('📜 Получение типов сертификатов и вопросов...');
    const certificateUrls = await getTypeCertificatesAndQuestions();
    urls.push(...certificateUrls);
    console.error(`   Найдено вопросов: ${certificateUrls.length}`);

    // Убираем дубликаты и сортируем
    const uniqueUrls = [...new Set(urls)].sort();

    console.error(`\n✅ Всего URL: ${uniqueUrls.length}`);
    console.error(`   Статических: ${staticPages.length}`);
    console.error(`   Динамических: ${uniqueUrls.length - staticPages.length}`);

    return uniqueUrls.map(url => `${BASE_URL}${url}`);
}

// Экспорт для использования в других скриптах
if (require.main === module) {
    generateAllUrls()
        .then(urls => {
            // При прямом запуске выводим URL в stdout
            urls.forEach(url => console.log(url));
            process.exit(0);
        })
        .catch(error => {
            console.error('❌ Ошибка:', error);
            process.exit(1);
        });
}

module.exports = { generateAllUrls, BASE_URL };

