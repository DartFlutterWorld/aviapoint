import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_stars_widget.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/pilot_reviews_bottom_sheet.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

class PilotBookingCard extends StatelessWidget {
  final BookingEntity booking;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const PilotBookingCard({super.key, required this.booking, this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0);

    String statusText;
    Color statusColor;
    Color statusBgColor;

    switch (booking.status) {
      case 'pending':
        statusText = 'Ожидает подтверждения';
        statusColor = Color(0xFFFFA726);
        statusBgColor = Color(0xFFFFF4E6);
        break;
      case 'confirmed':
        statusText = 'Подтверждено';
        statusColor = Color(0xFF10B981);
        statusBgColor = Color(0xFFD1FAE5);
        break;
      case 'cancelled':
        statusText = 'Отменено';
        statusColor = Color(0xFFEF4444);
        statusBgColor = Color(0xFFFEE2E2);
        break;
      default:
        statusText = booking.status;
        statusColor = Color(0xFF9CA5AF);
        statusBgColor = Color(0xFFF3F4F6);
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xFFD9E6F8)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок и статус
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Бронирование #${booking.id}', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(color: statusBgColor, borderRadius: BorderRadius.circular(8.r)),
                child: Text(statusText, style: AppStyles.regular12s.copyWith(color: statusColor)),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Информация о пассажире
          Builder(
            builder: (context) {
              print('🔵 [PilotBookingCard] Отображение данных пассажира:');
              print('   - passengerFirstName: ${booking.passengerFirstName}');
              print('   - passengerLastName: ${booking.passengerLastName}');
              print('   - passengerFullName: ${booking.passengerFullName}');
              print('   - passengerAvatarUrl: ${booking.passengerAvatarUrl}');
              print('   - passengerAverageRating: ${booking.passengerAverageRating}');

              return Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Color(0xFFF9FAFB)),
                child: Row(
                  children: [
                    // Аватар пассажира
                    Builder(
                      builder: (context) {
                        final imageUrl = booking.passengerAvatarUrl != null && booking.passengerAvatarUrl!.isNotEmpty
                            ? getImageUrl(booking.passengerAvatarUrl!)
                            : null;
                        return GestureDetector(
                          onTap: imageUrl != null && imageUrl.isNotEmpty
                              ? () => _showPhotoViewer(context, imageUrl)
                              : null,
                          child: ClipOval(
                            child: imageUrl != null && imageUrl.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    width: 40.r,
                                    height: 40.r,
                                    fit: BoxFit.cover,
                                    cacheManager: GetIt.instance<DefaultCacheManager>(),
                                    cacheKey: booking.passengerAvatarUrl,
                                    // Очищаем кэш при ошибке декодирования
                                    httpHeaders: const {},
                                    placeholder: (context, url) =>
                                        Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                                    errorWidget: (context, url, error) {
                                      // Детальное логирование ошибки
                                      final errorType = error.runtimeType.toString();
                                      final errorMessage = error.toString();
                                      print(
                                        '❌ [PilotBookingCard] Ошибка загрузки аватара пассажира:\n'
                                        '   - Тип ошибки: $errorType\n'
                                        '   - Сообщение: $errorMessage\n'
                                        '   - URL: $url\n'
                                        '   - avatarUrl из БД: ${booking.passengerAvatarUrl}\n'
                                        '   - Сформированный imageUrl: $imageUrl',
                                      );

                                      // Очищаем кэш при ошибке декодирования (EncodingError)
                                      // Это может помочь, если файл был поврежден в кэше
                                      if (errorType.contains('EncodingError') ||
                                          errorMessage.contains('cannot be decoded')) {
                                        try {
                                          GetIt.instance<DefaultCacheManager>().removeFile(url).catchError((Object e) {
                                            print('⚠️ [PilotBookingCard] Не удалось очистить кэш: $e');
                                          });
                                          print('🔄 [PilotBookingCard] Кэш для поврежденного файла очищен');
                                        } catch (e) {
                                          print('⚠️ [PilotBookingCard] Ошибка при очистке кэша: $e');
                                        }
                                      }

                                      return Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover);
                                    },
                                  )
                                : Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                    // Имя, рейтинг слева, контакты справа
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Левая колонка: ФИО и рейтинг
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  booking.passengerFullName ?? 'Пассажир',
                                  style: AppStyles.bold12s.copyWith(color: Color(0xFF374151)),
                                ),
                                if (booking.passengerAverageRating != null && booking.passengerAverageRating! > 0) ...[
                                  SizedBox(height: 2.h),
                                  RatingStarsWidget(rating: booking.passengerAverageRating!, fontSize: 10.sp),
                                  SizedBox(height: 4.h),
                                  GestureDetector(
                                    onTap: () {
                                      _showPassengerReviews(context, booking.passengerId);
                                    },
                                    child: Text(
                                      'Отзывы',
                                      style: AppStyles.regular12s.copyWith(
                                        color: Color(0xFF0A6EFA),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          // Правая колонка: телефон, email, telegram, max
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (booking.passengerPhone != null && booking.passengerPhone!.isNotEmpty) ...[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.phone, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Text(
                                      formatPhone(booking.passengerPhone!),
                                      style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                                    ),
                                  ],
                                ),
                              ],
                              if (booking.passengerEmail != null && booking.passengerEmail!.isNotEmpty) ...[
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.email, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Text(
                                      booking.passengerEmail!,
                                      style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                                    ),
                                  ],
                                ),
                              ],
                              if (booking.passengerTelegram != null && booking.passengerTelegram!.isNotEmpty) ...[
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.telegram, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Text(
                                      booking.passengerTelegram!,
                                      style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                                    ),
                                  ],
                                ),
                              ],
                              if (booking.passengerMax != null && booking.passengerMax!.isNotEmpty) ...[
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.chat, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Text(
                                      booking.passengerMax!,
                                      style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 12.h),
          // Количество мест
          Row(
            children: [
              Icon(Icons.event_seat, size: 16, color: Color(0xFF9CA5AF)),
              SizedBox(width: 6.w),
              Text(
                '${booking.seatsCount} ${booking.seatsCount == 1
                    ? 'место'
                    : booking.seatsCount < 5
                    ? 'места'
                    : 'мест'}',
                style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // Общая стоимость
          Row(
            children: [
              Icon(Icons.attach_money, size: 16, color: Color(0xFF10B981)),
              SizedBox(width: 6.w),
              Text(
                '${priceFormat.format(booking.totalPrice)}',
                style: AppStyles.bold14s.copyWith(color: Color(0xFF10B981)),
              ),
            ],
          ),
          // Кнопки действий для пилота
          if (booking.status == 'pending') ...[
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF10B981),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                    child: Text('Подтвердить', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFFEF4444)),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                    child: Text('Отклонить', style: AppStyles.bold16s.copyWith(color: Color(0xFFEF4444))),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  /// Просмотр фотографии в полноэкранном режиме
  void _showPassengerReviews(BuildContext context, int passengerId) {
    showUniversalBottomSheet<void>(
      context: context,
      title: '',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      showCloseButton: false,
      child: UserReviewsBottomSheet(userId: passengerId, title: 'Отзывы о пассажире'),
    );
  }

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
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        cacheManager: GetIt.instance<DefaultCacheManager>(),
                        placeholder: (context, url) => Container(
                          color: Colors.black,
                          child: Center(child: CircularProgressIndicator(color: Colors.white)),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                SizedBox(height: 16.h),
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
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                            SizedBox(width: 48.w), // Для центрирования
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
                                SizedBox(width: 8.w),
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
                                SizedBox(width: 8.w),
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
              SizedBox(width: 16.w),
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
