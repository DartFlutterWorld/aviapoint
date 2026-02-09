import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_stars_widget.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

class PilotInfoWidget extends StatelessWidget {
  final String? pilotName;
  final double rating;
  final int reviewsCount;
  final String? avatarUrl;

  const PilotInfoWidget({super.key, this.pilotName, this.rating = 0.0, this.reviewsCount = 0, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final displayName = pilotName ?? 'Пилот';
    final displayRating = rating > 0 ? rating : 0.0;
    final displayReviewsCount = reviewsCount;

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFD9E6F8)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Аватар
          GestureDetector(
            onTap: avatarUrl != null && avatarUrl!.isNotEmpty
                ? () => _showPhotoViewer(context, getImageUrl(avatarUrl!))
                : null,
            child: ClipOval(
              child: avatarUrl != null && avatarUrl!.isNotEmpty
                  ? NetworkImageWidget(
                      imageUrl: getImageUrl(avatarUrl!),
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      placeholder: Image.asset(Pictures.pilot, width: 48, height: 48, fit: BoxFit.cover),
                      errorWidget: Image.asset(Pictures.pilot, width: 48, height: 48, fit: BoxFit.cover),
                    )
                  : Image.asset(Pictures.pilot, width: 48, height: 48, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12),
          // Информация
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(displayName, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 4),
                if (displayRating > 0) ...[RatingStarsWidget(rating: displayRating), SizedBox(height: 4)],
                if (displayReviewsCount > 0)
                  Text(
                    '$displayReviewsCount ${_getReviewsText(displayReviewsCount)}',
                    style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                  )
                else if (displayRating > 0)
                  Text('Нет отзывов', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getReviewsText(int count) {
    if (count % 10 == 1 && count % 100 != 11) {
      return 'отзыв';
    } else if (count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 >= 20)) {
      return 'отзыва';
    } else {
      return 'отзывов';
    }
  }

  /// Просмотр фотографии в полноэкранном режиме
  void _showPhotoViewer(BuildContext context, String imageUrl) {
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
                // Основной контент с фотографией
                InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 5.0,
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: NetworkImageWidget(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: Container(
                          color: Colors.black,
                          child: Center(child: CircularProgressIndicator(color: Colors.white)),
                        ),
                        errorWidget: Container(
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
                ),

                // Верхняя панель с кнопками действий
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
                            SizedBox(width: 48), // Для центрирования
                            // Кнопки действий
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопка "Поделиться"
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.white, size: 24),
                                  onPressed: () => _sharePhoto(dialogContext, imageUrl),
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
                                  onPressed: () => _downloadPhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
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
  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      await Share.shareUri(Uri.parse(photoUrl));
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось поделиться фотографией'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Правый клик по изображению → "Сохранить как"'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Для мобильных платформ - скачиваем файл
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Необходимо разрешение на сохранение файлов'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(width: 16),
              Text('Скачивание...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );

      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last.split('?').first; // Убираем query параметры
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(photoUrl, filePath);

      // Для Android используем Downloads, для iOS - Photos
      final directory = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      if (directory != null) {
        final downloadPath = Platform.isAndroid
            ? '${directory.path}/Download/$fileName'
            : '${directory.path}/$fileName';

        final file = File(filePath);
        await file.copy(downloadPath);

        scaffoldMessenger.hideCurrentSnackBar();
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотография сохранена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      scaffoldMessenger.hideCurrentSnackBar();
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось скачать фотографию: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
