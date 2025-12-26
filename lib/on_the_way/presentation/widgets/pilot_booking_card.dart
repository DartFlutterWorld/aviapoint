import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_stars_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      padding: EdgeInsets.all(12.w),
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
                    ClipOval(
                      child: booking.passengerAvatarUrl != null && booking.passengerAvatarUrl!.isNotEmpty
                          ? Builder(
                              builder: (context) {
                                final imageUrl = getImageUrl(booking.passengerAvatarUrl!);
                                // Проверяем, что URL не пустой
                                if (imageUrl.isEmpty) {
                                  return Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover);
                                }
                                
                                return CachedNetworkImage(
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
                                    if (errorType.contains('EncodingError') || errorMessage.contains('cannot be decoded')) {
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
                                );
                              },
                            )
                          : Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 8.w),
                    // Имя и рейтинг
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
                            RatingStarsWidget(rating: booking.passengerAverageRating!),
                          ],
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
                    child: Text('Подтвердить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
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
                    child: Text('Отклонить', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
