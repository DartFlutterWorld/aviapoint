import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_stars_widget.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/pilot_reviews_bottom_sheet.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: statusBgColor, borderRadius: BorderRadius.circular(8)),
                child: Text(statusText, style: AppStyles.regular12s.copyWith(color: statusColor)),
              ),
            ],
          ),
          SizedBox(height: 12),
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF9FAFB)),
                child: Row(
                  children: [
                    // Аватар пассажира
                    Builder(
                      builder: (context) {
                        final imageUrl = booking.passengerAvatarUrl != null && booking.passengerAvatarUrl!.isNotEmpty ? getImageUrl(booking.passengerAvatarUrl!) : null;
                        return GestureDetector(
                          onTap: imageUrl != null && imageUrl.isNotEmpty ? () => _showPhotoViewer(context, imageUrl) : null,
                          child: ClipOval(
                            child: imageUrl != null && imageUrl.isNotEmpty
                                ? NetworkImageWidget(
                                    imageUrl: imageUrl,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    placeholder: Image.asset(Pictures.pilot, width: 40, height: 40, fit: BoxFit.cover),
                                    errorWidget: Image.asset(Pictures.pilot, width: 40, height: 40, fit: BoxFit.cover),
                                  )
                                : Image.asset(Pictures.pilot, width: 40, height: 40, fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 8),
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
                                Text(booking.passengerFullName ?? 'Пассажир', style: AppStyles.bold12s.copyWith(color: Color(0xFF374151))),
                                if (booking.passengerAverageRating != null && booking.passengerAverageRating! > 0) ...[
                                  SizedBox(height: 2),
                                  RatingStarsWidget(rating: booking.passengerAverageRating!, fontSize: 10.0),
                                  SizedBox(height: 4),
                                  GestureDetector(
                                    onTap: () {
                                      _showPassengerReviews(context, booking.passengerId);
                                    },
                                    child: Text(
                                      'Отзывы',
                                      style: AppStyles.regular12s.copyWith(color: Color(0xFF0A6EFA), decoration: TextDecoration.underline),
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
                                    SizedBox(width: 4),
                                    Text(formatPhone(booking.passengerPhone!), style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                  ],
                                ),
                              ],
                              if (booking.passengerEmail != null && booking.passengerEmail!.isNotEmpty) ...[
                                SizedBox(height: 4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.email, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4),
                                    Text(booking.passengerEmail!, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                  ],
                                ),
                              ],
                              if (booking.passengerTelegram != null && booking.passengerTelegram!.isNotEmpty) ...[
                                SizedBox(height: 4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.telegram, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4),
                                    Text(booking.passengerTelegram!, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                  ],
                                ),
                              ],
                              if (booking.passengerMax != null && booking.passengerMax!.isNotEmpty) ...[
                                SizedBox(height: 4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.chat, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4),
                                    Text(booking.passengerMax!, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
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
          // Кнопки контактов пассажира
          if ((booking.passengerPhone != null && booking.passengerPhone!.isNotEmpty) ||
              (booking.passengerEmail != null && booking.passengerEmail!.isNotEmpty) ||
              (booking.passengerTelegram != null && booking.passengerTelegram!.isNotEmpty) ||
              (booking.passengerMax != null && booking.passengerMax!.isNotEmpty)) ...[
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (booking.passengerPhone != null && booking.passengerPhone!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.phone,
                    label: formatPhone(booking.passengerPhone!),
                    color: Color(0xFF10B981),
                    onTap: () => _launchPhone(context, booking.passengerPhone!),
                  ),
                if (booking.passengerEmail != null && booking.passengerEmail!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.email,
                    label: booking.passengerEmail!,
                    color: Color(0xFF0A6EFA),
                    onTap: () => _launchEmail(context, booking.passengerEmail!),
                  ),
                if (booking.passengerTelegram != null && booking.passengerTelegram!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.send,
                    label: booking.passengerTelegram!,
                    color: Color(0xFF0088CC),
                    onTap: () => _launchTelegram(context, booking.passengerTelegram!),
                  ),
                if (booking.passengerMax != null && booking.passengerMax!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.message,
                    label: booking.passengerMax!,
                    color: Color(0xFF9CA5AF),
                    onTap: () => _launchMax(context, booking.passengerMax!),
                  ),
              ],
            ),
          ],
          SizedBox(height: 12),
          // Количество мест
          Row(
            children: [
              Icon(Icons.event_seat, size: 16, color: Color(0xFF9CA5AF)),
              SizedBox(width: 6),
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
          SizedBox(height: 8),
          // Общая стоимость
          Row(
            children: [
              Icon(Icons.attach_money, size: 16, color: Color(0xFF10B981)),
              SizedBox(width: 6),
              Text('${priceFormat.format(booking.totalPrice)}', style: AppStyles.bold14s.copyWith(color: Color(0xFF10B981))),
            ],
          ),
          // Кнопки действий для пилота
          if (booking.status == 'pending') ...[
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF10B981), padding: EdgeInsets.symmetric(vertical: 8)),
                    child: Text('Подтвердить', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFFEF4444)),
                      padding: EdgeInsets.symmetric(vertical: 8),
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

  Widget _buildContactButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: AppStyles.regular12s.copyWith(color: color),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchPhone(BuildContext context, String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось совершить звонок'), duration: Duration(seconds: 2)),
        );
      }
    }
  }

  Future<void> _launchEmail(BuildContext context, String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось открыть почтовый клиент'), duration: Duration(seconds: 2)),
        );
      }
    }
  }

  Future<void> _launchTelegram(BuildContext context, String telegram) async {
    final username = telegram.replaceAll('@', '');
    final uri = Uri.parse('https://t.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось открыть Telegram'), duration: Duration(seconds: 2)),
        );
      }
    }
  }

  Future<void> _launchMax(BuildContext context, String max) async {
    final username = max.replaceAll('@', '');
    final uri = Uri.parse('https://max.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось открыть MAX'), duration: Duration(seconds: 2)),
        );
      }
    }
  }
}
