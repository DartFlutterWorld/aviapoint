import 'package:flutter_quill/flutter_quill.dart';

/// Утилита для конвертации Quill Document в HTML (для отображения)
class QuillHtmlConverter {
  /// Конвертирует Quill Document в HTML
  static String documentToHtml(Document document) {
    return documentToSimpleHtml(document);
  }

  /// Конвертирует Quill Document в HTML
  /// Правильный формат изображений в Quill: {insert: {image: "url"}}
  static String documentToSimpleHtml(Document document) {
    final delta = document.toDelta();
    final buffer = StringBuffer();

    for (final op in delta.toJson()) {
      final insert = op['insert'];

      // Изображения хранятся как embed объекты: {insert: {image: "url"}}
      if (insert is Map<String, dynamic>) {
        final imageUrl = insert['image'];
        if (imageUrl != null && imageUrl is String) {
          buffer.write('<img src="$imageUrl" alt="" style="max-width: 100%; height: auto;" />');
        }
        continue;
      }

      // Текстовый контент
      if (insert is String) {
        final attrs = op['attributes'] as Map<String, dynamic>?;

        if (attrs != null) {
          // Заголовки
          if (attrs['header'] != null) {
            final level = attrs['header'];
            buffer.write('<h$level>$insert</h$level>');
          }
          // Жирный
          else if (attrs['bold'] == true) {
            buffer.write('<strong>$insert</strong>');
          }
          // Курсив
          else if (attrs['italic'] == true) {
            buffer.write('<em>$insert</em>');
          }
          // Подчеркивание
          else if (attrs['underline'] == true) {
            buffer.write('<u>$insert</u>');
          }
          // Ссылки
          else if (attrs['link'] != null) {
            final link = attrs['link'] as String;
            buffer.write('<a href="$link">$insert</a>');
          }
          // Списки
          else if (attrs['list'] != null) {
            final listType = attrs['list'] == 'ordered' ? 'ol' : 'ul';
            buffer.write('<$listType><li>$insert</li></$listType>');
          } else {
            buffer.write(insert.replaceAll('\n', '<br>'));
          }
        } else {
          buffer.write(insert.replaceAll('\n', '<br>'));
        }
      }
    }

    return buffer.toString();
  }
}
