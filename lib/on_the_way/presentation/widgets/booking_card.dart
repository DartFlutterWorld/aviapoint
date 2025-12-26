import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingCard extends StatelessWidget {
  final BookingEntity booking;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  const BookingCard({super.key, required this.booking, this.onTap, this.onCancel});

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

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            // Кнопка отмены (если статус pending или confirmed)
            if ((booking.status == 'pending' || booking.status == 'confirmed') && onCancel != null) ...[
              SizedBox(height: 12.h),
              OutlinedButton(
                onPressed: onCancel,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFFEF4444)),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                child: Text('Отменить бронирование', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
              ),
            ],
            // Кнопка перехода к деталям полета
            if (onTap != null) ...[
              SizedBox(height: 8.h),
              TextButton(
                onPressed: onTap,
                child: Text('Подробнее о полете', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
