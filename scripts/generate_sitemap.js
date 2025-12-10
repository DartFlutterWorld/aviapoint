#!/usr/bin/env node

/**
 * Генератор sitemap.xml
 * Использование: node scripts/generate_sitemap.js [--api-url=https://avia-point.com] > web/sitemap.xml
 */

const { generateAllUrls, BASE_URL } = require('./generate_urls');

function generateSitemap(urls) {
    const now = new Date().toISOString().split('T')[0];

    let sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
        http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
`;

    urls.forEach(url => {
        // Определяем приоритет и частоту обновления в зависимости от типа страницы
        let priority = '0.8';
        let changefreq = 'weekly';

        if (url === `${BASE_URL}/`) {
            priority = '1.0';
            changefreq = 'daily';
        } else if (url.includes('/news/')) {
            priority = '0.9';
            changefreq = 'monthly';
        } else if (url.includes('/learning/')) {
            priority = '0.8';
            changefreq = 'monthly';
        } else if (url.includes('/market') || url.includes('/prices')) {
            priority = '0.7';
            changefreq = 'weekly';
        } else {
            priority = '0.6';
            changefreq = 'monthly';
        }

        sitemap += `  <url>
    <loc>${url}</loc>
    <lastmod>${now}</lastmod>
    <changefreq>${changefreq}</changefreq>
    <priority>${priority}</priority>
  </url>
`;
    });

    sitemap += '</urlset>';

    return sitemap;
}

if (require.main === module) {
    generateAllUrls()
        .then(urls => {
            const sitemap = generateSitemap(urls);
            console.log(sitemap);
        })
        .catch(error => {
            console.error('❌ Ошибка:', error);
            process.exit(1);
        });
}

module.exports = { generateSitemap };

