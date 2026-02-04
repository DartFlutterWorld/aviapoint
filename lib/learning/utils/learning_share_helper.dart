import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:aviapoint/core/utils/const/app.dart';

/// Утилита для поделиться в разделе обучения
class LearningShareHelper {
  /// Поделиться страницей обучения
  /// [imageUrl] - относительный путь к изображению (будет преобразован через getImageUrl)
  static Future<void> shareLearningPage(BuildContext context, {String? title, String? description, String? imageUrl}) async {
    final baseUrl = kIsWeb ? 'https://avia-point.com' : 'https://avia-point.com';

    // Получаем текущий путь из роутера
    final currentPath = context.router.currentPath;
    final pageUrl = '$baseUrl$currentPath';

    // Формируем текст для шаринга
    final buffer = StringBuffer();

    if (title != null && title.isNotEmpty) {
      buffer.writeln('📚 $title');
      buffer.writeln('');
    }

    if (description != null && description.isNotEmpty) {
      final desc = description.length > 200 ? '${description.substring(0, 200)}...' : description;
      buffer.writeln(desc);
      buffer.writeln('');
    }

    buffer.writeln('🔗 $pageUrl');
    buffer.writeln('');
    buffer.writeln('Изучайте в AviaPoint');

    final shareText = buffer.toString();

    // Если есть изображение, пытаемся поделиться с ним
    if (imageUrl != null && imageUrl.isNotEmpty) {
      try {
        final fullImageUrl = getImageUrl(imageUrl);

        if (kIsWeb) {
          // Для веб - просто делимся текстом и URL изображения
          final textWithImage = '$shareText\n\n🖼️ Изображение: $fullImageUrl';
          await Share.share(textWithImage);
        } else {
          // Для мобильных платформ - скачиваем изображение и делимся файлом
          await _shareWithImage(shareText, fullImageUrl, imageUrl);
        }
      } catch (e) {
        // Если не удалось поделиться с изображением, делимся только текстом
        debugPrint('Ошибка при шаринге с изображением: $e');
        await Share.share(shareText);
      }
    } else {
      // Если нет изображения, просто делимся текстом
      await Share.share(shareText);
    }
  }

  /// Скачать изображение и поделиться им вместе с текстом
  static Future<void> _shareWithImage(String shareText, String fullImageUrl, String relativeImageUrl) async {
    try {
      // Скачиваем изображение во временный файл
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();

      // Извлекаем имя файла из URL
      final uri = Uri.tryParse(fullImageUrl);
      String fileName = uri != null ? uri.pathSegments.last : relativeImageUrl.split('/').last;

      // Убираем query параметры из имени файла
      fileName = fileName.split('?').first;

      // Если имя файла пустое или не имеет расширения, добавляем .jpg
      if (fileName.isEmpty || !fileName.contains('.')) {
        fileName = 'learning_image.jpg';
      }

      final filePath = '${tempDir.path}/$fileName';

      // Скачиваем изображение
      await dio.download(fullImageUrl, filePath);

      // Проверяем, что файл существует
      final file = File(filePath);
      if (await file.exists()) {
        // Делимся текстом и изображением
        final xFile = XFile(filePath);
        await Share.shareXFiles([xFile], text: shareText);

        // Удаляем временный файл после шаринга
        try {
          await file.delete();
        } catch (_) {
          // Игнорируем ошибки при удалении
        }
      } else {
        // Если файл не существует, делимся только текстом
        await Share.share(shareText);
      }
    } catch (e) {
      debugPrint('Ошибка при скачивании изображения для шаринга: $e');
      // В случае ошибки делимся только текстом
      await Share.share(shareText);
    }
  }
}
