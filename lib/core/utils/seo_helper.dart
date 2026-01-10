import 'package:flutter/foundation.dart';

// Conditional import для веб
import 'seo_helper_stub.dart' if (dart.library.html) 'seo_helper_web.dart' as html;

/// Утилита для управления SEO метатегами
class SeoHelper {
  /// Устанавливает метатеги для страницы
  static void setMetaTags({
    required String title,
    required String description,
    String? imageUrl,
    String? url,
    String? type = 'website',
  }) {
    if (!kIsWeb) return;

    final baseUrl = 'https://avia-point.com';
    final fullUrl = url != null ? '$baseUrl$url' : baseUrl;
    final fullImageUrl = imageUrl != null
        ? (imageUrl.startsWith('http') ? imageUrl : '$baseUrl$imageUrl')
        : '$baseUrl/icons/Icon-512.png';

    // Устанавливаем title
    html.SeoHelperWeb.setTitle(title);

    // Основные метатеги
    html.SeoHelperWeb.setMetaTag('description', description);
    html.SeoHelperWeb.setMetaTag('keywords', _generateKeywords(title, description));

    // Open Graph метатеги
    html.SeoHelperWeb.setMetaTag('og:title', title, property: 'og:title');
    html.SeoHelperWeb.setMetaTag('og:description', description, property: 'og:description');
    html.SeoHelperWeb.setMetaTag('og:image', fullImageUrl, property: 'og:image');
    html.SeoHelperWeb.setMetaTag('og:url', fullUrl, property: 'og:url');
    html.SeoHelperWeb.setMetaTag('og:type', type ?? 'website', property: 'og:type');
    html.SeoHelperWeb.setMetaTag('og:site_name', 'AviaPoint', property: 'og:site_name');
    html.SeoHelperWeb.setMetaTag('og:locale', 'ru_RU', property: 'og:locale');

    // Twitter Card метатеги
    html.SeoHelperWeb.setMetaTag('twitter:card', 'summary_large_image');
    html.SeoHelperWeb.setMetaTag('twitter:title', title);
    html.SeoHelperWeb.setMetaTag('twitter:description', description);
    html.SeoHelperWeb.setMetaTag('twitter:image', fullImageUrl);

    // Canonical URL
    html.SeoHelperWeb.setLinkTag('canonical', fullUrl);
  }

  /// Генерирует ключевые слова на основе заголовка и описания
  static String _generateKeywords(String title, String description) {
    final keywords = <String>[
      'авиация',
      'пилот',
      'обучение пилотов',
      'РосАвиаТест',
      'частный пилот',
      'самолеты',
      'запчасти для самолетов',
      'авиационный маркет',
    ];

    // Добавляем слова из заголовка и описания
    final words = '${title.toLowerCase()} ${description.toLowerCase()}'
        .split(RegExp(r'[^\wа-яё]+'))
        .where((word) => word.length > 3)
        .take(5)
        .toList();

    keywords.addAll(words);

    return keywords.join(', ');
  }

  /// Устанавливает метатеги для страницы новости
  static void setNewsMetaTags({
    required String title,
    required String description,
    String? imageUrl,
    required int newsId,
    DateTime? publishedAt,
  }) {
    setMetaTags(
      title: '$title - AviaPoint',
      description: description,
      imageUrl: imageUrl,
      url: '/news/$newsId',
      type: 'article',
    );

    if (publishedAt != null && kIsWeb) {
      html.SeoHelperWeb.setMetaTag(
        'article:published_time',
        publishedAt.toIso8601String(),
        property: 'article:published_time',
      );
    }
  }

  /// Устанавливает метатеги для страницы обучения
  static void setLearningMetaTags({required String title, required String description, String? url, String? imageUrl}) {
    setMetaTags(title: '$title - AviaPoint', description: description, imageUrl: imageUrl, url: url ?? '/learning');
  }

  /// Устанавливает метатеги для страницы чек-листа
  static void setChecklistMetaTags({
    required String title,
    required String description,
    required String categoryType,
    required int categoryId,
    String? imageUrl,
  }) {
    final url = '/learning/hand_book/$categoryType/check_list/$categoryId';
    setLearningMetaTags(title: title, description: description, url: url, imageUrl: imageUrl);
  }

  /// Устанавливает метатеги для страницы вопроса
  static void setQuestionMetaTags({
    required String title,
    required String description,
    required String typeCertificate,
    required int questionId,
    String? imageUrl,
  }) {
    final url = '/learning/type_sertificates/$typeCertificate/$questionId';
    setLearningMetaTags(title: title, description: description, url: url, imageUrl: imageUrl);
  }

  /// Устанавливает метатеги для страницы статьи блога
  static void setBlogArticleMetaTags({
    required String title,
    required String description,
    String? imageUrl,
    required int articleId,
    String? publishedAt,
  }) {
    setMetaTags(
      title: '$title - AviaPoint',
      description: description,
      imageUrl: imageUrl,
      url: '/blog/$articleId',
      type: 'article',
    );

    if (publishedAt != null && kIsWeb) {
      try {
        final published = DateTime.parse(publishedAt);
        html.SeoHelperWeb.setMetaTag(
          'article:published_time',
          published.toIso8601String(),
          property: 'article:published_time',
        );
      } catch (e) {
        // Игнорируем ошибки парсинга даты
      }
    }
  }
}
