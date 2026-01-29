import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
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

/// Диалог для выбора пассажира (для пилота при создании отзыва)
class SelectPassengerDialog extends StatelessWidget {
  final List<BookingEntity> bookings;
  final void Function(BookingEntity) onSelect;

  const SelectPassengerDialog({super.key, required this.bookings, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 500),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Выберите пассажира', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Color(0xFF9CA5AF)),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (bookings.isEmpty)
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('Нет подтверждённых бронирований', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                ),
              )
            else
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return InkWell(
                      onTap: () {
                        onSelect(booking);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Row(
                          children: [
                            // Аватар пассажира
                            GestureDetector(
                              onTap: booking.passengerAvatarUrl != null && booking.passengerAvatarUrl!.isNotEmpty ? () => _showPhotoViewer(context, getImageUrl(booking.passengerAvatarUrl!)) : null,
                              child: ClipOval(
                                child: booking.passengerAvatarUrl != null && booking.passengerAvatarUrl!.isNotEmpty
                                    ? NetworkImageWidget(
                                        imageUrl: getImageUrl(booking.passengerAvatarUrl!),
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
                            // Имя, рейтинг и количество мест
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(booking.passengerFullName ?? 'Пассажир #${booking.passengerId}', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                                  if (booking.passengerAverageRating != null && booking.passengerAverageRating! > 0) ...[
                                    SizedBox(height: 4),
                                    RatingStarsWidget(rating: booking.passengerAverageRating!),
                                  ],
                                  SizedBox(height: 4),
                                  Text('Мест: ${booking.seatsCount}', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right, color: Color(0xFF9CA5AF)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
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
                                Text('Не удалось загрузить изображение', style: AppStyles.regular14s.copyWith(color: Colors.white70)),
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
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
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
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
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
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось поделиться фотографией'), backgroundColor: Colors.red, duration: Duration(seconds: 2)));
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Правый клик по изображению → "Сохранить как"'), backgroundColor: Colors.blue, duration: Duration(seconds: 3)));
        return;
      }

      // Для мобильных платформ - скачиваем файл
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Необходимо разрешение на сохранение файлов'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
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
      final directory = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();

      if (directory != null) {
        final downloadPath = Platform.isAndroid ? '${directory.path}/Download/$fileName' : '${directory.path}/$fileName';

        final file = File(filePath);
        await file.copy(downloadPath);

        scaffoldMessenger.hideCurrentSnackBar();
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Фотография сохранена'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
      }
    } catch (e) {
      scaffoldMessenger.hideCurrentSnackBar();
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось скачать фотографию: $e'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
      }
    }
  }
}
