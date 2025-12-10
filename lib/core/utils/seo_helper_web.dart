import 'dart:html' as html;

/// Web-специфичная реализация для работы с DOM
class SeoHelperWeb {
  /// Устанавливает title страницы
  static void setTitle(String title) {
    html.document.title = title;
  }

  /// Устанавливает или обновляет meta тег
  static void setMetaTag(String name, String content, {String? property}) {
    final selector = property != null ? 'meta[property="$property"]' : 'meta[name="$name"]';

    var meta = html.document.querySelector(selector) as html.MetaElement?;
    if (meta != null) {
      meta.content = content;
    } else {
      meta = html.MetaElement()..content = content;
      if (property != null) {
        meta.setAttribute('property', property);
      } else {
        meta.name = name;
      }
      html.document.head!.append(meta);
    }
  }

  /// Устанавливает или обновляет link тег
  static void setLinkTag(String rel, String href) {
    var link = html.document.querySelector('link[rel="$rel"]') as html.LinkElement?;
    if (link != null) {
      link.href = href;
    } else {
      link = html.LinkElement()
        ..rel = rel
        ..href = href;
      html.document.head!.append(link);
    }
  }

  /// Устанавливает или обновляет JSON-LD скрипт
  static void setJsonLdScript(String jsonLd, {String id = 'structured-data'}) {
    // Удаляем существующий скрипт с таким же id
    final existing = html.document.querySelector('script#${id}') as html.ScriptElement?;
    if (existing != null) {
      existing.remove();
    }

    // Создаем новый скрипт
    final script = html.ScriptElement()
      ..id = id
      ..type = 'application/ld+json'
      ..text = jsonLd;

    html.document.head!.append(script);

    // Логирование для отладки (только в development)
    if (const bool.fromEnvironment('dart.vm.product') == false) {
      html.window.console.log('✅ JSON-LD добавлен: $id');
    }
  }
}
