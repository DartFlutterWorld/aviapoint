import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';

/// Универсальный виджет для просмотра фотографий с возможностью поделиться и скачать
class PhotoViewer {
  /// Показать просмотр фотографий
  static void show(BuildContext context, List<String?> photos, {int initialIndex = 0}) {
    if (photos.isEmpty) return;

    final PageController pageController = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;
    bool showControls = true;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogBuilderContext, setState) => GestureDetector(
          onTap: () {
            setState(() {
              showControls = !showControls;
            });
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                // Основной контент с фотографиями
                PageView.builder(
                  controller: pageController,
                  itemCount: photos.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final photoUrl = photos[index];
                    if (photoUrl == null || photoUrl.isEmpty) {
                      return Container(
                        color: Colors.black,
                        child: Center(child: Icon(Icons.broken_image, color: Colors.white70, size: 64)),
                      );
                    }
                    return InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 5.0,
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.network(
                            getImageUrl(photoUrl),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.black,
                                child: Center(child: CircularProgressIndicator(color: Colors.white)),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.black,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                    SizedBox(height: 16),
                                    Text(
                                      'Не удалось загрузить изображение',
                                      style: AppStyles.regular14s.copyWith(color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Верхняя панель с индикатором, кнопками действий и кнопкой закрытия
                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Левая часть: индикатор
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Индикатор текущей фотографии
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${currentIndex + 1} / ${photos.length}',
                                    style: AppStyles.regular14s.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Правая часть: кнопки действий и кнопка закрытия
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопки действий (если есть фото)
                                if (photos.isNotEmpty &&
                                    photos[currentIndex] != null &&
                                    photos[currentIndex]!.isNotEmpty) ...[
                                  // Кнопка "Поделиться"
                                  IconButton(
                                    icon: Icon(Icons.share, color: Colors.white, size: 24),
                                    onPressed: () => _sharePhoto(dialogContext, photos[currentIndex]!),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      shape: CircleBorder(),
                                    ),
                                    tooltip: 'Поделиться',
                                  ),
                                  SizedBox(width: 8),
                                  // Кнопка "Скачать"
                                  IconButton(
                                    icon: Icon(Icons.download, color: Colors.white, size: 24),
                                    onPressed: () => _downloadPhoto(dialogContext, photos[currentIndex]!),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      shape: CircleBorder(),
                                    ),
                                    tooltip: 'Скачать',
                                  ),
                                  SizedBox(width: 8),
                                ],
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 24),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Поделиться фотографией
  static Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final imageUrl = getImageUrl(photoUrl);
      await Share.shareUri(Uri.parse(imageUrl));
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Не удалось поделиться фотографией'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  /// Скачать фотографию
  static Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Правый клик по изображению → "Сохранить как"'),
            backgroundColor: Colors.blue,
            duration: const Duration(seconds: 3),
          ),
        );
        return;
      }

      final imageUrl = getImageUrl(photoUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last.split('?').first; // Убираем query параметры
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(imageUrl, filePath);

      // Запрашиваем разрешение на запись (для Android)
      if (await Permission.storage.request().isGranted) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final savedFile = await File(filePath).copy('${appDocDir.path}/$fileName');

        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотография сохранена: ${savedFile.path}'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Необходимо разрешение на сохранение файлов'),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Не удалось скачать фотографию: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
