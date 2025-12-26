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

/// Диалог для выбора пассажира (для пилота при создании отзыва)
class SelectPassengerDialog extends StatelessWidget {
  final List<BookingEntity> bookings;
  final void Function(BookingEntity) onSelect;

  const SelectPassengerDialog({super.key, required this.bookings, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400.w, maxHeight: 500.h),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Выберите пассажира', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                IconButton(
                  icon: Icon(Icons.close, color: Color(0xFF9CA5AF)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            if (bookings.isEmpty)
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Center(
                  child: Text(
                    'Нет подтверждённых бронирований',
                    style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                  ),
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
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.only(bottom: 8.h),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Row(
                          children: [
                            // Аватар пассажира
                            ClipOval(
                              child: booking.passengerAvatarUrl != null && booking.passengerAvatarUrl!.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl: getImageUrl(booking.passengerAvatarUrl!),
                                      width: 48.r,
                                      height: 48.r,
                                      fit: BoxFit.cover,
                                      cacheManager: GetIt.instance<DefaultCacheManager>(),
                                      cacheKey: booking.passengerAvatarUrl,
                                      placeholder: (context, url) => Image.asset(Pictures.pilot, width: 48.r, height: 48.r, fit: BoxFit.cover),
                                      errorWidget: (context, url, error) {
                                        print('❌ [SelectPassengerDialog] Ошибка загрузки аватара пассажира: error=$error, url=$url, avatarUrl=${booking.passengerAvatarUrl}');
                                        return Image.asset(Pictures.pilot, width: 48.r, height: 48.r, fit: BoxFit.cover);
                                      },
                                    )
                                  : Image.asset(Pictures.pilot, width: 48.r, height: 48.r, fit: BoxFit.cover),
                            ),
                            SizedBox(width: 12.w),
                            // Имя, рейтинг и количество мест
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking.passengerFullName ?? 'Пассажир #${booking.passengerId}',
                                    style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                                  ),
                                  if (booking.passengerAverageRating != null && booking.passengerAverageRating! > 0) ...[
                                    SizedBox(height: 4.h),
                                    RatingStarsWidget(rating: booking.passengerAverageRating!),
                                  ],
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Мест: ${booking.seatsCount}',
                                    style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                                  ),
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
}
