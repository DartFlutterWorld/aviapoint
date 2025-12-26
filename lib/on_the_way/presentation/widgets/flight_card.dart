import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class FlightCard extends StatelessWidget {
  final FlightEntity flight;
  final VoidCallback? onTap;

  const FlightCard({super.key, required this.flight, this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    final priceFormat = NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0);

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
            // ID полета
            Row(
              children: [
                Icon(Icons.tag, size: 14, color: Color(0xFF9CA5AF)),
                SizedBox(width: 4.w),
                Text('ID: ${flight.id}', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
              ],
            ),
            SizedBox(height: 8.h),
            // Маршрут
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Аэропорт отправления
                      _buildAirportInfo(
                        context: context,
                        icon: Icons.flight_takeoff,
                        code: flight.departureAirport,
                        identRu: flight.departureAirportIdentRu,
                        name: flight.departureAirportName,
                        city: flight.departureAirportCity,
                        region: flight.departureAirportRegion,
                        type: flight.departureAirportType,
                        isInternational: false, // TODO: добавить поле в FlightEntity
                      ),
                      SizedBox(height: 8.h),
                      // Стрелка
                      Padding(
                        padding: EdgeInsets.only(left: 22.w),
                        child: Icon(Icons.arrow_downward, size: 16, color: Color(0xFF0A6EFA)),
                      ),
                      SizedBox(height: 8.h),
                      // Аэропорт прибытия
                      _buildAirportInfo(
                        context: context,
                        icon: Icons.flight_land,
                        code: flight.arrivalAirport,
                        identRu: flight.arrivalAirportIdentRu,
                        name: flight.arrivalAirportName,
                        city: flight.arrivalAirportCity,
                        region: flight.arrivalAirportRegion,
                        type: flight.arrivalAirportType,
                        isInternational: false, // TODO: добавить поле в FlightEntity
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: flight.status == 'active'
                        ? Color(0xFFD1FAE5)
                        : flight.status == 'completed'
                        ? Color(0xFFFFF4E6)
                        : Color(0xFFFEE2E2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    flight.status == 'active'
                        ? 'Активен'
                        : flight.status == 'completed'
                        ? 'Завершен'
                        : 'Отменен',
                    style: AppStyles.regular12s.copyWith(
                      color: flight.status == 'active'
                          ? Color(0xFF10B981)
                          : flight.status == 'completed'
                          ? Color(0xFFFFA726)
                          : Color(0xFFEF4444),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Дата и время
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Color(0xFF9CA5AF)),
                SizedBox(width: 6.w),
                Text(dateFormat.format(flight.departureDate), style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
              ],
            ),
            SizedBox(height: 8.h),
            // Цена и места
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 16, color: Color(0xFF10B981)),
                    SizedBox(width: 6.w),
                    Text('${priceFormat.format(flight.pricePerSeat)} / место', style: AppStyles.bold14s.copyWith(color: Color(0xFF10B981))),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.event_seat, size: 16, color: Color(0xFF9CA5AF)),
                    SizedBox(width: 6.w),
                    Text('${flight.availableSeats} мест', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                  ],
                ),
              ],
            ),
            // Тип самолета (если указан)
            if (flight.aircraftType != null && flight.aircraftType!.isNotEmpty) ...[
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.flight, size: 16, color: Color(0xFF9CA5AF)),
                  SizedBox(width: 6.w),
                  Text(flight.aircraftType!, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                ],
              ),
            ],
            // Описание (если есть)
            if (flight.description != null && flight.description!.isNotEmpty) ...[
              SizedBox(height: 8.h),
              Text(
                flight.description!,
                style: AppStyles.regular12s.copyWith(color: Color(0xFF4B5767)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            // Информация о пилоте
            if (flight.pilotFullName != null || flight.pilotAverageRating != null) ...[
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Color(0xFFF9FAFB)),
                child: Row(
                  children: [
                    // Аватар пилота
                    Builder(
                      builder: (context) {
                        final avatarUrl = flight.pilotAvatarUrl;
                        final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;

                        return ClipOval(
                          child: imageUrl != null && imageUrl.isNotEmpty
                              ? CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  width: 32.r,
                                  height: 32.r,
                                  fit: BoxFit.cover,
                                  cacheManager: GetIt.instance<DefaultCacheManager>(),
                                  cacheKey: avatarUrl,
                                  placeholder: (context, url) => Image.asset(Pictures.pilot, width: 32.r, height: 32.r, fit: BoxFit.cover),
                                  errorWidget: (context, url, error) {
                                    print('❌ [FlightCard] Ошибка загрузки аватара пилота: error=$error, url=$url, avatarUrl=$avatarUrl');
                                    return Image.asset(Pictures.pilot, width: 32.r, height: 32.r, fit: BoxFit.cover);
                                  },
                                )
                              : Image.asset(Pictures.pilot, width: 32.r, height: 32.r, fit: BoxFit.cover),
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                    // Имя и рейтинг
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(flight.pilotFullName ?? 'Пилот', style: AppStyles.bold12s.copyWith(color: Color(0xFF374151))),
                          if (flight.pilotAverageRating != null && flight.pilotAverageRating! > 0) ...[
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Icon(Icons.star, size: 12, color: Color(0xFFFFA726)),
                                SizedBox(width: 4.w),
                                Text(flight.pilotAverageRating!.toStringAsFixed(1), style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Вспомогательный метод для отображения информации об аэропорте
  Widget _buildAirportInfo({
    required BuildContext context,
    required IconData icon,
    required String code,
    String? identRu,
    String? name,
    String? city,
    String? region,
    String? type,
    bool isInternational = false,
  }) {
    // Определяем иконку и цвет в зависимости от типа
    IconData iconData = Icons.local_airport; // Иконка аэропорта (самолётик) по умолчанию
    Color iconColor = Color(0xFF0A6EFA);

    // Получаем отображаемый тип и определяем иконку
    String typeDisplay = '';
    if (type != null && type.isNotEmpty) {
      final typeLower = type.toLowerCase().trim();
      print('🔍 [FlightCard] Тип аэропорта: "$type" -> "$typeLower"');

      // Проверяем сначала на вертодромы
      if (typeLower == 'heliport' || typeLower == 'вертодром' || typeLower.contains('heliport') || typeLower.contains('вертодром')) {
        iconData = Icons.airplanemode_active; // Иконка вертолёта (альтернативная иконка самолёта для визуального отличия)
        iconColor = Color(0xFF10B981);
        typeDisplay = 'Вертодром';
        print('✅ [FlightCard] Установлена иконка вертолёта для типа: $type');
      } else {
        // Для всех остальных типов - аэродром (самолётик)
        iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
        iconColor = Color(0xFF0A6EFA);

        // Определяем отображаемый тип
        switch (typeLower) {
          case 'airport':
          case 'аэродром':
            typeDisplay = 'Аэродром';
            break;
          case 'small_airport':
            typeDisplay = 'Малый аэродром';
            break;
          case 'medium_airport':
            typeDisplay = 'Средний аэродром';
            break;
          case 'large_airport':
            typeDisplay = 'Крупный аэродром';
            break;
          default:
            typeDisplay = type;
        }
        print('✅ [FlightCard] Установлена иконка самолёта для типа: $type');
      }
    } else {
      print('⚠️ [FlightCard] Тип аэропорта не указан или пустой');
    }

    return GestureDetector(
      onTap: () {
        showAirportInfoBottomSheet(context, code);
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8.r)),
            child: Icon(iconData, color: iconColor, size: 16.r),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Код и русский код
                Row(
                  children: [
                    Text(code, style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                    if (identRu != null && identRu != code) ...[SizedBox(width: 4.w), Text('($identRu)', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)))],
                    if (isInternational) ...[
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                        decoration: BoxDecoration(color: Color(0xFF0A6EFA).withOpacity(0.1), borderRadius: BorderRadius.circular(4.r)),
                        child: Text(
                          'INT',
                          style: AppStyles.medium10s.copyWith(color: Color(0xFF0A6EFA), fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ],
                ),
                // Название аэропорта
                if (name != null) ...[
                  SizedBox(height: 2.h),
                  Text(
                    name,
                    style: AppStyles.regular12s.copyWith(color: Color(0xFF374151)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                // Город, регион, тип
                if (city != null || region != null || typeDisplay.isNotEmpty) ...[
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      if (city != null) ...[
                        Icon(Icons.location_city, size: 10.r, color: Color(0xFF9CA5AF)),
                        SizedBox(width: 2.w),
                        Text(city, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                      if (region != null) ...[
                        if (city != null) ...[SizedBox(width: 6.w), Text('•', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))), SizedBox(width: 6.w)],
                        Text(region, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                      if (typeDisplay.isNotEmpty) ...[
                        if (city != null || region != null) ...[SizedBox(width: 6.w), Text('•', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))), SizedBox(width: 6.w)],
                        Text(typeDisplay, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
